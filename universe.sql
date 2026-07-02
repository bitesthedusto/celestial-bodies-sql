--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(30) NOT NULL,
    type text NOT NULL,
    size_in_kparsecs numeric(3,1),
    has_planets boolean,
    constellation text
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
    name character varying(30) NOT NULL,
    moon_color text,
    star_id integer,
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
    name character varying(30) NOT NULL,
    has_life boolean,
    planet_type text,
    color text,
    num_moons integer,
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
-- Name: space_movies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_movies (
    space_movies_id integer NOT NULL,
    name character varying(30) NOT NULL,
    genre text,
    imdb_score numeric(2,1),
    lead_actor text
);


ALTER TABLE public.space_movies OWNER TO freecodecamp;

--
-- Name: space_movies_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_movies_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_movies_movie_id_seq OWNER TO freecodecamp;

--
-- Name: space_movies_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_movies_movie_id_seq OWNED BY public.space_movies.space_movies_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_type text,
    star_color text,
    solar_mass integer,
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
-- Name: space_movies space_movies_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_movies ALTER COLUMN space_movies_id SET DEFAULT nextval('public.space_movies_movie_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', NULL, true, 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', NULL, NULL, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Cocoon', 'Spiral', NULL, NULL, 'Canes Venatici');
INSERT INTO public.galaxy VALUES (4, 'Eye of God', 'Spiral', NULL, NULL, 'Eridanus');
INSERT INTO public.galaxy VALUES (5, 'Godzilla', 'Spiral', NULL, NULL, 'Perseus');
INSERT INTO public.galaxy VALUES (6, 'Little Sombrero Galaxy', 'Spiral', NULL, NULL, 'Pegasus');
INSERT INTO public.galaxy VALUES (7, 'Sunburst Galaxy', 'Starburst', NULL, true, 'Apus');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Charon', 'Gray', 7, 9);
INSERT INTO public.moon VALUES (2, 'Styx', 'Gray', 7, 9);
INSERT INTO public.moon VALUES (3, 'Nix', 'Gray', 7, 9);
INSERT INTO public.moon VALUES (4, 'Kerberus', 'Gray', 7, 9);
INSERT INTO public.moon VALUES (5, 'Hydra', 'Gray', 7, 9);
INSERT INTO public.moon VALUES (6, 'Luna', 'Gray', 7, 3);
INSERT INTO public.moon VALUES (7, 'Phobos', 'Gray-Brown', 7, 4);
INSERT INTO public.moon VALUES (8, 'Deimos', 'Gray-Brown', 7, 4);
INSERT INTO public.moon VALUES (9, 'Naiad', 'Gray-Brown', 7, 8);
INSERT INTO public.moon VALUES (10, 'Thalassa', 'Gray-Brown', 7, 8);
INSERT INTO public.moon VALUES (11, 'Despina', 'Gray-Brown', 7, 8);
INSERT INTO public.moon VALUES (12, 'Galatea', 'Gray-Brown', 7, 8);
INSERT INTO public.moon VALUES (13, 'Larissa', 'Gray-Brown', 7, 8);
INSERT INTO public.moon VALUES (14, 'Hippocamp', 'Gray-Brown', 7, 8);
INSERT INTO public.moon VALUES (15, 'Proteus', 'Gray-Brown', 7, 8);
INSERT INTO public.moon VALUES (16, 'Triton', 'Gray-Brown', 7, 8);
INSERT INTO public.moon VALUES (17, 'Sao', 'Gray-Brown', 7, 8);
INSERT INTO public.moon VALUES (18, 'Neso', 'Gray-Brown', 7, 8);
INSERT INTO public.moon VALUES (19, 'Io', 'Brown', 7, 5);
INSERT INTO public.moon VALUES (20, 'Europa', 'Brown', 7, 5);
INSERT INTO public.moon VALUES (21, 'Callisto', 'Purple', 7, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 'Terrestrial', 'Gray', 0, 7);
INSERT INTO public.planet VALUES (2, 'Venus', false, 'Terrestrial', 'White', 0, 7);
INSERT INTO public.planet VALUES (3, 'Earth', true, 'Terrestrial', 'Blue', 1, 7);
INSERT INTO public.planet VALUES (4, 'Mars', true, 'Terrestrial', 'Red', 2, 7);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'Gas Giant', 'Brown', 115, 7);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'Gas Giant', 'Yellow', 293, 7);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'Ice Giant', 'Cyan', 29, 7);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'Ice Giant', 'Ice Blue', 16, 7);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 'Dwarf', 'White Gray', 0, 7);
INSERT INTO public.planet VALUES (10, 'Eris', false, 'Dwarf', 'Gray', 0, 7);
INSERT INTO public.planet VALUES (11, 'Haumea', false, 'Dwarf', 'Gray', 0, 7);
INSERT INTO public.planet VALUES (12, 'Gonggong', false, 'Dwarf', 'Brown', 0, 7);


--
-- Data for Name: space_movies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_movies VALUES (1, 'Interstellar', 'Epic Science Fiction', 8.7, 'Matthew McConaughey');
INSERT INTO public.space_movies VALUES (2, 'The Martian', 'Science Fiction', 8.0, 'Matt Damon');
INSERT INTO public.space_movies VALUES (3, 'Life', 'Science Fiction Horror', 6.6, 'Jake Gyllenhaal');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 'Mercury-manganese', 'White', 4, 1);
INSERT INTO public.star VALUES (2, 'Polaris', 'Supergiant', 'Yellow-White', 5, 1);
INSERT INTO public.star VALUES (3, 'Cygnus OB2', 'Hypergiant', 'Blue', 110, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Supergiant', 'Red', 14, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Red Dwarf', 'Red', 0, 1);
INSERT INTO public.star VALUES (6, 'Godzilla', NULL, NULL, NULL, 7);
INSERT INTO public.star VALUES (7, 'The Sun', 'G-Type', 'Yellow', 2, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_movies_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_movies_movie_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_constellation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_key UNIQUE (constellation);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: space_movies space_movies_lead_actor_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_movies
    ADD CONSTRAINT space_movies_lead_actor_key UNIQUE (lead_actor);


--
-- Name: space_movies space_movies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_movies
    ADD CONSTRAINT space_movies_pkey PRIMARY KEY (space_movies_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

