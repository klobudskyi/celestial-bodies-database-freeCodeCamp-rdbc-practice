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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    diameter double precision NOT NULL,
    orbit_period double precision,
    description text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: TABLE asteroid; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON TABLE public.asteroid IS 'Table storing information about asteroids';


--
-- Name: COLUMN asteroid.asteroid_id; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.asteroid.asteroid_id IS 'Unique identifier for the asteroid';


--
-- Name: COLUMN asteroid.name; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.asteroid.name IS 'Name of the asteroid';


--
-- Name: COLUMN asteroid.galaxy_id; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.asteroid.galaxy_id IS 'Foreign key referencing the galaxy in which the asteroid exists';


--
-- Name: COLUMN asteroid.diameter; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.asteroid.diameter IS 'Diameter of the asteroid in kilometers';


--
-- Name: COLUMN asteroid.orbit_period; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.asteroid.orbit_period IS 'Orbit period of the asteroid around the Sun (in Earth years)';


--
-- Name: COLUMN asteroid.description; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.asteroid.description IS 'Detailed description of the asteroid';


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(100) NOT NULL,
    distance double precision,
    mass numeric(20,2),
    is_active boolean NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: TABLE galaxy; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON TABLE public.galaxy IS 'Table storing information about galaxies';


--
-- Name: COLUMN galaxy.galaxy_id; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.galaxy.galaxy_id IS 'Unique identifier for the galaxy';


--
-- Name: COLUMN galaxy.name; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.galaxy.name IS 'Name of the galaxy';


--
-- Name: COLUMN galaxy.type; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.galaxy.type IS 'Type of galaxy (e.g., Spiral, Elliptical)';


--
-- Name: COLUMN galaxy.distance; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.galaxy.distance IS 'Distance of the galaxy from Earth (in light-years)';


--
-- Name: COLUMN galaxy.mass; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.galaxy.mass IS 'Mass of the galaxy in solar masses';


--
-- Name: COLUMN galaxy.is_active; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.galaxy.is_active IS 'Indicates if the galaxy is currently active';


--
-- Name: COLUMN galaxy.description; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.galaxy.description IS 'Detailed description of the galaxy';


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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter double precision NOT NULL,
    discovered_year integer,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: TABLE moon; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON TABLE public.moon IS 'Table storing information about moons';


--
-- Name: COLUMN moon.moon_id; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.moon.moon_id IS 'Unique identifier for the moon';


--
-- Name: COLUMN moon.name; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.moon.name IS 'Name of the moon';


--
-- Name: COLUMN moon.planet_id; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.moon.planet_id IS 'Foreign key referencing the planet that the moon orbits';


--
-- Name: COLUMN moon.diameter; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.moon.diameter IS 'Diameter of the moon in kilometers';


--
-- Name: COLUMN moon.discovered_year; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.moon.discovered_year IS 'Year when the moon was discovered';


--
-- Name: COLUMN moon.description; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.moon.description IS 'Detailed description of the moon';


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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    radius double precision NOT NULL,
    orbital_period double precision,
    has_life boolean NOT NULL,
    moons_count integer,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: TABLE planet; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON TABLE public.planet IS 'Table storing information about planets';


--
-- Name: COLUMN planet.planet_id; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.planet.planet_id IS 'Unique identifier for the planet';


--
-- Name: COLUMN planet.name; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.planet.name IS 'Name of the planet';


--
-- Name: COLUMN planet.star_id; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.planet.star_id IS 'Foreign key referencing the star that the planet orbits';


--
-- Name: COLUMN planet.radius; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.planet.radius IS 'Radius of the planet in kilometers';


--
-- Name: COLUMN planet.orbital_period; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.planet.orbital_period IS 'Orbital period of the planet around its star (in Earth days)';


--
-- Name: COLUMN planet.has_life; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.planet.has_life IS 'Indicates if life is present on the planet';


--
-- Name: COLUMN planet.moons_count; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.planet.moons_count IS 'Number of moons orbiting the planet';


--
-- Name: COLUMN planet.description; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.planet.description IS 'Detailed description of the planet';


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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(10) NOT NULL,
    luminosity double precision,
    age integer,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: TABLE star; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON TABLE public.star IS 'Table storing information about stars';


--
-- Name: COLUMN star.star_id; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.star.star_id IS 'Unique identifier for the star';


--
-- Name: COLUMN star.name; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.star.name IS 'Name of the star';


--
-- Name: COLUMN star.galaxy_id; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.star.galaxy_id IS 'Foreign key referencing the galaxy that the star belongs to';


--
-- Name: COLUMN star.spectral_type; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.star.spectral_type IS 'Spectral classification of the star (e.g., O, B, A)';


--
-- Name: COLUMN star.luminosity; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.star.luminosity IS 'Luminosity of the star relative to the Sun';


--
-- Name: COLUMN star.age; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.star.age IS 'Age of the star in millions of years';


--
-- Name: COLUMN star.description; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.star.description IS 'Detailed description of the star';


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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1, 939, 1680, 'The largest object in the asteroid belt, considered a dwarf planet.');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 1, 525, 1325, 'One of the largest asteroids in the asteroid belt, with a differentiated interior.');
INSERT INTO public.asteroid VALUES (3, 'Eros', 1, 34, 643, 'A near-Earth asteroid visited by NASA''s NEAR Shoemaker spacecraft.');
INSERT INTO public.asteroid VALUES (4, 'Apophis', 1, 370, 323, 'A potentially hazardous asteroid that will make a close approach to Earth in 2029.');
INSERT INTO public.asteroid VALUES (5, 'Bennu', 1, 490, 437, 'A near-Earth asteroid and the target of NASA''s OSIRIS-REx mission.');
INSERT INTO public.asteroid VALUES (6, 'Pallas', 1, 512, 1684, 'The second-largest asteroid in the asteroid belt.');
INSERT INTO public.asteroid VALUES (7, 'Hygiea', 1, 431, 2034, 'A dark asteroid that could be classified as a dwarf planet.');
INSERT INTO public.asteroid VALUES (8, 'Ryugu', 1, 900, 474, 'A near-Earth asteroid visited by Japan''s Hayabusa2 spacecraft.');
INSERT INTO public.asteroid VALUES (9, 'Itokawa', 1, 330, 556, 'A small, elongated asteroid visited by JAXA''s Hayabusa mission.');
INSERT INTO public.asteroid VALUES (10, 'Psyche', 1, 226, 1825, 'A metallic asteroid that may be the core of an early planetesimal.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 1.50, true, 'The Milky Way galaxy is home to our solar system.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2500000, 1.10, true, 'The closest large galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, 0.80, true, 'A smaller spiral galaxy near the Andromeda galaxy.');
INSERT INTO public.galaxy VALUES (4, 'NGC 1300', 'Barred Spiral', 60000000, 0.50, true, 'A barred spiral galaxy located in the Eridanus constellation.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 28000000, 0.90, true, 'Known for its distinct appearance resembling a sombrero hat.');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 54000000, 2.00, true, 'A giant elliptical galaxy located in the Virgo cluster.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, -4000, 'The only natural satellite of Earth.');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22.4, 1877, 'The larger of Mars'' two moons.');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12.4, 1877, 'The smaller of Mars'' two moons.');
INSERT INTO public.moon VALUES (4, 'Europa', 4, 3121, 1610, 'One of Jupiter''s largest moons, known for its ice-covered ocean.');
INSERT INTO public.moon VALUES (5, 'Ganymede', 4, 5268, 1610, 'The largest moon of Jupiter and the Solar System.');
INSERT INTO public.moon VALUES (6, 'Io', 4, 3643, 1610, 'A volcanic moon of Jupiter, known for its extreme geologic activity.');
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 4821, 1610, 'A large moon of Jupiter, heavily cratered and ice-covered.');
INSERT INTO public.moon VALUES (8, 'Titan', 5, 5150, 1655, 'Saturn''s largest moon, known for its thick atmosphere.');
INSERT INTO public.moon VALUES (9, 'Rhea', 5, 1528, 1672, 'Saturn''s second-largest moon, with a very thin atmosphere.');
INSERT INTO public.moon VALUES (10, 'Triton', 6, 2706, 1846, 'The largest moon of Neptune, with retrograde orbit.');
INSERT INTO public.moon VALUES (11, 'Oberon', 6, 1523, 1787, 'One of Uranus''s moons, heavily cratered.');
INSERT INTO public.moon VALUES (12, 'Miranda', 6, 471.6, 1948, 'Uranus;''s moon, known for its extreme geological features.');
INSERT INTO public.moon VALUES (13, 'Enceladus', 5, 504.2, 1789, 'A small, icy moon of Saturn, with geysers that erupt water and ice.');
INSERT INTO public.moon VALUES (14, 'Mimas', 5, 396.4, 1789, 'A small moon of Saturn, often called the "Death Star moon" because of its large crater.');
INSERT INTO public.moon VALUES (15, 'Iapetus', 5, 1469, 1671, 'A moon of Saturn with a two-toned appearance.');
INSERT INTO public.moon VALUES (16, 'Hyperion', 5, 270, 1848, 'A moon of Saturn with a chaotic rotation and sponge-like texture.');
INSERT INTO public.moon VALUES (17, 'Titania', 6, 1578, 1787, 'The largest moon of Uranus, with a significant number of craters.');
INSERT INTO public.moon VALUES (18, 'Ariel', 6, 1158, 1851, 'A moon of Uranus, known for its relatively smooth surface.');
INSERT INTO public.moon VALUES (19, 'Phoebe', 5, 213, 1898, 'A moon of Saturn, captured by the planet''s gravity.');
INSERT INTO public.moon VALUES (20, 'Charon', 3, 1212, 1978, 'The largest moon of Pluto, locked in a mutual orbit with its parent planet.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, 365, true, 1, 'The third planet from the Sun and the only known planet to support life.');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3389, 687, false, 2, 'The fourth planet from the Sun, known for its red appearance.');
INSERT INTO public.planet VALUES (3, 'Venus', 1, 6051, 225, false, 0, 'The second planet from the Sun, often referred to as Earth''s twin.');
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 69911, 4333, false, 79, 'The largest planet in the Solar System, with a massive atmosphere and many moons.');
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 58232, 10759, false, 82, 'Known for its stunning ring system.');
INSERT INTO public.planet VALUES (6, 'Uranus', 1, 25362, 30687, false, 27, 'An ice giant with a tilted axis.');
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 24622, 60190, false, 14, 'The eighth and farthest planet from the Sun.');
INSERT INTO public.planet VALUES (8, 'Mercury', 1, 2439, 88, false, 0, 'The closest planet to the Sun.');
INSERT INTO public.planet VALUES (9, 'Proxima b', 6, 10920, 11, true, 1, 'A planet orbiting Proxima Centauri, located in the habitable zone.');
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 2, 11230, 5, false, 0, 'A planet orbiting Alpha Centauri B, outside the habitable zone.');
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 5, 12440, 290, true, 1, 'An exoplanet orbiting a star similar to the Sun.');
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 4, 16000, 3.5, false, 0, 'A hot Jupiter-like planet orbiting a star in the constellation Pegasus.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1, 4600, 'The star at the center of our solar system.');
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 'G2V', 1.5, 5800, 'The closest star system to Earth.');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 2, 'M2I', 10000, 100, 'A red supergiant in the constellation of Orion.');
INSERT INTO public.star VALUES (4, 'Sirius', 3, 'A1V', 25.4, 200, 'The brightest star in the night sky.');
INSERT INTO public.star VALUES (5, 'Polaris', 4, 'F7Ib', 2.5, 700, 'The current northern pole star.');
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 2, 'M5.5V', 0.0015, 4800, 'The closest known star to the Sun.');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

