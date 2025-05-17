--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12
-- Dumped by pg_dump version 16.3

-- Started on 2025-05-17 01:33:56

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 833 (class 1247 OID 16984)
-- Name: estado_espacio; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_espacio AS ENUM (
    'ocupado',
    'libre'
);


ALTER TYPE public.estado_espacio OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16990)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id_client integer NOT NULL,
    nombre character varying(45),
    telefono character varying(20),
    email character varying(45),
    apellido character varying(25)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16989)
-- Name: clientes_id_client_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_client_seq OWNER TO postgres;

--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 209
-- Name: clientes_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_client_seq OWNED BY public.clientes.id_client;


--
-- TOC entry 212 (class 1259 OID 16997)
-- Name: empleados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleados (
    id_emp integer NOT NULL,
    nombre_emp character varying(45),
    apellido_emp character varying(45),
    telefono_emp character varying(25),
    email_emp character varying(40)
);


ALTER TABLE public.empleados OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16996)
-- Name: empleados_id_emp_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleados_id_emp_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.empleados_id_emp_seq OWNER TO postgres;

--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 211
-- Name: empleados_id_emp_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empleados_id_emp_seq OWNED BY public.empleados.id_emp;


--
-- TOC entry 216 (class 1259 OID 17018)
-- Name: espacios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.espacios (
    id_espacio integer NOT NULL,
    estado public.estado_espacio DEFAULT 'libre'::public.estado_espacio,
    id_vehiculo integer
);


ALTER TABLE public.espacios OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17017)
-- Name: espacios_id_espacio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.espacios_id_espacio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.espacios_id_espacio_seq OWNER TO postgres;

--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 215
-- Name: espacios_id_espacio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.espacios_id_espacio_seq OWNED BY public.espacios.id_espacio;


--
-- TOC entry 220 (class 1259 OID 32779)
-- Name: mantenimiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mantenimiento (
    id_mantenimiento integer NOT NULL,
    id_espacio integer NOT NULL,
    id_emp integer NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE public.mantenimiento OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 32778)
-- Name: mantenimiento_id_mantenimiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mantenimiento_id_mantenimiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mantenimiento_id_mantenimiento_seq OWNER TO postgres;

--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 219
-- Name: mantenimiento_id_mantenimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mantenimiento_id_mantenimiento_seq OWNED BY public.mantenimiento.id_mantenimiento;


--
-- TOC entry 218 (class 1259 OID 17048)
-- Name: relacioncli; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.relacioncli (
    nro_contrato integer DEFAULT floor((random() * (1000000)::double precision)) NOT NULL,
    id_client integer,
    id_emp integer
);


ALTER TABLE public.relacioncli OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17047)
-- Name: relacioncli_id_relacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.relacioncli_id_relacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.relacioncli_id_relacion_seq OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 217
-- Name: relacioncli_id_relacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.relacioncli_id_relacion_seq OWNED BY public.relacioncli.nro_contrato;


--
-- TOC entry 214 (class 1259 OID 17004)
-- Name: vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehiculo (
    id_vehiculo integer NOT NULL,
    matricula character varying(20) NOT NULL,
    marca character varying(50),
    modelo character varying(50),
    id_client integer
);


ALTER TABLE public.vehiculo OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17003)
-- Name: vehiculo_id_vehiculo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehiculo_id_vehiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehiculo_id_vehiculo_seq OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 213
-- Name: vehiculo_id_vehiculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehiculo_id_vehiculo_seq OWNED BY public.vehiculo.id_vehiculo;


--
-- TOC entry 3192 (class 2604 OID 16993)
-- Name: clientes id_client; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id_client SET DEFAULT nextval('public.clientes_id_client_seq'::regclass);


--
-- TOC entry 3193 (class 2604 OID 17000)
-- Name: empleados id_emp; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados ALTER COLUMN id_emp SET DEFAULT nextval('public.empleados_id_emp_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 17021)
-- Name: espacios id_espacio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.espacios ALTER COLUMN id_espacio SET DEFAULT nextval('public.espacios_id_espacio_seq'::regclass);


--
-- TOC entry 3198 (class 2604 OID 32782)
-- Name: mantenimiento id_mantenimiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimiento ALTER COLUMN id_mantenimiento SET DEFAULT nextval('public.mantenimiento_id_mantenimiento_seq'::regclass);


--
-- TOC entry 3194 (class 2604 OID 17007)
-- Name: vehiculo id_vehiculo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculo ALTER COLUMN id_vehiculo SET DEFAULT nextval('public.vehiculo_id_vehiculo_seq'::regclass);


--
-- TOC entry 3363 (class 0 OID 16990)
-- Dependencies: 210
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id_client, nombre, telefono, email, apellido) FROM stdin;
1	Kevin	0974651425	kevinromero@gmail.com	Romero
2	Josias	0985645524	josiastre@gmail.com	Olmedo
3	Francisco	0984562365	franciscoff@gmail.com	fernandez
4	Hernan	0974568451	hernankceres@gmail.com	Caceres
5	Joel	0985452125	joelhern@gmail.com	Hernier
6	Erick	0987426854	erickgameryt@gmail.com	Montes
\.


--
-- TOC entry 3365 (class 0 OID 16997)
-- Dependencies: 212
-- Data for Name: empleados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleados (id_emp, nombre_emp, apellido_emp, telefono_emp, email_emp) FROM stdin;
1	Jonas	Portillo	0984122444	portillojon@gmail.com
2	Julian	Arevalos	0984258741	jarevalos@gmail.com
3	Kiara	Aguero	0963541585	agueroki@gmail.com
4	Cristina	Ravolini	0974264825	ravolini44@gmail.com
5	Wilson	Pereira	0974563841	wilsongameryt@gmail.com
6	Sergio	Ramirez	0965412587	sergiram@gmail.com
\.


--
-- TOC entry 3369 (class 0 OID 17018)
-- Dependencies: 216
-- Data for Name: espacios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.espacios (id_espacio, estado, id_vehiculo) FROM stdin;
7	libre	\N
9	libre	\N
10	libre	\N
2	ocupado	3
3	ocupado	4
4	ocupado	5
5	ocupado	1
1	ocupado	2
6	ocupado	6
8	libre	\N
\.


--
-- TOC entry 3373 (class 0 OID 32779)
-- Dependencies: 220
-- Data for Name: mantenimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mantenimiento (id_mantenimiento, id_espacio, id_emp, fecha) FROM stdin;
1	1	1	2025-05-10
2	2	1	2025-05-10
3	3	2	2025-05-11
4	4	2	2025-05-11
5	5	3	2025-05-12
6	6	3	2025-05-12
7	7	4	2025-05-13
8	8	4	2025-05-13
9	9	5	2025-05-14
10	10	5	2025-05-14
11	5	6	2025-05-16
\.


--
-- TOC entry 3371 (class 0 OID 17048)
-- Dependencies: 218
-- Data for Name: relacioncli; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.relacioncli (nro_contrato, id_client, id_emp) FROM stdin;
883616	1	3
841869	2	4
581060	3	5
629629	4	2
994252	5	2
908688	6	5
\.


--
-- TOC entry 3367 (class 0 OID 17004)
-- Dependencies: 214
-- Data for Name: vehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehiculo (id_vehiculo, matricula, marca, modelo, id_client) FROM stdin;
1	ADFS457	TOYOTA	FUNCARGO 2005	1
2	AFSF526	HYUNDAI	HB20 2014	1
3	POTY458	TOYOTA	PLATZ 2008	3
4	YUTR478	NISSAN	SKYLINE 1997	2
5	TYAR456	CHEVROLET	SILVERADO 2020	4
6	TAWE728	TOYOTA	AURIS 2010	5
7	TYEEY874	volkswagen	gol 2008	6
\.


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 209
-- Name: clientes_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_client_seq', 6, true);


--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 211
-- Name: empleados_id_emp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleados_id_emp_seq', 6, true);


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 215
-- Name: espacios_id_espacio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.espacios_id_espacio_seq', 10, true);


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 219
-- Name: mantenimiento_id_mantenimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mantenimiento_id_mantenimiento_seq', 11, true);


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 217
-- Name: relacioncli_id_relacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.relacioncli_id_relacion_seq', 1, false);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 213
-- Name: vehiculo_id_vehiculo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehiculo_id_vehiculo_seq', 7, true);


--
-- TOC entry 3200 (class 2606 OID 16995)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_client);


--
-- TOC entry 3212 (class 2606 OID 32879)
-- Name: relacioncli contrato_unico; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relacioncli
    ADD CONSTRAINT contrato_unico UNIQUE (nro_contrato);


--
-- TOC entry 3202 (class 2606 OID 17002)
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id_emp);


--
-- TOC entry 3208 (class 2606 OID 17024)
-- Name: espacios espacios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.espacios
    ADD CONSTRAINT espacios_pkey PRIMARY KEY (id_espacio);


--
-- TOC entry 3216 (class 2606 OID 32784)
-- Name: mantenimiento mantenimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT mantenimiento_pkey PRIMARY KEY (id_mantenimiento);


--
-- TOC entry 3214 (class 2606 OID 17053)
-- Name: relacioncli relacioncli_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relacioncli
    ADD CONSTRAINT relacioncli_pkey PRIMARY KEY (nro_contrato);


--
-- TOC entry 3210 (class 2606 OID 24590)
-- Name: espacios unique_vehiculo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.espacios
    ADD CONSTRAINT unique_vehiculo UNIQUE (id_vehiculo);


--
-- TOC entry 3204 (class 2606 OID 17011)
-- Name: vehiculo vehiculo_matricula_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_matricula_key UNIQUE (matricula);


--
-- TOC entry 3206 (class 2606 OID 17009)
-- Name: vehiculo vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_pkey PRIMARY KEY (id_vehiculo);


--
-- TOC entry 3218 (class 2606 OID 17025)
-- Name: espacios espacios_id_vehiculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.espacios
    ADD CONSTRAINT espacios_id_vehiculo_fkey FOREIGN KEY (id_vehiculo) REFERENCES public.vehiculo(id_vehiculo);


--
-- TOC entry 3221 (class 2606 OID 32790)
-- Name: mantenimiento mantenimiento_id_emp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT mantenimiento_id_emp_fkey FOREIGN KEY (id_emp) REFERENCES public.empleados(id_emp);


--
-- TOC entry 3222 (class 2606 OID 32785)
-- Name: mantenimiento mantenimiento_id_espacio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT mantenimiento_id_espacio_fkey FOREIGN KEY (id_espacio) REFERENCES public.espacios(id_espacio);


--
-- TOC entry 3219 (class 2606 OID 17054)
-- Name: relacioncli relacioncli_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relacioncli
    ADD CONSTRAINT relacioncli_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.clientes(id_client);


--
-- TOC entry 3220 (class 2606 OID 17059)
-- Name: relacioncli relacioncli_id_emp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relacioncli
    ADD CONSTRAINT relacioncli_id_emp_fkey FOREIGN KEY (id_emp) REFERENCES public.empleados(id_emp);


--
-- TOC entry 3217 (class 2606 OID 17012)
-- Name: vehiculo vehiculo_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.clientes(id_client);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2025-05-17 01:33:56

--
-- PostgreSQL database dump complete
--

