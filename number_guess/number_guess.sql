--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1689994974065', 0, 0);
INSERT INTO public.users VALUES (3, 'user_1689994974064', 0, 0);
INSERT INTO public.users VALUES (4, 'user_1689994993910', 0, 0);
INSERT INTO public.users VALUES (5, 'user_1689994993909', 0, 0);
INSERT INTO public.users VALUES (6, 'tabore', 0, 0);
INSERT INTO public.users VALUES (7, '[A', 0, 0);
INSERT INTO public.users VALUES (8, 'user_1689996551188', 0, 0);
INSERT INTO public.users VALUES (9, 'user_1689996551187', 0, 0);
INSERT INTO public.users VALUES (10, 'user_1689996560989', 0, 0);
INSERT INTO public.users VALUES (11, 'user_1689996560988', 0, 0);
INSERT INTO public.users VALUES (12, 'bob', 1, 0);
INSERT INTO public.users VALUES (14, 'user_1689997075262', 2, 0);
INSERT INTO public.users VALUES (30, 'user_1689997802676', 5, 59);
INSERT INTO public.users VALUES (1, 'tabor', 8, 11);
INSERT INTO public.users VALUES (13, 'user_1689997075263', 5, 0);
INSERT INTO public.users VALUES (20, 'user_1689997427129', 2, 1);
INSERT INTO public.users VALUES (16, 'user_1689997140008', 2, 0);
INSERT INTO public.users VALUES (15, 'user_1689997140009', 5, 0);
INSERT INTO public.users VALUES (19, 'user_1689997427130', 5, 1);
INSERT INTO public.users VALUES (33, 'user_1689997816928', 2, 471);
INSERT INTO public.users VALUES (21, 'taborgreat', 5, 3);
INSERT INTO public.users VALUES (32, 'user_1689997816929', 5, 929);
INSERT INTO public.users VALUES (18, 'user_1689997287490', 2, 0);
INSERT INTO public.users VALUES (34, 'user_1689997829886', 1, 0);
INSERT INTO public.users VALUES (23, 'user_1689997586389', 2, 574);
INSERT INTO public.users VALUES (22, 'user_1689997586390', 5, 367);
INSERT INTO public.users VALUES (25, 'user_1689997755209', 2, 910);
INSERT INTO public.users VALUES (24, 'user_1689997755210', 5, 29);
INSERT INTO public.users VALUES (27, 'user_1689997770619', 2, 401);
INSERT INTO public.users VALUES (26, 'user_1689997770620', 5, 237);
INSERT INTO public.users VALUES (29, 'user_1689997785985', 2, 502);
INSERT INTO public.users VALUES (17, 'user_1689997287491', 5, 69);
INSERT INTO public.users VALUES (28, 'user_1689997785986', 5, 368);
INSERT INTO public.users VALUES (31, 'user_1689997802675', 2, 373);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 34, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

