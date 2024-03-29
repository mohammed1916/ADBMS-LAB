PGDMP     
                    {            coe    15.3    15.3 '    *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            +           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ,           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            -           1262    16455    coe    DATABASE     ~   CREATE DATABASE coe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE coe;
                postgres    false            �            1259    16464    branch    TABLE     v   CREATE TABLE public.branch (
    bcode integer NOT NULL,
    bname character varying(15) NOT NULL,
    dno integer
);
    DROP TABLE public.branch;
       public         heap    postgres    false            �            1259    16463    branch_bcode_seq    SEQUENCE     �   CREATE SEQUENCE public.branch_bcode_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.branch_bcode_seq;
       public          postgres    false    217            .           0    0    branch_bcode_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.branch_bcode_seq OWNED BY public.branch.bcode;
          public          postgres    false    216            �            1259    16484    branch_course    TABLE     �   CREATE TABLE public.branch_course (
    bcode integer NOT NULL,
    ccode integer NOT NULL,
    semester character varying(15)
);
 !   DROP TABLE public.branch_course;
       public         heap    postgres    false            �            1259    16478    course    TABLE     �   CREATE TABLE public.course (
    ccode integer NOT NULL,
    cname character varying(15) NOT NULL,
    credits integer,
    dno integer
);
    DROP TABLE public.course;
       public         heap    postgres    false            �            1259    16477    course_ccode_seq    SEQUENCE     �   CREATE SEQUENCE public.course_ccode_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.course_ccode_seq;
       public          postgres    false    221            /           0    0    course_ccode_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.course_ccode_seq OWNED BY public.course.ccode;
          public          postgres    false    220            �            1259    16471 
   department    TABLE     g   CREATE TABLE public.department (
    dno integer NOT NULL,
    dname character varying(15) NOT NULL
);
    DROP TABLE public.department;
       public         heap    postgres    false            �            1259    16470    department_dno_seq    SEQUENCE     �   CREATE SEQUENCE public.department_dno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.department_dno_seq;
       public          postgres    false    219            0           0    0    department_dno_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.department_dno_seq OWNED BY public.department.dno;
          public          postgres    false    218            �            1259    16492    enrolls    TABLE     �  CREATE TABLE public.enrolls (
    rollno integer NOT NULL,
    ccode integer NOT NULL,
    sess character varying(15) NOT NULL,
    grade character varying(2),
    CONSTRAINT cs1 CHECK ((((sess)::text = 'april 2013'::text) OR ((sess)::text = 'nov 2013'::text))),
    CONSTRAINT cs2 CHECK ((((grade)::text = 'B'::text) OR ((grade)::text = 'A'::text) OR ((grade)::text = 'B'::text) OR ((grade)::text = 'C'::text) OR ((grade)::text = 'D'::text) OR ((grade)::text = 'E'::text) OR ((grade)::text = 'U'::text)))
);
    DROP TABLE public.enrolls;
       public         heap    postgres    false            �            1259    16457    student    TABLE     �   CREATE TABLE public.student (
    rollno integer NOT NULL,
    name character varying(64) NOT NULL,
    dob date,
    gender character(6),
    doa date,
    bcode integer NOT NULL
);
    DROP TABLE public.student;
       public         heap    postgres    false            �            1259    16456    student_rollno_seq    SEQUENCE     �   CREATE SEQUENCE public.student_rollno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.student_rollno_seq;
       public          postgres    false    215            1           0    0    student_rollno_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.student_rollno_seq OWNED BY public.student.rollno;
          public          postgres    false    214            }           2604    16467    branch bcode    DEFAULT     l   ALTER TABLE ONLY public.branch ALTER COLUMN bcode SET DEFAULT nextval('public.branch_bcode_seq'::regclass);
 ;   ALTER TABLE public.branch ALTER COLUMN bcode DROP DEFAULT;
       public          postgres    false    217    216    217                       2604    16481    course ccode    DEFAULT     l   ALTER TABLE ONLY public.course ALTER COLUMN ccode SET DEFAULT nextval('public.course_ccode_seq'::regclass);
 ;   ALTER TABLE public.course ALTER COLUMN ccode DROP DEFAULT;
       public          postgres    false    220    221    221            ~           2604    16474    department dno    DEFAULT     p   ALTER TABLE ONLY public.department ALTER COLUMN dno SET DEFAULT nextval('public.department_dno_seq'::regclass);
 =   ALTER TABLE public.department ALTER COLUMN dno DROP DEFAULT;
       public          postgres    false    219    218    219            |           2604    16460    student rollno    DEFAULT     p   ALTER TABLE ONLY public.student ALTER COLUMN rollno SET DEFAULT nextval('public.student_rollno_seq'::regclass);
 =   ALTER TABLE public.student ALTER COLUMN rollno DROP DEFAULT;
       public          postgres    false    214    215    215            !          0    16464    branch 
   TABLE DATA           3   COPY public.branch (bcode, bname, dno) FROM stdin;
    public          postgres    false    217   �)       &          0    16484    branch_course 
   TABLE DATA           ?   COPY public.branch_course (bcode, ccode, semester) FROM stdin;
    public          postgres    false    222   �)       %          0    16478    course 
   TABLE DATA           <   COPY public.course (ccode, cname, credits, dno) FROM stdin;
    public          postgres    false    221   �)       #          0    16471 
   department 
   TABLE DATA           0   COPY public.department (dno, dname) FROM stdin;
    public          postgres    false    219   *       '          0    16492    enrolls 
   TABLE DATA           =   COPY public.enrolls (rollno, ccode, sess, grade) FROM stdin;
    public          postgres    false    223   F*                 0    16457    student 
   TABLE DATA           H   COPY public.student (rollno, name, dob, gender, doa, bcode) FROM stdin;
    public          postgres    false    215   c*       2           0    0    branch_bcode_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.branch_bcode_seq', 1, false);
          public          postgres    false    216            3           0    0    course_ccode_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.course_ccode_seq', 1, false);
          public          postgres    false    220            4           0    0    department_dno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.department_dno_seq', 5, true);
          public          postgres    false    218            5           0    0    student_rollno_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.student_rollno_seq', 1, false);
          public          postgres    false    214            �           2606    16488    branch_course branch_course_pk 
   CONSTRAINT     f   ALTER TABLE ONLY public.branch_course
    ADD CONSTRAINT branch_course_pk PRIMARY KEY (bcode, ccode);
 H   ALTER TABLE ONLY public.branch_course DROP CONSTRAINT branch_course_pk;
       public            postgres    false    222    222            �           2606    16469    branch branch_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pk PRIMARY KEY (bcode);
 :   ALTER TABLE ONLY public.branch DROP CONSTRAINT branch_pk;
       public            postgres    false    217            �           2606    16483    course course_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pk PRIMARY KEY (ccode);
 :   ALTER TABLE ONLY public.course DROP CONSTRAINT course_pk;
       public            postgres    false    221            �           2606    16500    student cs4 
   CONSTRAINT     E   ALTER TABLE ONLY public.student
    ADD CONSTRAINT cs4 UNIQUE (doa);
 5   ALTER TABLE ONLY public.student DROP CONSTRAINT cs4;
       public            postgres    false    215            �           2606    16476    department department_pk 
   CONSTRAINT     W   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pk PRIMARY KEY (dno);
 B   ALTER TABLE ONLY public.department DROP CONSTRAINT department_pk;
       public            postgres    false    219            �           2606    16498    enrolls enrolls_pk 
   CONSTRAINT     a   ALTER TABLE ONLY public.enrolls
    ADD CONSTRAINT enrolls_pk PRIMARY KEY (rollno, ccode, sess);
 <   ALTER TABLE ONLY public.enrolls DROP CONSTRAINT enrolls_pk;
       public            postgres    false    223    223    223            �           2606    16462    student student_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pk PRIMARY KEY (rollno);
 <   ALTER TABLE ONLY public.student DROP CONSTRAINT student_pk;
       public            postgres    false    215            !      x������ � �      &      x������ � �      %      x������ � �      #   3   x�3�L.N�2��,�2��MM�H��LN��2�L�,���2�LMN����� 7h      '      x������ � �            x������ � �     