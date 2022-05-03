--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-05-03 16:35:21 AST

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
-- TOC entry 214 (class 1259 OID 17103)
-- Name: animals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.animals (
    id integer NOT NULL,
    name character varying(20),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
    species_id integer,
    owner_id integer
);


ALTER TABLE public.animals OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17102)
-- Name: animals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.animals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 210 (class 1259 OID 17091)
-- Name: owners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owners (
    id integer NOT NULL,
    full_name character varying(20),
    age integer,
    email character varying(120)
);


ALTER TABLE public.owners OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17090)
-- Name: owners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.owners ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 17127)
-- Name: specializations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specializations (
    id integer NOT NULL,
    species_id integer,
    vet_id integer
);


ALTER TABLE public.specializations OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17126)
-- Name: specializations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.specializations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.specializations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 17097)
-- Name: species; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.species (
    id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.species OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17096)
-- Name: species_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.species ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.species_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 17121)
-- Name: vets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vets (
    id integer NOT NULL,
    name character varying(20),
    age integer,
    date_of_graduation date
);


ALTER TABLE public.vets OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17120)
-- Name: vets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.vets ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.vets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 17143)
-- Name: visits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visits (
    id integer NOT NULL,
    animal_id integer,
    vet_id integer,
    date_of_visit date
);


ALTER TABLE public.visits OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17142)
-- Name: visits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.visits ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3461 (class 2606 OID 17109)
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (id);


--
-- TOC entry 3457 (class 2606 OID 17095)
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (id);


--
-- TOC entry 3465 (class 2606 OID 17131)
-- Name: specializations specializations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_pkey PRIMARY KEY (id);


--
-- TOC entry 3459 (class 2606 OID 17101)
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (id);


--
-- TOC entry 3463 (class 2606 OID 17125)
-- Name: vets vets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vets
    ADD CONSTRAINT vets_pkey PRIMARY KEY (id);


--
-- TOC entry 3467 (class 2606 OID 17147)
-- Name: visits visits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);


--
-- TOC entry 3469 (class 2606 OID 17115)
-- Name: animals animals_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.owners(id);


--
-- TOC entry 3468 (class 2606 OID 17110)
-- Name: animals animals_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.species(id);


--
-- TOC entry 3470 (class 2606 OID 17132)
-- Name: specializations specializations_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.species(id);


--
-- TOC entry 3471 (class 2606 OID 17137)
-- Name: specializations specializations_vet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_vet_id_fkey FOREIGN KEY (vet_id) REFERENCES public.vets(id);


--
-- TOC entry 3472 (class 2606 OID 17148)
-- Name: visits visits_animal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES public.animals(id);


--
-- TOC entry 3473 (class 2606 OID 17153)
-- Name: visits visits_vet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_vet_id_fkey FOREIGN KEY (vet_id) REFERENCES public.vets(id);


-- Completed on 2022-05-03 16:35:27 AST

--
-- PostgreSQL database dump complete
--

