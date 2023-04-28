--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-04-28 23:35:22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 840 (class 1247 OID 49189)
-- Name: is_success; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.is_success AS ENUM (
    'success',
    'failed'
);


ALTER TYPE public.is_success OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 49194)
-- Name: reflection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reflection (
    id integer NOT NULL,
    success public.is_success,
    low_point integer,
    take_away character varying(20),
    userid integer,
    createdat date,
    updatedat date
);


ALTER TABLE public.reflection OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 49193)
-- Name: reflection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reflection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reflection_id_seq OWNER TO postgres;

--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 214
-- Name: reflection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reflection_id_seq OWNED BY public.reflection.id;


--
-- TOC entry 217 (class 1259 OID 49201)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(30),
    password character varying(100)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 49200)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3342 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3181 (class 2604 OID 49214)
-- Name: reflection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reflection ALTER COLUMN id SET DEFAULT nextval('public.reflection_id_seq'::regclass);


--
-- TOC entry 3182 (class 2604 OID 49215)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3333 (class 0 OID 49194)
-- Dependencies: 215
-- Data for Name: reflection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reflection (id, success, low_point, take_away, userid, createdat, updatedat) FROM stdin;
\.


--
-- TOC entry 3335 (class 0 OID 49201)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password) FROM stdin;
1	user@user.com	$2a$10$AWW2/eWUtwshsBBDEoMbueJDi48Lx8U8nT/4MA/8iBY6up7wO5QJ2
2	user1@user.com	$2a$10$t6G32j.lQ6doCeepIlag1OHIw8e1CKMcauVuQwGfR37ynnvpRM3Fm
3	user2@user.com	$2a$10$J.WC7UGw0ABnjk7AMMthXes2575SmqMF5x5rfUQIexv8wdStEcwUW
4	user3@user.com	$2a$10$nP9z87dW4zRRYFZuwxTtWe5lteDXtwyAjtDlNs9Qrz/gOVt.a87E.
6	user4@user.com	$2a$10$L1SxAB6D4d0nyECirjhb2un.z.X.MiHoEn794a4qOUEjHgWpgL3XG
8	user5@user.com	$2a$10$UyJZMzHhwoz45xwWgiLqUejI9DwNuBaFZ.cjj7EfIcp0vNhPJhsEi
10	user6@user.com	$2a$10$t/LAmmbvDS1boZws3iOkxOyrzlLH5e3NxwDi7sOf7mnIEJ8FUgjn.
11	user7@user.com	$2a$10$7tW6yayCuZI2RUXXFSQhVuq3PAQQ.hxNaACvf3dqLqSs9Fu2SyMXi
12	user8@user.com	$2a$10$ikQymevrZotNBqspFNgRrut6ZEDC0dPNig2GigC6ki/Vr2pFvkQ0O
14	userr8@user.com	$2a$10$t2PLVQ5v61K2/SuX5mnEpuTl4c9.bBZEuOfy681FPpQZJobLB5P4C
16	user11@user.com	$2a$10$6qiZWyCimukaTP4CHKqbp.CVR9NFHRxlsImXMqPlKoPM89zUdpdSK
18	finaluser@gmail.com	$2a$10$7h.q3f3g3X9RNAMYOa7pvOhGO5YWcyCtQo13FJ.IFG2n2JofLlBvK
20	finaluser1@gmail.com	$2a$10$0wrvWUFhY.QI540B/RGgJOI7S7hY/ZOvK2/U.50qWX.OkAwZ27nvu
22	finaluser2@gmail.com	$2a$10$dNxkifggpoYhkJz2lBLvP.gnYQnZYyLcqrjMQtZL/aQfGB6qrdoXi
23	finaluser3@gmail.com	$2a$10$6bKjHI/2KynLx0wS9IFkXOUdeJbmoSkyg.28Kfeu8PPJ/Xc/cWiKi
24	finaluser4@gmail.com	$2a$10$4O2PxUyEAlUbSC38uWaCveZ62Ff1SbXaF00xeLZ8QozhaiM3p/XRS
25	finaluser5@gmail.com	$2a$10$RUhMuu6YikPl.6ecFk06dO13ddpwXOT7RPIuazKYHc2KLTTqH6bQm
\.


--
-- TOC entry 3343 (class 0 OID 0)
-- Dependencies: 214
-- Name: reflection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reflection_id_seq', 1, false);


--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 25, true);


--
-- TOC entry 3186 (class 2606 OID 49208)
-- Name: users email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT email_unique UNIQUE (email);


--
-- TOC entry 3184 (class 2606 OID 49199)
-- Name: reflection reflection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reflection
    ADD CONSTRAINT reflection_pkey PRIMARY KEY (id);


--
-- TOC entry 3188 (class 2606 OID 49206)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3189 (class 2606 OID 49209)
-- Name: reflection users_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reflection
    ADD CONSTRAINT users_fk FOREIGN KEY (userid) REFERENCES public.users(id);


-- Completed on 2023-04-28 23:35:24

--
-- PostgreSQL database dump complete
--

