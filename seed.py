from models import *
from main import *
# --------------------------
# Создание минимальных данных
# --------------------------
with Session(engine) as session:
    # 1️⃣ Франшиза
    franchise = Franchise(
        contact_person="Иван Иванов",
        phone="+79001234567",
        email="franchise@example.com",
        address="г. Москва, ул. Театральная 1",
        start_date=date.today(),
        status="active",
        royalty_percentage=10.0,
        initial_fee=5000.0,
        monthly_fee=1000.0
    )
    session.add(franchise)
    session.commit()

    # 2️⃣ Театр
    theater = Theater(
        contract_id=franchise.contract_id,
        name="Большой театр иммерсивного искусства",
        location="Москва"
    )
    session.add(theater)
    session.commit()

    # 3️⃣ Зал
    hall = Hall(
        theater_id=theater.theater_id,
        capacity=50
    )
    session.add(hall)
    session.commit()

    # 4️⃣ Сценарий
    scenario = Scenario(
        script_ai="Сценарий AI: волшебное приключение",
        status="approved"
    )
    session.add(scenario)
    session.commit()

    # 5️⃣ Шоу
    show = Show(
        hall_id=hall.hall_id,
        scenario_id=scenario.scenario_id,
        title="Ночное приключение",
        acts=2,
        duration=timedelta(hours=1, minutes=30),
        show_date=datetime.now()
    )
    session.add(show)
    session.commit()

    # 6️⃣ Акты
    act1 = Acts(act_number=1, show_id=show.show_id, script_ai="Акт 1: вступление")
    act2 = Acts(act_number=2, show_id=show.show_id, script_ai="Акт 2: кульминация")
    session.add_all([act1, act2])
    session.commit()

    # 7️⃣ Клиент
    customer = Customer(email="alice@mail.com", name="Alice", phone="+79001112233")
    session.add(customer)
    session.commit()

    # 8️⃣ Билеты
    ticket1 = Ticket(show_id=show.show_id, seat_number="A1", price=1000.0, status="sold", vip_status=True, email=customer.email)
    ticket2 = Ticket(show_id=show.show_id, seat_number="A2", price=1000.0, status="sold", vip_status=False, email=customer.email)
    session.add_all([ticket1, ticket2])
    session.commit()

    # 9️⃣ Оборудование
    equipment = Equipment(name="Проектор", price=500.0, amount=2)
    session.add(equipment)
    session.commit()

    # 10️⃣ Аренда оборудования
    rent_eq = RentEquipment(equipment_id=equipment.equipment_id, show_id=show.show_id, rent_start=datetime.now(), rent_end=datetime.now() + timedelta(hours=2))
    session.add(rent_eq)
    session.commit()

    # 11️⃣ Услуга
    service = Service(name="Фотограф", price=200.0, amount=1)
    session.add(service)
    session.commit()

    # 12️⃣ Аренда услуги
    rent_srv = RentService(service_id=service.service_id, show_id=show.show_id, rent_start=datetime.now(), rent_end=datetime.now() + timedelta(hours=2))
    session.add(rent_srv)
    session.commit()

print("Минимальный набор данных создан!")
