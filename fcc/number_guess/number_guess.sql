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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 1);
INSERT INTO public.games VALUES (2, 1, 1);
INSERT INTO public.games VALUES (3, 1, 1);
INSERT INTO public.games VALUES (4, 1, 3);
INSERT INTO public.games VALUES (5, 12, 6);
INSERT INTO public.games VALUES (6, 13, 268);
INSERT INTO public.games VALUES (7, 13, 43);
INSERT INTO public.games VALUES (8, 14, 91);
INSERT INTO public.games VALUES (9, 14, 886);
INSERT INTO public.games VALUES (10, 13, 491);
INSERT INTO public.games VALUES (11, 13, 690);
INSERT INTO public.games VALUES (12, 13, 586);
INSERT INTO public.games VALUES (13, 12, 13);
INSERT INTO public.games VALUES (14, 15, 753);
INSERT INTO public.games VALUES (15, 15, 596);
INSERT INTO public.games VALUES (16, 16, 649);
INSERT INTO public.games VALUES (17, 16, 703);
INSERT INTO public.games VALUES (18, 15, 809);
INSERT INTO public.games VALUES (19, 15, 651);
INSERT INTO public.games VALUES (20, 15, 864);
INSERT INTO public.games VALUES (21, 17, 208);
INSERT INTO public.games VALUES (22, 17, 474);
INSERT INTO public.games VALUES (23, 18, 75);
INSERT INTO public.games VALUES (24, 18, 748);
INSERT INTO public.games VALUES (25, 17, 512);
INSERT INTO public.games VALUES (26, 17, 632);
INSERT INTO public.games VALUES (27, 17, 311);
INSERT INTO public.games VALUES (28, 19, 804);
INSERT INTO public.games VALUES (29, 19, 423);
INSERT INTO public.games VALUES (30, 20, 415);
INSERT INTO public.games VALUES (31, 20, 952);
INSERT INTO public.games VALUES (32, 19, 730);
INSERT INTO public.games VALUES (33, 19, 690);
INSERT INTO public.games VALUES (34, 19, 29);
INSERT INTO public.games VALUES (35, 21, 370);
INSERT INTO public.games VALUES (36, 21, 218);
INSERT INTO public.games VALUES (37, 22, 544);
INSERT INTO public.games VALUES (38, 22, 122);
INSERT INTO public.games VALUES (39, 21, 387);
INSERT INTO public.games VALUES (40, 21, 286);
INSERT INTO public.games VALUES (41, 21, 900);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'fiedri');
INSERT INTO public.users VALUES (2, 'fiedri2');
INSERT INTO public.users VALUES (3, 'user_1773762202561');
INSERT INTO public.users VALUES (4, 'user_1773762202560');
INSERT INTO public.users VALUES (5, 'user_1773762369763');
INSERT INTO public.users VALUES (6, 'user_1773762369762');
INSERT INTO public.users VALUES (7, 'user_1773762503965');
INSERT INTO public.users VALUES (8, 'user_1773762503964');
INSERT INTO public.users VALUES (9, 'user_1773762569431');
INSERT INTO public.users VALUES (10, 'user_1773762569430');
INSERT INTO public.users VALUES (11, '316');
INSERT INTO public.users VALUES (12, 'Friedrich');
INSERT INTO public.users VALUES (13, 'user_1773763673734');
INSERT INTO public.users VALUES (14, 'user_1773763673733');
INSERT INTO public.users VALUES (15, 'user_1773763903773');
INSERT INTO public.users VALUES (16, 'user_1773763903772');
INSERT INTO public.users VALUES (17, 'user_1773763964630');
INSERT INTO public.users VALUES (18, 'user_1773763964629');
INSERT INTO public.users VALUES (19, 'user_1773763978633');
INSERT INTO public.users VALUES (20, 'user_1773763978632');
INSERT INTO public.users VALUES (21, 'user_1773763991219');
INSERT INTO public.users VALUES (22, 'user_1773763991218');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 41, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 22, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

