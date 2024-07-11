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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    number_of_stars integer NOT NULL,
    distance_from_earth integer NOT NULL,
    mass numeric(20,2) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
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
    name character varying NOT NULL,
    surface_temperature numeric,
    is_inhabited boolean,
    discoverer character varying(100),
    planet_id integer NOT NULL
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
    name character varying NOT NULL,
    diameter numeric,
    orbital_period numeric,
    has_atmosphere boolean,
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
-- Name: space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_station (
    name character varying NOT NULL,
    space_station_id integer NOT NULL,
    location character varying(100)
);


ALTER TABLE public.space_station OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_station_space_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_space_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_station_space_station_id_seq OWNED BY public.space_station.space_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    distance_from_earth numeric,
    is_visible boolean
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
-- Name: space_station space_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_space_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 200, 10000, 4.50, 'Our home galaxy', false, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 400, 20000, 5.20, 'Nearest spiral galaxy', true, true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 100, 15000, 2.80, 'Distinctive dust lane', false, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 300, 18000, 3.90, 'Interacting galaxy', false, false);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 150, 25000, 2.10, 'Small spiral galaxy', false, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 120, 12000, 6.70, 'Radio galaxy', false, false);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 500, 30000, 6.10, 'Supermassive black hole', false, false);
INSERT INTO public.galaxy VALUES (8, 'NGC 1300', 250, 22000, 4.20, 'Barred spiral galaxy', false, true);
INSERT INTO public.galaxy VALUES (9, 'Leo I', 80, 18000, 1.80, 'Dwarf spheroidal galaxy', false, false);
INSERT INTO public.galaxy VALUES (10, 'Pinwheel', 350, 19000, 3.50, 'Grand design spiral galaxy', true, true);
INSERT INTO public.galaxy VALUES (11, 'Cartwheel', 90, 21000, 2.40, 'Ring galaxy', false, false);
INSERT INTO public.galaxy VALUES (12, 'Cigar', 70, 17000, 1.60, 'Dwarf irregular galaxy', false, true);
INSERT INTO public.galaxy VALUES (13, 'Antennae', 200, 28000, 3.80, 'Colliding galaxies', false, false);
INSERT INTO public.galaxy VALUES (14, 'Bode’s Galaxy', 180, 15000, 2.90, 'Irregular galaxy', false, true);
INSERT INTO public.galaxy VALUES (15, 'Andromeda II', 60, 23000, 1.50, 'Satellite galaxy', false, false);
INSERT INTO public.galaxy VALUES (16, 'Fireworks', 110, 26000, 2.20, 'Starburst galaxy', false, true);
INSERT INTO public.galaxy VALUES (17, 'Hoag’s Object', 40, 27000, 1.40, 'Ring galaxy', false, false);
INSERT INTO public.galaxy VALUES (18, 'Sculptor', 130, 14000, 2.30, 'Dwarf spheroidal galaxy', false, true);
INSERT INTO public.galaxy VALUES (19, 'Tadpole', 170, 20000, 2.70, 'Distorted galaxy', false, false);
INSERT INTO public.galaxy VALUES (20, 'Ursa Major I', 50, 21000, 1.90, 'Dwarf spheroidal galaxy', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon1', 200, false, 'Galileo', 1);
INSERT INTO public.moon VALUES (2, 'Moon2', -150, false, 'Hubble', 2);
INSERT INTO public.moon VALUES (3, 'Moon3', 100, true, 'Kepler', 3);
INSERT INTO public.moon VALUES (4, 'Moon4', -180, false, 'Copernicus', 4);
INSERT INTO public.moon VALUES (5, 'Moon5', 180, false, 'Newton', 5);
INSERT INTO public.moon VALUES (6, 'Moon6', 90, true, 'Einstein', 6);
INSERT INTO public.moon VALUES (7, 'Moon7', -170, false, 'Galileo', 7);
INSERT INTO public.moon VALUES (8, 'Moon8', 210, false, 'Hubble', 8);
INSERT INTO public.moon VALUES (9, 'Moon9', 80, true, 'Kepler', 9);
INSERT INTO public.moon VALUES (10, 'Moon10', -160, false, 'Copernicus', 10);
INSERT INTO public.moon VALUES (11, 'Moon11', 170, false, 'Newton', 11);
INSERT INTO public.moon VALUES (12, 'Moon12', 95, true, 'Einstein', 12);
INSERT INTO public.moon VALUES (13, 'Moon13', -175, false, 'Galileo', 13);
INSERT INTO public.moon VALUES (14, 'Moon14', 215, false, 'Hubble', 14);
INSERT INTO public.moon VALUES (15, 'Moon15', 75, true, 'Kepler', 15);
INSERT INTO public.moon VALUES (16, 'Moon16', -155, false, 'Copernicus', 16);
INSERT INTO public.moon VALUES (17, 'Moon17', 185, false, 'Newton', 17);
INSERT INTO public.moon VALUES (18, 'Moon18', 100, true, 'Einstein', 18);
INSERT INTO public.moon VALUES (19, 'Moon19', -165, false, 'Galileo', 19);
INSERT INTO public.moon VALUES (20, 'Moon20', 200, false, 'Hubble', 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet1', 5000, 365, true, 1);
INSERT INTO public.planet VALUES (2, 'Planet2', 8000, 730, false, 2);
INSERT INTO public.planet VALUES (3, 'Planet3', 6000, 500, true, 3);
INSERT INTO public.planet VALUES (4, 'Planet4', 5500, 400, false, 4);
INSERT INTO public.planet VALUES (5, 'Planet5', 7000, 600, true, 5);
INSERT INTO public.planet VALUES (6, 'Planet6', 4500, 300, false, 6);
INSERT INTO public.planet VALUES (7, 'Planet7', 4800, 320, true, 7);
INSERT INTO public.planet VALUES (8, 'Planet8', 5200, 350, false, 8);
INSERT INTO public.planet VALUES (9, 'Planet9', 5800, 380, true, 9);
INSERT INTO public.planet VALUES (10, 'Planet10', 5300, 340, false, 10);
INSERT INTO public.planet VALUES (11, 'Planet11', 7200, 650, true, 11);
INSERT INTO public.planet VALUES (12, 'Planet12', 6900, 630, false, 12);
INSERT INTO public.planet VALUES (13, 'Planet13', 6400, 590, true, 13);
INSERT INTO public.planet VALUES (14, 'Planet14', 4900, 330, false, 14);
INSERT INTO public.planet VALUES (15, 'Planet15', 5000, 365, true, 15);
INSERT INTO public.planet VALUES (16, 'Planet16', 8000, 730, false, 16);
INSERT INTO public.planet VALUES (17, 'Planet17', 6000, 500, true, 17);
INSERT INTO public.planet VALUES (18, 'Planet18', 5500, 400, false, 18);
INSERT INTO public.planet VALUES (19, 'Planet19', 7000, 600, true, 19);
INSERT INTO public.planet VALUES (20, 'Planet20', 4500, 300, false, 20);


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_station VALUES ('International Space Station', 1, NULL);
INSERT INTO public.space_station VALUES ('Mir', 2, NULL);
INSERT INTO public.space_station VALUES ('Skylab', 3, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star1', 1, 5000, true);
INSERT INTO public.star VALUES (2, 'Star2', 2, 6000, false);
INSERT INTO public.star VALUES (3, 'Star3', 3, 7000, true);
INSERT INTO public.star VALUES (4, 'Star4', 4, 8000, false);
INSERT INTO public.star VALUES (5, 'Star5', 5, 9000, true);
INSERT INTO public.star VALUES (6, 'Star6', 6, 10000, false);
INSERT INTO public.star VALUES (7, 'Star7', 7, 11000, true);
INSERT INTO public.star VALUES (8, 'Star8', 8, 12000, false);
INSERT INTO public.star VALUES (9, 'Star9', 9, 13000, true);
INSERT INTO public.star VALUES (10, 'Star10', 10, 14000, false);
INSERT INTO public.star VALUES (11, 'Star11', 11, 15000, true);
INSERT INTO public.star VALUES (12, 'Star12', 12, 16000, false);
INSERT INTO public.star VALUES (13, 'Star13', 13, 17000, true);
INSERT INTO public.star VALUES (14, 'Star14', 14, 18000, false);
INSERT INTO public.star VALUES (15, 'Star15', 15, 19000, true);
INSERT INTO public.star VALUES (16, 'Star16', 16, 20000, false);
INSERT INTO public.star VALUES (17, 'Star17', 17, 21000, true);
INSERT INTO public.star VALUES (18, 'Star18', 18, 22000, false);
INSERT INTO public.star VALUES (19, 'Star19', 19, 23000, true);
INSERT INTO public.star VALUES (20, 'Star20', 20, 24000, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 2, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_station_space_station_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: space_station space_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_name_key UNIQUE (name);


--
-- Name: space_station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (space_station_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

