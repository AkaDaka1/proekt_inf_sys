from main import *
from models import *

def get_shows_by_theater(session: Session, theater_id: int):
    """
    Получить все шоу для конкретного театра
    """
    statement = select(Show).where(Show.hall.has(Hall.theater_id == theater_id))
    return session.exec(statement).scalars().all()


def get_tickets_by_customer(session: Session, customer_email: str):
    """
    Получить все билеты, купленные конкретным клиентом
    """
    statement = select(Ticket).where(Ticket.email == customer_email)
    return session.exec(statement).scalars().all()


def get_acts_with_votes(session: Session, show_id: int):
    """
    Получить акты шоу с количеством VIP и обычных голосов
    """
    statement = (
        select(
            Acts.act_number,
            func.count(VoteVIP.vote_id).label("vip_votes"),
            func.count(VoteCommon.vote_id).label("common_votes")
        )
        .join(VoteVIP, isouter=True)
        .join(VoteCommon, isouter=True)
        .where(Acts.show_id == show_id)
        .group_by(Acts.act_number)
    )
    return session.exec(statement).all()


def get_rented_equipment_for_show(session: Session, show_id: int):
    """
    Получить список оборудования, арендованного для конкретного шоу
    """
    statement = select(RentEquipment).where(RentEquipment.show_id == show_id)
    return session.exec(statement).scalars().all()


def get_active_franchises_with_theaters(session: Session):
    """
    Получить список активных франшиз с их театрами
    """
    statement = select(Franchise).where(Franchise.status == "active")
    franchises = session.exec(statement).scalars().all()

    result = []
    for f in franchises:
        result.append({
            "franchise": f,
            "theaters": f.theaters
        })
    return result

def add_new_show(
    session: Session, 
    hall_id: int, 
    show_name: str, 
    show_date: datetime, 
    duration: int
):
    """
    Добавить новое шоу
    """
    new_show = Show(
        hall_id=hall_id,
        show_name=show_name,
        show_date=show_date,
        duration=duration,
        created_at=datetime.now()
    )
    session.add(new_show)
    session.commit()
    session.refresh(new_show)
    return new_show


def add_customer_ticket(
    session: Session,
    show_id: int,
    seat_number: str,
    customer_email: str,
    price: float,
    ticket_type: str = "standard"
):
    """
    Добавить билет для клиента
    """
    new_ticket = Ticket(
        show_id=show_id,
        seat_number=seat_number,
        email=customer_email,
        price=price,
        ticket_type=ticket_type,
        purchase_date=datetime.now(),
        status="active"
    )
    session.add(new_ticket)
    session.commit()
    return new_ticket

def update_franchise_status(
    session: Session, 
    franchise_id: int, 
    new_status: str
):
    """
    Обновить статус франшизы
    """
    franchise = session.get(Franchise, franchise_id)
    if franchise:
        franchise.status = new_status
        franchise.updated_at = datetime.now()
        session.commit()
        session.refresh(franchise)
    return franchise


def update_show_duration(
    session: Session, 
    show_id: int, 
    new_duration: int
):
    """
    Обновить продолжительность шоу
    """
    show = session.get(Show, show_id)
    if show:
        show.duration = new_duration
        session.commit()
        session.refresh(show)
    return show

def delete_rented_equipment(
    session: Session, 
    rent_id: int
):
    """
    Удалить запись об аренде оборудования
    """
    rented_eq = session.get(RentEquipment, rent_id)
    if rented_eq:
        session.delete(rented_eq)
        session.commit()
        return True
    return False


def cancel_customer_ticket(
    session: Session, 
    ticket_id: int
):
    """
    Отменить билет клиента (мягкое удаление через изменение статуса)
    """
    ticket = session.get(Ticket, ticket_id)
    if ticket:
        ticket.status = "cancelled"
        ticket.cancelled_at = datetime.now()
        session.commit()
        return True
    return False

with Session(engine) as session:
    shows = get_shows_by_theater(session, theater_id=1)
    for show in shows:
        print(show.title, show.show_date)