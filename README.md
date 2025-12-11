# Курсовая и лабораторные работы по предмету:
**Методы и средства проектирования информационных систем и технологий**

**Студент:** Момот Данил Владимирович (ИС-1/2)  
**СУБД:** PostgreSQL v18  

---

## Описание проекта
Проект представляет собой **базу данных для управления иммерсивным театром**.  
В базе реализованы таблицы для работы с договорами франшиз, театрами, залами, представлениями, сценариями, актами, билетами, голосованиями зрителей, оборудованием и услугами и др.  
База данных полностью структурирована с учетом связей, каскадных ограничений и составных ключей.

Проект включает:
- Модели на Python с использованием **SQLModel**.
- Методы выборки данных.
- Возможность быстрого наполнения базы минимальным набором данных для тестирования и отладки.

---

## Структура базы данных
- **Franchise** - франшиза, контакты, договорные условия.  
- **Theater** - театр, привязанный к франшизе.  
- **Hall** - залы театров с указанием вместимости.  
- **Scenario** - сценарии шоу, с версиями AI и отредактированными.  
- **Show** - конкретные представления с датой, продолжительностью, актами и сценарием.  
- **Acts** - акты конкретного шоу (составной ключ).  
- **Ticket** - билеты зрителей, VIP-статус, цена, статус.  
- **VoteVIP / VoteCommon** - голосование зрителей по актам шоу.  
- **Equipment / RentEquipment** - оборудование и его аренда для шоу.  
- **Service / RentService** - услуги и их аренда для шоу.

---

## Используемые технологии
- **Python 3.13**  
- **SQLModel** для работы с базой данных через ORM  
- **PostgreSQL v18**  
- **SQLAlchemy** как основной движок ORM  

---

## Примеры методов выборки данных
- Получение всех шоу конкретного театра  
- Получение всех билетов по клиенту  
- Получение актов шоу с подсчетом VIP и обычных голосов  
- Получение аренды оборудования для конкретного шоу  
- Получение списка активных франшиз с их театрами  

---

## Цель проекта
Проект создан для **изучения и отработки навыков проектирования баз данных и ORM-моделирования**, а также для **демонстрации навыков работы с PostgreSQL и SQLModel**.  

---

## Примечание
Для доступа к PlantUML диаграмме можно также воспользоваться ссылкой:
www.plantuml.com/plantuml/png/nLXTRzjK6BxthpWg5oHIo-X7nwZOMBl1GDiqQ2hWObBb9LPgaJZ5SUbsbwxREgbZPHjYQA2MmGHNIEb7MhT9dRzmpb_OB-4zppcsuvvaY8jgdTOwpddVztc_7_jYFR3zOAbQiG8tg3YCR_68j_cnMEU7ZF_CGtx0ZtcB_kjRVz6j8zvc_1VUeNyjqH0hT6k7JaHybqUC_q77c-AkQF3cJI_7NyaBadu8NKts-i5JPMLF7XTtUKJ2H_4NJtX8vbialgvkF0EUIApW72dYeTZGNm5NI-eN3zBRFvBc9k-IPdqxRrbsCQZvR8XlYGO9xOaL-Itf2-blYxV58vR5ATQ7c5rdd_gsLrnmwywDPS_nOosmqE4XiAmeJwKVef5n7XgcIrNNI-t_fY2J_Bu4Rfw_RdjskSVKIt91YZJf18pXrDU-6wI7llhy2yQVuu3s1eVeTg9cas-BTR4M9z4yN0XihsJxfHuVZ-G1qL1koBkMjKYruXRTHTiBsD2SKt7AlbsLIOiqiBdoJ2smh5krsn8xShE3tzhm4_43Fu93UontgUOx-I7spZMtl13CL9OSYz5FnWRV95aIo8PPYyAYl3BbfiiE_PdsxCgTUg0yAEjFWmvViQlEPQVkbYdJMYB-E4YaKFGTnrj6ChI8oemfSDMhBLUSKjbXCtRTORdPwIiA_zKPo_5AZ2AM2I_2Hmb7aZhK7LG9g-8UUgCXMq4vl-GKo2Md-X-YI09L_1d-dE-8LTbka4Va2xKbhvHLS6dsEZiZyzf4owAXC074VSXTdh4iwrrs_ZH-IE-RVzv_Znb3XOTzPqgclquDi7N-F84Q9LZFULCEH_5OhA78GzvYubu6Qp8cz-G5W4Ro02D5sN73HYweyS6ce5uR41knRyVqIyv5wHubTKyQb8QHUb9BNpAwYWCGyOu5VL9nrfIsC4OMVkg5nNWNGUtAUf9E90ge1BJGE0czf5C7gahWiyo95WfJKxbYpGjy6Z3pRYclepPcIlTYHcQXhIqnKP0C16E4GS7UnaXl9v6VMt1iQiQiMLDyR83uPtQbaWkK3X8TPaLxqIwwmPqO-tYSSGf-5oc1baXb8xEl-k0U7uZxa--MtCKg3HXJfc-yPkdeV2B4Shmhnpl3eY7juZvo6D8iY50QOUp0XE60MAMKjUdZRZ_84mCX5np_UxVec18ICF3f4_y3tIJP-bqFdWsA8The0B-tqUG0lDAx8EaADQAcCE70UW2IoQH1Tv6V0uXZJW91qfYelYF54EGGFABxnp3IbNI2XnPqakvusclzOqe__2DN65gn0RqxMdSMhTYmb0f0fKsW5L5TqNeO8OYfifoAZTpNmmo4g967jEaeqlftnlRXoJWT9axqke2GRv8Tiee4cn768bvD0un4G_OioMw9LSfD6nGnvcI5ekFPlblBrOk-knZCssx-BIwFKQ2acA9_zcK9RCUKKmRhL9S4ZFCexZV3U5moBNx0Jh0h9bN494t67KoBJP7En2LgtOxQ1fGqFNwHmOSyefn18adPg56lXONQCZkJv8ikvGIqwFH8njuuPW2Q5Nv8QjTI5biWZTY1F1o05-Nvb6GmANL_aLm3KT1TQ62ELK73P1n7EH0OEYFgdI1O6Xsr20UXEFkcN3IDO7rWpbrYN_MWLgKso3bLswta3Q5pVOJctEAtJf2hKx2nLEgqN-QzfUejnnzcYpwDoBnbnln3ZNQFm2b2lKywu-bB3gIEX0E2DYfvqp_a89A45eWVwbBFMUxBsRVPdbIJvcCTqjay-LHd3jFJR5titRXaNn8HRaWopE87Ij2JVPsGGvQZPwyyMfOkUkiEPCKSiTXioPFIAkeP9B5hgXSRDxqX_a9s6IEHaBx5evmw785uj1CihO-7T3saEq9HdYrOaygROWrpFlKgGfd5KobtpQq77nK2t_NA5zHs1kbJl1FLj8eKuC4ahdHaxHN8RSVyRZCUEuhvnkieVKmZd8eXlI1lckXhmWiAdPO5Uk3GIeLI9q6L9butdaso7ag-e_mxLcClGs8EKn3fanyKAMVlALV8uNRg3hd-Y4qmN18uwHzuWqoPHBZRx-s5bUXFz_uunkAlqiQ8JYJA0VM1fyMiLEhc95f6F_HW59juOjVI1ufn3C0_-uwJh3Is8iHwpM8WRgBOjaK3eb5g1HM7O-VY9GDcIHKR9Ob7oQ42mV7JLnB8gQoo2RXcH92t1cv3CDG1Ch9oJlWcretccEZV75ZAClVY4KOGmW9_CxBZY8hkMlYIcT7RoblAqqEwKXsETW_XxsJVwKUL5w9YoJRzxSya4P4-n1IqDxFcfOmipAoPnrdUAoi9YGNz1eDK0m4Bnc2j8BzKf5CifQa68n0RmvH-17-troFKBC92D-1Us8_PWXVpLoSaJMRBSdFExI1lbZo8yO2IH-ab3xxmDdcr6HhLJqJPh7vaa9hAVF_O9nB8GWgzbKbVybQ7JP52JHgpfTXL99jmgyyTU4yaG3vVAHg4TAz9P7ahrKZgyIuFgljMUgOCcW2DCk6T567wtWXwC20HiNG8eQVLowRa7YuxgAaziKulXozV_uPevet2fRnrqV5Az1hwNm00
