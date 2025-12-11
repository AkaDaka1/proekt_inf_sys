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

with Session(engine) as session:
    shows = get_shows_by_theater(session, theater_id=1)
    for show in shows:
        print(show.title, show.show_date)