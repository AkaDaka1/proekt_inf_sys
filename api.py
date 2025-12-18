from fastapi import FastAPI, Depends
from sqlmodel import Session
from datetime import datetime

from main import *
from models import *
from requests import *

app = FastAPI(title="Immersive Theater API")


def get_session():
    with Session(engine) as session:
        yield session


@app.get("/theaters/{theater_id}/shows")
def api_get_shows_by_theater(
    theater_id: int,
    session: Session = Depends(get_session)
):
    return get_shows_by_theater(session, theater_id)


@app.get("/customers/{email}/tickets")
def api_get_tickets_by_customer(
    email: str,
    session: Session = Depends(get_session)
):
    return get_tickets_by_customer(session, email)


@app.get("/shows/{show_id}/acts/votes")
def api_get_acts_with_votes(
    show_id: int,
    session: Session = Depends(get_session)
):
    return get_acts_with_votes(session, show_id)


@app.post("/shows")
def api_add_show(
    hall_id: int,
    show_name: str,
    show_date: datetime,
    duration: int,
    session: Session = Depends(get_session)
):
    return add_new_show(
        session,
        hall_id,
        show_name,
        show_date,
        duration
    )


@app.post("/tickets")
def api_add_ticket(
    show_id: int,
    seat_number: str,
    email: str,
    price: float,
    session: Session = Depends(get_session)
):
    return add_customer_ticket(
        session,
        show_id,
        seat_number,
        email,
        price
    )


@app.patch("/franchises/{franchise_id}/status")
def api_update_franchise_status(
    franchise_id: int,
    status: str,
    session: Session = Depends(get_session)
):
    return update_franchise_status(session, franchise_id, status)

# Примеры использования API
# GET /theaters/1/shows
# GET /customers/test@mail.com/tickets
# GET /shows/3/acts/votes
# POST /shows?hall_id=1&show_name=Night Show&show_date=2025-06-01T19:00&duration=120
# POST /tickets?show_id=3&seat_number=A12&email=test@mail.com&price=1500
