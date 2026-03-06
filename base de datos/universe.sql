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
-- Name: astronomer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomer (
    astronomer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    birth_year integer NOT NULL,
    nationality character varying(50) NOT NULL,
    is_active boolean NOT NULL,
    discoveries_count integer NOT NULL,
    field_of_study text NOT NULL
);


ALTER TABLE public.astronomer OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomer_astronomer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomer_astronomer_id_seq OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomer_astronomer_id_seq OWNED BY public.astronomer.astronomer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions integer NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL,
    has_life boolean NOT NULL,
    type character varying(50) NOT NULL,
    number_of_stars integer NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km numeric(10,2) NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_planet_km integer NOT NULL,
    orbital_period_days numeric(10,2) NOT NULL,
    discovery_year integer NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    has_rings boolean NOT NULL,
    diameter_km numeric(10,2) NOT NULL,
    is_habitable boolean NOT NULL,
    number_of_moons integer NOT NULL,
    atmosphere_type text NOT NULL,
    orbital_period_days numeric(10,2) NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature integer NOT NULL,
    distance_from_earth numeric(10,6) NOT NULL,
    is_main_sequence boolean NOT NULL,
    age_in_millions integer NOT NULL,
    spectral_type character varying(10) NOT NULL
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
-- Name: astronomer astronomer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer ALTER COLUMN astronomer_id SET DEFAULT nextval('public.astronomer_astronomer_id_seq'::regclass);


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
-- Data for Name: astronomer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomer VALUES (1, 'Galileo Galilei', 1564, 'Italiana', false, 5, 'Observación astronómica, lunas de Júpiter');
INSERT INTO public.astronomer VALUES (2, 'Carl Sagan', 1934, 'Estadounidense', false, 3, 'Astrobiología, divulgación científica');
INSERT INTO public.astronomer VALUES (3, 'Stephen Hawking', 1942, 'Británica', false, 2, 'Agujeros negros, cosmología');
INSERT INTO public.astronomer VALUES (4, 'Vera Rubin', 1928, 'Estadounidense', false, 4, 'Materia oscura, rotación de galaxias');
INSERT INTO public.astronomer VALUES (5, 'Neil deGrasse Tyson', 1958, 'Estadounidense', true, 1, 'Astrofísica, divulgación');
INSERT INTO public.astronomer VALUES (6, 'Carolina Herschel', 1750, 'Británica', false, 8, 'Descubrimiento de cometas');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 'Nuestra galaxia, hogar del Sistema Solar', 13600, 0.00, true, 'Espiral barrada', 250000);
INSERT INTO public.galaxy VALUES (2, 'Andrómeda', 'Galaxia más cercana a la Vía Láctea', 10000, 2.50, false, 'Espiral', 1000000);
INSERT INTO public.galaxy VALUES (3, 'Triángulo', 'Tercera galaxia más grande del Grupo Local', 9000, 3.00, false, 'Espiral', 40000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Galaxia con un núcleo brillante y un gran bulbo', 13200, 29.30, false, 'Espiral', 80000);
INSERT INTO public.galaxy VALUES (5, 'Remolino', 'Galaxia interactuando con su compañera', 8000, 23.00, false, 'Espiral', 60000);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Galaxia con un agujero negro supermasivo', 12000, 13.00, false, 'Lenticular', 50000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 3474.00, true, 384400, 27.30, 0);
INSERT INTO public.moon VALUES (2, 'Fobos', 2, 22.00, false, 9376, 0.30, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12.00, false, 23460, 1.30, 1877);
INSERT INTO public.moon VALUES (4, 'Ío', 3, 3642.00, true, 421800, 1.80, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3122.00, true, 671100, 3.60, 1610);
INSERT INTO public.moon VALUES (6, 'Ganímedes', 3, 5268.00, true, 1070400, 7.20, 1610);
INSERT INTO public.moon VALUES (7, 'Calisto', 3, 4821.00, true, 1882700, 16.70, 1610);
INSERT INTO public.moon VALUES (8, 'Amaltea', 3, 167.00, false, 181400, 0.50, 1892);
INSERT INTO public.moon VALUES (9, 'Titán', 4, 5150.00, true, 1221870, 15.90, 1655);
INSERT INTO public.moon VALUES (10, 'Rea', 4, 1527.00, true, 527040, 4.50, 1672);
INSERT INTO public.moon VALUES (11, 'Dione', 4, 1123.00, true, 377400, 2.70, 1684);
INSERT INTO public.moon VALUES (12, 'Tetis', 4, 1062.00, true, 294660, 1.90, 1684);
INSERT INTO public.moon VALUES (13, 'Encélado', 4, 504.00, true, 238040, 1.40, 1789);
INSERT INTO public.moon VALUES (14, 'Mimas', 4, 396.00, true, 185540, 0.90, 1789);
INSERT INTO public.moon VALUES (15, 'Hiperión', 4, 270.00, false, 1481000, 21.30, 1848);
INSERT INTO public.moon VALUES (16, 'Febe', 4, 213.00, false, 12952000, 550.00, 1899);
INSERT INTO public.moon VALUES (17, 'Tritón', 8, 2707.00, true, 354800, 5.90, 1846);
INSERT INTO public.moon VALUES (18, 'Nereida', 8, 340.00, false, 5513800, 360.00, 1949);
INSERT INTO public.moon VALUES (19, 'Caronte', 1, 1212.00, true, 19570, 6.40, 1978);
INSERT INTO public.moon VALUES (20, 'Hydra', 1, 51.00, false, 64738, 38.20, 2005);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', 1, false, 12742.00, true, 1, 'Nitrógeno-Oxígeno', 365.00);
INSERT INTO public.planet VALUES (2, 'Marte', 1, false, 6779.00, false, 2, 'Dióxido de carbono', 687.00);
INSERT INTO public.planet VALUES (3, 'Júpiter', 1, true, 139820.00, false, 79, 'Hidrógeno-Helio', 4333.00);
INSERT INTO public.planet VALUES (4, 'Saturno', 1, true, 116460.00, false, 82, 'Hidrógeno-Helio', 10759.00);
INSERT INTO public.planet VALUES (5, 'Venus', 1, false, 12104.00, false, 0, 'Dióxido de carbono', 225.00);
INSERT INTO public.planet VALUES (6, 'Mercurio', 1, false, 4879.00, false, 0, 'Prácticamente inexistente', 88.00);
INSERT INTO public.planet VALUES (7, 'Urano', 1, true, 50724.00, false, 27, 'Hidrógeno-Helio-Metano', 30687.00);
INSERT INTO public.planet VALUES (8, 'Neptuno', 1, true, 49244.00, false, 14, 'Hidrógeno-Helio-Metano', 60190.00);
INSERT INTO public.planet VALUES (9, 'Próxima Centauri b', 1, false, 14000.00, true, 0, 'Desconocida', 11.00);
INSERT INTO public.planet VALUES (10, 'Sirius b', 2, false, 11600.00, false, 0, 'Helio', 365.00);
INSERT INTO public.planet VALUES (11, 'Betelgeuse b', 3, false, 1200000.00, false, 0, 'Desconocida', 2100.00);
INSERT INTO public.planet VALUES (12, 'Andrómeda b', 4, true, 45000.00, false, 5, 'Hidrógeno', 800.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 5778, 0.000016, true, 4600, 'G2V');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, 8.600000, true, 200, 'A1V');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 3500, 642.500000, false, 8, 'M2I');
INSERT INTO public.star VALUES (4, 'Andrómeda Prime', 2, 6000, 2.500000, true, 5000, 'G0V');
INSERT INTO public.star VALUES (5, 'Triangulum Major', 3, 7500, 3.000000, true, 3000, 'F5V');
INSERT INTO public.star VALUES (6, 'Sombrero Central', 4, 5500, 29.300000, true, 6000, 'K0V');


--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomer_astronomer_id_seq', 6, true);


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
-- Name: astronomer astronomer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_name_key UNIQUE (name);


--
-- Name: astronomer astronomer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_pkey PRIMARY KEY (astronomer_id);


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

