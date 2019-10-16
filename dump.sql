PGDMP         *            	    v           test    10.5    10.5 ?    D           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            E           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            F           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            G           1262    34166    test    DATABASE     �   CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE test;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            H           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            I           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    34216    adresse    TABLE     �   CREATE TABLE public.adresse (
    adresse_id integer NOT NULL,
    voie character varying(64) NOT NULL,
    code_postal integer NOT NULL,
    localite character varying(64) NOT NULL,
    utilisateur_id integer NOT NULL
);
    DROP TABLE public.adresse;
       public         postgres    false    3            �            1259    34214    adresse_adresse_id_seq    SEQUENCE        CREATE SEQUENCE public.adresse_adresse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.adresse_adresse_id_seq;
       public       postgres    false    3    207            J           0    0    adresse_adresse_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.adresse_adresse_id_seq OWNED BY public.adresse.adresse_id;
            public       postgres    false    206            �            1259    34209    client    TABLE     �   CREATE TABLE public.client (
    utilisateur_id integer NOT NULL,
    nom_compte character varying(32),
    mot_de_passe character varying(100)
);
    DROP TABLE public.client;
       public         postgres    false    3            �            1259    34227    commande    TABLE     �   CREATE TABLE public.commande (
    numero_commande character varying NOT NULL,
    date date NOT NULL,
    suivi character varying(32) NOT NULL,
    panier_id integer NOT NULL
);
    DROP TABLE public.commande;
       public         postgres    false    3            �            1259    34190    composition    TABLE     �   CREATE TABLE public.composition (
    composition_id integer NOT NULL,
    nom character varying(64) NOT NULL,
    produit_id integer NOT NULL,
    quantite integer NOT NULL,
    grandeur character varying(20) NOT NULL
);
    DROP TABLE public.composition;
       public         postgres    false    3            �            1259    34188    composition_composition_id_seq    SEQUENCE     �   CREATE SEQUENCE public.composition_composition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.composition_composition_id_seq;
       public       postgres    false    3    201            K           0    0    composition_composition_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.composition_composition_id_seq OWNED BY public.composition.composition_id;
            public       postgres    false    200            �            1259    34172    elementstocks    TABLE     �   CREATE TABLE public.elementstocks (
    nom character varying(64) NOT NULL,
    quantite double precision NOT NULL,
    grandeur character varying(20) NOT NULL
);
 !   DROP TABLE public.elementstocks;
       public         postgres    false    3            �            1259    34167 
   ingredient    TABLE     K   CREATE TABLE public.ingredient (
    nom character varying(64) NOT NULL
);
    DROP TABLE public.ingredient;
       public         postgres    false    3            �            1259    34222    panier    TABLE     �   CREATE TABLE public.panier (
    panier_id integer NOT NULL,
    utilisateur_id integer NOT NULL,
    produit_id integer NOT NULL
);
    DROP TABLE public.panier;
       public         postgres    false    3            �            1259    34204 	   personnel    TABLE     �   CREATE TABLE public.personnel (
    utilisateur_id integer NOT NULL,
    nom_compte character varying(32) NOT NULL,
    mot_de_passe character varying(100) NOT NULL,
    role character varying(16) NOT NULL
);
    DROP TABLE public.personnel;
       public         postgres    false    3            �            1259    34179    produit    TABLE     /  CREATE TABLE public.produit (
    produit_id integer NOT NULL,
    nom character varying(64) NOT NULL,
    descriptif character varying(2000) NOT NULL,
    prixunitaireht double precision NOT NULL,
    tauxtva100 double precision NOT NULL,
    valeursnutritionnelles character varying(2000) NOT NULL
);
    DROP TABLE public.produit;
       public         postgres    false    3            �            1259    34177    produit_produit_id_seq    SEQUENCE        CREATE SEQUENCE public.produit_produit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.produit_produit_id_seq;
       public       postgres    false    199    3            L           0    0    produit_produit_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.produit_produit_id_seq OWNED BY public.produit.produit_id;
            public       postgres    false    198            �            1259    34198    utilisateur    TABLE     �   CREATE TABLE public.utilisateur (
    utilisateur_id integer NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100) NOT NULL,
    numero integer NOT NULL
);
    DROP TABLE public.utilisateur;
       public         postgres    false    3            �            1259    34196    utilisateur_utilisateur_id_seq    SEQUENCE     �   CREATE SEQUENCE public.utilisateur_utilisateur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.utilisateur_utilisateur_id_seq;
       public       postgres    false    203    3            M           0    0    utilisateur_utilisateur_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.utilisateur_utilisateur_id_seq OWNED BY public.utilisateur.utilisateur_id;
            public       postgres    false    202            �
           2604    34219    adresse adresse_id    DEFAULT     x   ALTER TABLE ONLY public.adresse ALTER COLUMN adresse_id SET DEFAULT nextval('public.adresse_adresse_id_seq'::regclass);
 A   ALTER TABLE public.adresse ALTER COLUMN adresse_id DROP DEFAULT;
       public       postgres    false    206    207    207            �
           2604    34193    composition composition_id    DEFAULT     �   ALTER TABLE ONLY public.composition ALTER COLUMN composition_id SET DEFAULT nextval('public.composition_composition_id_seq'::regclass);
 I   ALTER TABLE public.composition ALTER COLUMN composition_id DROP DEFAULT;
       public       postgres    false    201    200    201            �
           2604    34182    produit produit_id    DEFAULT     x   ALTER TABLE ONLY public.produit ALTER COLUMN produit_id SET DEFAULT nextval('public.produit_produit_id_seq'::regclass);
 A   ALTER TABLE public.produit ALTER COLUMN produit_id DROP DEFAULT;
       public       postgres    false    198    199    199            �
           2604    34201    utilisateur utilisateur_id    DEFAULT     �   ALTER TABLE ONLY public.utilisateur ALTER COLUMN utilisateur_id SET DEFAULT nextval('public.utilisateur_utilisateur_id_seq'::regclass);
 I   ALTER TABLE public.utilisateur ALTER COLUMN utilisateur_id DROP DEFAULT;
       public       postgres    false    203    202    203            ?          0    34216    adresse 
   TABLE DATA               Z   COPY public.adresse (adresse_id, voie, code_postal, localite, utilisateur_id) FROM stdin;
    public       postgres    false    207   H       =          0    34209    client 
   TABLE DATA               J   COPY public.client (utilisateur_id, nom_compte, mot_de_passe) FROM stdin;
    public       postgres    false    205   >H       A          0    34227    commande 
   TABLE DATA               K   COPY public.commande (numero_commande, date, suivi, panier_id) FROM stdin;
    public       postgres    false    209   qH       9          0    34190    composition 
   TABLE DATA               Z   COPY public.composition (composition_id, nom, produit_id, quantite, grandeur) FROM stdin;
    public       postgres    false    201   �H       5          0    34172    elementstocks 
   TABLE DATA               @   COPY public.elementstocks (nom, quantite, grandeur) FROM stdin;
    public       postgres    false    197   I       4          0    34167 
   ingredient 
   TABLE DATA               )   COPY public.ingredient (nom) FROM stdin;
    public       postgres    false    196   I       @          0    34222    panier 
   TABLE DATA               G   COPY public.panier (panier_id, utilisateur_id, produit_id) FROM stdin;
    public       postgres    false    208   �I       <          0    34204 	   personnel 
   TABLE DATA               S   COPY public.personnel (utilisateur_id, nom_compte, mot_de_passe, role) FROM stdin;
    public       postgres    false    204   �I       7          0    34179    produit 
   TABLE DATA               r   COPY public.produit (produit_id, nom, descriptif, prixunitaireht, tauxtva100, valeursnutritionnelles) FROM stdin;
    public       postgres    false    199   ;J       ;          0    34198    utilisateur 
   TABLE DATA               J   COPY public.utilisateur (utilisateur_id, nom, prenom, numero) FROM stdin;
    public       postgres    false    203   �J       N           0    0    adresse_adresse_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.adresse_adresse_id_seq', 1, true);
            public       postgres    false    206            O           0    0    composition_composition_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.composition_composition_id_seq', 1, false);
            public       postgres    false    200            P           0    0    produit_produit_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.produit_produit_id_seq', 1, false);
            public       postgres    false    198            Q           0    0    utilisateur_utilisateur_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.utilisateur_utilisateur_id_seq', 1, false);
            public       postgres    false    202            �
           2606    34221    adresse adresse_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT adresse_pk PRIMARY KEY (adresse_id);
 <   ALTER TABLE ONLY public.adresse DROP CONSTRAINT adresse_pk;
       public         postgres    false    207            �
           2606    34213    client client_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pk PRIMARY KEY (utilisateur_id);
 :   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pk;
       public         postgres    false    205            �
           2606    34234    commande commande_pk 
   CONSTRAINT     _   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pk PRIMARY KEY (numero_commande);
 >   ALTER TABLE ONLY public.commande DROP CONSTRAINT commande_pk;
       public         postgres    false    209            �
           2606    34195    composition composition_pk 
   CONSTRAINT     u   ALTER TABLE ONLY public.composition
    ADD CONSTRAINT composition_pk PRIMARY KEY (composition_id, nom, produit_id);
 D   ALTER TABLE ONLY public.composition DROP CONSTRAINT composition_pk;
       public         postgres    false    201    201    201            �
           2606    34176    elementstocks elementstocks_pk 
   CONSTRAINT     ]   ALTER TABLE ONLY public.elementstocks
    ADD CONSTRAINT elementstocks_pk PRIMARY KEY (nom);
 H   ALTER TABLE ONLY public.elementstocks DROP CONSTRAINT elementstocks_pk;
       public         postgres    false    197            �
           2606    34171    ingredient ingredient_pk 
   CONSTRAINT     W   ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pk PRIMARY KEY (nom);
 B   ALTER TABLE ONLY public.ingredient DROP CONSTRAINT ingredient_pk;
       public         postgres    false    196            �
           2606    34226    panier panier_pk 
   CONSTRAINT     U   ALTER TABLE ONLY public.panier
    ADD CONSTRAINT panier_pk PRIMARY KEY (panier_id);
 :   ALTER TABLE ONLY public.panier DROP CONSTRAINT panier_pk;
       public         postgres    false    208            �
           2606    34208    personnel personnel_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.personnel
    ADD CONSTRAINT personnel_pk PRIMARY KEY (utilisateur_id);
 @   ALTER TABLE ONLY public.personnel DROP CONSTRAINT personnel_pk;
       public         postgres    false    204            �
           2606    34187    produit produit_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.produit
    ADD CONSTRAINT produit_pk PRIMARY KEY (produit_id);
 <   ALTER TABLE ONLY public.produit DROP CONSTRAINT produit_pk;
       public         postgres    false    199            �
           2606    34203    utilisateur utilisateur_pk 
   CONSTRAINT     d   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pk PRIMARY KEY (utilisateur_id);
 D   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_pk;
       public         postgres    false    203            �
           2606    34270    adresse client_adresse_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT client_adresse_fk FOREIGN KEY (utilisateur_id) REFERENCES public.client(utilisateur_id);
 C   ALTER TABLE ONLY public.adresse DROP CONSTRAINT client_adresse_fk;
       public       postgres    false    2731    205    207            �
           2606    34265    panier client_panier_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.panier
    ADD CONSTRAINT client_panier_fk FOREIGN KEY (utilisateur_id) REFERENCES public.client(utilisateur_id);
 A   ALTER TABLE ONLY public.panier DROP CONSTRAINT client_panier_fk;
       public       postgres    false    2731    205    208            �
           2606    34240 %   composition ingr_dient_composition_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.composition
    ADD CONSTRAINT ingr_dient_composition_fk FOREIGN KEY (nom) REFERENCES public.ingredient(nom);
 O   ALTER TABLE ONLY public.composition DROP CONSTRAINT ingr_dient_composition_fk;
       public       postgres    false    196    201    2719            �
           2606    34235 )   elementstocks ingr_dient_elementstocks_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.elementstocks
    ADD CONSTRAINT ingr_dient_elementstocks_fk FOREIGN KEY (nom) REFERENCES public.ingredient(nom);
 S   ALTER TABLE ONLY public.elementstocks DROP CONSTRAINT ingr_dient_elementstocks_fk;
       public       postgres    false    2719    196    197            �
           2606    34275    commande panier_commande_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT panier_commande_fk FOREIGN KEY (panier_id) REFERENCES public.panier(panier_id);
 E   ALTER TABLE ONLY public.commande DROP CONSTRAINT panier_commande_fk;
       public       postgres    false    209    208    2735            �
           2606    34245 "   composition produit_composition_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.composition
    ADD CONSTRAINT produit_composition_fk FOREIGN KEY (produit_id) REFERENCES public.produit(produit_id);
 L   ALTER TABLE ONLY public.composition DROP CONSTRAINT produit_composition_fk;
       public       postgres    false    2723    199    201            �
           2606    34250    panier produit_panier_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.panier
    ADD CONSTRAINT produit_panier_fk FOREIGN KEY (produit_id) REFERENCES public.produit(produit_id);
 B   ALTER TABLE ONLY public.panier DROP CONSTRAINT produit_panier_fk;
       public       postgres    false    199    208    2723            �
           2606    34255    client utilisateur_client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.client
    ADD CONSTRAINT utilisateur_client_fk FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(utilisateur_id);
 F   ALTER TABLE ONLY public.client DROP CONSTRAINT utilisateur_client_fk;
       public       postgres    false    203    205    2727            �
           2606    34260 "   personnel utilisateur_personnel_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.personnel
    ADD CONSTRAINT utilisateur_personnel_fk FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(utilisateur_id);
 L   ALTER TABLE ONLY public.personnel DROP CONSTRAINT utilisateur_personnel_fk;
       public       postgres    false    204    2727    203            ?   ,   x�3�t,K�+MUp,J-�46600�t�/JIM,��4����� ��	x      =   #   x�3�LKL�L�K)52�,.-H-�M)������ y�
      A   2   x�3�420��50�54�t���M�KIUH�+JM�,.):�2�Ӑ+F��� �	      9   \   x�3�t�H�-�L���+�4�4�L�2��J�M��SH�I�K�
s��WU%���$B�L8/*I��L9�K�SJ�s�f�!`.��=... h��      5   P   x�s�H�-�L���+�42��N��J�M��SH�I�K�
��WU%���$B/*I���K�SJ�s�B!`��=... ���      4   G   x�s�H�-�L���+��J�M��SH�I�K��ͯ�J,J��I�
8��$�+8�49U�$?7�	S�\1z\\\ i�      @      x�3�4�4����� �X      <   2   x�3��(MO/�L-�LJM,��/II-H,.N�,Ȭ�J���������� I��      7   s   x�3�Ȭ�JT�K,���,I��K��IT( � 9��
��9��E�
)�
y�%@FrbQI��"�%�����%
�45HW((�/9�h\������S�������Z��������� VJ'9      ;   @   x�3���/N-��tKL�L��43�02�437�2�t��MJ��(M/M-�4�05324������� �A     