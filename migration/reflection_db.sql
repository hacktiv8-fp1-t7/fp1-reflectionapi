--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-04-28 23:27:10

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
-- TOC entry 3331 (class 0 OID 0)
-- Dependencies: 214
-- Name: reflection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reflection_id_seq OWNED BY public.reflection.id;


--
-- TOC entry 3178 (class 2604 OID 49214)
-- Name: reflection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reflection ALTER COLUMN id SET DEFAULT nextval('public.reflection_id_seq'::regclass);


--
-- TOC entry 3325 (class 0 OID 49194)
-- Dependencies: 215
-- Data for Name: reflection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reflection (id, success, low_point, take_away, userid, createdat, updatedat) FROM stdin;
\.


--
-- TOC entry 3332 (class 0 OID 0)
-- Dependencies: 214
-- Name: reflection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reflection_id_seq', 1, false);


--
-- TOC entry 3180 (class 2606 OID 49199)
-- Name: reflection reflection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reflection
    ADD CONSTRAINT reflection_pkey PRIMARY KEY (id);


--
-- TOC entry 3181 (class 2606 OID 49209)
-- Name: reflection users_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reflection
    ADD CONSTRAINT users_fk FOREIGN KEY (userid) REFERENCES public.users(id);


-- Completed on 2023-04-28 23:27:15

--
-- PostgreSQL database dump complete
--

