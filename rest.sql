--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: menuitems; Type: TABLE; Schema: public; Owner: reuben
--

CREATE TABLE menuitems (
    id integer NOT NULL,
    name character varying(128),
    description text,
    price numeric
);


ALTER TABLE menuitems OWNER TO reuben;

--
-- Name: menuitems_id_seq; Type: SEQUENCE; Schema: public; Owner: reuben
--

CREATE SEQUENCE menuitems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE menuitems_id_seq OWNER TO reuben;

--
-- Name: menuitems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reuben
--

ALTER SEQUENCE menuitems_id_seq OWNED BY menuitems.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: reuben
--

CREATE TABLE orders (
    id integer NOT NULL,
    menuitem_id integer,
    waiter_id integer,
    notes character varying(128),
    open boolean
);


ALTER TABLE orders OWNER TO reuben;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: reuben
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_id_seq OWNER TO reuben;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reuben
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: waiters; Type: TABLE; Schema: public; Owner: reuben
--

CREATE TABLE waiters (
    id integer NOT NULL,
    name character varying(128)
);


ALTER TABLE waiters OWNER TO reuben;

--
-- Name: waiters_id_seq; Type: SEQUENCE; Schema: public; Owner: reuben
--

CREATE SEQUENCE waiters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE waiters_id_seq OWNER TO reuben;

--
-- Name: waiters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reuben
--

ALTER SEQUENCE waiters_id_seq OWNED BY waiters.id;


--
-- Name: menuitems id; Type: DEFAULT; Schema: public; Owner: reuben
--

ALTER TABLE ONLY menuitems ALTER COLUMN id SET DEFAULT nextval('menuitems_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: reuben
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: waiters id; Type: DEFAULT; Schema: public; Owner: reuben
--

ALTER TABLE ONLY waiters ALTER COLUMN id SET DEFAULT nextval('waiters_id_seq'::regclass);


--
-- Data for Name: menuitems; Type: TABLE DATA; Schema: public; Owner: reuben
--

COPY menuitems (id, name, description, price) FROM stdin;
1	Hot Dog	Try it Chicago Style: steamed all-beef frank with onions, tomatoes, pickles, cucumbers, relish, mustard, celery salt AND NEVER KETCHUP	2.99
2	Omelette	Fancy french egg thing	8.50
3	Salad	Try: Goat walnut gorgonzola cranberry on spring greens	7.25
4	Pasta	U name it	12.99
\.


--
-- Name: menuitems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reuben
--

SELECT pg_catalog.setval('menuitems_id_seq', 4, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: reuben
--

COPY orders (id, menuitem_id, waiter_id, notes, open) FROM stdin;
1	1	1	chicago style	t
2	2	1	egg whites only	t
3	1	2	mustard and kraut plz	t
4	2	2	bacon broc moz garlic	t
5	3	3	cobb salad	t
6	3	4	mushroom rav	t
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reuben
--

SELECT pg_catalog.setval('orders_id_seq', 6, true);


--
-- Data for Name: waiters; Type: TABLE DATA; Schema: public; Owner: reuben
--

COPY waiters (id, name) FROM stdin;
1	Samat
2	Irwin
3	Hannah
4	Marie
\.


--
-- Name: waiters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reuben
--

SELECT pg_catalog.setval('waiters_id_seq', 4, true);


--
-- Name: menuitems menuitems_pkey; Type: CONSTRAINT; Schema: public; Owner: reuben
--

ALTER TABLE ONLY menuitems
    ADD CONSTRAINT menuitems_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: reuben
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: waiters waiters_pkey; Type: CONSTRAINT; Schema: public; Owner: reuben
--

ALTER TABLE ONLY waiters
    ADD CONSTRAINT waiters_pkey PRIMARY KEY (id);


--
-- Name: orders orders_menuitem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: reuben
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_menuitem_id_fkey FOREIGN KEY (menuitem_id) REFERENCES menuitems(id);


--
-- Name: orders orders_waiter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: reuben
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_waiter_id_fkey FOREIGN KEY (waiter_id) REFERENCES waiters(id);


--
-- PostgreSQL database dump complete
--

