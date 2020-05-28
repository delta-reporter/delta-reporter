--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

ALTER ROLE delta WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md597881dd012009e56e4216742bcdfaaf8';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3 (Debian 12.3-1.pgdg100+1)
-- Dumped by pg_dump version 12.3 (Debian 12.3-1.pgdg100+1)

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
-- PostgreSQL database dump complete
--

--
-- Database "delta_db" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3 (Debian 12.3-1.pgdg100+1)
-- Dumped by pg_dump version 12.3 (Debian 12.3-1.pgdg100+1)

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
-- Name: delta_db; Type: DATABASE; Schema: -; Owner: delta
--


ALTER DATABASE delta_db OWNER TO delta;

\connect delta_db

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: delta
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO delta;

--
-- Name: launch; Type: TABLE; Schema: public; Owner: delta
--

CREATE TABLE public.launch (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    data json,
    launch_status_id integer NOT NULL,
    project_id integer NOT NULL
);


ALTER TABLE public.launch OWNER TO delta;

--
-- Name: launch_id_seq; Type: SEQUENCE; Schema: public; Owner: delta
--

CREATE SEQUENCE public.launch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.launch_id_seq OWNER TO delta;

--
-- Name: launch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delta
--

ALTER SEQUENCE public.launch_id_seq OWNED BY public.launch.id;


--
-- Name: launch_status; Type: TABLE; Schema: public; Owner: delta
--

CREATE TABLE public.launch_status (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.launch_status OWNER TO delta;

--
-- Name: launch_status_id_seq; Type: SEQUENCE; Schema: public; Owner: delta
--

CREATE SEQUENCE public.launch_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.launch_status_id_seq OWNER TO delta;

--
-- Name: launch_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delta
--

ALTER SEQUENCE public.launch_status_id_seq OWNED BY public.launch_status.id;


--
-- Name: project; Type: TABLE; Schema: public; Owner: delta
--

CREATE TABLE public.project (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    data json,
    project_status_id integer NOT NULL
);


ALTER TABLE public.project OWNER TO delta;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: delta
--

CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO delta;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delta
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- Name: project_status; Type: TABLE; Schema: public; Owner: delta
--

CREATE TABLE public.project_status (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.project_status OWNER TO delta;

--
-- Name: project_status_id_seq; Type: SEQUENCE; Schema: public; Owner: delta
--

CREATE SEQUENCE public.project_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_status_id_seq OWNER TO delta;

--
-- Name: project_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delta
--

ALTER SEQUENCE public.project_status_id_seq OWNED BY public.project_status.id;


--
-- Name: test; Type: TABLE; Schema: public; Owner: delta
--

CREATE TABLE public.test (
    id integer NOT NULL,
    name character varying(300) NOT NULL,
    data json,
    test_suite_id integer NOT NULL
);


ALTER TABLE public.test OWNER TO delta;

--
-- Name: test_history; Type: TABLE; Schema: public; Owner: delta
--

CREATE TABLE public.test_history (
    id integer NOT NULL,
    start_datetime timestamp without time zone,
    end_datetime timestamp without time zone,
    trace character varying,
    file character varying(2000),
    message character varying(2000),
    error_type character varying(2000),
    retries integer,
    test_id integer NOT NULL,
    test_status_id integer NOT NULL,
    test_resolution_id integer NOT NULL,
    test_run_id integer NOT NULL,
    test_suite_history_id integer NOT NULL
);


ALTER TABLE public.test_history OWNER TO delta;

--
-- Name: test_history_id_seq; Type: SEQUENCE; Schema: public; Owner: delta
--

CREATE SEQUENCE public.test_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_history_id_seq OWNER TO delta;

--
-- Name: test_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delta
--

ALTER SEQUENCE public.test_history_id_seq OWNED BY public.test_history.id;


--
-- Name: test_id_seq; Type: SEQUENCE; Schema: public; Owner: delta
--

CREATE SEQUENCE public.test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_id_seq OWNER TO delta;

--
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delta
--

ALTER SEQUENCE public.test_id_seq OWNED BY public.test.id;


--
-- Name: test_resolution; Type: TABLE; Schema: public; Owner: delta
--

CREATE TABLE public.test_resolution (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.test_resolution OWNER TO delta;

--
-- Name: test_resolution_id_seq; Type: SEQUENCE; Schema: public; Owner: delta
--

CREATE SEQUENCE public.test_resolution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_resolution_id_seq OWNER TO delta;

--
-- Name: test_resolution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delta
--

ALTER SEQUENCE public.test_resolution_id_seq OWNED BY public.test_resolution.id;


--
-- Name: test_run; Type: TABLE; Schema: public; Owner: delta
--

CREATE TABLE public.test_run (
    id integer NOT NULL,
    data json,
    start_datetime timestamp without time zone,
    end_datetime timestamp without time zone,
    test_type character varying(100) NOT NULL,
    test_run_status_id integer NOT NULL,
    launch_id integer NOT NULL
);


ALTER TABLE public.test_run OWNER TO delta;

--
-- Name: test_run_id_seq; Type: SEQUENCE; Schema: public; Owner: delta
--

CREATE SEQUENCE public.test_run_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_run_id_seq OWNER TO delta;

--
-- Name: test_run_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delta
--

ALTER SEQUENCE public.test_run_id_seq OWNED BY public.test_run.id;


--
-- Name: test_run_status; Type: TABLE; Schema: public; Owner: delta
--

CREATE TABLE public.test_run_status (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.test_run_status OWNER TO delta;

--
-- Name: test_run_status_id_seq; Type: SEQUENCE; Schema: public; Owner: delta
--

CREATE SEQUENCE public.test_run_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_run_status_id_seq OWNER TO delta;

--
-- Name: test_run_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delta
--

ALTER SEQUENCE public.test_run_status_id_seq OWNED BY public.test_run_status.id;


--
-- Name: test_status; Type: TABLE; Schema: public; Owner: delta
--

CREATE TABLE public.test_status (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.test_status OWNER TO delta;

--
-- Name: test_status_id_seq; Type: SEQUENCE; Schema: public; Owner: delta
--

CREATE SEQUENCE public.test_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_status_id_seq OWNER TO delta;

--
-- Name: test_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delta
--

ALTER SEQUENCE public.test_status_id_seq OWNED BY public.test_status.id;


--
-- Name: test_suite; Type: TABLE; Schema: public; Owner: delta
--

CREATE TABLE public.test_suite (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    data json,
    test_type character varying(50) NOT NULL,
    project_id integer NOT NULL
);


ALTER TABLE public.test_suite OWNER TO delta;

--
-- Name: test_suite_history; Type: TABLE; Schema: public; Owner: delta
--

CREATE TABLE public.test_suite_history (
    id integer NOT NULL,
    data json,
    start_datetime timestamp without time zone,
    end_datetime timestamp without time zone,
    test_suite_status_id integer NOT NULL,
    test_run_id integer NOT NULL,
    test_suite_id integer NOT NULL
);


ALTER TABLE public.test_suite_history OWNER TO delta;

--
-- Name: test_suite_history_id_seq; Type: SEQUENCE; Schema: public; Owner: delta
--

CREATE SEQUENCE public.test_suite_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_suite_history_id_seq OWNER TO delta;

--
-- Name: test_suite_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delta
--

ALTER SEQUENCE public.test_suite_history_id_seq OWNED BY public.test_suite_history.id;


--
-- Name: test_suite_id_seq; Type: SEQUENCE; Schema: public; Owner: delta
--

CREATE SEQUENCE public.test_suite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_suite_id_seq OWNER TO delta;

--
-- Name: test_suite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delta
--

ALTER SEQUENCE public.test_suite_id_seq OWNED BY public.test_suite.id;


--
-- Name: test_suite_status; Type: TABLE; Schema: public; Owner: delta
--

CREATE TABLE public.test_suite_status (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.test_suite_status OWNER TO delta;

--
-- Name: test_suite_status_id_seq; Type: SEQUENCE; Schema: public; Owner: delta
--

CREATE SEQUENCE public.test_suite_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_suite_status_id_seq OWNER TO delta;

--
-- Name: test_suite_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delta
--

ALTER SEQUENCE public.test_suite_status_id_seq OWNED BY public.test_suite_status.id;


--
-- Name: launch id; Type: DEFAULT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.launch ALTER COLUMN id SET DEFAULT nextval('public.launch_id_seq'::regclass);


--
-- Name: launch_status id; Type: DEFAULT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.launch_status ALTER COLUMN id SET DEFAULT nextval('public.launch_status_id_seq'::regclass);


--
-- Name: project id; Type: DEFAULT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- Name: project_status id; Type: DEFAULT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.project_status ALTER COLUMN id SET DEFAULT nextval('public.project_status_id_seq'::regclass);


--
-- Name: test id; Type: DEFAULT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test ALTER COLUMN id SET DEFAULT nextval('public.test_id_seq'::regclass);


--
-- Name: test_history id; Type: DEFAULT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_history ALTER COLUMN id SET DEFAULT nextval('public.test_history_id_seq'::regclass);


--
-- Name: test_resolution id; Type: DEFAULT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_resolution ALTER COLUMN id SET DEFAULT nextval('public.test_resolution_id_seq'::regclass);


--
-- Name: test_run id; Type: DEFAULT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_run ALTER COLUMN id SET DEFAULT nextval('public.test_run_id_seq'::regclass);


--
-- Name: test_run_status id; Type: DEFAULT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_run_status ALTER COLUMN id SET DEFAULT nextval('public.test_run_status_id_seq'::regclass);


--
-- Name: test_status id; Type: DEFAULT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_status ALTER COLUMN id SET DEFAULT nextval('public.test_status_id_seq'::regclass);


--
-- Name: test_suite id; Type: DEFAULT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_suite ALTER COLUMN id SET DEFAULT nextval('public.test_suite_id_seq'::regclass);


--
-- Name: test_suite_history id; Type: DEFAULT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_suite_history ALTER COLUMN id SET DEFAULT nextval('public.test_suite_history_id_seq'::regclass);


--
-- Name: test_suite_status id; Type: DEFAULT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_suite_status ALTER COLUMN id SET DEFAULT nextval('public.test_suite_status_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: delta
--

COPY public.alembic_version (version_num) FROM stdin;
636c5796f80a
\.


--
-- Data for Name: launch; Type: TABLE DATA; Schema: public; Owner: delta
--

COPY public.launch (id, name, data, launch_status_id, project_id) FROM stdin;
1	Launch 1590613658190	null	2	1
\.


--
-- Data for Name: launch_status; Type: TABLE DATA; Schema: public; Owner: delta
--

COPY public.launch_status (id, name) FROM stdin;
1	Failed
2	In Process
3	Successful
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: delta
--

COPY public.project (id, name, data, project_status_id) FROM stdin;
1	Delta Reporter	\N	1
\.


--
-- Data for Name: project_status; Type: TABLE DATA; Schema: public; Owner: delta
--

COPY public.project_status (id, name) FROM stdin;
1	Active
2	Inactive
3	Archived
\.


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: delta
--

COPY public.test (id, name, data, test_suite_id) FROM stdin;
1	com.deltareporter.AppTest:shouldAnswerWithNotSoTrue	null	1
2	com.deltareporter.AppTest:shouldAnswerWithTrue	null	1
3	com.deltareporter.AppTest2:testCaseConditionalSkipException	null	2
\.


--
-- Data for Name: test_history; Type: TABLE DATA; Schema: public; Owner: delta
--

COPY public.test_history (id, start_datetime, end_datetime, trace, file, message, error_type, retries, test_id, test_status_id, test_resolution_id, test_run_id, test_suite_history_id) FROM stdin;
1	2020-05-27 22:07:38	2020-05-27 22:07:38	\N	com.deltareporter.AppTest.java	\N	\N	\N	1	2	1	1	1
2	2020-05-27 22:07:38	2020-05-27 22:07:38	\N	com.deltareporter.AppTest.java	\N	\N	\N	2	2	1	1	1
3	2020-05-27 22:07:38	2020-05-27 22:07:38	\ncom.deltareporter.AppTest2.testCaseConditionalSkipException(AppTest2.java:20)\njava.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\njava.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\njava.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\njava.base/java.lang.reflect.Method.invoke(Method.java:566)\norg.testng.internal.MethodInvocationHelper.invokeMethod(MethodInvocationHelper.java:134)\norg.testng.internal.MethodInvocationHelper$1.runTestMethod(MethodInvocationHelper.java:240)\ncom.deltareporter.listener.DeltaListener.lambda$run$0(DeltaListener.java:60)\ncom.deltareporter.listener.DeltaEventRegistrar.onTestHook(DeltaEventRegistrar.java:204)\ncom.deltareporter.listener.DeltaListener.run(DeltaListener.java:59)\norg.testng.internal.MethodInvocationHelper.invokeHookable(MethodInvocationHelper.java:252)\norg.testng.internal.TestInvoker.invokeMethod(TestInvoker.java:593)\norg.testng.internal.TestInvoker.invokeTestMethod(TestInvoker.java:173)\norg.testng.internal.MethodRunner.runInSequence(MethodRunner.java:46)\norg.testng.internal.TestInvoker$MethodInvocationAgent.invoke(TestInvoker.java:816)\norg.testng.internal.TestInvoker.invokeTestMethods(TestInvoker.java:146)\norg.testng.internal.TestMethodWorker.invokeTestMethods(TestMethodWorker.java:146)\norg.testng.internal.TestMethodWorker.run(TestMethodWorker.java:128)\njava.base/java.util.ArrayList.forEach(ArrayList.java:1540)\norg.testng.TestRunner.privateRun(TestRunner.java:766)\norg.testng.TestRunner.run(TestRunner.java:587)\norg.testng.SuiteRunner.runTest(SuiteRunner.java:384)\norg.testng.SuiteRunner.runSequentially(SuiteRunner.java:378)\norg.testng.SuiteRunner.privateRun(SuiteRunner.java:337)\norg.testng.SuiteRunner.run(SuiteRunner.java:286)\norg.testng.SuiteRunnerWorker.runSuite(SuiteRunnerWorker.java:53)\norg.testng.SuiteRunnerWorker.run(SuiteRunnerWorker.java:96)\norg.testng.TestNG.runSuitesSequentially(TestNG.java:1187)\norg.testng.TestNG.runSuitesLocally(TestNG.java:1109)\norg.testng.TestNG.runSuites(TestNG.java:1039)\norg.testng.TestNG.run(TestNG.java:1007)\norg.apache.maven.surefire.testng.TestNGExecutor.run(TestNGExecutor.java:283)\norg.apache.maven.surefire.testng.TestNGXmlTestSuite.execute(TestNGXmlTestSuite.java:75)\norg.apache.maven.surefire.testng.TestNGProvider.invoke(TestNGProvider.java:120)\norg.apache.maven.surefire.booter.ForkedBooter.invokeProviderInSameClassLoader(ForkedBooter.java:384)\norg.apache.maven.surefire.booter.ForkedBooter.runSuitesInProcess(ForkedBooter.java:345)\norg.apache.maven.surefire.booter.ForkedBooter.execute(ForkedBooter.java:126)\norg.apache.maven.surefire.booter.ForkedBooter.main(ForkedBooter.java:418)	com.deltareporter.AppTest2.java	Skipping this exception	\N	\N	3	5	1	1	2
\.


--
-- Data for Name: test_resolution; Type: TABLE DATA; Schema: public; Owner: delta
--

COPY public.test_resolution (id, name) FROM stdin;
1	Not set
2	Working as expected
3	Test Issue
4	Environment Issue
5	Application Issue
\.


--
-- Data for Name: test_run; Type: TABLE DATA; Schema: public; Owner: delta
--

COPY public.test_run (id, data, start_datetime, end_datetime, test_type, test_run_status_id, launch_id) FROM stdin;
1	null	2020-05-27 22:07:38	2020-05-27 22:07:38	Integration Tests	2	1
\.


--
-- Data for Name: test_run_status; Type: TABLE DATA; Schema: public; Owner: delta
--

COPY public.test_run_status (id, name) FROM stdin;
1	Failed
2	Passed
3	Running
\.


--
-- Data for Name: test_status; Type: TABLE DATA; Schema: public; Owner: delta
--

COPY public.test_status (id, name) FROM stdin;
1	Failed
2	Passed
3	Running
4	Incomplete
5	Skipped
\.


--
-- Data for Name: test_suite; Type: TABLE DATA; Schema: public; Owner: delta
--

COPY public.test_suite (id, name, data, test_type, project_id) FROM stdin;
1	Delta Reporter Tests 1/Test for Delta Reporter Integration	null	Integration Tests	1
2	Delta Reporter Tests 1/Test for Delta Reporter Integration 2	null	Integration Tests	1
\.


--
-- Data for Name: test_suite_history; Type: TABLE DATA; Schema: public; Owner: delta
--

COPY public.test_suite_history (id, data, start_datetime, end_datetime, test_suite_status_id, test_run_id, test_suite_id) FROM stdin;
1	null	2020-05-27 22:07:38	2020-05-27 22:07:38	2	1	1
2	null	2020-05-27 22:07:38	2020-05-27 22:07:38	2	1	2
\.


--
-- Data for Name: test_suite_status; Type: TABLE DATA; Schema: public; Owner: delta
--

COPY public.test_suite_status (id, name) FROM stdin;
1	Failed
2	Successful
3	Running
\.


--
-- Name: launch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: delta
--

SELECT pg_catalog.setval('public.launch_id_seq', 1, true);


--
-- Name: launch_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: delta
--

SELECT pg_catalog.setval('public.launch_status_id_seq', 3, true);


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: delta
--

SELECT pg_catalog.setval('public.project_id_seq', 1, true);


--
-- Name: project_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: delta
--

SELECT pg_catalog.setval('public.project_status_id_seq', 3, true);


--
-- Name: test_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: delta
--

SELECT pg_catalog.setval('public.test_history_id_seq', 3, true);


--
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: delta
--

SELECT pg_catalog.setval('public.test_id_seq', 3, true);


--
-- Name: test_resolution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: delta
--

SELECT pg_catalog.setval('public.test_resolution_id_seq', 5, true);


--
-- Name: test_run_id_seq; Type: SEQUENCE SET; Schema: public; Owner: delta
--

SELECT pg_catalog.setval('public.test_run_id_seq', 1, true);


--
-- Name: test_run_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: delta
--

SELECT pg_catalog.setval('public.test_run_status_id_seq', 3, true);


--
-- Name: test_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: delta
--

SELECT pg_catalog.setval('public.test_status_id_seq', 5, true);


--
-- Name: test_suite_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: delta
--

SELECT pg_catalog.setval('public.test_suite_history_id_seq', 2, true);


--
-- Name: test_suite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: delta
--

SELECT pg_catalog.setval('public.test_suite_id_seq', 2, true);


--
-- Name: test_suite_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: delta
--

SELECT pg_catalog.setval('public.test_suite_status_id_seq', 3, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: launch launch_name_key; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.launch
    ADD CONSTRAINT launch_name_key UNIQUE (name);


--
-- Name: launch launch_pkey; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.launch
    ADD CONSTRAINT launch_pkey PRIMARY KEY (id);


--
-- Name: launch_status launch_status_name_key; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.launch_status
    ADD CONSTRAINT launch_status_name_key UNIQUE (name);


--
-- Name: launch_status launch_status_pkey; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.launch_status
    ADD CONSTRAINT launch_status_pkey PRIMARY KEY (id);


--
-- Name: project project_name_key; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_name_key UNIQUE (name);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: project_status project_status_name_key; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.project_status
    ADD CONSTRAINT project_status_name_key UNIQUE (name);


--
-- Name: project_status project_status_pkey; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.project_status
    ADD CONSTRAINT project_status_pkey PRIMARY KEY (id);


--
-- Name: test_history test_history_pkey; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_history
    ADD CONSTRAINT test_history_pkey PRIMARY KEY (id);


--
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- Name: test_resolution test_resolution_name_key; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_resolution
    ADD CONSTRAINT test_resolution_name_key UNIQUE (name);


--
-- Name: test_resolution test_resolution_pkey; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_resolution
    ADD CONSTRAINT test_resolution_pkey PRIMARY KEY (id);


--
-- Name: test_run test_run_pkey; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_run
    ADD CONSTRAINT test_run_pkey PRIMARY KEY (id);


--
-- Name: test_run_status test_run_status_name_key; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_run_status
    ADD CONSTRAINT test_run_status_name_key UNIQUE (name);


--
-- Name: test_run_status test_run_status_pkey; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_run_status
    ADD CONSTRAINT test_run_status_pkey PRIMARY KEY (id);


--
-- Name: test_status test_status_name_key; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_status
    ADD CONSTRAINT test_status_name_key UNIQUE (name);


--
-- Name: test_status test_status_pkey; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_status
    ADD CONSTRAINT test_status_pkey PRIMARY KEY (id);


--
-- Name: test_suite_history test_suite_history_pkey; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_suite_history
    ADD CONSTRAINT test_suite_history_pkey PRIMARY KEY (id);


--
-- Name: test_suite test_suite_pkey; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_suite
    ADD CONSTRAINT test_suite_pkey PRIMARY KEY (id);


--
-- Name: test_suite_status test_suite_status_name_key; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_suite_status
    ADD CONSTRAINT test_suite_status_name_key UNIQUE (name);


--
-- Name: test_suite_status test_suite_status_pkey; Type: CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_suite_status
    ADD CONSTRAINT test_suite_status_pkey PRIMARY KEY (id);


--
-- Name: launch launch_launch_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.launch
    ADD CONSTRAINT launch_launch_status_id_fkey FOREIGN KEY (launch_status_id) REFERENCES public.launch_status(id);


--
-- Name: launch launch_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.launch
    ADD CONSTRAINT launch_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.project(id);


--
-- Name: project project_project_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_project_status_id_fkey FOREIGN KEY (project_status_id) REFERENCES public.project_status(id);


--
-- Name: test_history test_history_test_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_history
    ADD CONSTRAINT test_history_test_id_fkey FOREIGN KEY (test_id) REFERENCES public.test(id);


--
-- Name: test_history test_history_test_resolution_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_history
    ADD CONSTRAINT test_history_test_resolution_id_fkey FOREIGN KEY (test_resolution_id) REFERENCES public.test_resolution(id);


--
-- Name: test_history test_history_test_run_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_history
    ADD CONSTRAINT test_history_test_run_id_fkey FOREIGN KEY (test_run_id) REFERENCES public.test_run(id);


--
-- Name: test_history test_history_test_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_history
    ADD CONSTRAINT test_history_test_status_id_fkey FOREIGN KEY (test_status_id) REFERENCES public.test_status(id);


--
-- Name: test_history test_history_test_suite_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_history
    ADD CONSTRAINT test_history_test_suite_history_id_fkey FOREIGN KEY (test_suite_history_id) REFERENCES public.test_suite_history(id);


--
-- Name: test_run test_run_launch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_run
    ADD CONSTRAINT test_run_launch_id_fkey FOREIGN KEY (launch_id) REFERENCES public.launch(id);


--
-- Name: test_run test_run_test_run_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_run
    ADD CONSTRAINT test_run_test_run_status_id_fkey FOREIGN KEY (test_run_status_id) REFERENCES public.test_run_status(id);


--
-- Name: test_suite_history test_suite_history_test_run_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_suite_history
    ADD CONSTRAINT test_suite_history_test_run_id_fkey FOREIGN KEY (test_run_id) REFERENCES public.test_run(id);


--
-- Name: test_suite_history test_suite_history_test_suite_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_suite_history
    ADD CONSTRAINT test_suite_history_test_suite_id_fkey FOREIGN KEY (test_suite_id) REFERENCES public.test_suite(id);


--
-- Name: test_suite_history test_suite_history_test_suite_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_suite_history
    ADD CONSTRAINT test_suite_history_test_suite_status_id_fkey FOREIGN KEY (test_suite_status_id) REFERENCES public.test_suite_status(id);


--
-- Name: test_suite test_suite_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test_suite
    ADD CONSTRAINT test_suite_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.project(id);


--
-- Name: test test_test_suite_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delta
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_test_suite_id_fkey FOREIGN KEY (test_suite_id) REFERENCES public.test_suite(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3 (Debian 12.3-1.pgdg100+1)
-- Dumped by pg_dump version 12.3 (Debian 12.3-1.pgdg100+1)

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
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

