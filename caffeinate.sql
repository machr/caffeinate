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
-- Name: groups; Type: TABLE; Schema: public; Owner: mark
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE groups OWNER TO mark;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: mark
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_id_seq OWNER TO mark;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mark
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: mark
--

CREATE TABLE services (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE services OWNER TO mark;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: mark
--

CREATE SEQUENCE services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE services_id_seq OWNER TO mark;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mark
--

ALTER SEQUENCE services_id_seq OWNED BY services.id;


--
-- Name: shop_groups; Type: TABLE; Schema: public; Owner: mark
--

CREATE TABLE shop_groups (
    id integer NOT NULL,
    group_id integer,
    shop_id integer
);


ALTER TABLE shop_groups OWNER TO mark;

--
-- Name: shop_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: mark
--

CREATE SEQUENCE shop_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shop_groups_id_seq OWNER TO mark;

--
-- Name: shop_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mark
--

ALTER SEQUENCE shop_groups_id_seq OWNED BY shop_groups.id;


--
-- Name: shop_owners; Type: TABLE; Schema: public; Owner: mark
--

CREATE TABLE shop_owners (
    id integer NOT NULL,
    firstname character varying(400),
    lastname character varying(400),
    email character varying(400),
    phone character varying(400),
    password_digest character varying(400)
);


ALTER TABLE shop_owners OWNER TO mark;

--
-- Name: shop_owners_id_seq; Type: SEQUENCE; Schema: public; Owner: mark
--

CREATE SEQUENCE shop_owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shop_owners_id_seq OWNER TO mark;

--
-- Name: shop_owners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mark
--

ALTER SEQUENCE shop_owners_id_seq OWNED BY shop_owners.id;


--
-- Name: shop_services; Type: TABLE; Schema: public; Owner: mark
--

CREATE TABLE shop_services (
    id integer NOT NULL,
    service_id integer,
    shop_id integer
);


ALTER TABLE shop_services OWNER TO mark;

--
-- Name: shop_services_id_seq; Type: SEQUENCE; Schema: public; Owner: mark
--

CREATE SEQUENCE shop_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shop_services_id_seq OWNER TO mark;

--
-- Name: shop_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mark
--

ALTER SEQUENCE shop_services_id_seq OWNED BY shop_services.id;


--
-- Name: shops; Type: TABLE; Schema: public; Owner: mark
--

CREATE TABLE shops (
    id integer NOT NULL,
    name character varying(400) NOT NULL,
    address character varying(500),
    city character varying(500),
    state character varying(50),
    postcode integer,
    logo_url text,
    shop_owner_id integer,
    shop_group_id integer,
    description text,
    image_url character varying(500)
);


ALTER TABLE shops OWNER TO mark;

--
-- Name: shops_id_seq; Type: SEQUENCE; Schema: public; Owner: mark
--

CREATE SEQUENCE shops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shops_id_seq OWNER TO mark;

--
-- Name: shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mark
--

ALTER SEQUENCE shops_id_seq OWNED BY shops.id;


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: mark
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: mark
--

ALTER TABLE ONLY services ALTER COLUMN id SET DEFAULT nextval('services_id_seq'::regclass);


--
-- Name: shop_groups id; Type: DEFAULT; Schema: public; Owner: mark
--

ALTER TABLE ONLY shop_groups ALTER COLUMN id SET DEFAULT nextval('shop_groups_id_seq'::regclass);


--
-- Name: shop_owners id; Type: DEFAULT; Schema: public; Owner: mark
--

ALTER TABLE ONLY shop_owners ALTER COLUMN id SET DEFAULT nextval('shop_owners_id_seq'::regclass);


--
-- Name: shop_services id; Type: DEFAULT; Schema: public; Owner: mark
--

ALTER TABLE ONLY shop_services ALTER COLUMN id SET DEFAULT nextval('shop_services_id_seq'::regclass);


--
-- Name: shops id; Type: DEFAULT; Schema: public; Owner: mark
--

ALTER TABLE ONLY shops ALTER COLUMN id SET DEFAULT nextval('shops_id_seq'::regclass);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: mark
--

COPY groups (id, name) FROM stdin;
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mark
--

SELECT pg_catalog.setval('groups_id_seq', 1, false);


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: mark
--

COPY services (id, name) FROM stdin;
1	High Chair
2	Board Games
3	Outdoor seating
5	Toilets
6	WIFI
4	Powerpoints
\.


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mark
--

SELECT pg_catalog.setval('services_id_seq', 6, true);


--
-- Data for Name: shop_groups; Type: TABLE DATA; Schema: public; Owner: mark
--

COPY shop_groups (id, group_id, shop_id) FROM stdin;
\.


--
-- Name: shop_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mark
--

SELECT pg_catalog.setval('shop_groups_id_seq', 1, false);


--
-- Data for Name: shop_owners; Type: TABLE DATA; Schema: public; Owner: mark
--

COPY shop_owners (id, firstname, lastname, email, phone, password_digest) FROM stdin;
7	bob	bob	bob@bob.bob	123123	$2a$10$IAg1Ue3jr6FJ4iPezmNX.uBnEBzP3hNKMTI9Wn2Hs9xZGr4z0Hd1G
8	Mark 	Powell	m@p.co	0481083949	$2a$10$7o.MKa394TrAu6AfFOuBHetVfbxpWyKCLJue6PmrFC9t3Mb0XAD6.
\.


--
-- Name: shop_owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mark
--

SELECT pg_catalog.setval('shop_owners_id_seq', 8, true);


--
-- Data for Name: shop_services; Type: TABLE DATA; Schema: public; Owner: mark
--

COPY shop_services (id, service_id, shop_id) FROM stdin;
1	5	2
2	4	2
3	6	2
4	2	2
5	5	4
6	5	5
7	4	6
8	5	6
9	6	6
10	5	8
11	6	8
12	3	9
13	5	9
14	6	9
\.


--
-- Name: shop_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mark
--

SELECT pg_catalog.setval('shop_services_id_seq', 14, true);


--
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: mark
--

COPY shops (id, name, address, city, state, postcode, logo_url, shop_owner_id, shop_group_id, description, image_url) FROM stdin;
3	Ample Cafe	123 Howard St	North Melbourne	VIC	3051	http://www.amplecafe.com.au/wp-content/uploads/2015/02/Ample-cafe-and-bar-Logo2.png	7	\N	\N	\N
2	Oli & Evi	337 Collins Street	Melbourne	VIC	3008	http://oliandlevi.com.au/wp-content/uploads/2015/05/oli_logo_final_white.png	\N	\N	Its on the groundfloor!	\N
4	kasun's pastries	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	mark's steak shop	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	blah	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	Nightmare	Elm St	Brunswick	VIC	3056		8	\N	\N	\N
8	Nightmare	Elm St	brunswick	VIC	3056		\N	\N	\N	\N
9	Bobs Burgers	373 La Trobe Street	Docklands	VIC	3008		7	\N	\N	\N
\.


--
-- Name: shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mark
--

SELECT pg_catalog.setval('shops_id_seq', 9, true);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: mark
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: mark
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: shop_groups shop_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: mark
--

ALTER TABLE ONLY shop_groups
    ADD CONSTRAINT shop_groups_pkey PRIMARY KEY (id);


--
-- Name: shop_owners shop_owners_pkey; Type: CONSTRAINT; Schema: public; Owner: mark
--

ALTER TABLE ONLY shop_owners
    ADD CONSTRAINT shop_owners_pkey PRIMARY KEY (id);


--
-- Name: shop_services shop_services_pkey; Type: CONSTRAINT; Schema: public; Owner: mark
--

ALTER TABLE ONLY shop_services
    ADD CONSTRAINT shop_services_pkey PRIMARY KEY (id);


--
-- Name: shops shops_pkey; Type: CONSTRAINT; Schema: public; Owner: mark
--

ALTER TABLE ONLY shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

