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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    num_of_stars integer,
    age_in_billions numeric(15,2),
    galaxy_id integer NOT NULL,
    life_exist boolean,
    name character varying(50) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: meteors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.meteors (
    name character varying(30) NOT NULL,
    size integer NOT NULL,
    meteors_id integer NOT NULL
);


ALTER TABLE public.meteors OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    crater_density integer,
    planet_id integer,
    age_in_years integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(50),
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    size_ratio_to_earth integer NOT NULL,
    color text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(50),
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    dying_out boolean,
    main_element text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (100000, 10.50, 2, false, 'Andromeda');
INSERT INTO public.galaxy VALUES (400000, 8.20, 3, false, 'Triangulum');
INSERT INTO public.galaxy VALUES (2000000, 4.10, 4, true, 'Orion');
INSERT INTO public.galaxy VALUES (15000000, 6.80, 5, true, 'Whirlpool');
INSERT INTO public.galaxy VALUES (1, 0.00, 6, true, 'Tabors Mind');
INSERT INTO public.galaxy VALUES (14035949, 13.60, 1, true, 'Milky Way');


--
-- Data for Name: meteors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.meteors VALUES ('big one', 3232, 1);
INSERT INTO public.meteors VALUES ('small one', 21, 2);
INSERT INTO public.meteors VALUES ('medium one', 1002, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Bob', 1, 3, 1, 3234);
INSERT INTO public.moon VALUES ('Jess', 2, 4554, 3, 3423423);
INSERT INTO public.moon VALUES ('Sarah', 3, 453, 4, 43);
INSERT INTO public.moon VALUES ('Jan', 4, 4343, 2, 322);
INSERT INTO public.moon VALUES ('Len', 5, 431, 1, 32);
INSERT INTO public.moon VALUES ('Penny', 6, 4345, 1, 32);
INSERT INTO public.moon VALUES ('Ortman', 7, 43, 2, 323);
INSERT INTO public.moon VALUES ('Ben', 8, 43, 2, 323);
INSERT INTO public.moon VALUES ('Jacob', 9, 212, 1, 9093);
INSERT INTO public.moon VALUES ('Caleb', 10, 32, 3, 24);
INSERT INTO public.moon VALUES ('Dylan', 11, 11, 6, 44);
INSERT INTO public.moon VALUES ('Emma', 12, 32, 1, 33);
INSERT INTO public.moon VALUES ('Rean', 13, 32, 2, 3223);
INSERT INTO public.moon VALUES ('Bess', 14, 545, 1, 234234);
INSERT INTO public.moon VALUES ('Kio', 15, 213, 3, 23);
INSERT INTO public.moon VALUES ('Ret', 16, 43, 2, 3232);
INSERT INTO public.moon VALUES ('Lonuy', 17, 54, 5, 1);
INSERT INTO public.moon VALUES ('Neo', 18, 656, 1, 132323);
INSERT INTO public.moon VALUES ('Foi', 19, 32, 2, 323423);
INSERT INTO public.moon VALUES ('Lopop', 20, 3242, 4, 12312);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('EARTH', 1, 1, 1, 'Blue');
INSERT INTO public.planet VALUES ('Mars', 2, 1, 0, 'Red');
INSERT INTO public.planet VALUES ('Kepler', 3, 2, 2, 'Unknown');
INSERT INTO public.planet VALUES ('Orion', 4, 3, 1, 'Orange');
INSERT INTO public.planet VALUES ('CentauriBb', 5, 4, 1, 'Unknown');
INSERT INTO public.planet VALUES ('Andromeda', 6, 5, 3, 'Green');
INSERT INTO public.planet VALUES ('Whirlpool', 7, 6, 1, 'Pink');
INSERT INTO public.planet VALUES ('Jupiter', 8, 1, 11, 'Orange');
INSERT INTO public.planet VALUES ('Saturn', 9, 1, 9, 'Yellow');
INSERT INTO public.planet VALUES ('Neptune', 10, 1, 4, 'Blue');
INSERT INTO public.planet VALUES ('Uranus', 11, 1, 4, 'Blue');
INSERT INTO public.planet VALUES ('Venus', 12, 1, 1, 'Yellow');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 1, false, 'Hydrogen');
INSERT INTO public.star VALUES ('Vega', 2, 1, false, 'Helium');
INSERT INTO public.star VALUES ('Betelguese', 3, 4, true, 'Carbon');
INSERT INTO public.star VALUES ('Alpha Centauri A', 4, 1, false, 'Hydrogen');
INSERT INTO public.star VALUES ('Andromeda Star 1', 5, 2, false, 'Helium');
INSERT INTO public.star VALUES ('Whirlpool Star 2', 6, 5, false, 'Hydrogen');


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: meteors meteors_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteors
    ADD CONSTRAINT meteors_name_key UNIQUE (name);


--
-- Name: meteors meteors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteors
    ADD CONSTRAINT meteors_pkey PRIMARY KEY (meteors_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_name_key UNIQUE (name);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_universe_system_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_universe_system_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

