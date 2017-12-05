PGDMP         "                u            ss_blog    10.1    10.1 /    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16385    ss_blog    DATABASE     y   CREATE DATABASE ss_blog WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE ss_blog;
             shrralis    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12290    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16438    images    TABLE     Z   CREATE TABLE images (
    id integer NOT NULL,
    src character varying(512) NOT NULL
);
    DROP TABLE public.images;
       public         shrralis    false    3            �            1259    16436    images_id_seq    SEQUENCE     ~   CREATE SEQUENCE images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.images_id_seq;
       public       shrralis    false    202    3            �           0    0    images_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE images_id_seq OWNED BY images.id;
            public       shrralis    false    201            �            1259    16396    posts    TABLE     n  CREATE TABLE posts (
    id integer NOT NULL,
    title character varying(64) NOT NULL,
    description character varying(128) NOT NULL,
    text character varying(2048) NOT NULL,
    is_posted boolean NOT NULL,
    creator_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    image_id integer
);
    DROP TABLE public.posts;
       public         shrralis    false    3            �            1259    16394    posts_id_seq    SEQUENCE     }   CREATE SEQUENCE posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.posts_id_seq;
       public       shrralis    false    199    3            �           0    0    posts_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE posts_id_seq OWNED BY posts.id;
            public       shrralis    false    198            �            1259    16405    posts_updaters    TABLE     \   CREATE TABLE posts_updaters (
    post_id integer NOT NULL,
    user_id integer NOT NULL
);
 "   DROP TABLE public.posts_updaters;
       public         shrralis    false    3            �            1259    16388    users    TABLE     �   CREATE TABLE users (
    id integer NOT NULL,
    login character varying(16) NOT NULL,
    password character varying(256) NOT NULL,
    scope character(8) NOT NULL
);
    DROP TABLE public.users;
       public         shrralis    false    3            �            1259    16386    users_id_seq    SEQUENCE     }   CREATE SEQUENCE users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       shrralis    false    197    3            �           0    0    users_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE users_id_seq OWNED BY users.id;
            public       shrralis    false    196                       2604    16441 	   images id    DEFAULT     X   ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);
 8   ALTER TABLE public.images ALTER COLUMN id DROP DEFAULT;
       public       shrralis    false    202    201    202                       2604    16399    posts id    DEFAULT     V   ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);
 7   ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
       public       shrralis    false    198    199    199                       2604    16391    users id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       shrralis    false    196    197    197            �          0    16438    images 
   TABLE DATA               "   COPY images (id, src) FROM stdin;
    public       shrralis    false    202   =/       �          0    16396    posts 
   TABLE DATA               o   COPY posts (id, title, description, text, is_posted, creator_id, created_at, updated_at, image_id) FROM stdin;
    public       shrralis    false    199   �/       �          0    16405    posts_updaters 
   TABLE DATA               3   COPY posts_updaters (post_id, user_id) FROM stdin;
    public       shrralis    false    200   �4       �          0    16388    users 
   TABLE DATA               4   COPY users (id, login, password, scope) FROM stdin;
    public       shrralis    false    197   �4       �           0    0    images_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('images_id_seq', 11, true);
            public       shrralis    false    201            �           0    0    posts_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('posts_id_seq', 25, true);
            public       shrralis    false    198            �           0    0    users_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('users_id_seq', 7, true);
            public       shrralis    false    196                       2606    16446    images images_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
       public         shrralis    false    202                       2606    16404    posts posts_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public         shrralis    false    199                       2606    16409 "   posts_updaters posts_updaters_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY posts_updaters
    ADD CONSTRAINT posts_updaters_pkey PRIMARY KEY (post_id, user_id);
 L   ALTER TABLE ONLY public.posts_updaters DROP CONSTRAINT posts_updaters_pkey;
       public         shrralis    false    200    200                       2606    16393    users users_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         shrralis    false    197                       1259    16418    fki_posts_creator_id    INDEX     E   CREATE INDEX fki_posts_creator_id ON posts USING btree (creator_id);
 (   DROP INDEX public.fki_posts_creator_id;
       public         shrralis    false    199                       1259    16453    fki_posts_image_id    INDEX     A   CREATE INDEX fki_posts_image_id ON posts USING btree (image_id);
 &   DROP INDEX public.fki_posts_image_id;
       public         shrralis    false    199                       1259    16429    fki_posts_updaters_post_id    INDEX     Q   CREATE INDEX fki_posts_updaters_post_id ON posts_updaters USING btree (post_id);
 .   DROP INDEX public.fki_posts_updaters_post_id;
       public         shrralis    false    200                       1259    16435    fki_posts_updaters_user_id    INDEX     Q   CREATE INDEX fki_posts_updaters_user_id ON posts_updaters USING btree (user_id);
 .   DROP INDEX public.fki_posts_updaters_user_id;
       public         shrralis    false    200                       1259    16447    images_id_index    INDEX     @   CREATE UNIQUE INDEX images_id_index ON images USING btree (id);
 #   DROP INDEX public.images_id_index;
       public         shrralis    false    202                       1259    16422    posts_description_index    INDEX     I   CREATE INDEX posts_description_index ON posts USING btree (description);
 +   DROP INDEX public.posts_description_index;
       public         shrralis    false    199                       1259    16420    posts_id_index    INDEX     >   CREATE UNIQUE INDEX posts_id_index ON posts USING btree (id);
 "   DROP INDEX public.posts_id_index;
       public         shrralis    false    199                       1259    16423    posts_text_index    INDEX     ;   CREATE INDEX posts_text_index ON posts USING btree (text);
 $   DROP INDEX public.posts_text_index;
       public         shrralis    false    199                       1259    16421    posts_title_index    INDEX     =   CREATE INDEX posts_title_index ON posts USING btree (title);
 %   DROP INDEX public.posts_title_index;
       public         shrralis    false    199                       1259    16410    users_id_index    INDEX     >   CREATE UNIQUE INDEX users_id_index ON users USING btree (id);
 "   DROP INDEX public.users_id_index;
       public         shrralis    false    197            	           1259    16411    users_login_index    INDEX     D   CREATE UNIQUE INDEX users_login_index ON users USING btree (login);
 %   DROP INDEX public.users_login_index;
       public         shrralis    false    197                       1259    16412    users_scope_index    INDEX     =   CREATE INDEX users_scope_index ON users USING btree (scope);
 %   DROP INDEX public.users_scope_index;
       public         shrralis    false    197                       2606    16413    posts posts_creator_id    FK CONSTRAINT     j   ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_creator_id FOREIGN KEY (creator_id) REFERENCES users(id);
 @   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_creator_id;
       public       shrralis    false    199    197    2059                       2606    16454    posts posts_image_id    FK CONSTRAINT     �   ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_image_id FOREIGN KEY (image_id) REFERENCES images(id) ON UPDATE CASCADE ON DELETE SET NULL;
 >   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_image_id;
       public       shrralis    false    2075    199    202                       2606    16424 %   posts_updaters posts_updaters_post_id    FK CONSTRAINT     v   ALTER TABLE ONLY posts_updaters
    ADD CONSTRAINT posts_updaters_post_id FOREIGN KEY (post_id) REFERENCES posts(id);
 O   ALTER TABLE ONLY public.posts_updaters DROP CONSTRAINT posts_updaters_post_id;
       public       shrralis    false    200    2066    199                       2606    16430 %   posts_updaters posts_updaters_user_id    FK CONSTRAINT     v   ALTER TABLE ONLY posts_updaters
    ADD CONSTRAINT posts_updaters_user_id FOREIGN KEY (user_id) REFERENCES users(id);
 O   ALTER TABLE ONLY public.posts_updaters DROP CONSTRAINT posts_updaters_user_id;
       public       shrralis    false    197    2059    200            �   }   x���[
� ��g�˄�M����*^�(V!�}!������Z�t�f�s��k�]*��x깘���Pz�iB�a}���]���l��	�e ��w��Ts��nwL:�?�D��υs��3U0      �   �  x��VKo7>�~��d��K.�y)��R��BRR��Z���+Q�G��"�A�z���0�������Õ%���z)�h).w�3�ɏ8�@��$vGI1�eɄ�@�Q ��7�A-�m�i1�Hh�!uL�!�M���1�2=�/��}~�C����V��]#6c�c�}��lR�:NHӣ��K��usM渮^��^�k�I>7�|
���Ral��8�b=�r�)��Y�S�3�0�����w����4�|��cY�~c����FI>K������#1̓�&q�6!��� 
$,�m��	$����H�2>��r���E�%�$O�dz "M
��1Nнd�}�q帐(��d����dC�X$ӸH�|������}�d�����ЎI��8�a�E̋�L�~]r���L�eΧ#�,ӔO�����4��( b�mf�Ħ�(��P?���a�h9 �N�����w|?�^��Թz���y��:�� �\�R���?�@.�W��!���
�3	����@~�*�+�B�7��^�0������Ǩct��h!:4�Y�\�w �l��.t��&�������v����1��ۻW��Q��oGw���^�u�����n�	����%����NԞ����i��V��>�Q���-����^�<�.��~>�f�^$.�&���l``�m� sM�
|��ũ䢭p�I��g7ũ��]p������p���R�$�uA���07�X��S�{�S���tM�ڈ*3�,�,-��h*q?dP�FRyW�&AU���k�d�ɱL��8Mln�F8���@��b}Q�[�p(�iSW(����u�� 9h�/��ZPd��^��L���lc�}��m�Ak�+����`n�������$�������Z�7����8r���jw�`�iJ��H��)2ѹ
^�~�b�r�ׇ`��~f�Ǭ��倅W����k1�b�6��Z�̒OQ'��3M6m,O���M�͜��a���e����RX��G"�q�����.n�V���f�_�zZ��ԛ�b�3D2���ԯ�Y�D��'�U�@�����G(��a_�$i��
�i��� .��K\��3'�"���K�KD<8�o@��O5�9����S�>AS��Ӎ9}�o�N�t�SΑ�~P?�'���[���:�z;!�M��ϻU�ó�P��s��g6�?ſ      �      x�3�4�22�4�\1z\\\ �w      �   �   x�M�;jC1��z�*���yh$�v�".L M��F�	΅l?ӟΏ���(Z��y$Q�a%v��p9���n�T[��@�4���ěR�sg5�C9e����|<LB`~���R�*A)���-&��Q����t�M��{�n�)�PC�R�]Ð�XG������+½�O��)xL!R���Z�w�Y�)
�_�kQĈ��Dec�f�5�	{��ĂU��b�;֑��G�>_�e�L-\�     