--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: entity; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.entity (
    entity_id integer NOT NULL,
    name character varying(255) NOT NULL,
    habitat character varying(255),
    planet_id integer NOT NULL
);


ALTER TABLE public.entity OWNER TO freecodecamp;

--
-- Name: entity_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.entity_entity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entity_entity_id_seq OWNER TO freecodecamp;

--
-- Name: entity_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.entity_entity_id_seq OWNED BY public.entity.entity_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255),
    weight_mc numeric(4,2),
    magnitude integer,
    distance integer NOT NULL,
    description text,
    has_atmosphere boolean,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255),
    weight_mz numeric(4,2),
    magnitude integer,
    distance integer NOT NULL,
    description text,
    has_atmosphere boolean,
    has_life boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255),
    weight_mz numeric(6,3),
    magnitude integer,
    distance integer NOT NULL,
    description text,
    has_atmosphere boolean,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255),
    weight_mc numeric(4,2),
    magnitude integer,
    distance integer NOT NULL,
    description text,
    has_atmosphere boolean,
    has_life boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: entity entity_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.entity ALTER COLUMN entity_id SET DEFAULT nextval('public.entity_entity_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: entity; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.entity VALUES (1, 'Velocitaraptor', 'Deserts', 1);
INSERT INTO public.entity VALUES (2, 'Aquaton', 'Oceans', 2);
INSERT INTO public.entity VALUES (3, 'Skyroam', 'High Atmosphere', 3);
INSERT INTO public.entity VALUES (4, 'Cave Dweller', 'Caves', 4);
INSERT INTO public.entity VALUES (5, 'Lumina Serpent', 'Underground Lakes', 5);
INSERT INTO public.entity VALUES (6, 'Glacial Mammoth', 'Polar Regions', 6);
INSERT INTO public.entity VALUES (7, 'Sand Strider', 'Deserts', 7);
INSERT INTO public.entity VALUES (8, 'Volcanis Drake', 'Volcanic Plains', 8);
INSERT INTO public.entity VALUES (9, 'Flora Spirit', 'Forests', 9);
INSERT INTO public.entity VALUES (10, 'Crystal Crawler', 'Crystal Caves', 10);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 25.45, 4, 2537000, 'A large spiral galaxy closest to the Milky Way.', true, false);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 32.87, 5, 0, 'Our home galaxy, contains billions of stars and planets.', true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 15.23, 6, 3000000, 'A member of the Local Group, a spiral galaxy.', false, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 10.67, 9, 29000000, 'A bright galaxy with a distinct bulging core.', false, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 12.34, 8, 23000000, 'A classic spiral galaxy known for its interaction with a nearby galaxy.', true, false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 21.78, 11, 53000000, 'An enormous elliptical galaxy with a supermassive black hole.', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 0.07, -12, 1, 'The Earths only natural satellite', false, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.01, 12, 1, 'One of the two small moons of Mars', false, false, 1);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.00, 13, 1, 'The smaller of the two moons of Mars', false, false, 1);
INSERT INTO public.moon VALUES (4, 'Titan', 0.14, 10, 1200, 'The largest moon of Saturn with a thick atmosphere', true, false, 1);
INSERT INTO public.moon VALUES (5, 'Europa', 0.05, 11, 780, 'A moon of Jupiter known for its icy surface and possible subsurface ocean', false, false, 1);
INSERT INTO public.moon VALUES (6, 'Ganymede', 0.15, 9, 1070, 'The largest moon in the Solar System orbiting Jupiter', false, false, 1);
INSERT INTO public.moon VALUES (7, 'Callisto', 0.11, 10, 1880, 'A heavily cratered moon of Jupiter', false, false, 1);
INSERT INTO public.moon VALUES (8, 'Io', 0.09, 5, 640, 'A volcanic moon of Jupiter with active lava flows', false, false, 1);
INSERT INTO public.moon VALUES (9, 'Triton', 0.12, 8, 2700, 'Neptunes largest moon with retrograde orbit', true, false, 1);
INSERT INTO public.moon VALUES (10, 'Charon', 0.06, 8, 5900, 'The largest moon of Pluto sometimes considered a double dwarf planet system', false, false, 1);
INSERT INTO public.moon VALUES (11, 'Enceladus', 0.08, 12, 1250, 'A moon of Saturn known for its icy surface and geysers', true, false, 1);
INSERT INTO public.moon VALUES (12, 'Dione', 0.06, 13, 1040, 'A moon of Saturn with a cratered surface', false, false, 1);
INSERT INTO public.moon VALUES (13, 'Rhea', 0.09, 12, 1520, 'Saturns second-largest moon', false, false, 1);
INSERT INTO public.moon VALUES (14, 'Oberon', 0.05, 13, 2900, 'A large moon of Uranus with a heavily cratered surface', false, false, 1);
INSERT INTO public.moon VALUES (15, 'Umbriel', 0.04, 14, 2750, 'A dark heavily cratered moon of Uranus', false, false, 1);
INSERT INTO public.moon VALUES (16, 'Miranda', 0.03, 14, 2900, 'A small moon of Uranus known for its extreme surface features', false, false, 1);
INSERT INTO public.moon VALUES (17, 'Tethys', 0.07, 13, 1190, 'A heavily cratered moon of Saturn', false, false, 1);
INSERT INTO public.moon VALUES (18, 'Hyperion', 0.03, 14, 1480, 'A moon of Saturn known for its irregular shape', false, false, 1);
INSERT INTO public.moon VALUES (19, 'Iapetus', 0.10, 11, 3560, 'A two-toned moon of Saturn with one dark and one light hemisphere', false, false, 1);
INSERT INTO public.moon VALUES (20, 'Mimas', 0.02, 12, 1150, 'A small moon of Saturn known for the large crater that makes it resemble the Death Star', false, false, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima b', 0.003, 15, 4, 'An exoplanet orbiting Proxima Centauri, potentially habitable.', true, false, 3);
INSERT INTO public.planet VALUES (2, 'Sirius B', 0.978, -1, 8600, 'A white dwarf companion to Sirius A.', false, false, 1);
INSERT INTO public.planet VALUES (3, 'Betelgeuse I', 2.345, 0, 650, 'A gas giant orbiting Betelgeuse.', true, false, 2);
INSERT INTO public.planet VALUES (4, 'Andromeda Prime', 0.456, 5, 2537100, 'A rocky planet in the Andromeda galaxy.', true, false, 5);
INSERT INTO public.planet VALUES (5, 'Andromeda IV', 1.234, 4, 2537200, 'A gas giant with rings in the Andromeda galaxy.', false, false, 5);
INSERT INTO public.planet VALUES (6, 'M87 Planet X', 1.678, 12, 53010000, 'A distant gas giant in the Messier 87 galaxy.', false, false, 4);
INSERT INTO public.planet VALUES (8, 'Sirius C', 0.789, -1, 8500, 'A hypothetical third planet orbiting Sirius.', false, false, 1);
INSERT INTO public.planet VALUES (9, 'Triangulum Major', 1.123, 7, 3000500, 'A large gas giant orbiting Triangulum Star B.', false, false, 6);
INSERT INTO public.planet VALUES (10, 'Betelgeuse II', 3.678, 1, 660, 'Another massive gas giant around Betelgeuse.', true, false, 2);
INSERT INTO public.planet VALUES (11, 'Messier 87 Terra', 0.512, 10, 53002000, 'A rocky planet in the Messier 87 galaxy.', true, false, 4);
INSERT INTO public.planet VALUES (12, 'Proxima c', 0.345, 15, 4, 'A second planet orbiting Proxima Centauri, very close to Proxima b.', false, false, 3);
INSERT INTO public.planet VALUES (7, 'Whirlpool Alpha', 0.321, 8, 23001000, 'A terrestrial planet in the Whirlpool galaxy.', true, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 2.02, -1, 8500, 'The brightest star in the night sky, part of the Milky Way.', true, false, 2);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 18.95, 0, 640, 'A red supergiant star in the Orion constellation.', false, false, 2);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 0.12, 15, 4, 'The closest known star to the Sun, part of Alpha Centauri.', true, false, 2);
INSERT INTO public.star VALUES (4, 'Messier 87 Star A', 6.78, 11, 53000000, 'A star in the galaxy Messier 87.', false, false, 6);
INSERT INTO public.star VALUES (5, 'Andromeda Alpha', 4.34, 3, 2537000, 'A star in the Andromeda galaxy.', true, false, 1);
INSERT INTO public.star VALUES (6, 'Triangulum Star B', 3.21, 6, 3000000, 'A star located in the Triangulum galaxy.', false, false, 3);


--
-- Name: entity_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.entity_entity_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: entity entity_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.entity
    ADD CONSTRAINT entity_name_key UNIQUE (name);


--
-- Name: entity entity_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.entity
    ADD CONSTRAINT entity_pkey PRIMARY KEY (entity_id);


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
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


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
-- Name: entity entity_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.entity
    ADD CONSTRAINT entity_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

