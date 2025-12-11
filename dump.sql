--
-- PostgreSQL database dump
--

\restrict EkVDBe9yKge1pLJSXs4HtFLjOmWcxqiC8bSO50Q6YZPxAJPi5vzqCVS2jeL8ZwK

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2025-12-12 00:44:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 234 (class 1259 OID 16683)
-- Name: acts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acts (
    act_number integer NOT NULL,
    show_id integer NOT NULL,
    script_ai character varying
);


ALTER TABLE public.acts OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16607)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    email character varying NOT NULL,
    phone character varying,
    name character varying
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16616)
-- Name: equipment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipment (
    equipment_id integer NOT NULL,
    name character varying,
    price double precision,
    amount integer
);


ALTER TABLE public.equipment OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16615)
-- Name: equipment_equipment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equipment_equipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.equipment_equipment_id_seq OWNER TO postgres;

--
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 224
-- Name: equipment_equipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.equipment_equipment_id_seq OWNED BY public.equipment.equipment_id;


--
-- TOC entry 220 (class 1259 OID 16588)
-- Name: franchise; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.franchise (
    contract_id integer NOT NULL,
    contact_person character varying,
    phone character varying,
    email character varying,
    address character varying,
    start_date date,
    end_date date,
    status character varying,
    royalty_percentage double precision,
    initial_fee double precision,
    monthly_fee double precision
);


ALTER TABLE public.franchise OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16587)
-- Name: franchise_contract_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.franchise_contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.franchise_contract_id_seq OWNER TO postgres;

--
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 219
-- Name: franchise_contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.franchise_contract_id_seq OWNED BY public.franchise.contract_id;


--
-- TOC entry 231 (class 1259 OID 16651)
-- Name: hall; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hall (
    hall_id integer NOT NULL,
    theater_id integer,
    capacity integer
);


ALTER TABLE public.hall OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16650)
-- Name: hall_hall_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hall_hall_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hall_hall_id_seq OWNER TO postgres;

--
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 230
-- Name: hall_hall_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hall_hall_id_seq OWNED BY public.hall.hall_id;


--
-- TOC entry 237 (class 1259 OID 16719)
-- Name: rentequipment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rentequipment (
    equipment_id integer NOT NULL,
    show_id integer NOT NULL,
    rent_start timestamp without time zone,
    rent_end timestamp without time zone
);


ALTER TABLE public.rentequipment OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16736)
-- Name: rentservice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rentservice (
    service_id integer NOT NULL,
    show_id integer NOT NULL,
    rent_start timestamp without time zone,
    rent_end timestamp without time zone
);


ALTER TABLE public.rentservice OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16598)
-- Name: scenario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scenario (
    scenario_id integer NOT NULL,
    script_ai character varying,
    script_edited character varying,
    status character varying
);


ALTER TABLE public.scenario OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16597)
-- Name: scenario_scenario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scenario_scenario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.scenario_scenario_id_seq OWNER TO postgres;

--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 221
-- Name: scenario_scenario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scenario_scenario_id_seq OWNED BY public.scenario.scenario_id;


--
-- TOC entry 227 (class 1259 OID 16626)
-- Name: service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service (
    service_id integer NOT NULL,
    name character varying,
    price double precision,
    amount integer
);


ALTER TABLE public.service OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16625)
-- Name: service_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_service_id_seq OWNER TO postgres;

--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 226
-- Name: service_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_service_id_seq OWNED BY public.service.service_id;


--
-- TOC entry 233 (class 1259 OID 16664)
-- Name: show; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.show (
    show_id integer NOT NULL,
    hall_id integer,
    scenario_id integer,
    title character varying,
    add_prompt character varying,
    acts integer,
    duration interval,
    show_date timestamp without time zone
);


ALTER TABLE public.show OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16663)
-- Name: show_show_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.show_show_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.show_show_id_seq OWNER TO postgres;

--
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 232
-- Name: show_show_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.show_show_id_seq OWNED BY public.show.show_id;


--
-- TOC entry 229 (class 1259 OID 16636)
-- Name: theater; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.theater (
    theater_id integer NOT NULL,
    contract_id integer,
    name character varying,
    location character varying
);


ALTER TABLE public.theater OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16635)
-- Name: theater_theater_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.theater_theater_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.theater_theater_id_seq OWNER TO postgres;

--
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 228
-- Name: theater_theater_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.theater_theater_id_seq OWNED BY public.theater.theater_id;


--
-- TOC entry 236 (class 1259 OID 16698)
-- Name: ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket (
    ticket_id integer NOT NULL,
    show_id integer NOT NULL,
    seat_number character varying,
    price double precision,
    status character varying,
    vip_status boolean,
    email character varying NOT NULL
);


ALTER TABLE public.ticket OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16697)
-- Name: ticket_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ticket_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ticket_ticket_id_seq OWNER TO postgres;

--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 235
-- Name: ticket_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ticket_ticket_id_seq OWNED BY public.ticket.ticket_id;


--
-- TOC entry 242 (class 1259 OID 16772)
-- Name: votecommon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.votecommon (
    vote_id integer NOT NULL,
    ticket_id integer NOT NULL,
    show_id integer NOT NULL,
    act_number integer NOT NULL,
    value character varying
);


ALTER TABLE public.votecommon OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16771)
-- Name: votecommon_vote_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.votecommon_vote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.votecommon_vote_id_seq OWNER TO postgres;

--
-- TOC entry 5152 (class 0 OID 0)
-- Dependencies: 241
-- Name: votecommon_vote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.votecommon_vote_id_seq OWNED BY public.votecommon.vote_id;


--
-- TOC entry 240 (class 1259 OID 16754)
-- Name: votevip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.votevip (
    vote_id integer NOT NULL,
    ticket_id integer NOT NULL,
    show_id integer NOT NULL,
    act_number integer NOT NULL,
    value character varying
);


ALTER TABLE public.votevip OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16753)
-- Name: votevip_vote_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.votevip_vote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.votevip_vote_id_seq OWNER TO postgres;

--
-- TOC entry 5153 (class 0 OID 0)
-- Dependencies: 239
-- Name: votevip_vote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.votevip_vote_id_seq OWNED BY public.votevip.vote_id;


--
-- TOC entry 4919 (class 2604 OID 16619)
-- Name: equipment equipment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment ALTER COLUMN equipment_id SET DEFAULT nextval('public.equipment_equipment_id_seq'::regclass);


--
-- TOC entry 4917 (class 2604 OID 16591)
-- Name: franchise contract_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.franchise ALTER COLUMN contract_id SET DEFAULT nextval('public.franchise_contract_id_seq'::regclass);


--
-- TOC entry 4922 (class 2604 OID 16654)
-- Name: hall hall_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hall ALTER COLUMN hall_id SET DEFAULT nextval('public.hall_hall_id_seq'::regclass);


--
-- TOC entry 4918 (class 2604 OID 16601)
-- Name: scenario scenario_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scenario ALTER COLUMN scenario_id SET DEFAULT nextval('public.scenario_scenario_id_seq'::regclass);


--
-- TOC entry 4920 (class 2604 OID 16629)
-- Name: service service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service ALTER COLUMN service_id SET DEFAULT nextval('public.service_service_id_seq'::regclass);


--
-- TOC entry 4923 (class 2604 OID 16667)
-- Name: show show_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.show ALTER COLUMN show_id SET DEFAULT nextval('public.show_show_id_seq'::regclass);


--
-- TOC entry 4921 (class 2604 OID 16639)
-- Name: theater theater_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.theater ALTER COLUMN theater_id SET DEFAULT nextval('public.theater_theater_id_seq'::regclass);


--
-- TOC entry 4924 (class 2604 OID 16701)
-- Name: ticket ticket_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket ALTER COLUMN ticket_id SET DEFAULT nextval('public.ticket_ticket_id_seq'::regclass);


--
-- TOC entry 4926 (class 2604 OID 16775)
-- Name: votecommon vote_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.votecommon ALTER COLUMN vote_id SET DEFAULT nextval('public.votecommon_vote_id_seq'::regclass);


--
-- TOC entry 4925 (class 2604 OID 16757)
-- Name: votevip vote_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.votevip ALTER COLUMN vote_id SET DEFAULT nextval('public.votevip_vote_id_seq'::regclass);


--
-- TOC entry 5130 (class 0 OID 16683)
-- Dependencies: 234
-- Data for Name: acts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.acts (act_number, show_id, script_ai) FROM stdin;
1	1	Акт 1: вступление
2	1	Акт 2: кульминация
1	2	Акт 1: вступление
2	2	Акт 2: кульминация
\.


--
-- TOC entry 5119 (class 0 OID 16607)
-- Dependencies: 223
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (email, phone, name) FROM stdin;
alice@mail.com	+79001112233	Alice
\.


--
-- TOC entry 5121 (class 0 OID 16616)
-- Dependencies: 225
-- Data for Name: equipment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipment (equipment_id, name, price, amount) FROM stdin;
1	Проектор	500	2
\.


--
-- TOC entry 5116 (class 0 OID 16588)
-- Dependencies: 220
-- Data for Name: franchise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.franchise (contract_id, contact_person, phone, email, address, start_date, end_date, status, royalty_percentage, initial_fee, monthly_fee) FROM stdin;
1	Иван Иванов	+79001234567	franchise@example.com	г. Москва, ул. Театральная 1	2025-12-12	\N	active	10	5000	1000
2	Иван Иванов	+79001234567	franchise@example.com	г. Москва, ул. Театральная 1	2025-12-12	\N	active	10	5000	1000
\.


--
-- TOC entry 5127 (class 0 OID 16651)
-- Dependencies: 231
-- Data for Name: hall; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hall (hall_id, theater_id, capacity) FROM stdin;
1	1	50
2	2	50
\.


--
-- TOC entry 5133 (class 0 OID 16719)
-- Dependencies: 237
-- Data for Name: rentequipment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rentequipment (equipment_id, show_id, rent_start, rent_end) FROM stdin;
1	1	2025-12-12 00:23:45.158169	2025-12-12 02:23:45.158171
\.


--
-- TOC entry 5134 (class 0 OID 16736)
-- Dependencies: 238
-- Data for Name: rentservice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rentservice (service_id, show_id, rent_start, rent_end) FROM stdin;
1	1	2025-12-12 00:23:45.169309	2025-12-12 02:23:45.169311
\.


--
-- TOC entry 5118 (class 0 OID 16598)
-- Dependencies: 222
-- Data for Name: scenario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scenario (scenario_id, script_ai, script_edited, status) FROM stdin;
1	Сценарий AI: волшебное приключение	\N	approved
2	Сценарий AI: волшебное приключение	\N	approved
\.


--
-- TOC entry 5123 (class 0 OID 16626)
-- Dependencies: 227
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service (service_id, name, price, amount) FROM stdin;
1	Фотограф	200	1
\.


--
-- TOC entry 5129 (class 0 OID 16664)
-- Dependencies: 233
-- Data for Name: show; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.show (show_id, hall_id, scenario_id, title, add_prompt, acts, duration, show_date) FROM stdin;
1	1	1	Ночное приключение	\N	2	01:30:00	2025-12-12 00:23:45.100302
2	2	2	Ночное приключение	\N	2	01:30:00	2025-12-12 00:30:00.644789
\.


--
-- TOC entry 5125 (class 0 OID 16636)
-- Dependencies: 229
-- Data for Name: theater; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.theater (theater_id, contract_id, name, location) FROM stdin;
1	1	Большой театр иммерсивного искусства	Москва
2	2	Большой театр иммерсивного искусства	Москва
\.


--
-- TOC entry 5132 (class 0 OID 16698)
-- Dependencies: 236
-- Data for Name: ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket (ticket_id, show_id, seat_number, price, status, vip_status, email) FROM stdin;
1	1	A1	1000	sold	t	alice@mail.com
2	1	A2	1000	sold	f	alice@mail.com
\.


--
-- TOC entry 5138 (class 0 OID 16772)
-- Dependencies: 242
-- Data for Name: votecommon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.votecommon (vote_id, ticket_id, show_id, act_number, value) FROM stdin;
\.


--
-- TOC entry 5136 (class 0 OID 16754)
-- Dependencies: 240
-- Data for Name: votevip; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.votevip (vote_id, ticket_id, show_id, act_number, value) FROM stdin;
\.


--
-- TOC entry 5154 (class 0 OID 0)
-- Dependencies: 224
-- Name: equipment_equipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipment_equipment_id_seq', 1, true);


--
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 219
-- Name: franchise_contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.franchise_contract_id_seq', 2, true);


--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 230
-- Name: hall_hall_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hall_hall_id_seq', 2, true);


--
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 221
-- Name: scenario_scenario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scenario_scenario_id_seq', 2, true);


--
-- TOC entry 5158 (class 0 OID 0)
-- Dependencies: 226
-- Name: service_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_service_id_seq', 1, true);


--
-- TOC entry 5159 (class 0 OID 0)
-- Dependencies: 232
-- Name: show_show_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.show_show_id_seq', 2, true);


--
-- TOC entry 5160 (class 0 OID 0)
-- Dependencies: 228
-- Name: theater_theater_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.theater_theater_id_seq', 2, true);


--
-- TOC entry 5161 (class 0 OID 0)
-- Dependencies: 235
-- Name: ticket_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ticket_ticket_id_seq', 2, true);


--
-- TOC entry 5162 (class 0 OID 0)
-- Dependencies: 241
-- Name: votecommon_vote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.votecommon_vote_id_seq', 1, false);


--
-- TOC entry 5163 (class 0 OID 0)
-- Dependencies: 239
-- Name: votevip_vote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.votevip_vote_id_seq', 1, false);


--
-- TOC entry 4944 (class 2606 OID 16691)
-- Name: acts acts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acts
    ADD CONSTRAINT acts_pkey PRIMARY KEY (act_number, show_id);


--
-- TOC entry 4932 (class 2606 OID 16614)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (email);


--
-- TOC entry 4934 (class 2606 OID 16624)
-- Name: equipment equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (equipment_id);


--
-- TOC entry 4928 (class 2606 OID 16596)
-- Name: franchise franchise_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.franchise
    ADD CONSTRAINT franchise_pkey PRIMARY KEY (contract_id);


--
-- TOC entry 4940 (class 2606 OID 16657)
-- Name: hall hall_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hall
    ADD CONSTRAINT hall_pkey PRIMARY KEY (hall_id);


--
-- TOC entry 4948 (class 2606 OID 16725)
-- Name: rentequipment rentequipment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentequipment
    ADD CONSTRAINT rentequipment_pkey PRIMARY KEY (equipment_id, show_id);


--
-- TOC entry 4950 (class 2606 OID 16742)
-- Name: rentservice rentservice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentservice
    ADD CONSTRAINT rentservice_pkey PRIMARY KEY (service_id, show_id);


--
-- TOC entry 4930 (class 2606 OID 16606)
-- Name: scenario scenario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scenario
    ADD CONSTRAINT scenario_pkey PRIMARY KEY (scenario_id);


--
-- TOC entry 4936 (class 2606 OID 16634)
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (service_id);


--
-- TOC entry 4942 (class 2606 OID 16672)
-- Name: show show_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.show
    ADD CONSTRAINT show_pkey PRIMARY KEY (show_id);


--
-- TOC entry 4938 (class 2606 OID 16644)
-- Name: theater theater_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.theater
    ADD CONSTRAINT theater_pkey PRIMARY KEY (theater_id);


--
-- TOC entry 4946 (class 2606 OID 16708)
-- Name: ticket ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (ticket_id);


--
-- TOC entry 4954 (class 2606 OID 16783)
-- Name: votecommon votecommon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.votecommon
    ADD CONSTRAINT votecommon_pkey PRIMARY KEY (vote_id);


--
-- TOC entry 4952 (class 2606 OID 16765)
-- Name: votevip votevip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.votevip
    ADD CONSTRAINT votevip_pkey PRIMARY KEY (vote_id);


--
-- TOC entry 4959 (class 2606 OID 16692)
-- Name: acts acts_show_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acts
    ADD CONSTRAINT acts_show_id_fkey FOREIGN KEY (show_id) REFERENCES public.show(show_id);


--
-- TOC entry 4956 (class 2606 OID 16658)
-- Name: hall hall_theater_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hall
    ADD CONSTRAINT hall_theater_id_fkey FOREIGN KEY (theater_id) REFERENCES public.theater(theater_id);


--
-- TOC entry 4962 (class 2606 OID 16726)
-- Name: rentequipment rentequipment_equipment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentequipment
    ADD CONSTRAINT rentequipment_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES public.equipment(equipment_id);


--
-- TOC entry 4963 (class 2606 OID 16731)
-- Name: rentequipment rentequipment_show_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentequipment
    ADD CONSTRAINT rentequipment_show_id_fkey FOREIGN KEY (show_id) REFERENCES public.show(show_id);


--
-- TOC entry 4964 (class 2606 OID 16743)
-- Name: rentservice rentservice_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentservice
    ADD CONSTRAINT rentservice_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(service_id);


--
-- TOC entry 4965 (class 2606 OID 16748)
-- Name: rentservice rentservice_show_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentservice
    ADD CONSTRAINT rentservice_show_id_fkey FOREIGN KEY (show_id) REFERENCES public.show(show_id);


--
-- TOC entry 4957 (class 2606 OID 16673)
-- Name: show show_hall_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.show
    ADD CONSTRAINT show_hall_id_fkey FOREIGN KEY (hall_id) REFERENCES public.hall(hall_id);


--
-- TOC entry 4958 (class 2606 OID 16678)
-- Name: show show_scenario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.show
    ADD CONSTRAINT show_scenario_id_fkey FOREIGN KEY (scenario_id) REFERENCES public.scenario(scenario_id);


--
-- TOC entry 4955 (class 2606 OID 16645)
-- Name: theater theater_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.theater
    ADD CONSTRAINT theater_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.franchise(contract_id);


--
-- TOC entry 4960 (class 2606 OID 16714)
-- Name: ticket ticket_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_email_fkey FOREIGN KEY (email) REFERENCES public.customer(email);


--
-- TOC entry 4961 (class 2606 OID 16709)
-- Name: ticket ticket_show_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_show_id_fkey FOREIGN KEY (show_id) REFERENCES public.show(show_id);


--
-- TOC entry 4967 (class 2606 OID 16784)
-- Name: votecommon votecommon_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.votecommon
    ADD CONSTRAINT votecommon_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.ticket(ticket_id);


--
-- TOC entry 4966 (class 2606 OID 16766)
-- Name: votevip votevip_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.votevip
    ADD CONSTRAINT votevip_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.ticket(ticket_id);


-- Completed on 2025-12-12 00:44:13

--
-- PostgreSQL database dump complete
--

\unrestrict EkVDBe9yKge1pLJSXs4HtFLjOmWcxqiC8bSO50Q6YZPxAJPi5vzqCVS2jeL8ZwK

