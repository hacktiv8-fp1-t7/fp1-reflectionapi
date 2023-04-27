PGDMP     3                    {            reflection_db    15.2    15.2     
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    49187    reflection_db    DATABASE     �   CREATE DATABASE reflection_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE reflection_db;
                postgres    false            H           1247    49189 
   is_success    TYPE     G   CREATE TYPE public.is_success AS ENUM (
    'success',
    'failed'
);
    DROP TYPE public.is_success;
       public          postgres    false            �            1259    49194 
   reflection    TABLE     �   CREATE TABLE public.reflection (
    id integer NOT NULL,
    success public.is_success,
    low_point integer,
    take_away character varying(20),
    userid integer,
    createdat date,
    updatedat date
);
    DROP TABLE public.reflection;
       public         heap    postgres    false    840            �            1259    49193    reflection_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reflection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.reflection_id_seq;
       public          postgres    false    215                       0    0    reflection_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.reflection_id_seq OWNED BY public.reflection.id;
          public          postgres    false    214            �            1259    49201    users    TABLE     }   CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(30),
    password character varying(100)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    49200    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    217                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    216            m           2604    49197    reflection id    DEFAULT     n   ALTER TABLE ONLY public.reflection ALTER COLUMN id SET DEFAULT nextval('public.reflection_id_seq'::regclass);
 <   ALTER TABLE public.reflection ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            n           2604    49204    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217                      0    49194 
   reflection 
   TABLE DATA           e   COPY public.reflection (id, success, low_point, take_away, userid, createdat, updatedat) FROM stdin;
    public          postgres    false    215   �                 0    49201    users 
   TABLE DATA           4   COPY public.users (id, email, password) FROM stdin;
    public          postgres    false    217   �                  0    0    reflection_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.reflection_id_seq', 1, false);
          public          postgres    false    214                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 4, true);
          public          postgres    false    216            r           2606    49208    users email_unique 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT email_unique UNIQUE (email);
 <   ALTER TABLE ONLY public.users DROP CONSTRAINT email_unique;
       public            postgres    false    217            p           2606    49199    reflection reflection_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.reflection
    ADD CONSTRAINT reflection_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.reflection DROP CONSTRAINT reflection_pkey;
       public            postgres    false    215            t           2606    49206    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            u           2606    49209    reflection users_fk    FK CONSTRAINT     q   ALTER TABLE ONLY public.reflection
    ADD CONSTRAINT users_fk FOREIGN KEY (userid) REFERENCES public.users(id);
 =   ALTER TABLE ONLY public.reflection DROP CONSTRAINT users_fk;
       public          postgres    false    215    217    3188                  x������ � �         �   x�e̻v�0  ��|3H &nm����B5>(�Bb���)���9�o_�яu9�`��S�a��Bu��u=��ߒG��&�=II�5l���f��j��8f��&fK�z�N���&,���z���3���Z�?���$�
J`�|�"�-p�TSǭ��P*�{�A�Ѧ���Q{N��w�N�Uʀ=n��V���'fIr>�귂qT��z8����n��qY턞���K �<CcR     