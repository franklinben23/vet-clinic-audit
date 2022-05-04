PGDMP          :                z         
   vet-clinic    14.2    14.2                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            !           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            "           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            #           1262    25281 
   vet-clinic    DATABASE     a   CREATE DATABASE "vet-clinic" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE "vet-clinic";
                postgres    false            �            1259    25282    animals    TABLE     �   CREATE TABLE public.animals (
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
       public         heap    postgres    false            �            1259    25287    animals_id_seq    SEQUENCE     �   ALTER TABLE public.animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.animals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            �            1259    25288    owners    TABLE     �   CREATE TABLE public.owners (
    id integer NOT NULL,
    full_name character varying(20),
    age integer,
    email character varying(120)
);
    DROP TABLE public.owners;
       public         heap    postgres    false            �            1259    25291    owners_id_seq    SEQUENCE     �   ALTER TABLE public.owners ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211            �            1259    25292    specializations    TABLE     m   CREATE TABLE public.specializations (
    id integer NOT NULL,
    species_id integer,
    vet_id integer
);
 #   DROP TABLE public.specializations;
       public         heap    postgres    false            �            1259    25295    specializations_id_seq    SEQUENCE     �   ALTER TABLE public.specializations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.specializations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    213            �            1259    25296    species    TABLE     Y   CREATE TABLE public.species (
    id integer NOT NULL,
    name character varying(20)
);
    DROP TABLE public.species;
       public         heap    postgres    false            �            1259    25299    species_id_seq    SEQUENCE     �   ALTER TABLE public.species ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.species_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    25300    vets    TABLE     �   CREATE TABLE public.vets (
    id integer NOT NULL,
    name character varying(20),
    age integer,
    date_of_graduation date
);
    DROP TABLE public.vets;
       public         heap    postgres    false            �            1259    25303    vets_id_seq    SEQUENCE     �   ALTER TABLE public.vets ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.vets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    25304    visits    TABLE     {   CREATE TABLE public.visits (
    id integer NOT NULL,
    animal_id integer,
    vet_id integer,
    date_of_visit date
);
    DROP TABLE public.visits;
       public         heap    postgres    false            �            1259    25307    visits_id_seq    SEQUENCE     �   ALTER TABLE public.visits ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �           2606    25309    animals animals_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.animals DROP CONSTRAINT animals_pkey;
       public            postgres    false    209            �           2606    25311    owners owners_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.owners DROP CONSTRAINT owners_pkey;
       public            postgres    false    211            �           2606    25313 $   specializations specializations_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.specializations DROP CONSTRAINT specializations_pkey;
       public            postgres    false    213            �           2606    25315    species species_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.species DROP CONSTRAINT species_pkey;
       public            postgres    false    215            �           2606    25317    vets vets_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.vets
    ADD CONSTRAINT vets_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.vets DROP CONSTRAINT vets_pkey;
       public            postgres    false    217            �           2606    25319    visits visits_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.visits DROP CONSTRAINT visits_pkey;
       public            postgres    false    219            �           1259    25352    animal_id_on_visits    INDEX     K   CREATE INDEX animal_id_on_visits ON public.visits USING btree (animal_id);
 '   DROP INDEX public.animal_id_on_visits;
       public            postgres    false    219            �           2606    25320    animals animals_owner_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.owners(id);
 G   ALTER TABLE ONLY public.animals DROP CONSTRAINT animals_owner_id_fkey;
       public          postgres    false    209    211    3459            �           2606    25325    animals animals_species_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.species(id);
 I   ALTER TABLE ONLY public.animals DROP CONSTRAINT animals_species_id_fkey;
       public          postgres    false    215    3463    209            �           2606    25330 /   specializations specializations_species_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.species(id);
 Y   ALTER TABLE ONLY public.specializations DROP CONSTRAINT specializations_species_id_fkey;
       public          postgres    false    215    3463    213            �           2606    25335 +   specializations specializations_vet_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_vet_id_fkey FOREIGN KEY (vet_id) REFERENCES public.vets(id);
 U   ALTER TABLE ONLY public.specializations DROP CONSTRAINT specializations_vet_id_fkey;
       public          postgres    false    217    3465    213            �           2606    25340    visits visits_animal_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES public.animals(id);
 F   ALTER TABLE ONLY public.visits DROP CONSTRAINT visits_animal_id_fkey;
       public          postgres    false    3457    209    219            �           2606    25345    visits visits_vet_id_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_vet_id_fkey FOREIGN KEY (vet_id) REFERENCES public.vets(id);
 C   ALTER TABLE ONLY public.visits DROP CONSTRAINT visits_vet_id_fkey;
       public          postgres    false    3465    219    217           