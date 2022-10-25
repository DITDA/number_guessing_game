--
-- PostgreSQL database dump
--
-- Dumped from database version 11.17 (Ubuntu 11.17-1.pgdg20.04+1)
-- Dumped by pg_dump version 11.17 (Ubuntu 11.17-1.pgdg20.04+1)

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
-- Name: users; Type: DATABASE; Schema: -; Owner: yellowflash2041
--

CREATE DATABASE users WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE users OWNER TO yellowflash2041;

\connect users

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
-- Name: users; Type: TABLE; Schema: public; Owner: yellowflash2041
--

CREATE TABLE public.users (
    username character varying(25) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO yellowflash2041;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: yellowflash2041
--


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: yellowflash2041
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--