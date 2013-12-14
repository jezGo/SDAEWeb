--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO sdae;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO sdae;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO sdae;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO sdae;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO sdae;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO sdae;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO sdae;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO sdae;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO sdae;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO sdae;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO sdae;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO sdae;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO sdae;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO sdae;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO sdae;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO sdae;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO sdae;

--
-- Name: publications_advertisement; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_advertisement (
    id integer NOT NULL,
    publication_id integer NOT NULL,
    "EffectiveDate" date NOT NULL,
    "directedTo" character varying(60),
    "isActive" boolean NOT NULL
);


ALTER TABLE public.publications_advertisement OWNER TO sdae;

--
-- Name: publications_advertisement_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_advertisement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_advertisement_id_seq OWNER TO sdae;

--
-- Name: publications_advertisement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_advertisement_id_seq OWNED BY publications_advertisement.id;


--
-- Name: publications_buysell; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_buysell (
    id integer NOT NULL,
    publication_id integer NOT NULL,
    "isSell" boolean NOT NULL,
    "isNew" boolean NOT NULL,
    price numeric(7,2) NOT NULL,
    "specsUrl" character varying(200) NOT NULL,
    "isAvailable" boolean NOT NULL
);


ALTER TABLE public.publications_buysell OWNER TO sdae;

--
-- Name: publications_buysell_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_buysell_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_buysell_id_seq OWNER TO sdae;

--
-- Name: publications_buysell_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_buysell_id_seq OWNED BY publications_buysell.id;


--
-- Name: publications_comment; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_comment (
    id integer NOT NULL,
    publication_id integer NOT NULL,
    content text NOT NULL,
    published timestamp with time zone NOT NULL,
    "lastEdited" timestamp with time zone NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.publications_comment OWNER TO sdae;

--
-- Name: publications_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_comment_id_seq OWNER TO sdae;

--
-- Name: publications_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_comment_id_seq OWNED BY publications_comment.id;


--
-- Name: publications_company; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_company (
    id integer NOT NULL,
    "sdaeUser_id" integer NOT NULL,
    name character varying(80) NOT NULL,
    address character varying(200) NOT NULL,
    "contactName" character varying(100) NOT NULL,
    "contactPhone" character varying(15) NOT NULL,
    "contactEmail" character varying(75) NOT NULL,
    website character varying(200) NOT NULL
);


ALTER TABLE public.publications_company OWNER TO sdae;

--
-- Name: publications_company_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_company_id_seq OWNER TO sdae;

--
-- Name: publications_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_company_id_seq OWNED BY publications_company.id;


--
-- Name: publications_coursematerial; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_coursematerial (
    id integer NOT NULL,
    publication_id integer NOT NULL,
    attachment character varying(400) NOT NULL
);


ALTER TABLE public.publications_coursematerial OWNER TO sdae;

--
-- Name: publications_coursematerial_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_coursematerial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_coursematerial_id_seq OWNER TO sdae;

--
-- Name: publications_coursematerial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_coursematerial_id_seq OWNED BY publications_coursematerial.id;


--
-- Name: publications_event; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_event (
    id integer NOT NULL,
    publication_id integer NOT NULL,
    "startDateTime" timestamp with time zone NOT NULL,
    "endDateTime" timestamp with time zone NOT NULL,
    location_id integer NOT NULL,
    "parentEvent_id" integer,
    speaker character varying(100)
);


ALTER TABLE public.publications_event OWNER TO sdae;

--
-- Name: publications_event_host; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_event_host (
    id integer NOT NULL,
    event_id integer NOT NULL,
    sdaeuser_id integer NOT NULL
);


ALTER TABLE public.publications_event_host OWNER TO sdae;

--
-- Name: publications_event_host_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_event_host_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_event_host_id_seq OWNER TO sdae;

--
-- Name: publications_event_host_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_event_host_id_seq OWNED BY publications_event_host.id;


--
-- Name: publications_event_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_event_id_seq OWNER TO sdae;

--
-- Name: publications_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_event_id_seq OWNED BY publications_event.id;


--
-- Name: publications_joboffer; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_joboffer (
    id integer NOT NULL,
    publication_id integer NOT NULL,
    company_id integer NOT NULL,
    "appointmentDate" character varying(60) NOT NULL,
    "appointmentAdress" character varying(200) NOT NULL,
    "laboralAddress" character varying(200) NOT NULL,
    compensation character varying(20) NOT NULL,
    "isOpen" boolean NOT NULL
);


ALTER TABLE public.publications_joboffer OWNER TO sdae;

--
-- Name: publications_joboffer_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_joboffer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_joboffer_id_seq OWNER TO sdae;

--
-- Name: publications_joboffer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_joboffer_id_seq OWNED BY publications_joboffer.id;


--
-- Name: publications_jobtype; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_jobtype (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.publications_jobtype OWNER TO sdae;

--
-- Name: publications_jobtype_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_jobtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_jobtype_id_seq OWNER TO sdae;

--
-- Name: publications_jobtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_jobtype_id_seq OWNED BY publications_jobtype.id;


--
-- Name: publications_location; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_location (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    type_id integer NOT NULL,
    map_id integer NOT NULL,
    "mapX1" integer,
    "mapX2" integer,
    "mapY1" integer,
    "mapY2" integer
);


ALTER TABLE public.publications_location OWNER TO sdae;

--
-- Name: publications_location_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_location_id_seq OWNER TO sdae;

--
-- Name: publications_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_location_id_seq OWNED BY publications_location.id;


--
-- Name: publications_locationtype; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_locationtype (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.publications_locationtype OWNER TO sdae;

--
-- Name: publications_locationtype_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_locationtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_locationtype_id_seq OWNER TO sdae;

--
-- Name: publications_locationtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_locationtype_id_seq OWNED BY publications_locationtype.id;


--
-- Name: publications_lostandfound; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_lostandfound (
    id integer NOT NULL,
    publication_id integer NOT NULL,
    "isLostType" boolean NOT NULL,
    "lostOrFoundDate" date NOT NULL,
    "lostOrFoundTime" time without time zone NOT NULL,
    "lastSeenLocation_id" integer,
    reward numeric(7,2) NOT NULL,
    "isActive" boolean NOT NULL
);


ALTER TABLE public.publications_lostandfound OWNER TO sdae;

--
-- Name: publications_lostandfound_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_lostandfound_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_lostandfound_id_seq OWNER TO sdae;

--
-- Name: publications_lostandfound_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_lostandfound_id_seq OWNED BY publications_lostandfound.id;


--
-- Name: publications_map; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_map (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    "imageUrl" character varying(200) NOT NULL
);


ALTER TABLE public.publications_map OWNER TO sdae;

--
-- Name: publications_map_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_map_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_map_id_seq OWNER TO sdae;

--
-- Name: publications_map_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_map_id_seq OWNED BY publications_map.id;


--
-- Name: publications_publication; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_publication (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    content text NOT NULL,
    type_id integer NOT NULL,
    published timestamp with time zone NOT NULL,
    "lastEdited" timestamp with time zone NOT NULL,
    "imageUrl" character varying(200) NOT NULL,
    author_id integer NOT NULL,
    hightlighted boolean NOT NULL
);


ALTER TABLE public.publications_publication OWNER TO sdae;

--
-- Name: publications_publication_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_publication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_publication_id_seq OWNER TO sdae;

--
-- Name: publications_publication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_publication_id_seq OWNED BY publications_publication.id;


--
-- Name: publications_publication_tags; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_publication_tags (
    id integer NOT NULL,
    publication_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.publications_publication_tags OWNER TO sdae;

--
-- Name: publications_publication_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_publication_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_publication_tags_id_seq OWNER TO sdae;

--
-- Name: publications_publication_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_publication_tags_id_seq OWNED BY publications_publication_tags.id;


--
-- Name: publications_publicationtype; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_publicationtype (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.publications_publicationtype OWNER TO sdae;

--
-- Name: publications_publicationtype_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_publicationtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_publicationtype_id_seq OWNER TO sdae;

--
-- Name: publications_publicationtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_publicationtype_id_seq OWNED BY publications_publicationtype.id;


--
-- Name: publications_schooldepartment; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_schooldepartment (
    id integer NOT NULL,
    name character varying(60) NOT NULL,
    manager character varying(60) NOT NULL,
    description text,
    "serviceHours" character varying(80),
    "sdaeUser_id" integer NOT NULL
);


ALTER TABLE public.publications_schooldepartment OWNER TO sdae;

--
-- Name: publications_schooldepartment_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_schooldepartment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_schooldepartment_id_seq OWNER TO sdae;

--
-- Name: publications_schooldepartment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_schooldepartment_id_seq OWNED BY publications_schooldepartment.id;


--
-- Name: publications_sdaeuser; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_sdaeuser (
    id integer NOT NULL,
    user_id integer NOT NULL,
    type_id integer NOT NULL,
    "profileImageUrl" character varying(200),
    "facebookUsername" character varying(80),
    "facebookAuthToken" character varying(100),
    "twitterUsername" character varying(20),
    "twitterAuthToken" character varying(100)
);


ALTER TABLE public.publications_sdaeuser OWNER TO sdae;

--
-- Name: publications_sdaeuser_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_sdaeuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_sdaeuser_id_seq OWNER TO sdae;

--
-- Name: publications_sdaeuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_sdaeuser_id_seq OWNED BY publications_sdaeuser.id;


--
-- Name: publications_student; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_student (
    id integer NOT NULL,
    "sdaeUser_id" integer NOT NULL,
    "studentId" character varying(10),
    "startDate" date,
    "endDate" date
);


ALTER TABLE public.publications_student OWNER TO sdae;

--
-- Name: publications_student_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_student_id_seq OWNER TO sdae;

--
-- Name: publications_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_student_id_seq OWNED BY publications_student.id;


--
-- Name: publications_studentsclub; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_studentsclub (
    id integer NOT NULL,
    name character varying(60) NOT NULL,
    "teacherManager" character varying(60) NOT NULL,
    "studentManager" character varying(60) NOT NULL,
    description text,
    website character varying(100) NOT NULL,
    "sdaeUser_id" integer NOT NULL
);


ALTER TABLE public.publications_studentsclub OWNER TO sdae;

--
-- Name: publications_studentsclub_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_studentsclub_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_studentsclub_id_seq OWNER TO sdae;

--
-- Name: publications_studentsclub_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_studentsclub_id_seq OWNED BY publications_studentsclub.id;


--
-- Name: publications_tag; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.publications_tag OWNER TO sdae;

--
-- Name: publications_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_tag_id_seq OWNER TO sdae;

--
-- Name: publications_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_tag_id_seq OWNED BY publications_tag.id;


--
-- Name: publications_userteacher; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_userteacher (
    id integer NOT NULL,
    "sdaeUser_id" integer NOT NULL,
    teacher_id integer NOT NULL,
    "teacherId" character varying(10)
);


ALTER TABLE public.publications_userteacher OWNER TO sdae;

--
-- Name: publications_userteacher_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_userteacher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_userteacher_id_seq OWNER TO sdae;

--
-- Name: publications_userteacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_userteacher_id_seq OWNED BY publications_userteacher.id;


--
-- Name: publications_usertype; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_usertype (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.publications_usertype OWNER TO sdae;

--
-- Name: publications_usertype_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_usertype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_usertype_id_seq OWNER TO sdae;

--
-- Name: publications_usertype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_usertype_id_seq OWNED BY publications_usertype.id;


--
-- Name: publications_vote; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE publications_vote (
    id integer NOT NULL,
    publication_id integer NOT NULL,
    author_id integer NOT NULL,
    "isPositive" boolean NOT NULL,
    "givenDateTime" timestamp with time zone NOT NULL,
    "modifiedDateTime" timestamp with time zone NOT NULL
);


ALTER TABLE public.publications_vote OWNER TO sdae;

--
-- Name: publications_vote_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE publications_vote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publications_vote_id_seq OWNER TO sdae;

--
-- Name: publications_vote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE publications_vote_id_seq OWNED BY publications_vote.id;


--
-- Name: schoolInfo_classsession; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE "schoolInfo_classsession" (
    id integer NOT NULL,
    course_id integer NOT NULL,
    location_id integer NOT NULL,
    day character varying(2) NOT NULL,
    hour character varying(2) NOT NULL
);


ALTER TABLE public."schoolInfo_classsession" OWNER TO sdae;

--
-- Name: schoolInfo_classsession_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE "schoolInfo_classsession_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."schoolInfo_classsession_id_seq" OWNER TO sdae;

--
-- Name: schoolInfo_classsession_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE "schoolInfo_classsession_id_seq" OWNED BY "schoolInfo_classsession".id;


--
-- Name: schoolInfo_course; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE "schoolInfo_course" (
    id integer NOT NULL,
    teacher_id integer NOT NULL,
    subject_id integer NOT NULL,
    "scholarCycle" character varying(12) NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public."schoolInfo_course" OWNER TO sdae;

--
-- Name: schoolInfo_course_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE "schoolInfo_course_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."schoolInfo_course_id_seq" OWNER TO sdae;

--
-- Name: schoolInfo_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE "schoolInfo_course_id_seq" OWNED BY "schoolInfo_course".id;


--
-- Name: schoolInfo_group; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE "schoolInfo_group" (
    id integer NOT NULL,
    name character varying(4) NOT NULL
);


ALTER TABLE public."schoolInfo_group" OWNER TO sdae;

--
-- Name: schoolInfo_group_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE "schoolInfo_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."schoolInfo_group_id_seq" OWNER TO sdae;

--
-- Name: schoolInfo_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE "schoolInfo_group_id_seq" OWNED BY "schoolInfo_group".id;


--
-- Name: schoolInfo_subject; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE "schoolInfo_subject" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    "syllabusUrl" character varying(200),
    "theoryHours" numeric(4,2),
    "practicHours" numeric(4,2),
    credits numeric(4,2),
    level character varying(1) NOT NULL,
    formation character varying(1) NOT NULL
);


ALTER TABLE public."schoolInfo_subject" OWNER TO sdae;

--
-- Name: schoolInfo_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE "schoolInfo_subject_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."schoolInfo_subject_id_seq" OWNER TO sdae;

--
-- Name: schoolInfo_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE "schoolInfo_subject_id_seq" OWNED BY "schoolInfo_subject".id;


--
-- Name: schoolInfo_teacher; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE "schoolInfo_teacher" (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    "photoUrl" character varying(200),
    about text,
    office_id integer,
    department character varying(4),
    academy character varying(100),
    website character varying(200)
);


ALTER TABLE public."schoolInfo_teacher" OWNER TO sdae;

--
-- Name: schoolInfo_teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE "schoolInfo_teacher_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."schoolInfo_teacher_id_seq" OWNER TO sdae;

--
-- Name: schoolInfo_teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE "schoolInfo_teacher_id_seq" OWNED BY "schoolInfo_teacher".id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO sdae;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO sdae;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE taggit_tag_id_seq OWNED BY taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: sdae; Tablespace: 
--

CREATE TABLE taggit_taggeditem (
    id integer NOT NULL,
    tag_id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO sdae;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: sdae
--

CREATE SEQUENCE taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO sdae;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sdae
--

ALTER SEQUENCE taggit_taggeditem_id_seq OWNED BY taggit_taggeditem.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_advertisement ALTER COLUMN id SET DEFAULT nextval('publications_advertisement_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_buysell ALTER COLUMN id SET DEFAULT nextval('publications_buysell_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_comment ALTER COLUMN id SET DEFAULT nextval('publications_comment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_company ALTER COLUMN id SET DEFAULT nextval('publications_company_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_coursematerial ALTER COLUMN id SET DEFAULT nextval('publications_coursematerial_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_event ALTER COLUMN id SET DEFAULT nextval('publications_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_event_host ALTER COLUMN id SET DEFAULT nextval('publications_event_host_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_joboffer ALTER COLUMN id SET DEFAULT nextval('publications_joboffer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_jobtype ALTER COLUMN id SET DEFAULT nextval('publications_jobtype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_location ALTER COLUMN id SET DEFAULT nextval('publications_location_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_locationtype ALTER COLUMN id SET DEFAULT nextval('publications_locationtype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_lostandfound ALTER COLUMN id SET DEFAULT nextval('publications_lostandfound_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_map ALTER COLUMN id SET DEFAULT nextval('publications_map_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_publication ALTER COLUMN id SET DEFAULT nextval('publications_publication_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_publication_tags ALTER COLUMN id SET DEFAULT nextval('publications_publication_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_publicationtype ALTER COLUMN id SET DEFAULT nextval('publications_publicationtype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_schooldepartment ALTER COLUMN id SET DEFAULT nextval('publications_schooldepartment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_sdaeuser ALTER COLUMN id SET DEFAULT nextval('publications_sdaeuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_student ALTER COLUMN id SET DEFAULT nextval('publications_student_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_studentsclub ALTER COLUMN id SET DEFAULT nextval('publications_studentsclub_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_tag ALTER COLUMN id SET DEFAULT nextval('publications_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_userteacher ALTER COLUMN id SET DEFAULT nextval('publications_userteacher_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_usertype ALTER COLUMN id SET DEFAULT nextval('publications_usertype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_vote ALTER COLUMN id SET DEFAULT nextval('publications_vote_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY "schoolInfo_classsession" ALTER COLUMN id SET DEFAULT nextval('"schoolInfo_classsession_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY "schoolInfo_course" ALTER COLUMN id SET DEFAULT nextval('"schoolInfo_course_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY "schoolInfo_group" ALTER COLUMN id SET DEFAULT nextval('"schoolInfo_group_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY "schoolInfo_subject" ALTER COLUMN id SET DEFAULT nextval('"schoolInfo_subject_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY "schoolInfo_teacher" ALTER COLUMN id SET DEFAULT nextval('"schoolInfo_teacher_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY taggit_tag ALTER COLUMN id SET DEFAULT nextval('taggit_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('taggit_taggeditem_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add user type	7	add_usertype
20	Can change user type	7	change_usertype
21	Can delete user type	7	delete_usertype
22	Can add Usuario SDAE	8	add_sdaeuser
23	Can change Usuario SDAE	8	change_sdaeuser
24	Can delete Usuario SDAE	8	delete_sdaeuser
25	Can add Alumno	9	add_student
26	Can change Alumno	9	change_student
27	Can delete Alumno	9	delete_student
28	Can add user teacher	10	add_userteacher
29	Can change user teacher	10	change_userteacher
30	Can delete user teacher	10	delete_userteacher
31	Can add school department	11	add_schooldepartment
32	Can change school department	11	change_schooldepartment
33	Can delete school department	11	delete_schooldepartment
34	Can add students club	12	add_studentsclub
35	Can change students club	12	change_studentsclub
36	Can delete students club	12	delete_studentsclub
37	Can add company	13	add_company
38	Can change company	13	change_company
39	Can delete company	13	delete_company
40	Can add tag	14	add_tag
41	Can change tag	14	change_tag
42	Can delete tag	14	delete_tag
43	Can add Tipo de Publicación	15	add_publicationtype
44	Can change Tipo de Publicación	15	change_publicationtype
45	Can delete Tipo de Publicación	15	delete_publicationtype
46	Can add Publicación	16	add_publication
47	Can change Publicación	16	change_publication
48	Can delete Publicación	16	delete_publication
49	Can add comment	17	add_comment
50	Can change comment	17	change_comment
51	Can delete comment	17	delete_comment
52	Can add vote	18	add_vote
53	Can change vote	18	change_vote
54	Can delete vote	18	delete_vote
55	Can add map	19	add_map
56	Can change map	19	change_map
57	Can delete map	19	delete_map
58	Can add location type	20	add_locationtype
59	Can change location type	20	change_locationtype
60	Can delete location type	20	delete_locationtype
61	Can add location	21	add_location
62	Can change location	21	change_location
63	Can delete location	21	delete_location
64	Can add course material	22	add_coursematerial
65	Can change course material	22	change_coursematerial
66	Can delete course material	22	delete_coursematerial
67	Can add event	23	add_event
68	Can change event	23	change_event
69	Can delete event	23	delete_event
70	Can add job type	24	add_jobtype
71	Can change job type	24	change_jobtype
72	Can delete job type	24	delete_jobtype
73	Can add job offer	25	add_joboffer
74	Can change job offer	25	change_joboffer
75	Can delete job offer	25	delete_joboffer
76	Can add buy sell	26	add_buysell
77	Can change buy sell	26	change_buysell
78	Can delete buy sell	26	delete_buysell
79	Can add lost and found	27	add_lostandfound
80	Can change lost and found	27	change_lostandfound
81	Can delete lost and found	27	delete_lostandfound
82	Can add advertisement	28	add_advertisement
83	Can change advertisement	28	change_advertisement
84	Can delete advertisement	28	delete_advertisement
85	Can add subject	29	add_subject
86	Can change subject	29	change_subject
87	Can delete subject	29	delete_subject
88	Can add teacher	30	add_teacher
89	Can change teacher	30	change_teacher
90	Can delete teacher	30	delete_teacher
91	Can add group	31	add_group
92	Can change group	31	change_group
93	Can delete group	31	delete_group
94	Can add course	32	add_course
95	Can change course	32	change_course
96	Can delete course	32	delete_course
97	Can add class session	33	add_classsession
98	Can change class session	33	change_classsession
99	Can delete class session	33	delete_classsession
100	Can add Tag	34	add_tag
101	Can change Tag	34	change_tag
102	Can delete Tag	34	delete_tag
103	Can add Tagged Item	35	add_taggeditem
104	Can change Tagged Item	35	change_taggeditem
105	Can delete Tagged Item	35	delete_taggeditem
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('auth_permission_id_seq', 105, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$10000$uUJAL9LTcQ22$1fZfY0WXnmopBkya8pYIzoM0dzhFnt5+Cr87JQz+UiE=	2013-12-09 04:28:33.399639-06	f	radiomovil			reclutamiento@radiomovil.com	f	t	2013-12-09 04:28:23.235922-06
2	pbkdf2_sha256$10000$ckeODKx9Qm8q$V8F/r95pzDMtmC4hF/EA0Ck1uZPBf4OSEUzWFlB+fAk=	2013-12-09 04:33:57.863834-06	f	shcp			reclutamientos@hcp.com	f	t	2013-12-09 04:19:03.619723-06
4	pbkdf2_sha256$10000$C69t9WVbCuWw$jvRRUdm37cnoBjvU/dKdrC85AAgDcj8aKfmaaM7BH5I=	2013-12-09 04:37:39.956522-06	f	banxico			reclutamient@banxico.com	f	t	2013-12-09 04:37:31.842821-06
1	pbkdf2_sha256$10000$l0IXMXPLBIeZ$LeSs9TkdX9l2rOLDn7B79Vb0hVbjR2TnAKo5F3qIeic=	2013-12-09 04:44:22.133785-06	t	sdae			sdae@ipn.com.mx	t	t	2013-12-09 02:40:22.452342-06
5	pbkdf2_sha256$10000$43puaSrCoKJm$OPaYJtvD1MZT6Q7H8wKFVUxFEk5LZBc4Kl0di1wff2g=	2013-12-09 04:44:44-06	f	gescolar	Gestión Escolar			f	t	2013-12-09 04:44:44-06
6	pbkdf2_sha256$10000$6MQqIFRw4xmF$4o0mK22Ce981V07iUKax03YVJgSFxMwAxjDwxqLs0UU=	2013-12-09 04:48:34-06	f	maestroAxel	Axel Ernesto	Moreno Cervantes		f	t	2013-12-09 04:48:34-06
7	pbkdf2_sha256$10000$YW633hx2Q2ZF$n5WCbCI05eknquVuS5xC96UsWD2etZpfZb4XmcDtmEc=	2013-12-09 04:55:39-06	f	maestroOrtigoza	Andres	Ortigoza	aortigoza@ipn.com	f	t	2013-12-09 04:55:39-06
8	pbkdf2_sha256$10000$ZakQ1anj3Nvz$yzaf8o85dvSShCpuGnJvhdZvnkaiWNMptV8lRnjeo+4=	2013-12-09 04:58:19-06	f	maestroEuler	Euler	Hernández Contreras	econtrerash@ipn.com.mx	f	t	2013-12-09 04:58:19-06
11	pbkdf2_sha256$10000$feDKPMU2a472$pB9W7Vq/4qPOFMN4fRuMjL1iL/rjw3DvU1jqYxwBals=	2013-12-09 05:15:32.97448-06	f	jgonzalezg	Jessica	González Gutiérrez	gogj911203@ipn.com.mx	f	t	2013-12-09 05:06:10.146487-06
10	pbkdf2_sha256$10000$RQxpVkIWIuTQ$T6hEfz4dP7WJvlFk9W1pH+inAA9id6WwBmpchPlSmhk=	2013-12-09 05:26:39.0064-06	f	jtopetet	Jaqueline Rihan	 Topete	jtopetet@ipn.com	f	t	2013-12-09 05:03:03.688072-06
9	pbkdf2_sha256$10000$plLItZFtIsp3$e1MS6EuKNTjl3UJwpOpQ+QIMusHcbeUQhf1FBQFDcng=	2013-12-09 06:11:33.103742-06	f	mlopezj	Miguel Angel	López Juárez	mlopezj@ipn.com.mx	f	t	2013-12-09 05:00:59.978959-06
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('auth_user_id_seq', 11, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2013-12-09 02:41:02.34761-06	1	7	1	Administrador	1	
2	2013-12-09 02:41:07.094672-06	1	7	2	Empresa	1	
3	2013-12-09 02:41:10.982438-06	1	7	3	Alumno	1	
4	2013-12-09 02:41:14.960848-06	1	7	4	Maestro	1	
5	2013-12-09 02:41:25.205807-06	1	7	5	Departamento Escolar	1	
6	2013-12-09 02:42:52.252163-06	1	15	1	Evento	1	
7	2013-12-09 02:42:56.646928-06	1	15	2	Perdido/Encontrado	1	
8	2013-12-09 02:43:02.175372-06	1	15	3	Compra/Venta	1	
9	2013-12-09 02:43:07.764026-06	1	15	4	Oferta Laboral	1	
10	2013-12-09 02:43:12.075055-06	1	15	5	Anuncio	1	
11	2013-12-09 02:43:17.056726-06	1	15	6	Material	1	
12	2013-12-09 02:46:21.408044-06	1	19	1	ESCOM Piso 1	1	
13	2013-12-09 02:46:26.950569-06	1	19	2	ESCOM Piso 2	1	
14	2013-12-09 02:46:33.723844-06	1	19	3	ESCOM Planta Baja	1	
15	2013-12-09 02:49:36.350456-06	1	20	1	Sala de Usos Múltiples	1	
16	2013-12-09 02:50:09.654349-06	1	20	2	Salón	1	
17	2013-12-09 02:50:21.761641-06	1	20	3	Laboratorio	1	
18	2013-12-09 02:50:49.271269-06	1	20	4	Oficinas	1	
19	2013-12-09 02:51:00.733064-06	1	20	5	Área Común	1	
20	2013-12-09 02:51:08.971319-06	1	20	6	Baños	1	
21	2013-12-09 02:51:57.538263-06	1	20	7	Salas de TT	1	
22	2013-12-09 03:00:08.920312-06	1	8	1	sdae	1	
23	2013-12-09 03:09:00.461716-06	1	30	1	Fabiola Ocampo Botello	1	
24	2013-12-09 03:11:04.680573-06	1	30	2	Didier Ojeda Guillen	1	
25	2013-12-09 03:12:14.161071-06	1	30	3	Luz María Sanchez García	1	
26	2013-12-09 03:13:14.950008-06	1	30	4	Benjamín Luna Benoso	1	
27	2013-12-09 03:15:03.243207-06	1	30	5	Serafin Estrada Elizalde	1	
28	2013-12-09 03:16:50.476498-06	1	30	6	Jesus Ortuño Araujo	1	
29	2013-12-09 03:17:52.553663-06	1	30	7	Claudia Celia Díaz Huerta	1	
30	2013-12-09 03:18:32.635258-06	1	30	8	Raquel Flores Delgado	1	
31	2013-12-09 03:19:20.908552-06	1	30	9	Jose Alfredo Martínez Guerrero	1	
32	2013-12-09 03:20:19.782864-06	1	30	10	Rocío Almazan Farfán	1	
33	2013-12-09 03:21:22.118294-06	1	30	11	Gelacio Castillo Cabrera	1	
34	2013-12-09 03:22:34.378047-06	1	30	12	César Róman Martínez García	1	
35	2013-12-09 03:23:41.788789-06	1	30	13	Flavio Arturo Sanchez Garfias	1	
36	2013-12-09 03:24:58.41498-06	1	30	14	Ulises Velez Saldaña	1	
37	2013-12-09 03:25:42.232064-06	1	30	15	Miriam Pescador Rojas	1	
38	2013-12-09 03:27:03.265568-06	1	30	16	Axel Ernesto Moreno Cervantes	1	
39	2013-12-09 03:48:41.189233-06	1	29	1	Administración Financiera	1	
40	2013-12-09 03:52:05.450274-06	1	29	2	Bases de datos	1	
41	2013-12-09 03:54:46.57801-06	1	29	3	Cálculo	1	
42	2013-12-09 03:56:37.432365-06	1	29	4	Arquitectura de Computadoras	1	
43	2013-12-09 03:58:56.790935-06	1	29	5	Compiladores	1	
44	2013-12-09 04:00:37.262657-06	1	29	6	Estructuras de Datos	1	
45	2013-12-09 04:01:49.208767-06	1	29	7	Gestión Empresarial	1	
46	2013-12-09 04:03:36.20134-06	1	29	8	Matemáticas Discretas	1	
47	2013-12-09 04:04:41.175877-06	1	29	9	Redes de Computadoras	1	
48	2013-12-09 04:06:34.407305-06	1	29	10	Probabilidad y Estadística	1	
49	2013-12-09 04:07:58.925123-06	1	29	11	Física	1	
50	2013-12-09 04:09:01.912753-06	1	29	12	Comunicación Oral y escrita	1	
51	2013-12-09 04:10:30.661311-06	1	29	13	Ingeniería de Software	1	
52	2013-12-09 04:11:17.605247-06	1	31	1	1CV1	1	
53	2013-12-09 04:11:22.604606-06	1	31	2	1CM1	1	
54	2013-12-09 04:11:26.340924-06	1	31	3	2CM1	1	
55	2013-12-09 04:11:29.52871-06	1	31	4	2CV1	1	
56	2013-12-09 04:11:32.415405-06	1	31	5	3CV1	1	
57	2013-12-09 04:11:35.393165-06	1	31	6	3CM1	1	
58	2013-12-09 04:11:39.284024-06	1	31	7	4CM1	1	
59	2013-12-09 04:11:45.004435-06	1	31	8	4CV2	1	
60	2013-12-09 04:11:51.427587-06	1	31	9	3CM3	1	
61	2013-12-09 04:11:56.041304-06	1	31	10	2CM5	1	
62	2013-12-09 04:11:59.902067-06	1	31	11	2CV4	1	
63	2013-12-09 04:12:03.371073-06	1	31	12	1CM6	1	
64	2013-12-09 04:12:07.237912-06	1	31	13	4CM4	1	
65	2013-12-09 04:12:09.526021-06	1	31	14	4C	1	
66	2013-12-09 04:12:17.05645-06	1	31	15	4CV3	1	
67	2013-12-09 04:12:24.088338-06	1	31	16	5CM1	1	
68	2013-12-09 04:12:28.406903-06	1	31	17	5CV1	1	
69	2013-12-09 04:12:50.740902-06	1	31	18	1CM8	1	
70	2013-12-09 04:13:53.188728-06	1	32	1	Bases de datos con Fabiola Ocampo Botello en 2014-01	1	
71	2013-12-09 04:31:32.856779-06	1	14	2	Administrado de Base de Datos	1	
72	2013-12-09 04:31:41.492549-06	1	14	3	Becarios	1	
73	2013-12-09 04:31:51.025244-06	1	14	4	Trabajo	1	
74	2013-12-09 04:32:02.296034-06	1	14	5	Conferencia	1	
75	2013-12-09 04:32:15.936643-06	1	14	6	Eventos	1	
76	2013-12-09 04:32:23.629551-06	1	14	7	ESCOM	1	
77	2013-12-09 04:44:44.630672-06	1	4	5	gescolar	1	
78	2013-12-09 04:45:11.093192-06	1	4	5	gescolar	2	Modifica first_name.
79	2013-12-09 04:45:32.797507-06	1	8	5	gescolar	1	
80	2013-12-09 04:48:34.297633-06	1	4	6	maestroAxel	1	
81	2013-12-09 04:52:44.630256-06	1	4	6	maestroAxel	2	Modifica first_name y last_name.
82	2013-12-09 04:53:15.920353-06	1	8	6	maestroAxel	1	
83	2013-12-09 04:55:39.509822-06	1	4	7	maestroOrtigoza	1	
84	2013-12-09 04:56:17.760109-06	1	4	7	maestroOrtigoza	2	Modifica first_name,last_name y email.
85	2013-12-09 04:58:19.153785-06	1	4	8	maestroEuler	1	
86	2013-12-09 04:58:57.528238-06	1	4	8	maestroEuler	2	Modifica first_name,last_name y email.
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 86, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	user	auth	user
5	content type	contenttypes	contenttype
6	session	sessions	session
7	user type	publications	usertype
8	Usuario SDAE	publications	sdaeuser
9	Alumno	publications	student
10	user teacher	publications	userteacher
11	school department	publications	schooldepartment
12	students club	publications	studentsclub
13	company	publications	company
14	tag	publications	tag
15	Tipo de Publicación	publications	publicationtype
16	Publicación	publications	publication
17	comment	publications	comment
18	vote	publications	vote
19	map	publications	map
20	location type	publications	locationtype
21	location	publications	location
22	course material	publications	coursematerial
23	event	publications	event
24	job type	publications	jobtype
25	job offer	publications	joboffer
26	buy sell	publications	buysell
27	lost and found	publications	lostandfound
28	advertisement	publications	advertisement
29	subject	schoolInfo	subject
30	teacher	schoolInfo	teacher
31	group	schoolInfo	group
32	course	schoolInfo	course
33	class session	schoolInfo	classsession
34	Tag	taggit	tag
35	Tagged Item	taggit	taggeditem
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('django_content_type_id_seq', 35, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
yt1kqkea57bcal77ibfcurybo7b4888v	N2Y5NzEyMzdmMzM0NDdmOTI3MzY5MTdlZDhmMmU3MTg0OGY2MTk4ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OX0=	2013-12-23 06:11:33.115657-06
\.


--
-- Data for Name: publications_advertisement; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_advertisement (id, publication_id, "EffectiveDate", "directedTo", "isActive") FROM stdin;
\.


--
-- Name: publications_advertisement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_advertisement_id_seq', 1, false);


--
-- Data for Name: publications_buysell; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_buysell (id, publication_id, "isSell", "isNew", price, "specsUrl", "isAvailable") FROM stdin;
1	6	t	f	200.00	http://www.androiod.es/	t
2	7	t	f	2300.00	http://www.samsung.com/mx	t
3	9	t	t	50.00	http://www.libros.es/	t
4	10	t	f	200.00	http://www.electronica.com/	t
\.


--
-- Name: publications_buysell_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_buysell_id_seq', 4, true);


--
-- Data for Name: publications_comment; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_comment (id, publication_id, content, published, "lastEdited", author_id) FROM stdin;
\.


--
-- Name: publications_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_comment_id_seq', 1, false);


--
-- Data for Name: publications_company; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_company (id, "sdaeUser_id", name, address, "contactName", "contactPhone", "contactEmail", website) FROM stdin;
1	2	SECRETARIA DE HACIENDA Y CREDITO PUBLICO	Av Constituyentes 1001, Belén de Las Flores, Álvaro Obregón, 01110 Ciudad de México, Distrito Federa	LIC. Edith Arias	36883587	Edith.arias@hacienda.gob.mx	http://www.shcp.gob.mx/‎
2	3	RadioMovil	Lago Alberto 366 Miguel Hidalgo, Distrito Federal	LIC. Rocío Castro	5260 3962	rocastro@radiomovil.com	http://www.telcel.com.mx/
3	4	Banco de México	Gante No.20 Col Centro	 Campos Alcantara Francisco Rodrigo	 5227-8726     	rcampos@banxico.com	http://www.banxico.org.mx/
\.


--
-- Name: publications_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_company_id_seq', 3, true);


--
-- Data for Name: publications_coursematerial; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_coursematerial (id, publication_id, attachment) FROM stdin;
\.


--
-- Name: publications_coursematerial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_coursematerial_id_seq', 1, false);


--
-- Data for Name: publications_event; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_event (id, publication_id, "startDateTime", "endDateTime", location_id, "parentEvent_id", speaker) FROM stdin;
\.


--
-- Data for Name: publications_event_host; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_event_host (id, event_id, sdaeuser_id) FROM stdin;
\.


--
-- Name: publications_event_host_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_event_host_id_seq', 1, false);


--
-- Name: publications_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_event_id_seq', 1, false);


--
-- Data for Name: publications_joboffer; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_joboffer (id, publication_id, company_id, "appointmentDate", "appointmentAdress", "laboralAddress", compensation, "isOpen") FROM stdin;
1	1	1	11/12/2013	\tAv Constituyentes 1001, Belén de Las Flores, Álvaro Obregón, 01110	\tAv Constituyentes 1001, Belén de Las Flores, Álvaro Obregón, 01110	47000	t
2	2	2	17/12/2013	Ignacio Manuel Altamirano 46 Álvaro Obregón, Distrito Federal	Lago Alberto 366 Miguel Hidalgo, Distrito Federal	15000	t
3	3	1	10/12/2013	\tAv Constituyentes 1001, Belén de Las Flores, Álvaro Obregón, 01110 Ciudad de México	\tAv Constituyentes 1001, Belén de Las Flores, Álvaro Obregón, 01110 Ciudad de México	8000	t
4	4	3	13/12/2013	Gante No.20 col. centro 	Gante No.20 col. centro 	30000	t
\.


--
-- Name: publications_joboffer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_joboffer_id_seq', 4, true);


--
-- Data for Name: publications_jobtype; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_jobtype (id, name) FROM stdin;
\.


--
-- Name: publications_jobtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_jobtype_id_seq', 1, false);


--
-- Data for Name: publications_location; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_location (id, name, type_id, map_id, "mapX1", "mapX2", "mapY1", "mapY2") FROM stdin;
1	Departamento de Control Escolar(2001)	4	3	12	70	569	609
2	2002	2	1	12	70	525	567
3	2003	2	1	12	70	483	524
4	2004	2	1	12	70	420	462
5	2005	2	1	12	70	378	420
6	2006	2	1	12	70	335	379
8	2008	2	1	12	70	195	238
9	2009	2	1	12	70	152	196
10	2010	2	1	12	70	90	132
11	2011	2	1	12	70	47	90
12	2012	2	1	12	70	6	48
13	2101	2	2	12	70	569	609
14	2102	2	2	12	70	525	567
15	2103	2	2	12	70	483	524
16	2104	2	2	12	70	420	462
17	2105	2	2	12	70	378	420
18	2106	2	2	12	70	335	379
19	2107	2	2	12	70	237	280
20	2108	2	2	12	70	195	238
21	2109	2	2	12	70	152	196
22	2110	2	2	12	70	90	132
23	2111	2	2	12	70	47	90
24	2112	2	2	12	70	6	48
7	2007	2	1	12	70	237	280
25	2201	2	3	12	70	569	609
26	2202	2	3	12	70	525	567
27	2203	2	3	12	70	483	524
28	2203	2	3	12	70	420	462
29	2204	2	3	12	70	420	462
30	2205	2	3	12	70	378	420
31	2206	2	3	12	70	335	379
32	2207	2	3	12	70	237	280
33	2208	2	3	12	70	195	238
34	2208	2	3	12	70	195	238
35	2209	2	3	12	70	152	196
36	2210	2	3	12	70	90	132
37	2211	2	3	12	70	47	90
38	2212	2	3	12	70	6	48
39	1001	2	1	695	761	569	609
40	1002	2	1	695	761	525	567
41	1003	2	1	695	761	483	524
42	1004	2	1	695	761	420	462
43	1005	2	1	695	761	378	420
44	1006	2	1	695	761	335	379
45	1007	2	1	695	761	237	280
46	1008	2	1	695	761	195	238
47	1009	2	1	695	761	152	196
48	1010	7	1	695	761	90	132
49	1011	2	1	695	761	47	90
50	1012	2	1	695	761	6	48
51	1101	2	2	695	761	569	609
52	1102	2	2	695	761	525	567
53	1103	2	2	695	761	483	524
54	1104	2	2	695	761	420	462
55	1105	2	2	695	761	378	420
56	1106	2	2	695	761	335	379
57	1107	2	2	695	761	237	280
58	1108	2	2	695	761	195	238
59	1109	2	2	695	761	152	196
61	1111	2	2	695	761	47	90
62	1112	2	2	695	761	6	48
63	1201	2	3	695	761	569	609
64	1202	2	3	695	761	525	567
65	1203	2	3	695	761	483	524
66	1204	2	3	695	761	420	462
67	1205	2	3	695	761	378	420
68	1206	2	3	695	761	335	379
69	1207	2	3	695	761	237	280
70	1208	2	3	695	761	195	238
71	1209	2	3	695	761	152	196
72	1210	2	3	695	761	90	132
73	1211	2	3	695	761	47	90
74	1212	2	3	695	761	6	48
75	3001	2	1	381	431	456	500
76	3002	2	1	496	546	456	500
77	3003	2	1	381	465	369	398
78	3004	2	1	465	549	369	398
79	3005	2	1	381	465	340	368
80	3006	2	1	465	549	340	368
81	3007	2	1	381	465	309	338
82	3008	2	1	465	549	309	338
83	3009	2	1	381	465	279	308
84	3010	2	1	465	549	279	308
85	3011	2	1	381	465	249	278
86	3012	2	1	465	549	249	278
87	3013	2	1	381	465	217	248
88	3014	2	1	465	549	217	248
89	3101	2	2	381	431	456	500
90	3102	2	2	496	546	456	500
91	3103	2	2	381	465	369	398
92	3104	2	2	465	549	369	398
93	3105	2	2	381	465	340	368
94	3106	2	2	465	549	340	368
95	3107	2	2	381	465	309	338
96	3108	2	2	465	549	309	338
97	3109	2	2	381	465	279	308
98	3110	2	2	465	549	279	308
99	3111	2	2	381	465	249	278
100	3112	2	2	465	549	249	278
101	3113	2	2	381	465	217	248
102	3114	2	2	465	549	217	248
103	3201	2	3	381	431	456	500
104	3202	2	3	496	546	456	500
105	3203	2	3	381	465	369	398
106	3204	2	3	465	549	369	398
107	3205	2	3	381	465	340	368
108	3206	2	3	465	549	340	368
109	3207	2	3	381	465	309	338
110	3208	2	3	465	549	309	338
111	3209	2	3	381	465	279	308
112	3210	2	3	465	549	279	308
113	3211	2	3	381	465	249	278
114	3212	2	3	465	549	249	278
115	3213	2	3	381	465	217	248
116	3214	2	2	465	549	217	248
\.


--
-- Name: publications_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_location_id_seq', 1, false);


--
-- Data for Name: publications_locationtype; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_locationtype (id, name) FROM stdin;
1	Sala de Usos Múltiples
2	Salón
3	Laboratorio
4	Oficinas
5	Área Común
6	Baños
7	Salas de TT
\.


--
-- Name: publications_locationtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_locationtype_id_seq', 7, true);


--
-- Data for Name: publications_lostandfound; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_lostandfound (id, publication_id, "isLostType", "lostOrFoundDate", "lostOrFoundTime", "lastSeenLocation_id", reward, "isActive") FROM stdin;
1	5	t	2013-12-06	12:00:00	22	200.00	t
2	8	t	2013-12-05	13:00:00	20	100.00	t
\.


--
-- Name: publications_lostandfound_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_lostandfound_id_seq', 2, true);


--
-- Data for Name: publications_map; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_map (id, name, "imageUrl") FROM stdin;
1	ESCOM Piso 1	
2	ESCOM Piso 2	
3	ESCOM Planta Baja	
\.


--
-- Name: publications_map_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_map_id_seq', 3, true);


--
-- Data for Name: publications_publication; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_publication (id, title, content, type_id, published, "lastEdited", "imageUrl", author_id, hightlighted) FROM stdin;
1	Administrador de Centros de Cómputo	Habilidades de manejo : ORACLE 11 G, BD, UNIX, LINUX,  REDES,\r\n	4	2013-12-09 04:23:06.434278-06	2013-12-09 04:23:06.434318-06		2	f
2	Programador SR. Java	Habilidades, Contar con 2 años de experiencias, JAVA, .NET, UNIX, SUN, IBM, SQL,	4	2013-12-09 04:30:25.684909-06	2013-12-09 04:30:25.684948-06		3	f
3	Becario en Sistemas	Recién egresados de la carrera de ISC conocimientos básicos de BD, programación y diseño	4	2013-12-09 04:35:36.662107-06	2013-12-09 04:35:36.662148-06		2	f
4	Analista de Sitemas	Disponibilidad de tiempo, Analista de Sistemas en la Dirección de Apoyo a las Operaciones en Banco de México 	4	2013-12-09 04:40:30.173529-06	2013-12-09 04:40:30.173574-06		4	f
5	iPOD Classic extraviado	Se busca iPod Classic Color gris de 16 gb	2	2013-12-09 05:19:03.381702-06	2013-12-09 05:19:03.381746-06		9	f
6	libro de android	Vendo  El Gran Libro de Android, de Jesús Tomás Girones. 2da edición	3	2013-12-09 05:21:22.765496-06	2013-12-09 05:22:02.805927-06		9	f
7	Galaxy SII	Vendo Galaxy SII, semi-nuevo, en buenas condiciones	3	2013-12-09 05:25:17.948223-06	2013-12-09 05:25:17.948262-06		9	f
8	Memoria USB Kingston 8GB	Se busca USB Kingston 8GB color roja con llavero de flores, contiene info, importante	2	2013-12-09 05:28:25.815042-06	2013-12-09 05:28:25.815081-06		8	f
9	Vendo libro 	Grandes Esperanzas de Charles DIckens	3	2013-12-09 05:33:45.20501-06	2013-12-09 05:33:45.205053-06		8	f
10	Se vende material de electrónica	se vende diversidad de material de electronica en buen uso\r\n	3	2013-12-09 05:37:32.917635-06	2013-12-09 05:37:32.917675-06		8	f
\.


--
-- Name: publications_publication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_publication_id_seq', 10, true);


--
-- Data for Name: publications_publication_tags; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_publication_tags (id, publication_id, tag_id) FROM stdin;
1	1	1
2	2	1
3	3	3
4	3	4
5	4	1
6	4	4
7	5	8
9	6	9
10	6	7
11	7	10
12	7	11
13	8	7
14	9	9
15	9	7
16	10	7
\.


--
-- Name: publications_publication_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_publication_tags_id_seq', 16, true);


--
-- Data for Name: publications_publicationtype; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_publicationtype (id, name) FROM stdin;
1	Evento
2	Perdido/Encontrado
3	Compra/Venta
4	Oferta Laboral
5	Anuncio
6	Material
\.


--
-- Name: publications_publicationtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_publicationtype_id_seq', 6, true);


--
-- Data for Name: publications_schooldepartment; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_schooldepartment (id, name, manager, description, "serviceHours", "sdaeUser_id") FROM stdin;
\.


--
-- Name: publications_schooldepartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_schooldepartment_id_seq', 1, false);


--
-- Data for Name: publications_sdaeuser; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_sdaeuser (id, user_id, type_id, "profileImageUrl", "facebookUsername", "facebookAuthToken", "twitterUsername", "twitterAuthToken") FROM stdin;
1	1	1					
2	2	2	\N	\N	\N	\N	\N
3	3	2	\N	\N	\N	\N	\N
4	4	2	\N	\N	\N	\N	\N
5	5	5					
6	6	4					
7	9	3	\N	\N	\N	\N	\N
8	10	3	\N	\N	\N	\N	\N
9	11	3	\N	\N	\N	\N	\N
\.


--
-- Name: publications_sdaeuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_sdaeuser_id_seq', 9, true);


--
-- Data for Name: publications_student; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_student (id, "sdaeUser_id", "studentId", "startDate", "endDate") FROM stdin;
1	7	\N	\N	\N
2	8	\N	\N	\N
3	9	\N	\N	\N
\.


--
-- Name: publications_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_student_id_seq', 3, true);


--
-- Data for Name: publications_studentsclub; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_studentsclub (id, name, "teacherManager", "studentManager", description, website, "sdaeUser_id") FROM stdin;
\.


--
-- Name: publications_studentsclub_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_studentsclub_id_seq', 1, false);


--
-- Data for Name: publications_tag; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_tag (id, name) FROM stdin;
1	Desarrollador
2	Administrado de Base de Datos
3	Becarios
4	Trabajo
5	Conferencia
6	Eventos
7	ESCOM
8	iPOD Classic
9	libros
10	celular
11	Android
\.


--
-- Name: publications_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_tag_id_seq', 11, true);


--
-- Data for Name: publications_userteacher; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_userteacher (id, "sdaeUser_id", teacher_id, "teacherId") FROM stdin;
\.


--
-- Name: publications_userteacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_userteacher_id_seq', 1, false);


--
-- Data for Name: publications_usertype; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_usertype (id, name) FROM stdin;
1	Administrador
2	Empresa
3	Alumno
4	Maestro
5	Departamento Escolar
\.


--
-- Name: publications_usertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_usertype_id_seq', 5, true);


--
-- Data for Name: publications_vote; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY publications_vote (id, publication_id, author_id, "isPositive", "givenDateTime", "modifiedDateTime") FROM stdin;
\.


--
-- Name: publications_vote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('publications_vote_id_seq', 1, false);


--
-- Data for Name: schoolInfo_classsession; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY "schoolInfo_classsession" (id, course_id, location_id, day, hour) FROM stdin;
\.


--
-- Name: schoolInfo_classsession_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('"schoolInfo_classsession_id_seq"', 1, false);


--
-- Data for Name: schoolInfo_course; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY "schoolInfo_course" (id, teacher_id, subject_id, "scholarCycle", group_id) FROM stdin;
1	1	2	2014-01	2
\.


--
-- Name: schoolInfo_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('"schoolInfo_course_id_seq"', 1, true);


--
-- Data for Name: schoolInfo_group; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY "schoolInfo_group" (id, name) FROM stdin;
1	1CV1
2	1CM1
3	2CM1
4	2CV1
5	3CV1
6	3CM1
7	4CM1
8	4CV2
9	3CM3
10	2CM5
11	2CV4
12	1CM6
13	4CM4
14	4C
15	4CV3
16	5CM1
17	5CV1
18	1CM8
\.


--
-- Name: schoolInfo_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('"schoolInfo_group_id_seq"', 18, true);


--
-- Data for Name: schoolInfo_subject; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY "schoolInfo_subject" (id, name, description, "syllabusUrl", "theoryHours", "practicHours", credits, level, formation) FROM stdin;
1	Administración Financiera	Emplear  estrategias  que  promuevan  el  aprendizaje  significativo  y  el  trabajo  colaborativo.	subjectsSyllabus/administracionFinanciera.pdf	3.00	1.50	4.36	2	P
2	Bases de datos	Aplicar  la  estrategia  de  instrucción  programada  en  los  diversos  conceptos  básicos  de  los  sitemas  de  bases  de datos.\r\n	subjectsSyllabus/basesDatos.pdf	3.00	1.50	4.44	2	P
3	Cálculo	Manejar  las  herramientas  del  cálculo  para  resolver  problemas  de  aplicación  en  ingeniería  a  través  del  desarrollo  de ejercicios de manera sistemática, critica y reflexiva.\r\n	subjectsSyllabus/calculo.pdf	3.00	1.50	4.45	1	C
4	Arquitectura de Computadoras	Implementa arquitecturas básicas de computadoras, con base en un lenguaje de descripción de hardware (HDL).\r\n	subjectsSyllabus/arquitecturaComputadoras.pdf	3.00	1.50	4.39	3	P
5	Compiladores	Desarrolla un intérprete con base en herramientas generadoras de analizadores léxicos y sintácticos y\r\nprogramación orientada a objetos\r\n	subjectsSyllabus/compiladores.pdf	3.00	1.50	4.39	3	P
6	Estructuras de Datos	  Implementar  estructuras  de  datos  en  un  lenguaje  de  programación  de  alto  nivel  para \r\naplicarlas en la solución de problemas computacionales que requieran de ellas.\r\n	subjectsSyllabus/estructuraDatos.pdf	3.00	1.50	4.39	1	P
7	Gestión Empresarial	Gestiona organizaciones de innovación tecnológica con base en competencias gerenciales.\r\n	subjectsSyllabus/gestionEmpresarial.pdf	3.00	1.50	4.39	4	T
8	Matemáticas Discretas	Aplicar las principales estructuras algebraicas discretas para la solución de problemas relacionados con las ciencias de la computación.\r\n		4.50	1.50	5.85	1	C
9	Redes de Computadoras	Diseñar las topologías lógica y física de una red de computadoras LAN de acuerdo a los estándares \r\nEIA/TIA/ANSI, así como identificar los protocolos que permiten su funcionamiento. \r\n	subjectsSyllabus/redesComputadoras.pdf	3.00	1.50	4.46	2	P
10	Probabilidad y Estadística	Plantear  y  resolver  de manera  general  problemas  aleatorios  involucrados  con  los  sistemas  computacionales,  de manera particular y de forma interdisciplinaría.\r\n	subjectsSyllabus/probabilidadEstadistica.pdf	4.50	0.00	4.39	2	C
11	Física	Analizar  fenómenos  mecánicos  y  electromagnéticos  presentes  en  la  naturaleza,  con  el  fin  de  comprender  el funcionamiento  de  los  sistemas  físicos;  \r\n	subjectsSyllabus/fisica.pdf	3.00	1.50	4.39	1	C
12	Comunicación Oral y escrita	Comunicar experiencias de forma oral y escrita para expresarse correctamente en su ámbito personal y \r\nprofesional de manera colaborativa y cooperativa, a través de técnicas de comunicación efe\r\n	subjectsSyllabus/comunicacionOralEscrita.pdf	3.00	1.50	4.39	1	I
13	Ingeniería de Software	Elabora un sistema computacional de propósito específico con base en metodologías de Ingeniería de Software.\r\n	subjectsSyllabus/ingenieriaSoftware.pdf	3.00	1.50	4.39	3	P
\.


--
-- Name: schoolInfo_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('"schoolInfo_subject_id_seq"', 13, true);


--
-- Data for Name: schoolInfo_teacher; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY "schoolInfo_teacher" (id, name, lastname, "photoUrl", about, office_id, department, academy, website) FROM stdin;
1	Fabiola	Ocampo Botello	teachersPhotos/ipod_1.jpg	Profesora de Base de datos	30	DCIC	DCIC	
2	Didier	Ojeda Guillen	teachersPhotos/ipod_2.jpg	Profesor de la ESCOM	61	DFB	DFB	
3	Luz María	Sanchez García	teachersPhotos/ipod_3.jpg	Profesora del ESCOM	61	DCIC	DCIC	
4	Benjamín	Luna Benoso	teachersPhotos/ipod_4.jpg	Profesor de la ESCOM	62	DCIC	DCIC	
5	Serafin	Estrada Elizalde	teachersPhotos/ipod_5.jpg	Profesor de La ESCOM	43	DFII	DFII	
6	Jesus	Ortuño Araujo	teachersPhotos/ipod_6.jpg	Profesor de la ESCOM	74	DISC	DISC	
7	Claudia Celia	Díaz Huerta	teachersPhotos/ipod_7.jpg	Profesora de la ESCOM	43	DFII	DFII	
8	Raquel	Flores Delgado	teachersPhotos/ipod_8.jpg	Profesora de la ESCOM	66	DFB	DFB	
9	Jose Alfredo	Martínez Guerrero	teachersPhotos/ipod_9.jpg	Profesor de la ESCOM	16	DFB	DFB	
10	Rocío	Almazan Farfán	teachersPhotos/ipod_10.jpg	Profesora de la ESCOM	62	DCIC	DCIC	
11	Gelacio	Castillo Cabrera	teachersPhotos/ipod_11.jpg	Profesor de la ESCOM	62	DCIC	DCIC	
12	César Róman	Martínez García	teachersPhotos/ipod_12.jpg	Profesor de la ESCOM	89	DFB	DFB	
13	Flavio Arturo	Sanchez Garfias	teachersPhotos/ipod_13.jpg	Director de la ESCOM	59	DISC	DISC	
14	Ulises	Velez Saldaña	teachersPhotos/ipod_14.jpg	Profesor de la ESCOM	32	DISC	DISC	
15	Miriam	Pescador Rojas	teachersPhotos/ipod_15.jpg	Profesora de la ESCOM	74	DCIC	DCIC	
16	Axel Ernesto	Moreno Cervantes	teachersPhotos/ipod_16.jpg	Profesor de la ESCOM	61	DISC	DISC	
\.


--
-- Name: schoolInfo_teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('"schoolInfo_teacher_id_seq"', 16, true);


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('taggit_tag_id_seq', 1, false);


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: sdae
--

COPY taggit_taggeditem (id, tag_id, object_id, content_type_id) FROM stdin;
\.


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sdae
--

SELECT pg_catalog.setval('taggit_taggeditem_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: publications_advertisement_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_advertisement
    ADD CONSTRAINT publications_advertisement_pkey PRIMARY KEY (id);


--
-- Name: publications_advertisement_publication_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_advertisement
    ADD CONSTRAINT publications_advertisement_publication_id_key UNIQUE (publication_id);


--
-- Name: publications_buysell_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_buysell
    ADD CONSTRAINT publications_buysell_pkey PRIMARY KEY (id);


--
-- Name: publications_buysell_publication_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_buysell
    ADD CONSTRAINT publications_buysell_publication_id_key UNIQUE (publication_id);


--
-- Name: publications_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_comment
    ADD CONSTRAINT publications_comment_pkey PRIMARY KEY (id);


--
-- Name: publications_company_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_company
    ADD CONSTRAINT publications_company_pkey PRIMARY KEY (id);


--
-- Name: publications_company_sdaeUser_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_company
    ADD CONSTRAINT "publications_company_sdaeUser_id_key" UNIQUE ("sdaeUser_id");


--
-- Name: publications_coursematerial_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_coursematerial
    ADD CONSTRAINT publications_coursematerial_pkey PRIMARY KEY (id);


--
-- Name: publications_coursematerial_publication_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_coursematerial
    ADD CONSTRAINT publications_coursematerial_publication_id_key UNIQUE (publication_id);


--
-- Name: publications_event_host_event_id_sdaeuser_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_event_host
    ADD CONSTRAINT publications_event_host_event_id_sdaeuser_id_key UNIQUE (event_id, sdaeuser_id);


--
-- Name: publications_event_host_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_event_host
    ADD CONSTRAINT publications_event_host_pkey PRIMARY KEY (id);


--
-- Name: publications_event_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_event
    ADD CONSTRAINT publications_event_pkey PRIMARY KEY (id);


--
-- Name: publications_event_publication_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_event
    ADD CONSTRAINT publications_event_publication_id_key UNIQUE (publication_id);


--
-- Name: publications_joboffer_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_joboffer
    ADD CONSTRAINT publications_joboffer_pkey PRIMARY KEY (id);


--
-- Name: publications_joboffer_publication_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_joboffer
    ADD CONSTRAINT publications_joboffer_publication_id_key UNIQUE (publication_id);


--
-- Name: publications_jobtype_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_jobtype
    ADD CONSTRAINT publications_jobtype_pkey PRIMARY KEY (id);


--
-- Name: publications_location_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_location
    ADD CONSTRAINT publications_location_pkey PRIMARY KEY (id);


--
-- Name: publications_locationtype_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_locationtype
    ADD CONSTRAINT publications_locationtype_pkey PRIMARY KEY (id);


--
-- Name: publications_lostandfound_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_lostandfound
    ADD CONSTRAINT publications_lostandfound_pkey PRIMARY KEY (id);


--
-- Name: publications_lostandfound_publication_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_lostandfound
    ADD CONSTRAINT publications_lostandfound_publication_id_key UNIQUE (publication_id);


--
-- Name: publications_map_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_map
    ADD CONSTRAINT publications_map_pkey PRIMARY KEY (id);


--
-- Name: publications_publication_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_publication
    ADD CONSTRAINT publications_publication_pkey PRIMARY KEY (id);


--
-- Name: publications_publication_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_publication_tags
    ADD CONSTRAINT publications_publication_tags_pkey PRIMARY KEY (id);


--
-- Name: publications_publication_tags_publication_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_publication_tags
    ADD CONSTRAINT publications_publication_tags_publication_id_tag_id_key UNIQUE (publication_id, tag_id);


--
-- Name: publications_publicationtype_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_publicationtype
    ADD CONSTRAINT publications_publicationtype_pkey PRIMARY KEY (id);


--
-- Name: publications_schooldepartment_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_schooldepartment
    ADD CONSTRAINT publications_schooldepartment_pkey PRIMARY KEY (id);


--
-- Name: publications_schooldepartment_sdaeUser_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_schooldepartment
    ADD CONSTRAINT "publications_schooldepartment_sdaeUser_id_key" UNIQUE ("sdaeUser_id");


--
-- Name: publications_sdaeuser_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_sdaeuser
    ADD CONSTRAINT publications_sdaeuser_pkey PRIMARY KEY (id);


--
-- Name: publications_sdaeuser_user_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_sdaeuser
    ADD CONSTRAINT publications_sdaeuser_user_id_key UNIQUE (user_id);


--
-- Name: publications_student_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_student
    ADD CONSTRAINT publications_student_pkey PRIMARY KEY (id);


--
-- Name: publications_student_sdaeUser_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_student
    ADD CONSTRAINT "publications_student_sdaeUser_id_key" UNIQUE ("sdaeUser_id");


--
-- Name: publications_studentsclub_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_studentsclub
    ADD CONSTRAINT publications_studentsclub_pkey PRIMARY KEY (id);


--
-- Name: publications_studentsclub_sdaeUser_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_studentsclub
    ADD CONSTRAINT "publications_studentsclub_sdaeUser_id_key" UNIQUE ("sdaeUser_id");


--
-- Name: publications_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_tag
    ADD CONSTRAINT publications_tag_pkey PRIMARY KEY (id);


--
-- Name: publications_userteacher_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_userteacher
    ADD CONSTRAINT publications_userteacher_pkey PRIMARY KEY (id);


--
-- Name: publications_userteacher_sdaeUser_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_userteacher
    ADD CONSTRAINT "publications_userteacher_sdaeUser_id_key" UNIQUE ("sdaeUser_id");


--
-- Name: publications_userteacher_teacher_id_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_userteacher
    ADD CONSTRAINT publications_userteacher_teacher_id_key UNIQUE (teacher_id);


--
-- Name: publications_usertype_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_usertype
    ADD CONSTRAINT publications_usertype_pkey PRIMARY KEY (id);


--
-- Name: publications_vote_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY publications_vote
    ADD CONSTRAINT publications_vote_pkey PRIMARY KEY (id);


--
-- Name: schoolInfo_classsession_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY "schoolInfo_classsession"
    ADD CONSTRAINT "schoolInfo_classsession_pkey" PRIMARY KEY (id);


--
-- Name: schoolInfo_course_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY "schoolInfo_course"
    ADD CONSTRAINT "schoolInfo_course_pkey" PRIMARY KEY (id);


--
-- Name: schoolInfo_group_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY "schoolInfo_group"
    ADD CONSTRAINT "schoolInfo_group_pkey" PRIMARY KEY (id);


--
-- Name: schoolInfo_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY "schoolInfo_subject"
    ADD CONSTRAINT "schoolInfo_subject_pkey" PRIMARY KEY (id);


--
-- Name: schoolInfo_teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY "schoolInfo_teacher"
    ADD CONSTRAINT "schoolInfo_teacher_pkey" PRIMARY KEY (id);


--
-- Name: taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: sdae; Tablespace: 
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: publications_comment_author_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX publications_comment_author_id ON publications_comment USING btree (author_id);


--
-- Name: publications_comment_publication_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX publications_comment_publication_id ON publications_comment USING btree (publication_id);


--
-- Name: publications_event_host_event_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX publications_event_host_event_id ON publications_event_host USING btree (event_id);


--
-- Name: publications_event_host_sdaeuser_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX publications_event_host_sdaeuser_id ON publications_event_host USING btree (sdaeuser_id);


--
-- Name: publications_event_location_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX publications_event_location_id ON publications_event USING btree (location_id);


--
-- Name: publications_event_parentEvent_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX "publications_event_parentEvent_id" ON publications_event USING btree ("parentEvent_id");


--
-- Name: publications_joboffer_company_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX publications_joboffer_company_id ON publications_joboffer USING btree (company_id);


--
-- Name: publications_location_map_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX publications_location_map_id ON publications_location USING btree (map_id);


--
-- Name: publications_location_type_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX publications_location_type_id ON publications_location USING btree (type_id);


--
-- Name: publications_lostandfound_lastSeenLocation_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX "publications_lostandfound_lastSeenLocation_id" ON publications_lostandfound USING btree ("lastSeenLocation_id");


--
-- Name: publications_publication_author_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX publications_publication_author_id ON publications_publication USING btree (author_id);


--
-- Name: publications_publication_tags_publication_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX publications_publication_tags_publication_id ON publications_publication_tags USING btree (publication_id);


--
-- Name: publications_publication_tags_tag_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX publications_publication_tags_tag_id ON publications_publication_tags USING btree (tag_id);


--
-- Name: publications_publication_type_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX publications_publication_type_id ON publications_publication USING btree (type_id);


--
-- Name: publications_sdaeuser_type_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX publications_sdaeuser_type_id ON publications_sdaeuser USING btree (type_id);


--
-- Name: publications_vote_author_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX publications_vote_author_id ON publications_vote USING btree (author_id);


--
-- Name: publications_vote_publication_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX publications_vote_publication_id ON publications_vote USING btree (publication_id);


--
-- Name: schoolInfo_classsession_course_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX "schoolInfo_classsession_course_id" ON "schoolInfo_classsession" USING btree (course_id);


--
-- Name: schoolInfo_classsession_location_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX "schoolInfo_classsession_location_id" ON "schoolInfo_classsession" USING btree (location_id);


--
-- Name: schoolInfo_course_group_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX "schoolInfo_course_group_id" ON "schoolInfo_course" USING btree (group_id);


--
-- Name: schoolInfo_course_subject_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX "schoolInfo_course_subject_id" ON "schoolInfo_course" USING btree (subject_id);


--
-- Name: schoolInfo_course_teacher_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX "schoolInfo_course_teacher_id" ON "schoolInfo_course" USING btree (teacher_id);


--
-- Name: schoolInfo_teacher_office_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX "schoolInfo_teacher_office_id" ON "schoolInfo_teacher" USING btree (office_id);


--
-- Name: taggit_tag_name_like; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX taggit_tag_name_like ON taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_like; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX taggit_tag_slug_like ON taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX taggit_taggeditem_content_type_id ON taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_object_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX taggit_taggeditem_object_id ON taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id; Type: INDEX; Schema: public; Owner: sdae; Tablespace: 
--

CREATE INDEX taggit_taggeditem_tag_id ON taggit_taggeditem USING btree (tag_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_93d2d1f8; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_93d2d1f8 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_id_refs_id_ba3e5fc9; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_event_host
    ADD CONSTRAINT event_id_refs_id_ba3e5fc9 FOREIGN KEY (event_id) REFERENCES publications_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publication_id_refs_id_d3a75b9f; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_publication_tags
    ADD CONSTRAINT publication_id_refs_id_d3a75b9f FOREIGN KEY (publication_id) REFERENCES publications_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_advertisement_publication_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_advertisement
    ADD CONSTRAINT publications_advertisement_publication_id_fkey FOREIGN KEY (publication_id) REFERENCES publications_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_buysell_publication_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_buysell
    ADD CONSTRAINT publications_buysell_publication_id_fkey FOREIGN KEY (publication_id) REFERENCES publications_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_comment_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_comment
    ADD CONSTRAINT publications_comment_author_id_fkey FOREIGN KEY (author_id) REFERENCES publications_sdaeuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_comment_publication_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_comment
    ADD CONSTRAINT publications_comment_publication_id_fkey FOREIGN KEY (publication_id) REFERENCES publications_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_company_sdaeUser_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_company
    ADD CONSTRAINT "publications_company_sdaeUser_id_fkey" FOREIGN KEY ("sdaeUser_id") REFERENCES publications_sdaeuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_coursematerial_publication_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_coursematerial
    ADD CONSTRAINT publications_coursematerial_publication_id_fkey FOREIGN KEY (publication_id) REFERENCES publications_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_event_host_sdaeuser_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_event_host
    ADD CONSTRAINT publications_event_host_sdaeuser_id_fkey FOREIGN KEY (sdaeuser_id) REFERENCES publications_sdaeuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_event_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_event
    ADD CONSTRAINT publications_event_location_id_fkey FOREIGN KEY (location_id) REFERENCES publications_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_event_parentEvent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_event
    ADD CONSTRAINT "publications_event_parentEvent_id_fkey" FOREIGN KEY ("parentEvent_id") REFERENCES publications_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_event_publication_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_event
    ADD CONSTRAINT publications_event_publication_id_fkey FOREIGN KEY (publication_id) REFERENCES publications_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_joboffer_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_joboffer
    ADD CONSTRAINT publications_joboffer_company_id_fkey FOREIGN KEY (company_id) REFERENCES publications_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_joboffer_publication_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_joboffer
    ADD CONSTRAINT publications_joboffer_publication_id_fkey FOREIGN KEY (publication_id) REFERENCES publications_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_location_map_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_location
    ADD CONSTRAINT publications_location_map_id_fkey FOREIGN KEY (map_id) REFERENCES publications_map(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_location_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_location
    ADD CONSTRAINT publications_location_type_id_fkey FOREIGN KEY (type_id) REFERENCES publications_locationtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_lostandfound_lastSeenLocation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_lostandfound
    ADD CONSTRAINT "publications_lostandfound_lastSeenLocation_id_fkey" FOREIGN KEY ("lastSeenLocation_id") REFERENCES publications_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_lostandfound_publication_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_lostandfound
    ADD CONSTRAINT publications_lostandfound_publication_id_fkey FOREIGN KEY (publication_id) REFERENCES publications_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_publication_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_publication
    ADD CONSTRAINT publications_publication_author_id_fkey FOREIGN KEY (author_id) REFERENCES publications_sdaeuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_publication_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_publication_tags
    ADD CONSTRAINT publications_publication_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES publications_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_publication_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_publication
    ADD CONSTRAINT publications_publication_type_id_fkey FOREIGN KEY (type_id) REFERENCES publications_publicationtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_schooldepartment_sdaeUser_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_schooldepartment
    ADD CONSTRAINT "publications_schooldepartment_sdaeUser_id_fkey" FOREIGN KEY ("sdaeUser_id") REFERENCES publications_sdaeuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_sdaeuser_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_sdaeuser
    ADD CONSTRAINT publications_sdaeuser_type_id_fkey FOREIGN KEY (type_id) REFERENCES publications_usertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_sdaeuser_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_sdaeuser
    ADD CONSTRAINT publications_sdaeuser_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_student_sdaeUser_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_student
    ADD CONSTRAINT "publications_student_sdaeUser_id_fkey" FOREIGN KEY ("sdaeUser_id") REFERENCES publications_sdaeuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_studentsclub_sdaeUser_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_studentsclub
    ADD CONSTRAINT "publications_studentsclub_sdaeUser_id_fkey" FOREIGN KEY ("sdaeUser_id") REFERENCES publications_sdaeuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_userteacher_sdaeUser_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_userteacher
    ADD CONSTRAINT "publications_userteacher_sdaeUser_id_fkey" FOREIGN KEY ("sdaeUser_id") REFERENCES publications_sdaeuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_vote_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_vote
    ADD CONSTRAINT publications_vote_author_id_fkey FOREIGN KEY (author_id) REFERENCES publications_sdaeuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publications_vote_publication_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_vote
    ADD CONSTRAINT publications_vote_publication_id_fkey FOREIGN KEY (publication_id) REFERENCES publications_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schoolInfo_classsession_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY "schoolInfo_classsession"
    ADD CONSTRAINT "schoolInfo_classsession_course_id_fkey" FOREIGN KEY (course_id) REFERENCES "schoolInfo_course"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schoolInfo_classsession_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY "schoolInfo_classsession"
    ADD CONSTRAINT "schoolInfo_classsession_location_id_fkey" FOREIGN KEY (location_id) REFERENCES publications_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schoolInfo_course_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY "schoolInfo_course"
    ADD CONSTRAINT "schoolInfo_course_group_id_fkey" FOREIGN KEY (group_id) REFERENCES "schoolInfo_group"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schoolInfo_course_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY "schoolInfo_course"
    ADD CONSTRAINT "schoolInfo_course_subject_id_fkey" FOREIGN KEY (subject_id) REFERENCES "schoolInfo_subject"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schoolInfo_course_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY "schoolInfo_course"
    ADD CONSTRAINT "schoolInfo_course_teacher_id_fkey" FOREIGN KEY (teacher_id) REFERENCES "schoolInfo_teacher"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schoolInfo_teacher_office_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY "schoolInfo_teacher"
    ADD CONSTRAINT "schoolInfo_teacher_office_id_fkey" FOREIGN KEY (office_id) REFERENCES publications_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teacher_id_refs_id_7e396563; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY publications_userteacher
    ADD CONSTRAINT teacher_id_refs_id_7e396563 FOREIGN KEY (teacher_id) REFERENCES "schoolInfo_teacher"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_c0d12874; Type: FK CONSTRAINT; Schema: public; Owner: sdae
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_c0d12874 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

