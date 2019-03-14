--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 11.1

-- Started on 2019-02-28 20:33:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 9 (class 2615 OID 16641)
-- Name: fitness_app; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA fitness_app;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 219 (class 1259 OID 16763)
-- Name: account; Type: TABLE; Schema: fitness_app; Owner: -
--

CREATE TABLE fitness_app.account (
    userid integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    salt text NOT NULL,
    fullname text NOT NULL,
    email text NOT NULL,
    pictureurl text,
    privateprofile boolean NOT NULL,
    typeid integer NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 16761)
-- Name: account_userid_seq; Type: SEQUENCE; Schema: fitness_app; Owner: -
--

CREATE SEQUENCE fitness_app.account_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3910 (class 0 OID 0)
-- Dependencies: 218
-- Name: account_userid_seq; Type: SEQUENCE OWNED BY; Schema: fitness_app; Owner: -
--

ALTER SEQUENCE fitness_app.account_userid_seq OWNED BY fitness_app.account.userid;


--
-- TOC entry 220 (class 1259 OID 16781)
-- Name: accountsubscription; Type: TABLE; Schema: fitness_app; Owner: -
--

CREATE TABLE fitness_app.accountsubscription (
    subscriberid integer NOT NULL,
    subscribeeid integer NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 16737)
-- Name: accounttype; Type: TABLE; Schema: fitness_app; Owner: -
--

CREATE TABLE fitness_app.accounttype (
    typeid integer NOT NULL,
    description text NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 16735)
-- Name: accounttype_typeid_seq; Type: SEQUENCE; Schema: fitness_app; Owner: -
--

CREATE SEQUENCE fitness_app.accounttype_typeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3911 (class 0 OID 0)
-- Dependencies: 214
-- Name: accounttype_typeid_seq; Type: SEQUENCE OWNED BY; Schema: fitness_app; Owner: -
--

ALTER SEQUENCE fitness_app.accounttype_typeid_seq OWNED BY fitness_app.accounttype.typeid;


--
-- TOC entry 217 (class 1259 OID 16750)
-- Name: exercise; Type: TABLE; Schema: fitness_app; Owner: -
--

CREATE TABLE fitness_app.exercise (
    exerciseid integer NOT NULL,
    description text NOT NULL,
    unit text NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 16748)
-- Name: exercise_exerciseid_seq; Type: SEQUENCE; Schema: fitness_app; Owner: -
--

CREATE SEQUENCE fitness_app.exercise_exerciseid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3912 (class 0 OID 0)
-- Dependencies: 216
-- Name: exercise_exerciseid_seq; Type: SEQUENCE OWNED BY; Schema: fitness_app; Owner: -
--

ALTER SEQUENCE fitness_app.exercise_exerciseid_seq OWNED BY fitness_app.exercise.exerciseid;


--
-- TOC entry 222 (class 1259 OID 16798)
-- Name: exerciselog; Type: TABLE; Schema: fitness_app; Owner: -
--

CREATE TABLE fitness_app.exerciselog (
    exerciselogid integer NOT NULL,
    exerciseid integer NOT NULL,
    userid integer NOT NULL,
    units numeric NOT NULL,
    note text,
    occourred date NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 16796)
-- Name: exerciselog_exerciselogid_seq; Type: SEQUENCE; Schema: fitness_app; Owner: -
--

CREATE SEQUENCE fitness_app.exerciselog_exerciselogid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3913 (class 0 OID 0)
-- Dependencies: 221
-- Name: exerciselog_exerciselogid_seq; Type: SEQUENCE OWNED BY; Schema: fitness_app; Owner: -
--

ALTER SEQUENCE fitness_app.exerciselog_exerciselogid_seq OWNED BY fitness_app.exerciselog.exerciselogid;


--
-- TOC entry 223 (class 1259 OID 16817)
-- Name: exercisesubscription; Type: TABLE; Schema: fitness_app; Owner: -
--

CREATE TABLE fitness_app.exercisesubscription (
    exerciseid integer NOT NULL,
    userid integer NOT NULL
);


--
-- TOC entry 3744 (class 2604 OID 16766)
-- Name: account userid; Type: DEFAULT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.account ALTER COLUMN userid SET DEFAULT nextval('fitness_app.account_userid_seq'::regclass);


--
-- TOC entry 3742 (class 2604 OID 16740)
-- Name: accounttype typeid; Type: DEFAULT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.accounttype ALTER COLUMN typeid SET DEFAULT nextval('fitness_app.accounttype_typeid_seq'::regclass);


--
-- TOC entry 3743 (class 2604 OID 16753)
-- Name: exercise exerciseid; Type: DEFAULT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.exercise ALTER COLUMN exerciseid SET DEFAULT nextval('fitness_app.exercise_exerciseid_seq'::regclass);


--
-- TOC entry 3745 (class 2604 OID 16801)
-- Name: exerciselog exerciselogid; Type: DEFAULT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.exerciselog ALTER COLUMN exerciselogid SET DEFAULT nextval('fitness_app.exerciselog_exerciselogid_seq'::regclass);


--
-- TOC entry 3900 (class 0 OID 16763)
-- Dependencies: 219
-- Data for Name: account; Type: TABLE DATA; Schema: fitness_app; Owner: -
--

INSERT INTO fitness_app.account VALUES (8, 'mwell', '5303e8553023a6e05d2a0ebe345a1302', 'd87957cb8f7129c8ecece5734d1994c7', 'Matthew Wells', 'mwells@mail.co.uk', NULL, false, 2);
INSERT INTO fitness_app.account VALUES (13, 'test2', 'e88ca388ce6bc0e9f0b35b86f17b4711', 'ad0234829205b9033196ba818f7a872b', 'Brad Test', 'test.2@fitnessapp.com', NULL, true, 2);
INSERT INTO fitness_app.account VALUES (14, 'test3', 'd413ea7a31dd53e2a18f7856984ffefc', '8ad8757baa8564dc136c1e07507f4a98', 'Charlene Test', 'test.3@fitnessapp.com', NULL, true, 2);
INSERT INTO fitness_app.account VALUES (15, 'test4', '0c6b920b3bc2a94201ff92aac9e9a326', '86985e105f79b95d6bc918fb45ec7727', 'Debra Test', 'test.4@fitnessapp.com', NULL, true, 2);
INSERT INTO fitness_app.account VALUES (16, 'test5', 'bbffbafe8d1293f88cfccbd632bcb818', 'e3d704f3542b44a621ebed70dc0efe13', 'Ed Test', 'test.5@fitnessapp.com', NULL, true, 2);
INSERT INTO fitness_app.account VALUES (5, 'thor', '9f45e5600bae8048dd69961f678fb6b2', '575e22bc356137a41abdef379b776dba', 'Chris Hemsworth', 'chemsworth@marvel.com', 'https://lolosofocused.files.wordpress.com/2013/01/chris-hemsworth-shirtless-down-under.jpg', false, 2);
INSERT INTO fitness_app.account VALUES (6, 'wolverine', '75bc621a7a4a706f13f6989d3decb326', '3681df8d04470ecc65053b790e19a065', 'Hugh Jackman', 'hjackman@marvel.com', 'http://heightandweights.com/wp-content/uploads/2014/12/Hugh-Jackman-Hugh-Jackman-Beach-J_XYiYC0yHYx.jpg', false, 2);
INSERT INTO fitness_app.account VALUES (7, 'kimk', '98d7796b77a6283fed08d3ae433cbbf7', '098afd6b19e00dee1fe0a468d3b7a74b', 'Kim kardashian', 'kim@thekardashians.com', 'http://assets.nydailynews.com/polopoly_fs/1.2010817.1415971926!/img/httpImage/image.jpg_gen/derivatives/article_750/kim15f-1-web.jpg', false, 2);
INSERT INTO fitness_app.account VALUES (9, 'hulk', 'dc6fe0836bc6f6259e8c55f134758907', '76254239879f7ed7d73979f1f7543a7e', 'Hulk Hogan', 'hulk@wwe.com', 'http://www.freakingnews.com/pictures/43000/Green-Hulk-Hogan--43400.jpg', false, 2);
INSERT INTO fitness_app.account VALUES (10, 'storm', 'cd8395ddfe1be1f0f76be3ac5d7cd7e8', '849c829d658baaeff512d766b0db3cce', 'Halle Berry', 'hberry@marvel.com', 'https://www.bellanaija.com/wp-content/uploads/2015/08/GettyImages-483931562_master.jpg', false, 2);
INSERT INTO fitness_app.account VALUES (11, 'blackwidow', '0f7e4aaa6d893ed2ba089c71734d256c', 'da541fe52945785469d97fb4cfad9b92', 'Scarlett Johansson', 'sjohansson@marvel.com', 'http://wisetoast.com/wp-content/uploads/2015/10/Scarlett-Johansson-Net-Worth-1.jpg', false, 2);
INSERT INTO fitness_app.account VALUES (80, 'bsnow32', 'Ben Snow', '961', 'password', 'bsnow32@gmail.com', '', false, 2);
INSERT INTO fitness_app.account VALUES (81, 'gumby', 'bb40e30ebde253344e7bff12bd328b4b', 'da950212ff5fc5d8b8919098a02519fa', 'Gumby', 'gumby@eldritchhorror.net', '', false, 2);
INSERT INTO fitness_app.account VALUES (74, 'test6', '37fb7e5d2ebfd265d8f8645eb34cfab8', '359ab46e46db08d6746bc538c87ea0a7', 'test6', 't6', '', false, 2);
INSERT INTO fitness_app.account VALUES (2, 'saitama', '07ae411c30e81772f4ae585e5f429e5e', '3bccba45b8189496b768338ccce44e37', 'Saitama', 'admin@punchman.jp', 'https://static.comicvine.com/uploads/original/11125/111257530/5188676-saitama_by_ry_spirit-d9n2269.jpg', false, 2);
INSERT INTO fitness_app.account VALUES (3, 'rock', 'cb74a1233cf743222bee7cecff3bc13d', '9a1f30943126974075dbd4d13c8018ac', 'Dwayne Johnson', 'Rock@wwe.com', 'http://static2.comicvine.com/uploads/original/11129/111293443/5676516-the+rock+3.jpg', false, 2);
INSERT INTO fitness_app.account VALUES (4, 'starlord', 'e2786cf9464e2fbfb832cbd88a105886', '208ab3ac7222c0b11f04b8a9193c6713', 'Chris Pratt', 'cpratt@marvel.com', 'https://i.dailymail.co.uk/i/pix/2014/02/18/article-2562399-1B9C21DF00000578-317_634x488.jpg', false, 2);
INSERT INTO fitness_app.account VALUES (17, 'cool_beans_jim', '2fa73e349589763300f7cef9f7211162', '995f9f3d4e4969f40a38214774bdde26', 'Cool Beans Jim', 'coolbeans@hotmail.com', 'string', true, 1);
INSERT INTO fitness_app.account VALUES (28, 'joe_cool', 'f1970a221f2fddd606a6d24670618ef7', '79d8aff7da03c7e821601012b416a90d', 'Snoopy', 'admin@joecool.jp', 'http://www.thetoyshoppe.com/images/productslarge/52152b.jpg', false, 2);
INSERT INTO fitness_app.account VALUES (75, 'pOrlando', '77dd9a050594aac8d585484b52623f08', '29d7c7bdcee332042b6da4d6a4be8185', 'Peter Orlando', 'p@e.o', '', false, 2);
INSERT INTO fitness_app.account VALUES (1, 'admin', 'dcc3458e93367f0da48d0d74f91883a0', '21232f297a57a5a743894a0e4a801fc3', 'John Smith', 'JSmith@fitnessapp.com', 'https://i.imgur.com/r1kzivy.jpg', true, 1);


--
-- TOC entry 3901 (class 0 OID 16781)
-- Dependencies: 220
-- Data for Name: accountsubscription; Type: TABLE DATA; Schema: fitness_app; Owner: -
--

INSERT INTO fitness_app.accountsubscription VALUES (1, 2);
INSERT INTO fitness_app.accountsubscription VALUES (1, 3);
INSERT INTO fitness_app.accountsubscription VALUES (3, 2);
INSERT INTO fitness_app.accountsubscription VALUES (4, 2);
INSERT INTO fitness_app.accountsubscription VALUES (5, 2);
INSERT INTO fitness_app.accountsubscription VALUES (6, 2);
INSERT INTO fitness_app.accountsubscription VALUES (8, 2);
INSERT INTO fitness_app.accountsubscription VALUES (9, 2);
INSERT INTO fitness_app.accountsubscription VALUES (9, 3);
INSERT INTO fitness_app.accountsubscription VALUES (10, 2);
INSERT INTO fitness_app.accountsubscription VALUES (11, 2);
INSERT INTO fitness_app.accountsubscription VALUES (13, 2);
INSERT INTO fitness_app.accountsubscription VALUES (14, 2);
INSERT INTO fitness_app.accountsubscription VALUES (15, 2);
INSERT INTO fitness_app.accountsubscription VALUES (16, 2);
INSERT INTO fitness_app.accountsubscription VALUES (11, 3);
INSERT INTO fitness_app.accountsubscription VALUES (13, 3);
INSERT INTO fitness_app.accountsubscription VALUES (14, 3);
INSERT INTO fitness_app.accountsubscription VALUES (15, 3);
INSERT INTO fitness_app.accountsubscription VALUES (11, 4);
INSERT INTO fitness_app.accountsubscription VALUES (13, 4);
INSERT INTO fitness_app.accountsubscription VALUES (14, 4);
INSERT INTO fitness_app.accountsubscription VALUES (11, 5);
INSERT INTO fitness_app.accountsubscription VALUES (13, 5);
INSERT INTO fitness_app.accountsubscription VALUES (11, 6);
INSERT INTO fitness_app.accountsubscription VALUES (11, 7);
INSERT INTO fitness_app.accountsubscription VALUES (1, 5);


--
-- TOC entry 3896 (class 0 OID 16737)
-- Dependencies: 215
-- Data for Name: accounttype; Type: TABLE DATA; Schema: fitness_app; Owner: -
--

INSERT INTO fitness_app.accounttype VALUES (1, 'Admin');
INSERT INTO fitness_app.accounttype VALUES (2, 'User');


--
-- TOC entry 3898 (class 0 OID 16750)
-- Dependencies: 217
-- Data for Name: exercise; Type: TABLE DATA; Schema: fitness_app; Owner: -
--

INSERT INTO fitness_app.exercise VALUES (1, 'running', 'Km');
INSERT INTO fitness_app.exercise VALUES (2, 'biking', 'Km');
INSERT INTO fitness_app.exercise VALUES (3, 'swimming', 'Km');
INSERT INTO fitness_app.exercise VALUES (4, 'curls', 'RepLbs');
INSERT INTO fitness_app.exercise VALUES (6, 'deadlift', 'RepLbs');
INSERT INTO fitness_app.exercise VALUES (8, 'squats', 'Reps');
INSERT INTO fitness_app.exercise VALUES (5, 'benchpress', 'RepLbs');
INSERT INTO fitness_app.exercise VALUES (7, 'pushups', 'Reps');
INSERT INTO fitness_app.exercise VALUES (9, 'situps', 'Reps');
INSERT INTO fitness_app.exercise VALUES (10, 'pullups', 'Reps');


--
-- TOC entry 3903 (class 0 OID 16798)
-- Dependencies: 222
-- Data for Name: exerciselog; Type: TABLE DATA; Schema: fitness_app; Owner: -
--

INSERT INTO fitness_app.exerciselog VALUES (1, 1, 1, 2.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (2, 7, 2, 100, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (3, 9, 2, 100, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (4, 8, 2, 100, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (5, 1, 2, 10, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (6, 7, 2, 100, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (7, 9, 2, 100, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (8, 8, 2, 100, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (9, 1, 2, 10, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (10, 7, 2, 100, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (11, 9, 2, 100, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (12, 8, 2, 100, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (13, 1, 2, 10, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (14, 7, 2, 100, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (15, 9, 2, 100, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (16, 8, 2, 100, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (17, 1, 2, 10, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (18, 7, 2, 100, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (19, 9, 2, 100, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (20, 8, 2, 100, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (21, 1, 2, 10, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (22, 7, 2, 100, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (23, 9, 2, 100, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (24, 8, 2, 100, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (25, 1, 2, 10, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (26, 7, 2, 100, NULL, '2019-02-07');
INSERT INTO fitness_app.exerciselog VALUES (27, 9, 2, 100, NULL, '2019-02-07');
INSERT INTO fitness_app.exerciselog VALUES (28, 8, 2, 100, NULL, '2019-02-07');
INSERT INTO fitness_app.exerciselog VALUES (29, 1, 2, 10, NULL, '2019-02-07');
INSERT INTO fitness_app.exerciselog VALUES (30, 7, 2, 100, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (31, 9, 2, 100, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (32, 8, 2, 100, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (33, 1, 2, 10, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (34, 7, 2, 100, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (35, 9, 2, 100, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (36, 8, 2, 100, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (37, 1, 2, 10, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (38, 7, 2, 100, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (39, 9, 2, 100, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (40, 8, 2, 100, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (41, 1, 2, 10, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (42, 7, 2, 100, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (43, 9, 2, 100, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (44, 8, 2, 100, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (45, 1, 2, 10, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (46, 7, 2, 100, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (47, 9, 2, 100, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (48, 8, 2, 100, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (49, 1, 2, 10, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (50, 7, 2, 100, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (51, 9, 2, 100, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (52, 8, 2, 100, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (53, 1, 2, 10, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (54, 7, 2, 100, NULL, '2019-02-14');
INSERT INTO fitness_app.exerciselog VALUES (55, 9, 2, 100, NULL, '2019-02-14');
INSERT INTO fitness_app.exerciselog VALUES (56, 8, 2, 100, NULL, '2019-02-14');
INSERT INTO fitness_app.exerciselog VALUES (57, 1, 2, 10, NULL, '2019-02-14');
INSERT INTO fitness_app.exerciselog VALUES (58, 7, 2, 100, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (59, 9, 2, 100, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (60, 8, 2, 100, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (61, 1, 2, 10, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (62, 7, 2, 100, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (63, 9, 2, 100, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (64, 8, 2, 100, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (65, 1, 2, 10, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (66, 7, 2, 100, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (67, 9, 2, 100, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (68, 8, 2, 100, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (69, 1, 2, 10, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (70, 7, 2, 100, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (71, 9, 2, 100, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (72, 8, 2, 100, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (73, 1, 2, 10, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (74, 7, 2, 100, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (75, 9, 2, 100, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (76, 8, 2, 100, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (77, 1, 2, 10, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (78, 7, 2, 100, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (79, 9, 2, 100, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (80, 8, 2, 100, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (81, 1, 2, 10, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (82, 7, 2, 100, NULL, '2019-02-21');
INSERT INTO fitness_app.exerciselog VALUES (83, 9, 2, 100, NULL, '2019-02-21');
INSERT INTO fitness_app.exerciselog VALUES (84, 8, 2, 100, NULL, '2019-02-21');
INSERT INTO fitness_app.exerciselog VALUES (85, 1, 2, 10, NULL, '2019-02-21');
INSERT INTO fitness_app.exerciselog VALUES (86, 7, 2, 100, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (87, 9, 2, 100, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (88, 8, 2, 100, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (89, 1, 2, 10, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (90, 7, 2, 100, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (91, 9, 2, 100, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (92, 8, 2, 100, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (93, 1, 2, 10, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (94, 7, 2, 100, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (95, 9, 2, 100, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (96, 8, 2, 100, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (97, 1, 2, 10, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (98, 7, 2, 100, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (99, 9, 2, 100, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (100, 8, 2, 100, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (101, 1, 2, 10, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (102, 7, 2, 100, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (103, 9, 2, 100, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (104, 8, 2, 100, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (105, 1, 2, 10, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (106, 7, 2, 100, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (107, 9, 2, 100, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (108, 8, 2, 100, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (109, 1, 2, 10, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (110, 7, 2, 100, NULL, '2019-02-28');
INSERT INTO fitness_app.exerciselog VALUES (111, 9, 2, 100, NULL, '2019-02-28');
INSERT INTO fitness_app.exerciselog VALUES (112, 8, 2, 100, NULL, '2019-02-28');
INSERT INTO fitness_app.exerciselog VALUES (113, 1, 2, 10, NULL, '2019-02-28');
INSERT INTO fitness_app.exerciselog VALUES (114, 1, 3, 5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (115, 5, 3, 1000, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (116, 8, 3, 36, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (117, 6, 3, 2400, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (118, 4, 3, 60, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (119, 1, 3, 8, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (120, 5, 3, 1500, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (121, 8, 3, 24, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (122, 6, 3, 1800, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (123, 4, 3, 240, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (124, 1, 3, 3, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (125, 5, 3, 3000, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (126, 8, 3, 48, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (127, 6, 3, 3500, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (128, 4, 3, 15, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (129, 1, 3, 8, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (130, 5, 3, 1500, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (131, 8, 3, 80, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (132, 6, 3, 900, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (133, 4, 3, 300, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (134, 1, 3, 5, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (135, 5, 3, 1000, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (136, 8, 3, 36, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (137, 6, 3, 2400, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (138, 4, 3, 60, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (139, 1, 3, 20, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (140, 5, 3, 4000, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (141, 8, 3, 12, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (142, 6, 3, 4000, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (143, 4, 3, 90, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (144, 1, 3, 5, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (145, 5, 3, 1000, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (146, 8, 3, 36, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (147, 6, 3, 2400, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (148, 4, 3, 60, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (149, 1, 3, 8, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (150, 5, 3, 1500, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (151, 8, 3, 24, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (152, 6, 3, 1800, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (153, 4, 3, 240, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (154, 1, 3, 3, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (155, 5, 3, 3000, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (156, 8, 3, 48, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (157, 6, 3, 3500, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (158, 4, 3, 15, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (159, 1, 3, 8, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (160, 5, 3, 1500, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (161, 8, 3, 80, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (162, 6, 3, 900, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (163, 4, 3, 300, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (164, 1, 3, 5, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (165, 5, 3, 1000, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (166, 8, 3, 36, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (167, 6, 3, 2400, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (168, 4, 3, 60, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (169, 1, 3, 20, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (170, 5, 3, 4000, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (171, 8, 3, 12, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (172, 6, 3, 4000, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (173, 4, 3, 90, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (174, 1, 3, 5, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (175, 5, 3, 1000, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (176, 8, 3, 36, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (177, 6, 3, 2400, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (178, 4, 3, 60, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (179, 1, 3, 8, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (180, 5, 3, 1500, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (181, 8, 3, 24, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (182, 6, 3, 1800, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (183, 4, 3, 240, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (184, 1, 3, 3, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (185, 5, 3, 3000, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (186, 8, 3, 48, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (187, 6, 3, 3500, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (188, 4, 3, 15, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (189, 1, 3, 8, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (190, 5, 3, 1500, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (191, 8, 3, 80, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (192, 6, 3, 900, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (193, 4, 3, 300, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (194, 1, 3, 5, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (195, 5, 3, 1000, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (196, 8, 3, 36, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (197, 6, 3, 2400, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (198, 4, 3, 60, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (199, 1, 3, 20, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (200, 5, 3, 4000, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (201, 8, 3, 12, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (202, 6, 3, 4000, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (203, 4, 3, 90, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (204, 1, 3, 5, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (205, 5, 3, 1000, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (206, 8, 3, 36, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (207, 6, 3, 2400, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (208, 4, 3, 60, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (209, 1, 3, 8, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (210, 5, 3, 1500, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (211, 8, 3, 24, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (212, 6, 3, 1800, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (213, 4, 3, 240, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (214, 1, 3, 3, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (215, 5, 3, 3000, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (216, 8, 3, 48, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (217, 6, 3, 3500, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (218, 4, 3, 15, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (219, 1, 3, 8, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (220, 5, 3, 1500, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (221, 8, 3, 80, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (222, 6, 3, 900, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (223, 4, 3, 300, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (224, 1, 3, 5, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (225, 5, 3, 1000, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (226, 8, 3, 36, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (227, 6, 3, 2400, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (228, 4, 3, 60, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (229, 1, 3, 20, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (230, 5, 3, 4000, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (231, 8, 3, 12, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (232, 6, 3, 4000, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (233, 4, 3, 90, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (234, 1, 4, 1.8, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (235, 1, 4, 1.9, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (236, 1, 4, 1.0, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (237, 1, 4, 1.1, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (238, 1, 4, 1.2, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (239, 1, 4, 1.3, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (240, 1, 4, 1.4, NULL, '2019-02-07');
INSERT INTO fitness_app.exerciselog VALUES (241, 1, 4, 1.5, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (242, 1, 4, 1.6, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (243, 1, 4, 1.7, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (244, 1, 4, 1.8, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (245, 1, 4, 1.9, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (246, 1, 4, 2.0, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (247, 1, 4, 2.1, NULL, '2019-02-14');
INSERT INTO fitness_app.exerciselog VALUES (248, 1, 4, 2.2, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (249, 1, 4, 2.3, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (250, 1, 4, 2.4, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (251, 1, 4, 2.5, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (252, 1, 4, 2.6, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (253, 1, 4, 2.7, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (254, 1, 4, 2.8, NULL, '2019-02-21');
INSERT INTO fitness_app.exerciselog VALUES (255, 1, 4, 2.9, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (256, 1, 4, 3.0, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (257, 1, 4, 3.1, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (258, 1, 4, 3.2, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (259, 1, 4, 3.3, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (260, 1, 4, 3.4, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (261, 1, 4, 3.5, NULL, '2019-02-28');
INSERT INTO fitness_app.exerciselog VALUES (262, 1, 5, 10, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (263, 1, 5, 10, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (264, 1, 5, 10, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (265, 1, 5, 10, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (266, 1, 5, 10, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (267, 1, 5, 10, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (268, 1, 5, 10, NULL, '2019-02-07');
INSERT INTO fitness_app.exerciselog VALUES (269, 1, 5, 10, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (270, 1, 5, 10, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (271, 1, 5, 10, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (272, 1, 5, 10, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (273, 1, 5, 10, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (274, 1, 5, 10, NULL, '2019-02-14');
INSERT INTO fitness_app.exerciselog VALUES (275, 1, 5, 10, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (276, 1, 5, 10, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (277, 1, 5, 10, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (278, 1, 5, 10, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (279, 1, 5, 10, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (280, 1, 5, 10, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (281, 1, 5, 10, NULL, '2019-02-21');
INSERT INTO fitness_app.exerciselog VALUES (282, 1, 5, 10, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (283, 1, 5, 10, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (284, 1, 5, 10, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (285, 1, 5, 10, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (286, 1, 5, 10, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (287, 1, 5, 10, NULL, '2019-02-28');
INSERT INTO fitness_app.exerciselog VALUES (288, 5, 5, 750, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (289, 5, 5, 740, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (290, 5, 5, 760, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (291, 5, 5, 780, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (292, 5, 5, 790, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (293, 5, 5, 710, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (294, 5, 5, 700, NULL, '2019-02-07');
INSERT INTO fitness_app.exerciselog VALUES (295, 5, 5, 730, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (296, 5, 5, 750, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (297, 5, 5, 760, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (298, 5, 5, 770, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (299, 5, 5, 750, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (300, 5, 5, 780, NULL, '2019-02-14');
INSERT INTO fitness_app.exerciselog VALUES (301, 5, 5, 740, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (302, 5, 5, 750, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (303, 5, 5, 740, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (304, 5, 5, 770, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (305, 5, 5, 720, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (306, 5, 5, 780, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (307, 5, 5, 760, NULL, '2019-02-21');
INSERT INTO fitness_app.exerciselog VALUES (308, 5, 5, 750, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (309, 5, 5, 770, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (310, 5, 5, 750, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (311, 5, 5, 750, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (312, 5, 5, 790, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (313, 5, 5, 800, NULL, '2019-02-28');
INSERT INTO fitness_app.exerciselog VALUES (314, 1, 6, 10, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (315, 1, 6, 10, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (316, 1, 6, 10, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (317, 1, 6, 10, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (318, 1, 6, 10, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (319, 1, 6, 10, NULL, '2019-02-07');
INSERT INTO fitness_app.exerciselog VALUES (320, 1, 6, 10, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (321, 1, 6, 10, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (322, 1, 6, 10, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (323, 1, 6, 10, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (324, 1, 6, 10, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (325, 1, 6, 10, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (326, 1, 6, 10, NULL, '2019-02-14');
INSERT INTO fitness_app.exerciselog VALUES (327, 1, 6, 10, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (328, 1, 6, 10, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (329, 1, 6, 10, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (330, 1, 6, 10, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (331, 1, 6, 10, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (332, 1, 6, 10, NULL, '2019-02-21');
INSERT INTO fitness_app.exerciselog VALUES (333, 1, 6, 10, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (334, 1, 6, 10, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (335, 1, 6, 10, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (336, 1, 6, 10, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (337, 1, 6, 10, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (338, 1, 6, 10, NULL, '2019-02-28');
INSERT INTO fitness_app.exerciselog VALUES (339, 4, 6, 650, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (340, 4, 6, 660, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (341, 4, 6, 680, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (342, 4, 6, 690, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (343, 4, 6, 610, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (344, 4, 6, 600, NULL, '2019-02-07');
INSERT INTO fitness_app.exerciselog VALUES (345, 4, 6, 630, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (346, 4, 6, 630, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (347, 4, 6, 650, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (348, 4, 6, 660, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (349, 4, 6, 670, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (350, 4, 6, 650, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (351, 4, 6, 680, NULL, '2019-02-14');
INSERT INTO fitness_app.exerciselog VALUES (352, 4, 6, 650, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (353, 4, 6, 640, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (354, 4, 6, 670, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (355, 4, 6, 620, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (356, 4, 6, 680, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (357, 4, 6, 660, NULL, '2019-02-21');
INSERT INTO fitness_app.exerciselog VALUES (358, 4, 6, 650, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (359, 4, 6, 650, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (360, 4, 6, 670, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (361, 4, 6, 650, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (362, 4, 6, 650, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (363, 4, 6, 700, NULL, '2019-02-28');
INSERT INTO fitness_app.exerciselog VALUES (364, 5, 6, 650, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (365, 5, 6, 660, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (366, 5, 6, 680, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (367, 5, 6, 690, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (368, 5, 6, 610, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (369, 5, 6, 600, NULL, '2019-02-07');
INSERT INTO fitness_app.exerciselog VALUES (370, 5, 6, 630, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (371, 5, 6, 630, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (372, 5, 6, 650, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (373, 5, 6, 660, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (374, 5, 6, 670, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (375, 5, 6, 650, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (376, 5, 6, 680, NULL, '2019-02-14');
INSERT INTO fitness_app.exerciselog VALUES (377, 5, 6, 650, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (378, 5, 6, 640, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (379, 5, 6, 670, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (380, 5, 6, 620, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (381, 5, 6, 680, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (382, 5, 6, 660, NULL, '2019-02-21');
INSERT INTO fitness_app.exerciselog VALUES (383, 5, 6, 650, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (384, 5, 6, 650, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (385, 5, 6, 670, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (386, 5, 6, 650, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (387, 5, 6, 650, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (388, 5, 6, 700, NULL, '2019-02-28');
INSERT INTO fitness_app.exerciselog VALUES (389, 2, 7, 1, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (390, 2, 7, 1, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (391, 2, 7, 1, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (392, 2, 7, 1, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (393, 2, 7, 1, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (394, 2, 7, 1, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (395, 2, 7, 1, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (396, 2, 7, 1, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (397, 2, 7, 1, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (398, 2, 7, 1, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (399, 2, 7, 1, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (400, 2, 7, 1, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (401, 2, 7, 1, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (402, 2, 7, 1, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (403, 2, 7, 1, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (404, 2, 7, 1, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (405, 2, 7, 1, NULL, '2019-02-28');
INSERT INTO fitness_app.exerciselog VALUES (406, 1, 8, 50.3, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (407, 1, 8, 50.4, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (408, 1, 8, 50.5, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (409, 1, 8, 50.6, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (410, 1, 8, 50.5, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (411, 1, 8, 50.6, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (412, 1, 8, 50.2, NULL, '2019-02-07');
INSERT INTO fitness_app.exerciselog VALUES (413, 1, 8, 50.6, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (414, 1, 8, 50.9, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (415, 1, 8, 50.1, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (416, 1, 8, 48.8, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (417, 1, 8, 52.1, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (418, 1, 8, 50.6, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (419, 1, 8, 50.7, NULL, '2019-02-14');
INSERT INTO fitness_app.exerciselog VALUES (420, 1, 8, 50.8, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (421, 1, 8, 50.3, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (422, 1, 8, 50.3, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (423, 1, 8, 50.2, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (424, 1, 8, 50.2, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (425, 1, 8, 50.3, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (426, 1, 8, 50.4, NULL, '2019-02-21');
INSERT INTO fitness_app.exerciselog VALUES (427, 1, 8, 50.5, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (428, 1, 8, 50.7, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (429, 1, 8, 50.1, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (430, 1, 8, 50.2, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (431, 1, 8, 50.6, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (432, 1, 8, 50.7, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (433, 1, 8, 50.2, NULL, '2019-02-28');
INSERT INTO fitness_app.exerciselog VALUES (434, 1, 9, 5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (435, 5, 9, 100, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (436, 8, 9, 36, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (437, 6, 9, 240, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (438, 4, 9, 6, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (439, 1, 9, 8, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (440, 5, 9, 150, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (441, 8, 9, 24, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (442, 6, 9, 180, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (443, 4, 9, 24, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (444, 1, 9, 3, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (445, 5, 9, 300, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (446, 8, 9, 48, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (447, 6, 9, 350, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (448, 4, 9, 15, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (449, 1, 9, 8, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (450, 5, 9, 150, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (451, 8, 9, 8, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (452, 6, 9, 90, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (453, 4, 9, 30, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (454, 1, 9, 5, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (455, 5, 9, 100, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (456, 8, 9, 36, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (457, 6, 9, 240, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (458, 4, 9, 6, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (459, 1, 9, 2, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (460, 5, 9, 400, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (461, 8, 9, 12, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (462, 6, 9, 400, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (463, 4, 9, 9, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (464, 1, 9, 5, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (465, 5, 9, 100, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (466, 8, 9, 36, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (467, 6, 9, 240, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (468, 4, 9, 6, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (469, 1, 9, 8, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (470, 5, 9, 150, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (471, 8, 9, 24, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (472, 6, 9, 180, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (473, 4, 9, 24, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (474, 1, 9, 3, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (475, 5, 9, 300, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (476, 8, 9, 48, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (477, 6, 9, 350, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (478, 4, 9, 15, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (479, 1, 9, 8, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (480, 5, 9, 150, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (481, 8, 9, 8, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (482, 6, 9, 90, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (483, 4, 9, 30, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (484, 1, 9, 5, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (485, 5, 9, 100, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (486, 8, 9, 36, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (487, 6, 9, 240, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (488, 4, 9, 6, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (489, 1, 9, 2, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (490, 5, 9, 400, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (491, 8, 9, 12, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (492, 6, 9, 400, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (493, 4, 9, 9, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (494, 1, 9, 5, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (495, 5, 9, 100, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (496, 8, 9, 36, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (497, 6, 9, 240, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (498, 4, 9, 6, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (499, 1, 9, 8, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (500, 5, 9, 150, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (501, 8, 9, 24, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (502, 6, 9, 180, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (503, 4, 9, 24, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (504, 1, 9, 3, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (505, 5, 9, 300, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (506, 8, 9, 48, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (507, 6, 9, 350, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (508, 4, 9, 15, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (509, 1, 9, 8, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (510, 5, 9, 150, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (511, 8, 9, 8, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (512, 6, 9, 90, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (513, 4, 9, 30, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (514, 1, 9, 5, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (515, 5, 9, 100, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (516, 8, 9, 36, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (517, 6, 9, 240, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (518, 4, 9, 6, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (519, 1, 9, 2, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (520, 5, 9, 400, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (521, 8, 9, 12, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (522, 6, 9, 400, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (523, 4, 9, 9, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (524, 1, 9, 5, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (525, 5, 9, 100, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (526, 8, 9, 36, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (527, 6, 9, 240, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (528, 4, 9, 6, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (529, 1, 9, 8, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (530, 5, 9, 150, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (531, 8, 9, 24, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (532, 6, 9, 180, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (533, 4, 9, 24, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (534, 1, 9, 3, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (535, 5, 9, 300, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (536, 8, 9, 48, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (537, 6, 9, 350, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (538, 4, 9, 15, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (539, 1, 9, 8, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (540, 5, 9, 150, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (541, 8, 9, 8, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (542, 6, 9, 90, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (543, 4, 9, 30, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (544, 1, 9, 5, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (545, 5, 9, 100, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (546, 8, 9, 36, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (547, 6, 9, 240, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (548, 4, 9, 6, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (549, 1, 9, 2, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (550, 5, 9, 400, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (551, 8, 9, 12, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (552, 6, 9, 400, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (553, 4, 9, 9, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (554, 9, 10, 100, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (555, 9, 10, 100, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (556, 9, 10, 100, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (557, 9, 10, 100, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (558, 9, 10, 100, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (559, 9, 10, 100, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (560, 9, 10, 100, NULL, '2019-02-07');
INSERT INTO fitness_app.exerciselog VALUES (561, 9, 10, 100, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (562, 9, 10, 100, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (563, 9, 10, 100, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (564, 9, 10, 100, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (565, 9, 10, 100, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (566, 9, 10, 100, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (567, 9, 10, 100, NULL, '2019-02-14');
INSERT INTO fitness_app.exerciselog VALUES (568, 9, 10, 100, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (569, 9, 10, 100, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (570, 9, 10, 100, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (571, 9, 10, 100, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (572, 9, 10, 100, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (573, 9, 10, 100, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (574, 9, 10, 100, NULL, '2019-02-21');
INSERT INTO fitness_app.exerciselog VALUES (575, 9, 10, 100, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (576, 9, 10, 100, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (577, 9, 10, 100, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (578, 9, 10, 100, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (579, 9, 10, 100, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (580, 9, 10, 100, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (581, 9, 10, 100, NULL, '2019-02-28');
INSERT INTO fitness_app.exerciselog VALUES (582, 9, 11, 200, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (583, 9, 11, 200, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (584, 9, 11, 200, NULL, '2019-02-03');
INSERT INTO fitness_app.exerciselog VALUES (585, 9, 11, 200, NULL, '2019-02-04');
INSERT INTO fitness_app.exerciselog VALUES (586, 9, 11, 200, NULL, '2019-02-05');
INSERT INTO fitness_app.exerciselog VALUES (587, 9, 11, 200, NULL, '2019-02-06');
INSERT INTO fitness_app.exerciselog VALUES (588, 9, 11, 200, NULL, '2019-02-07');
INSERT INTO fitness_app.exerciselog VALUES (589, 9, 11, 200, NULL, '2019-02-08');
INSERT INTO fitness_app.exerciselog VALUES (590, 9, 11, 200, NULL, '2019-02-09');
INSERT INTO fitness_app.exerciselog VALUES (591, 9, 11, 200, NULL, '2019-02-10');
INSERT INTO fitness_app.exerciselog VALUES (592, 9, 11, 200, NULL, '2019-02-11');
INSERT INTO fitness_app.exerciselog VALUES (593, 9, 11, 200, NULL, '2019-02-12');
INSERT INTO fitness_app.exerciselog VALUES (594, 9, 11, 200, NULL, '2019-02-13');
INSERT INTO fitness_app.exerciselog VALUES (595, 9, 11, 200, NULL, '2019-02-14');
INSERT INTO fitness_app.exerciselog VALUES (596, 9, 11, 200, NULL, '2019-02-15');
INSERT INTO fitness_app.exerciselog VALUES (597, 9, 11, 200, NULL, '2019-02-16');
INSERT INTO fitness_app.exerciselog VALUES (598, 9, 11, 200, NULL, '2019-02-17');
INSERT INTO fitness_app.exerciselog VALUES (599, 9, 11, 200, NULL, '2019-02-18');
INSERT INTO fitness_app.exerciselog VALUES (600, 9, 11, 200, NULL, '2019-02-19');
INSERT INTO fitness_app.exerciselog VALUES (601, 9, 11, 200, NULL, '2019-02-20');
INSERT INTO fitness_app.exerciselog VALUES (602, 9, 11, 200, NULL, '2019-02-21');
INSERT INTO fitness_app.exerciselog VALUES (603, 9, 11, 200, NULL, '2019-02-22');
INSERT INTO fitness_app.exerciselog VALUES (604, 9, 11, 200, NULL, '2019-02-23');
INSERT INTO fitness_app.exerciselog VALUES (605, 9, 11, 200, NULL, '2019-02-24');
INSERT INTO fitness_app.exerciselog VALUES (606, 9, 11, 200, NULL, '2019-02-25');
INSERT INTO fitness_app.exerciselog VALUES (607, 9, 11, 200, NULL, '2019-02-26');
INSERT INTO fitness_app.exerciselog VALUES (608, 9, 11, 200, NULL, '2019-02-27');
INSERT INTO fitness_app.exerciselog VALUES (609, 9, 11, 200, NULL, '2019-02-28');
INSERT INTO fitness_app.exerciselog VALUES (610, 1, 1, 2.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (611, 2, 1, 2.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (612, 1, 1, 2.5, NULL, '2019-02-02');
INSERT INTO fitness_app.exerciselog VALUES (613, 1, 1, 2.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (614, 1, 1, 2.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (615, 1, 1, 2.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (616, 1, 1, 2.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (617, 1, 1, 2.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (618, 1, 1, 2.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (619, 1, 1, 2.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (620, 1, 1, 2.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (621, 1, 1, 2.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (622, 1, 1, 3.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (623, 1, 1, 4.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (624, 1, 1, 4.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (625, 1, 1, 4.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (626, 1, 1, 4.5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (627, 1, 1, 5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (628, 1, 1, 5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (629, 1, 1, 5, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (630, 1, 1, 50, NULL, '2019-02-01');
INSERT INTO fitness_app.exerciselog VALUES (631, 1, 1, 60, NULL, '2019-02-28');


--
-- TOC entry 3904 (class 0 OID 16817)
-- Dependencies: 223
-- Data for Name: exercisesubscription; Type: TABLE DATA; Schema: fitness_app; Owner: -
--

INSERT INTO fitness_app.exercisesubscription VALUES (1, 1);
INSERT INTO fitness_app.exercisesubscription VALUES (2, 1);
INSERT INTO fitness_app.exercisesubscription VALUES (3, 1);
INSERT INTO fitness_app.exercisesubscription VALUES (4, 1);
INSERT INTO fitness_app.exercisesubscription VALUES (5, 1);
INSERT INTO fitness_app.exercisesubscription VALUES (6, 1);
INSERT INTO fitness_app.exercisesubscription VALUES (7, 1);
INSERT INTO fitness_app.exercisesubscription VALUES (8, 1);
INSERT INTO fitness_app.exercisesubscription VALUES (9, 1);
INSERT INTO fitness_app.exercisesubscription VALUES (10, 1);
INSERT INTO fitness_app.exercisesubscription VALUES (1, 2);
INSERT INTO fitness_app.exercisesubscription VALUES (7, 2);
INSERT INTO fitness_app.exercisesubscription VALUES (8, 2);
INSERT INTO fitness_app.exercisesubscription VALUES (9, 2);
INSERT INTO fitness_app.exercisesubscription VALUES (1, 3);
INSERT INTO fitness_app.exercisesubscription VALUES (4, 3);
INSERT INTO fitness_app.exercisesubscription VALUES (5, 3);
INSERT INTO fitness_app.exercisesubscription VALUES (6, 3);
INSERT INTO fitness_app.exercisesubscription VALUES (8, 3);
INSERT INTO fitness_app.exercisesubscription VALUES (1, 4);
INSERT INTO fitness_app.exercisesubscription VALUES (1, 5);
INSERT INTO fitness_app.exercisesubscription VALUES (5, 5);
INSERT INTO fitness_app.exercisesubscription VALUES (1, 6);
INSERT INTO fitness_app.exercisesubscription VALUES (4, 6);
INSERT INTO fitness_app.exercisesubscription VALUES (5, 6);
INSERT INTO fitness_app.exercisesubscription VALUES (2, 7);
INSERT INTO fitness_app.exercisesubscription VALUES (1, 8);
INSERT INTO fitness_app.exercisesubscription VALUES (1, 9);
INSERT INTO fitness_app.exercisesubscription VALUES (4, 9);
INSERT INTO fitness_app.exercisesubscription VALUES (5, 9);
INSERT INTO fitness_app.exercisesubscription VALUES (6, 9);
INSERT INTO fitness_app.exercisesubscription VALUES (8, 9);
INSERT INTO fitness_app.exercisesubscription VALUES (9, 10);
INSERT INTO fitness_app.exercisesubscription VALUES (9, 11);
INSERT INTO fitness_app.exercisesubscription VALUES (10, 13);
INSERT INTO fitness_app.exercisesubscription VALUES (10, 14);
INSERT INTO fitness_app.exercisesubscription VALUES (10, 15);
INSERT INTO fitness_app.exercisesubscription VALUES (10, 16);


--
-- TOC entry 3914 (class 0 OID 0)
-- Dependencies: 218
-- Name: account_userid_seq; Type: SEQUENCE SET; Schema: fitness_app; Owner: -
--

SELECT pg_catalog.setval('fitness_app.account_userid_seq', 81, true);


--
-- TOC entry 3915 (class 0 OID 0)
-- Dependencies: 214
-- Name: accounttype_typeid_seq; Type: SEQUENCE SET; Schema: fitness_app; Owner: -
--

SELECT pg_catalog.setval('fitness_app.accounttype_typeid_seq', 2, true);


--
-- TOC entry 3916 (class 0 OID 0)
-- Dependencies: 216
-- Name: exercise_exerciseid_seq; Type: SEQUENCE SET; Schema: fitness_app; Owner: -
--

SELECT pg_catalog.setval('fitness_app.exercise_exerciseid_seq', 10, true);


--
-- TOC entry 3917 (class 0 OID 0)
-- Dependencies: 221
-- Name: exerciselog_exerciselogid_seq; Type: SEQUENCE SET; Schema: fitness_app; Owner: -
--

SELECT pg_catalog.setval('fitness_app.exerciselog_exerciselogid_seq', 631, true);


--
-- TOC entry 3755 (class 2606 OID 16775)
-- Name: account account_email_key; Type: CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.account
    ADD CONSTRAINT account_email_key UNIQUE (email);


--
-- TOC entry 3757 (class 2606 OID 16773)
-- Name: account account_username_key; Type: CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.account
    ADD CONSTRAINT account_username_key UNIQUE (username);


--
-- TOC entry 3747 (class 2606 OID 16747)
-- Name: accounttype accounttype_description_key; Type: CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.accounttype
    ADD CONSTRAINT accounttype_description_key UNIQUE (description);


--
-- TOC entry 3751 (class 2606 OID 16760)
-- Name: exercise exercise_description_key; Type: CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.exercise
    ADD CONSTRAINT exercise_description_key UNIQUE (description);


--
-- TOC entry 3759 (class 2606 OID 16771)
-- Name: account pk_account; Type: CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.account
    ADD CONSTRAINT pk_account PRIMARY KEY (userid);


--
-- TOC entry 3761 (class 2606 OID 16785)
-- Name: accountsubscription pk_accountsubscription; Type: CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.accountsubscription
    ADD CONSTRAINT pk_accountsubscription PRIMARY KEY (subscriberid, subscribeeid);


--
-- TOC entry 3749 (class 2606 OID 16745)
-- Name: accounttype pk_accounttype; Type: CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.accounttype
    ADD CONSTRAINT pk_accounttype PRIMARY KEY (typeid);


--
-- TOC entry 3753 (class 2606 OID 16758)
-- Name: exercise pk_exercise; Type: CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.exercise
    ADD CONSTRAINT pk_exercise PRIMARY KEY (exerciseid);


--
-- TOC entry 3763 (class 2606 OID 16806)
-- Name: exerciselog pk_exerciselog; Type: CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.exerciselog
    ADD CONSTRAINT pk_exerciselog PRIMARY KEY (exerciselogid);


--
-- TOC entry 3765 (class 2606 OID 16821)
-- Name: exercisesubscription pk_exercisesubscription; Type: CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.exercisesubscription
    ADD CONSTRAINT pk_exercisesubscription PRIMARY KEY (exerciseid, userid);


--
-- TOC entry 3766 (class 2606 OID 16776)
-- Name: account fk_accounttype; Type: FK CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.account
    ADD CONSTRAINT fk_accounttype FOREIGN KEY (typeid) REFERENCES fitness_app.accounttype(typeid);


--
-- TOC entry 3769 (class 2606 OID 16807)
-- Name: exerciselog fk_exercise; Type: FK CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.exerciselog
    ADD CONSTRAINT fk_exercise FOREIGN KEY (exerciseid) REFERENCES fitness_app.exercise(exerciseid);


--
-- TOC entry 3771 (class 2606 OID 16822)
-- Name: exercisesubscription fk_exercisesub; Type: FK CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.exercisesubscription
    ADD CONSTRAINT fk_exercisesub FOREIGN KEY (exerciseid) REFERENCES fitness_app.exercise(exerciseid);


--
-- TOC entry 3768 (class 2606 OID 16791)
-- Name: accountsubscription fk_subscribee; Type: FK CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.accountsubscription
    ADD CONSTRAINT fk_subscribee FOREIGN KEY (subscribeeid) REFERENCES fitness_app.account(userid);


--
-- TOC entry 3767 (class 2606 OID 16786)
-- Name: accountsubscription fk_subscriber; Type: FK CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.accountsubscription
    ADD CONSTRAINT fk_subscriber FOREIGN KEY (subscriberid) REFERENCES fitness_app.account(userid);


--
-- TOC entry 3770 (class 2606 OID 16812)
-- Name: exerciselog fk_user; Type: FK CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.exerciselog
    ADD CONSTRAINT fk_user FOREIGN KEY (userid) REFERENCES fitness_app.account(userid);


--
-- TOC entry 3772 (class 2606 OID 16827)
-- Name: exercisesubscription fk_usersub; Type: FK CONSTRAINT; Schema: fitness_app; Owner: -
--

ALTER TABLE ONLY fitness_app.exercisesubscription
    ADD CONSTRAINT fk_usersub FOREIGN KEY (userid) REFERENCES fitness_app.account(userid);


-- Completed on 2019-02-28 20:33:22

--
-- PostgreSQL database dump complete
--

