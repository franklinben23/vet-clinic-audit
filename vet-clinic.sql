PGDMP     %                    z         
   vet-clinic %   10.19 (Ubuntu 10.19-0ubuntu0.18.04.1) %   10.19 (Ubuntu 10.19-0ubuntu0.18.04.1)      �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16386 
   vet-clinic    DATABASE     ~   CREATE DATABASE "vet-clinic" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE "vet-clinic";
             franklinben    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    13041    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16403    animals    TABLE     �   CREATE TABLE public.animals (
    id integer NOT NULL,
    name character varying(20),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
    species_id integer,
    owner_id integer
);
    DROP TABLE public.animals;
       public         franklinben    false    3            �            1259    16401    animals_id_seq    SEQUENCE     �   ALTER TABLE public.animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.animals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       franklinben    false    201    3            �            1259    16389    owners    TABLE     �   CREATE TABLE public.owners (
    id integer NOT NULL,
    full_name character varying(20),
    age integer,
    email character varying(120)
);
    DROP TABLE public.owners;
       public         franklinben    false    3            �            1259    16387    owners_id_seq    SEQUENCE     �   ALTER TABLE public.owners ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       franklinben    false    197    3            �            1259    16430    specializations    TABLE     m   CREATE TABLE public.specializations (
    id integer NOT NULL,
    species_id integer,
    vet_id integer
);
 #   DROP TABLE public.specializations;
       public         franklinben    false    3            �            1259    16428    specializations_id_seq    SEQUENCE     �   ALTER TABLE public.specializations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.specializations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       franklinben    false    3    205            �            1259    16396    species    TABLE     Y   CREATE TABLE public.species (
    id integer NOT NULL,
    name character varying(20)
);
    DROP TABLE public.species;
       public         franklinben    false    3            �            1259    16394    species_id_seq    SEQUENCE     �   ALTER TABLE public.species ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.species_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       franklinben    false    199    3            �            1259    16423    vets    TABLE     �   CREATE TABLE public.vets (
    id integer NOT NULL,
    name character varying(20),
    age integer,
    date_of_graduation date
);
    DROP TABLE public.vets;
       public         franklinben    false    3            �            1259    16421    vets_id_seq    SEQUENCE     �   ALTER TABLE public.vets ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.vets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       franklinben    false    203    3            �            1259    16447    visits    TABLE     {   CREATE TABLE public.visits (
    id integer NOT NULL,
    animal_id integer,
    vet_id integer,
    date_of_visit date
);
    DROP TABLE public.visits;
       public         franklinben    false    3            �            1259    16445    visits_id_seq    SEQUENCE     �   ALTER TABLE public.visits ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       franklinben    false    207    3                       2606    16410    animals animals_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.animals DROP CONSTRAINT animals_pkey;
       public         franklinben    false    201                       2606    16393    owners owners_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.owners DROP CONSTRAINT owners_pkey;
       public         franklinben    false    197            
           2606    16434 $   specializations specializations_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.specializations DROP CONSTRAINT specializations_pkey;
       public         franklinben    false    205                       2606    16400    species species_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.species DROP CONSTRAINT species_pkey;
       public         franklinben    false    199                       2606    16427    vets vets_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.vets
    ADD CONSTRAINT vets_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.vets DROP CONSTRAINT vets_pkey;
       public         franklinben    false    203                       2606    16451    visits visits_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.visits DROP CONSTRAINT visits_pkey;
       public         franklinben    false    207                       2606    16416    animals animals_owner_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.owners(id);
 G   ALTER TABLE ONLY public.animals DROP CONSTRAINT animals_owner_id_fkey;
       public       franklinben    false    197    2818    201                       2606    16411    animals animals_species_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.species(id);
 I   ALTER TABLE ONLY public.animals DROP CONSTRAINT animals_species_id_fkey;
       public       franklinben    false    201    199    2820                       2606    16435 /   specializations specializations_species_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.species(id);
 Y   ALTER TABLE ONLY public.specializations DROP CONSTRAINT specializations_species_id_fkey;
       public       franklinben    false    2820    205    199                       2606    16440 +   specializations specializations_vet_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_vet_id_fkey FOREIGN KEY (vet_id) REFERENCES public.vets(id);
 U   ALTER TABLE ONLY public.specializations DROP CONSTRAINT specializations_vet_id_fkey;
       public       franklinben    false    203    2824    205                       2606    16452    visits visits_animal_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES public.animals(id);
 F   ALTER TABLE ONLY public.visits DROP CONSTRAINT visits_animal_id_fkey;
       public       franklinben    false    2822    201    207                       2606    16457    visits visits_vet_id_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_vet_id_fkey FOREIGN KEY (vet_id) REFERENCES public.vets(id);
 C   ALTER TABLE ONLY public.visits DROP CONSTRAINT visits_vet_id_fkey;
       public       franklinben    false    2824    203    207           