from main import *
# ---------------------------
# Franchise
# ---------------------------

class Franchise(SQLModel, table=True):
    contract_id: Optional[int] = Field(default=None, primary_key=True)
    contact_person: Optional[str]
    phone: Optional[str]
    email: Optional[str]
    address: Optional[str]
    start_date: Optional[date]
    end_date: Optional[date]
    status: Optional[str]
    royalty_percentage: Optional[float]
    initial_fee: Optional[float]
    monthly_fee: Optional[float]

    theaters: List["Theater"] = Relationship(back_populates="franchise")


# ---------------------------
# Theater
# ---------------------------

class Theater(SQLModel, table=True):
    theater_id: Optional[int] = Field(default=None, primary_key=True)
    contract_id: Optional[int] = Field(default=None, foreign_key="franchise.contract_id")
    name: Optional[str]
    location: Optional[str]

    franchise: Optional[Franchise] = Relationship(back_populates="theaters")
    halls: List["Hall"] = Relationship(back_populates="theater")


# ---------------------------
# Hall
# ---------------------------

class Hall(SQLModel, table=True):
    hall_id: Optional[int] = Field(default=None, primary_key=True)
    theater_id: Optional[int] = Field(default=None, foreign_key="theater.theater_id")
    capacity: Optional[int]

    theater: Optional[Theater] = Relationship(back_populates="halls")
    shows: List["Show"] = Relationship(back_populates="hall")


# ---------------------------
# Scenario
# ---------------------------

class Scenario(SQLModel, table=True):
    scenario_id: Optional[int] = Field(default=None, primary_key=True)
    script_ai: Optional[str]
    script_edited: Optional[str]
    status: Optional[str]

    shows: List["Show"] = Relationship(back_populates="scenario")


# ---------------------------
# Show
# ---------------------------

class Show(SQLModel, table=True):
    show_id: Optional[int] = Field(default=None, primary_key=True)
    hall_id: Optional[int] = Field(default=None, foreign_key="hall.hall_id")
    scenario_id: Optional[int] = Field(default=None, foreign_key="scenario.scenario_id")

    title: Optional[str]
    add_prompt: Optional[str]
    acts: Optional[int]
    duration: Optional[timedelta]
    show_date: Optional[datetime]

    hall: Optional[Hall] = Relationship(back_populates="shows")
    scenario: Optional[Scenario] = Relationship(back_populates="shows")

    acts_list: List["Acts"] = Relationship(back_populates="show")
    tickets: List["Ticket"] = Relationship(back_populates="show")
    rent_equipment: List["RentEquipment"] = Relationship(back_populates="show")
    rent_service: List["RentService"] = Relationship(back_populates="show")


# ---------------------------
# Acts (Composite Key)
# ---------------------------

class Acts(SQLModel, table=True):
    act_number: int = Field(primary_key=True)
    show_id: int = Field(primary_key=True, foreign_key="show.show_id")
    script_ai: Optional[str]

    __table_args__ = ()

    show: Optional["Show"] = Relationship(back_populates="acts_list")
    vip_votes: List["VoteVIP"] = Relationship(back_populates="act")
    common_votes: List["VoteCommon"] = Relationship(back_populates="act")



# ---------------------------
# Customer
# ---------------------------

class Customer(SQLModel, table=True):
    email: str = Field(primary_key=True)
    phone: Optional[str]
    name: Optional[str]

    tickets: List["Ticket"] = Relationship(back_populates="customer")


# ---------------------------
# Ticket
# ---------------------------

class Ticket(SQLModel, table=True):
    ticket_id: Optional[int] = Field(default=None, primary_key=True)
    show_id: int = Field(foreign_key="show.show_id")
    seat_number: Optional[str]
    price: Optional[float]
    status: Optional[str]
    vip_status: Optional[bool]
    email: str = Field(foreign_key="customer.email")

    show: Optional[Show] = Relationship(back_populates="tickets")
    customer: Optional[Customer] = Relationship(back_populates="tickets")

    votes_common: List["VoteCommon"] = Relationship(back_populates="ticket")
    votes_vip: List["VoteVIP"] = Relationship(back_populates="ticket")


# ---------------------------
# VIP Votes
# ---------------------------

class VoteVIP(SQLModel, table=True):
    vote_id: Optional[int] = Field(default=None, primary_key=True)
    ticket_id: int = Field(foreign_key="ticket.ticket_id")
    show_id: int
    act_number: int
    value: Optional[str]

    __table_args__ = (
        ForeignKeyConstraint(
            ['show_id', 'act_number'],
            ['acts.show_id', 'acts.act_number']
        ),
    )

    ticket: Optional["Ticket"] = Relationship(back_populates="votes_vip")
    act: Optional["Acts"] = Relationship(back_populates="vip_votes")

class VoteCommon(SQLModel, table=True):
    vote_id: Optional[int] = Field(default=None, primary_key=True)
    ticket_id: int = Field(foreign_key="ticket.ticket_id")
    show_id: int
    act_number: int
    value: Optional[str]

    __table_args__ = (
        ForeignKeyConstraint(
            ['show_id', 'act_number'],
            ['acts.show_id', 'acts.act_number']
        ),
    )

    ticket: Optional["Ticket"] = Relationship(back_populates="votes_common")
    act: Optional["Acts"] = Relationship(back_populates="common_votes")

# ---------------------------
# Equipment
# ---------------------------

class Equipment(SQLModel, table=True):
    equipment_id: Optional[int] = Field(default=None, primary_key=True)
    name: Optional[str]
    price: Optional[float]
    amount: Optional[int]

    rented: List["RentEquipment"] = Relationship(back_populates="equipment")


# ---------------------------
# RentEquipment
# ---------------------------

class RentEquipment(SQLModel, table=True):
    equipment_id: int = Field(foreign_key="equipment.equipment_id", primary_key=True)
    show_id: int = Field(foreign_key="show.show_id", primary_key=True)
    rent_start: Optional[datetime]
    rent_end: Optional[datetime]

    equipment: Optional[Equipment] = Relationship(back_populates="rented")
    show: Optional[Show] = Relationship(back_populates="rent_equipment")


# ---------------------------
# Service
# ---------------------------

class Service(SQLModel, table=True):
    service_id: Optional[int] = Field(default=None, primary_key=True)
    name: Optional[str]
    price: Optional[float]
    amount: Optional[int]

    rented: List["RentService"] = Relationship(back_populates="service")


# ---------------------------
# RentService
# ---------------------------

class RentService(SQLModel, table=True):
    service_id: int = Field(foreign_key="service.service_id", primary_key=True)
    show_id: int = Field(foreign_key="show.show_id", primary_key=True)
    rent_start: Optional[datetime]
    rent_end: Optional[datetime]

    service: Optional[Service] = Relationship(back_populates="rented")
    show: Optional[Show] = Relationship(back_populates="rent_service")
