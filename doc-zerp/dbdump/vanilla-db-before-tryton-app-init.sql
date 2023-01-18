--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6
-- Dumped by pg_dump version 14.6

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
-- Name: ir_action_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_action_id_seq OWNER TO tryton;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ir_action; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_action (
    id integer DEFAULT nextval('public.ir_action_id_seq'::regclass) NOT NULL,
    active boolean DEFAULT false,
    create_date timestamp(6) without time zone,
    create_uid integer,
    icon integer,
    name character varying NOT NULL,
    records character varying,
    type character varying NOT NULL,
    usage character varying,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_action_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_action OWNER TO tryton;

--
-- Name: TABLE ir_action; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_action IS 'Action';


--
-- Name: ir_action-res_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public."ir_action-res_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ir_action-res_group_id_seq" OWNER TO tryton;

--
-- Name: ir_action-res_group; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public."ir_action-res_group" (
    id integer DEFAULT nextval('public."ir_action-res_group_id_seq"'::regclass) NOT NULL,
    action integer NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    "group" integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT "ir_action-res_group_id_positive" CHECK ((id >= 0))
);


ALTER TABLE public."ir_action-res_group" OWNER TO tryton;

--
-- Name: TABLE "ir_action-res_group"; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public."ir_action-res_group" IS 'Action - Group';


--
-- Name: ir_action_act_window_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_action_act_window_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_action_act_window_id_seq OWNER TO tryton;

--
-- Name: ir_action_act_window; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_action_act_window (
    id integer DEFAULT nextval('public.ir_action_act_window_id_seq'::regclass) NOT NULL,
    action integer NOT NULL,
    context character varying,
    context_domain character varying,
    context_model character varying,
    create_date timestamp(6) without time zone,
    create_uid integer,
    domain character varying,
    "limit" integer,
    "order" character varying,
    res_model character varying,
    search_value character varying,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_action_act_window_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_action_act_window OWNER TO tryton;

--
-- Name: TABLE ir_action_act_window; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_action_act_window IS 'Action act window';


--
-- Name: ir_action_act_window_domain_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_action_act_window_domain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_action_act_window_domain_id_seq OWNER TO tryton;

--
-- Name: ir_action_act_window_domain; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_action_act_window_domain (
    id integer DEFAULT nextval('public.ir_action_act_window_domain_id_seq'::regclass) NOT NULL,
    act_window integer NOT NULL,
    active boolean DEFAULT false,
    count boolean DEFAULT false,
    create_date timestamp(6) without time zone,
    create_uid integer,
    domain character varying,
    name character varying,
    sequence integer,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_action_act_window_domain_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_action_act_window_domain OWNER TO tryton;

--
-- Name: TABLE ir_action_act_window_domain; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_action_act_window_domain IS 'Action act window domain';


--
-- Name: ir_action_act_window_view_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_action_act_window_view_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_action_act_window_view_id_seq OWNER TO tryton;

--
-- Name: ir_action_act_window_view; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_action_act_window_view (
    id integer DEFAULT nextval('public.ir_action_act_window_view_id_seq'::regclass) NOT NULL,
    act_window integer,
    active boolean DEFAULT false,
    create_date timestamp(6) without time zone,
    create_uid integer,
    sequence integer,
    view integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_action_act_window_view_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_action_act_window_view OWNER TO tryton;

--
-- Name: TABLE ir_action_act_window_view; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_action_act_window_view IS 'Action act window view';


--
-- Name: ir_action_keyword_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_action_keyword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_action_keyword_id_seq OWNER TO tryton;

--
-- Name: ir_action_keyword; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_action_keyword (
    id integer DEFAULT nextval('public.ir_action_keyword_id_seq'::regclass) NOT NULL,
    action integer,
    create_date timestamp(6) without time zone,
    create_uid integer,
    keyword character varying NOT NULL,
    model character varying,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_action_keyword_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_action_keyword OWNER TO tryton;

--
-- Name: TABLE ir_action_keyword; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_action_keyword IS 'Action keyword';


--
-- Name: ir_action_report_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_action_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_action_report_id_seq OWNER TO tryton;

--
-- Name: ir_action_report; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_action_report (
    id integer DEFAULT nextval('public.ir_action_report_id_seq'::regclass) NOT NULL,
    action integer NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    direct_print boolean DEFAULT false,
    extension character varying,
    model character varying,
    module character varying,
    record_name character varying,
    report character varying,
    report_content_custom bytea,
    report_name character varying NOT NULL,
    single boolean DEFAULT false,
    template_extension character varying NOT NULL,
    translatable boolean DEFAULT false,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_action_report_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_action_report OWNER TO tryton;

--
-- Name: TABLE ir_action_report; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_action_report IS 'Action report';


--
-- Name: ir_action_url_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_action_url_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_action_url_id_seq OWNER TO tryton;

--
-- Name: ir_action_url; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_action_url (
    id integer DEFAULT nextval('public.ir_action_url_id_seq'::regclass) NOT NULL,
    action integer NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    url character varying NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_action_url_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_action_url OWNER TO tryton;

--
-- Name: TABLE ir_action_url; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_action_url IS 'Action URL';


--
-- Name: ir_action_wizard_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_action_wizard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_action_wizard_id_seq OWNER TO tryton;

--
-- Name: ir_action_wizard; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_action_wizard (
    id integer DEFAULT nextval('public.ir_action_wizard_id_seq'::regclass) NOT NULL,
    action integer NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    model character varying,
    "window" boolean DEFAULT false,
    wiz_name character varying NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_action_wizard_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_action_wizard OWNER TO tryton;

--
-- Name: TABLE ir_action_wizard; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_action_wizard IS 'Action wizard';


--
-- Name: ir_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_attachment_id_seq OWNER TO tryton;

--
-- Name: ir_attachment; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_attachment (
    id integer DEFAULT nextval('public.ir_attachment_id_seq'::regclass) NOT NULL,
    copy_to_resources character varying,
    create_date timestamp(6) without time zone,
    create_uid integer,
    data bytea,
    description text,
    file_id character varying,
    link character varying,
    name character varying NOT NULL,
    resource character varying NOT NULL,
    type character varying NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_attachment_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_attachment OWNER TO tryton;

--
-- Name: TABLE ir_attachment; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_attachment IS 'Attachment';


--
-- Name: ir_avatar_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_avatar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_avatar_id_seq OWNER TO tryton;

--
-- Name: ir_avatar; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_avatar (
    id integer DEFAULT nextval('public.ir_avatar_id_seq'::regclass) NOT NULL,
    copy_to_resources character varying,
    create_date timestamp(6) without time zone,
    create_uid integer,
    image bytea,
    image_id character varying,
    resource character varying NOT NULL,
    uuid character varying NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer
);


ALTER TABLE public.ir_avatar OWNER TO tryton;

--
-- Name: TABLE ir_avatar; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_avatar IS 'Avatar';


--
-- Name: ir_avatar_cache_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_avatar_cache_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_avatar_cache_id_seq OWNER TO tryton;

--
-- Name: ir_avatar_cache; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_avatar_cache (
    id integer DEFAULT nextval('public.ir_avatar_cache_id_seq'::regclass) NOT NULL,
    avatar integer NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    image bytea,
    image_id character varying,
    size integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer
);


ALTER TABLE public.ir_avatar_cache OWNER TO tryton;

--
-- Name: TABLE ir_avatar_cache; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_avatar_cache IS 'Avatar Cache';


--
-- Name: ir_cache_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_cache_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_cache_id_seq OWNER TO tryton;

--
-- Name: ir_cache; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_cache (
    id integer DEFAULT nextval('public.ir_cache_id_seq'::regclass) NOT NULL,
    name character varying NOT NULL,
    "timestamp" timestamp without time zone,
    create_date timestamp(6) without time zone,
    create_uid integer,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_cache_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_cache OWNER TO tryton;

--
-- Name: TABLE ir_cache; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_cache IS 'Cache';


--
-- Name: ir_calendar_day_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_calendar_day_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_calendar_day_id_seq OWNER TO tryton;

--
-- Name: ir_calendar_day; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_calendar_day (
    id integer DEFAULT nextval('public.ir_calendar_day_id_seq'::regclass) NOT NULL,
    abbreviation character varying NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    index integer NOT NULL,
    name character varying NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer
);


ALTER TABLE public.ir_calendar_day OWNER TO tryton;

--
-- Name: TABLE ir_calendar_day; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_calendar_day IS 'Day';


--
-- Name: ir_calendar_month_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_calendar_month_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_calendar_month_id_seq OWNER TO tryton;

--
-- Name: ir_calendar_month; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_calendar_month (
    id integer DEFAULT nextval('public.ir_calendar_month_id_seq'::regclass) NOT NULL,
    abbreviation character varying NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    index integer NOT NULL,
    name character varying NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer
);


ALTER TABLE public.ir_calendar_month OWNER TO tryton;

--
-- Name: TABLE ir_calendar_month; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_calendar_month IS 'Month';


--
-- Name: ir_configuration_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_configuration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_configuration_id_seq OWNER TO tryton;

--
-- Name: ir_configuration; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_configuration (
    id integer DEFAULT nextval('public.ir_configuration_id_seq'::regclass) NOT NULL,
    language character varying,
    hostname character varying,
    create_date timestamp(6) without time zone,
    create_uid integer,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_configuration_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_configuration OWNER TO tryton;

--
-- Name: TABLE ir_configuration; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_configuration IS 'Configuration';


--
-- Name: ir_cron_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_cron_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_cron_id_seq OWNER TO tryton;

--
-- Name: ir_cron; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_cron (
    id integer DEFAULT nextval('public.ir_cron_id_seq'::regclass) NOT NULL,
    active boolean DEFAULT false,
    create_date timestamp(6) without time zone,
    create_uid integer,
    day integer,
    hour integer,
    interval_number integer NOT NULL,
    interval_type character varying NOT NULL,
    method character varying NOT NULL,
    minute integer,
    next_call timestamp(0) without time zone,
    weekday integer,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_cron_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_cron OWNER TO tryton;

--
-- Name: TABLE ir_cron; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_cron IS 'Cron';


--
-- Name: ir_email_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_email_id_seq OWNER TO tryton;

--
-- Name: ir_email; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_email (
    id integer DEFAULT nextval('public.ir_email_id_seq'::regclass) NOT NULL,
    body text,
    create_date timestamp(6) without time zone,
    create_uid integer,
    recipients character varying,
    recipients_hidden character varying,
    recipients_secondary character varying,
    resource character varying NOT NULL,
    subject character varying,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_email_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_email OWNER TO tryton;

--
-- Name: TABLE ir_email; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_email IS 'Email';


--
-- Name: ir_email_address_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_email_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_email_address_id_seq OWNER TO tryton;

--
-- Name: ir_email_address; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_email_address (
    id integer DEFAULT nextval('public.ir_email_address_id_seq'::regclass) NOT NULL,
    address character varying NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    email integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_email_address_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_email_address OWNER TO tryton;

--
-- Name: TABLE ir_email_address; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_email_address IS 'Email Address';


--
-- Name: ir_email_template_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_email_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_email_template_id_seq OWNER TO tryton;

--
-- Name: ir_email_template; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_email_template (
    id integer DEFAULT nextval('public.ir_email_template_id_seq'::regclass) NOT NULL,
    body text,
    create_date timestamp(6) without time zone,
    create_uid integer,
    model integer NOT NULL,
    name character varying NOT NULL,
    recipients integer,
    recipients_hidden integer,
    recipients_hidden_pyson character varying,
    recipients_pyson character varying,
    recipients_secondary integer,
    recipients_secondary_pyson character varying,
    subject character varying,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_email_template_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_email_template OWNER TO tryton;

--
-- Name: TABLE ir_email_template; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_email_template IS 'Email Template';


--
-- Name: ir_email_template-ir_action_report_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public."ir_email_template-ir_action_report_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ir_email_template-ir_action_report_id_seq" OWNER TO tryton;

--
-- Name: ir_email_template-ir_action_report; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public."ir_email_template-ir_action_report" (
    id integer DEFAULT nextval('public."ir_email_template-ir_action_report_id_seq"'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    report integer NOT NULL,
    template integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT "ir_email_template-ir_action_report_id_positive" CHECK ((id >= 0))
);


ALTER TABLE public."ir_email_template-ir_action_report" OWNER TO tryton;

--
-- Name: TABLE "ir_email_template-ir_action_report"; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public."ir_email_template-ir_action_report" IS 'Email Template - Report';


--
-- Name: ir_error_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_error_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_error_id_seq OWNER TO tryton;

--
-- Name: ir_error; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_error (
    id integer DEFAULT nextval('public.ir_error_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    description text,
    message text,
    origin character varying,
    processed_by integer,
    solved_by integer,
    state character varying,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_error_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_error OWNER TO tryton;

--
-- Name: TABLE ir_error; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_error IS 'Error';


--
-- Name: ir_export_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_export_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_export_id_seq OWNER TO tryton;

--
-- Name: ir_export; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_export (
    id integer DEFAULT nextval('public.ir_export_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    header boolean DEFAULT false,
    name character varying,
    resource character varying,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_export_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_export OWNER TO tryton;

--
-- Name: TABLE ir_export; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_export IS 'Export';


--
-- Name: ir_export-res_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public."ir_export-res_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ir_export-res_group_id_seq" OWNER TO tryton;

--
-- Name: ir_export-res_group; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public."ir_export-res_group" (
    id integer DEFAULT nextval('public."ir_export-res_group_id_seq"'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    export integer NOT NULL,
    "group" integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT "ir_export-res_group_id_positive" CHECK ((id >= 0))
);


ALTER TABLE public."ir_export-res_group" OWNER TO tryton;

--
-- Name: TABLE "ir_export-res_group"; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public."ir_export-res_group" IS 'Export Group';


--
-- Name: ir_export-write-res_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public."ir_export-write-res_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ir_export-write-res_group_id_seq" OWNER TO tryton;

--
-- Name: ir_export-write-res_group; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public."ir_export-write-res_group" (
    id integer DEFAULT nextval('public."ir_export-write-res_group_id_seq"'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    export integer NOT NULL,
    "group" integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT "ir_export-write-res_group_id_positive" CHECK ((id >= 0))
);


ALTER TABLE public."ir_export-write-res_group" OWNER TO tryton;

--
-- Name: TABLE "ir_export-write-res_group"; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public."ir_export-write-res_group" IS 'Export Modification Group';


--
-- Name: ir_export_line_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_export_line_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_export_line_id_seq OWNER TO tryton;

--
-- Name: ir_export_line; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_export_line (
    id integer DEFAULT nextval('public.ir_export_line_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    export integer NOT NULL,
    name character varying,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_export_line_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_export_line OWNER TO tryton;

--
-- Name: TABLE ir_export_line; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_export_line IS 'Export line';


--
-- Name: ir_lang_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_lang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_lang_id_seq OWNER TO tryton;

--
-- Name: ir_lang; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_lang (
    id integer DEFAULT nextval('public.ir_lang_id_seq'::regclass) NOT NULL,
    name character varying NOT NULL,
    code character varying NOT NULL,
    translatable boolean DEFAULT false,
    parent character varying,
    active boolean DEFAULT false,
    direction character varying NOT NULL,
    am character varying,
    create_date timestamp(6) without time zone,
    create_uid integer,
    date character varying NOT NULL,
    decimal_point character varying NOT NULL,
    "grouping" character varying NOT NULL,
    mon_decimal_point character varying NOT NULL,
    mon_grouping character varying NOT NULL,
    mon_thousands_sep character varying,
    n_cs_precedes boolean DEFAULT false,
    n_sep_by_space boolean DEFAULT false,
    n_sign_posn integer NOT NULL,
    negative_sign character varying,
    p_cs_precedes boolean DEFAULT false,
    p_sep_by_space boolean DEFAULT false,
    p_sign_posn integer NOT NULL,
    pg_text_search character varying,
    pm character varying,
    positive_sign character varying,
    thousands_sep character varying,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_lang_check_decimal_point_thousands_sep CHECK (((decimal_point)::text <> (thousands_sep)::text)),
    CONSTRAINT ir_lang_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_lang OWNER TO tryton;

--
-- Name: TABLE ir_lang; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_lang IS 'Language';


--
-- Name: ir_message_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_message_id_seq OWNER TO tryton;

--
-- Name: ir_message; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_message (
    id integer DEFAULT nextval('public.ir_message_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    text text NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_message_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_message OWNER TO tryton;

--
-- Name: TABLE ir_message; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_message IS 'Message';


--
-- Name: ir_model_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_model_id_seq OWNER TO tryton;

--
-- Name: ir_model; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_model (
    id integer DEFAULT nextval('public.ir_model_id_seq'::regclass) NOT NULL,
    model character varying NOT NULL,
    name character varying,
    info text,
    module character varying,
    create_date timestamp(6) without time zone,
    create_uid integer,
    global_search_p boolean DEFAULT false,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_model_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_model OWNER TO tryton;

--
-- Name: TABLE ir_model; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_model IS 'Model';


--
-- Name: ir_model_access_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_model_access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_model_access_id_seq OWNER TO tryton;

--
-- Name: ir_model_access; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_model_access (
    id integer DEFAULT nextval('public.ir_model_access_id_seq'::regclass) NOT NULL,
    active boolean DEFAULT false,
    create_date timestamp(6) without time zone,
    create_uid integer,
    description text,
    "group" integer,
    model integer NOT NULL,
    perm_create boolean DEFAULT false,
    perm_delete boolean DEFAULT false,
    perm_read boolean DEFAULT false,
    perm_write boolean DEFAULT false,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_model_access_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_model_access OWNER TO tryton;

--
-- Name: TABLE ir_model_access; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_model_access IS 'Model access';


--
-- Name: ir_model_button_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_model_button_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_model_button_id_seq OWNER TO tryton;

--
-- Name: ir_model_button; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_model_button (
    id integer DEFAULT nextval('public.ir_model_button_id_seq'::regclass) NOT NULL,
    active boolean DEFAULT false,
    confirm text,
    create_date timestamp(6) without time zone,
    create_uid integer,
    help text,
    model integer NOT NULL,
    name character varying NOT NULL,
    string character varying,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_model_button_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_model_button OWNER TO tryton;

--
-- Name: TABLE ir_model_button; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_model_button IS 'Model Button';


--
-- Name: ir_model_button-button_reset_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public."ir_model_button-button_reset_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ir_model_button-button_reset_id_seq" OWNER TO tryton;

--
-- Name: ir_model_button-button_reset; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public."ir_model_button-button_reset" (
    id integer DEFAULT nextval('public."ir_model_button-button_reset_id_seq"'::regclass) NOT NULL,
    button integer NOT NULL,
    button_ruled integer NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT "ir_model_button-button_reset_id_positive" CHECK ((id >= 0))
);


ALTER TABLE public."ir_model_button-button_reset" OWNER TO tryton;

--
-- Name: TABLE "ir_model_button-button_reset"; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public."ir_model_button-button_reset" IS 'Model Button Reset';


--
-- Name: ir_model_button-res_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public."ir_model_button-res_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ir_model_button-res_group_id_seq" OWNER TO tryton;

--
-- Name: ir_model_button-res_group; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public."ir_model_button-res_group" (
    id integer DEFAULT nextval('public."ir_model_button-res_group_id_seq"'::regclass) NOT NULL,
    active boolean DEFAULT false,
    button integer NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    "group" integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT "ir_model_button-res_group_id_positive" CHECK ((id >= 0))
);


ALTER TABLE public."ir_model_button-res_group" OWNER TO tryton;

--
-- Name: TABLE "ir_model_button-res_group"; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public."ir_model_button-res_group" IS 'Model Button - Group';


--
-- Name: ir_model_button_click_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_model_button_click_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_model_button_click_id_seq OWNER TO tryton;

--
-- Name: ir_model_button_click; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_model_button_click (
    id integer DEFAULT nextval('public.ir_model_button_click_id_seq'::regclass) NOT NULL,
    active boolean DEFAULT false,
    button integer NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    record_id integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    "user" integer,
    CONSTRAINT ir_model_button_click_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_model_button_click OWNER TO tryton;

--
-- Name: TABLE ir_model_button_click; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_model_button_click IS 'Model Button Click';


--
-- Name: ir_model_button_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_model_button_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_model_button_rule_id_seq OWNER TO tryton;

--
-- Name: ir_model_button_rule; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_model_button_rule (
    id integer DEFAULT nextval('public.ir_model_button_rule_id_seq'::regclass) NOT NULL,
    button integer NOT NULL,
    condition character varying,
    create_date timestamp(6) without time zone,
    create_uid integer,
    description character varying,
    number_user integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    "group" integer,
    CONSTRAINT ir_model_button_rule_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_model_button_rule OWNER TO tryton;

--
-- Name: TABLE ir_model_button_rule; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_model_button_rule IS 'Model Button Rule';


--
-- Name: ir_model_data_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_model_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_model_data_id_seq OWNER TO tryton;

--
-- Name: ir_model_data; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_model_data (
    id integer DEFAULT nextval('public.ir_model_data_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    db_id integer,
    fs_id character varying NOT NULL,
    fs_values text,
    model character varying NOT NULL,
    module character varying NOT NULL,
    noupdate boolean DEFAULT false,
    "values" text,
    write_date timestamp(6) without time zone,
    write_uid integer
);


ALTER TABLE public.ir_model_data OWNER TO tryton;

--
-- Name: TABLE ir_model_data; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_model_data IS 'Model data';


--
-- Name: ir_model_field_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_model_field_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_model_field_id_seq OWNER TO tryton;

--
-- Name: ir_model_field; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_model_field (
    id integer DEFAULT nextval('public.ir_model_field_id_seq'::regclass) NOT NULL,
    model integer NOT NULL,
    name character varying NOT NULL,
    relation character varying,
    field_description character varying,
    ttype character varying,
    help text,
    module character varying,
    access boolean DEFAULT false,
    create_date timestamp(6) without time zone,
    create_uid integer,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_model_field_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_model_field OWNER TO tryton;

--
-- Name: TABLE ir_model_field; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_model_field IS 'Model field';


--
-- Name: ir_model_field_access_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_model_field_access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_model_field_access_id_seq OWNER TO tryton;

--
-- Name: ir_model_field_access; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_model_field_access (
    id integer DEFAULT nextval('public.ir_model_field_access_id_seq'::regclass) NOT NULL,
    active boolean DEFAULT false,
    create_date timestamp(6) without time zone,
    create_uid integer,
    description text,
    field integer NOT NULL,
    "group" integer,
    perm_create boolean DEFAULT false,
    perm_delete boolean DEFAULT false,
    perm_read boolean DEFAULT false,
    perm_write boolean DEFAULT false,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_model_field_access_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_model_field_access OWNER TO tryton;

--
-- Name: TABLE ir_model_field_access; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_model_field_access IS 'Model Field Access';


--
-- Name: ir_module_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_module_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_module_id_seq OWNER TO tryton;

--
-- Name: ir_module; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_module (
    id integer DEFAULT nextval('public.ir_module_id_seq'::regclass) NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    write_uid integer,
    name character varying NOT NULL,
    state character varying
);


ALTER TABLE public.ir_module OWNER TO tryton;

--
-- Name: TABLE ir_module; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_module IS 'Module';


--
-- Name: ir_module_config_wizard_item_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_module_config_wizard_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_module_config_wizard_item_id_seq OWNER TO tryton;

--
-- Name: ir_module_config_wizard_item; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_module_config_wizard_item (
    id integer DEFAULT nextval('public.ir_module_config_wizard_item_id_seq'::regclass) NOT NULL,
    action integer NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    sequence integer,
    state character varying NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_module_config_wizard_item_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_module_config_wizard_item OWNER TO tryton;

--
-- Name: TABLE ir_module_config_wizard_item; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_module_config_wizard_item IS 'Config wizard to run after activating a module';


--
-- Name: ir_module_dependency_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_module_dependency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_module_dependency_id_seq OWNER TO tryton;

--
-- Name: ir_module_dependency; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_module_dependency (
    id integer DEFAULT nextval('public.ir_module_dependency_id_seq'::regclass) NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    write_uid integer,
    name character varying,
    module integer NOT NULL,
    CONSTRAINT ir_module_dependency_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_module_dependency OWNER TO tryton;

--
-- Name: TABLE ir_module_dependency; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_module_dependency IS 'Module dependency';


--
-- Name: ir_note_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_note_id_seq OWNER TO tryton;

--
-- Name: ir_note; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_note (
    id integer DEFAULT nextval('public.ir_note_id_seq'::regclass) NOT NULL,
    copy_to_resources character varying,
    create_date timestamp(6) without time zone,
    create_uid integer,
    message text,
    resource character varying NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_note_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_note OWNER TO tryton;

--
-- Name: TABLE ir_note; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_note IS 'Note';


--
-- Name: ir_note_read_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_note_read_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_note_read_id_seq OWNER TO tryton;

--
-- Name: ir_note_read; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_note_read (
    id integer DEFAULT nextval('public.ir_note_read_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    note integer NOT NULL,
    "user" integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_note_read_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_note_read OWNER TO tryton;

--
-- Name: TABLE ir_note_read; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_note_read IS 'Note Read';


--
-- Name: ir_queue_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_queue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_queue_id_seq OWNER TO tryton;

--
-- Name: ir_queue; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_queue (
    id integer DEFAULT nextval('public.ir_queue_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    data jsonb,
    dequeued_at timestamp(6) without time zone,
    enqueued_at timestamp(6) without time zone NOT NULL,
    expected_at timestamp(6) without time zone,
    finished_at timestamp(6) without time zone,
    name character varying NOT NULL,
    scheduled_at timestamp(6) without time zone,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_queue_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_queue OWNER TO tryton;

--
-- Name: TABLE ir_queue; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_queue IS 'Queue';


--
-- Name: ir_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_rule_id_seq OWNER TO tryton;

--
-- Name: ir_rule; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_rule (
    id integer DEFAULT nextval('public.ir_rule_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    domain character varying NOT NULL,
    rule_group integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_rule_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_rule OWNER TO tryton;

--
-- Name: TABLE ir_rule; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_rule IS 'Rule';


--
-- Name: ir_rule_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_rule_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_rule_group_id_seq OWNER TO tryton;

--
-- Name: ir_rule_group; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_rule_group (
    id integer DEFAULT nextval('public.ir_rule_group_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    default_p boolean DEFAULT false,
    global_p boolean DEFAULT false,
    model integer NOT NULL,
    name character varying NOT NULL,
    perm_create boolean DEFAULT false,
    perm_delete boolean DEFAULT false,
    perm_read boolean DEFAULT false,
    perm_write boolean DEFAULT false,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_rule_group_global_default_exclusive CHECK (((global_p = false) OR (default_p = false))),
    CONSTRAINT ir_rule_group_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_rule_group OWNER TO tryton;

--
-- Name: TABLE ir_rule_group; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_rule_group IS 'Rule group';


--
-- Name: ir_rule_group-res_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public."ir_rule_group-res_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ir_rule_group-res_group_id_seq" OWNER TO tryton;

--
-- Name: ir_rule_group-res_group; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public."ir_rule_group-res_group" (
    id integer DEFAULT nextval('public."ir_rule_group-res_group_id_seq"'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    "group" integer NOT NULL,
    rule_group integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT "ir_rule_group-res_group_id_positive" CHECK ((id >= 0))
);


ALTER TABLE public."ir_rule_group-res_group" OWNER TO tryton;

--
-- Name: TABLE "ir_rule_group-res_group"; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public."ir_rule_group-res_group" IS 'Rule Group - Group';


--
-- Name: ir_sequence_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_sequence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_id_seq OWNER TO tryton;

--
-- Name: ir_sequence; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_sequence (
    id integer DEFAULT nextval('public.ir_sequence_id_seq'::regclass) NOT NULL,
    active boolean DEFAULT false,
    create_date timestamp(6) without time zone,
    create_uid integer,
    last_timestamp integer,
    name character varying NOT NULL,
    number_increment integer,
    number_next_internal integer,
    padding integer,
    prefix character varying,
    sequence_type integer NOT NULL,
    suffix character varying,
    timestamp_offset double precision NOT NULL,
    timestamp_rounding double precision NOT NULL,
    type character varying,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_sequence_check_timestamp_rounding CHECK ((timestamp_rounding > (0)::double precision)),
    CONSTRAINT ir_sequence_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_sequence OWNER TO tryton;

--
-- Name: TABLE ir_sequence; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_sequence IS 'Sequence';


--
-- Name: ir_sequence_strict_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_sequence_strict_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_strict_id_seq OWNER TO tryton;

--
-- Name: ir_sequence_strict; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_sequence_strict (
    id integer DEFAULT nextval('public.ir_sequence_strict_id_seq'::regclass) NOT NULL,
    active boolean DEFAULT false,
    create_date timestamp(6) without time zone,
    create_uid integer,
    last_timestamp integer,
    name character varying NOT NULL,
    number_increment integer,
    number_next_internal integer,
    padding integer,
    prefix character varying,
    sequence_type integer NOT NULL,
    suffix character varying,
    timestamp_offset double precision NOT NULL,
    timestamp_rounding double precision NOT NULL,
    type character varying,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_sequence_strict_check_timestamp_rounding CHECK ((timestamp_rounding > (0)::double precision)),
    CONSTRAINT ir_sequence_strict_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_sequence_strict OWNER TO tryton;

--
-- Name: TABLE ir_sequence_strict; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_sequence_strict IS 'Sequence Strict';


--
-- Name: ir_sequence_type_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_sequence_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_type_id_seq OWNER TO tryton;

--
-- Name: ir_sequence_type; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_sequence_type (
    id integer DEFAULT nextval('public.ir_sequence_type_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    name character varying NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_sequence_type_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_sequence_type OWNER TO tryton;

--
-- Name: TABLE ir_sequence_type; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_sequence_type IS 'Sequence type';


--
-- Name: ir_sequence_type-res_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public."ir_sequence_type-res_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ir_sequence_type-res_group_id_seq" OWNER TO tryton;

--
-- Name: ir_sequence_type-res_group; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public."ir_sequence_type-res_group" (
    id integer DEFAULT nextval('public."ir_sequence_type-res_group_id_seq"'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    "group" integer NOT NULL,
    sequence_type integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT "ir_sequence_type-res_group_id_positive" CHECK ((id >= 0))
);


ALTER TABLE public."ir_sequence_type-res_group" OWNER TO tryton;

--
-- Name: TABLE "ir_sequence_type-res_group"; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public."ir_sequence_type-res_group" IS 'Sequence Type - Group';


--
-- Name: ir_session_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_session_id_seq OWNER TO tryton;

--
-- Name: ir_session; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_session (
    id integer DEFAULT nextval('public.ir_session_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    key character varying NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_session_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_session OWNER TO tryton;

--
-- Name: TABLE ir_session; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_session IS 'Session';


--
-- Name: ir_session_wizard_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_session_wizard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_session_wizard_id_seq OWNER TO tryton;

--
-- Name: ir_session_wizard; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_session_wizard (
    id integer DEFAULT nextval('public.ir_session_wizard_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    data text,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_session_wizard_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_session_wizard OWNER TO tryton;

--
-- Name: TABLE ir_session_wizard; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_session_wizard IS 'Session Wizard';


--
-- Name: ir_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_translation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_translation_id_seq OWNER TO tryton;

--
-- Name: ir_translation; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_translation (
    id integer DEFAULT nextval('public.ir_translation_id_seq'::regclass) NOT NULL,
    lang character varying,
    src text,
    name character varying NOT NULL,
    res_id integer NOT NULL,
    value text,
    type character varying NOT NULL,
    module character varying,
    fuzzy boolean DEFAULT false,
    create_date timestamp(6) without time zone,
    create_uid integer,
    overriding_module character varying,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_translation_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_translation OWNER TO tryton;

--
-- Name: TABLE ir_translation; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_translation IS 'Translation';


--
-- Name: ir_trigger_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_trigger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_trigger_id_seq OWNER TO tryton;

--
-- Name: ir_trigger; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_trigger (
    id integer DEFAULT nextval('public.ir_trigger_id_seq'::regclass) NOT NULL,
    action character varying NOT NULL,
    active boolean DEFAULT false,
    condition character varying NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    limit_number integer NOT NULL,
    minimum_time_delay interval,
    model integer NOT NULL,
    name character varying NOT NULL,
    on_create boolean DEFAULT false,
    on_delete boolean DEFAULT false,
    on_time boolean DEFAULT false,
    on_write boolean DEFAULT false,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_trigger_id_positive CHECK ((id >= 0)),
    CONSTRAINT ir_trigger_on_exclusive CHECK ((NOT ((on_time = true) AND ((on_create = true) OR (on_write = true) OR (on_delete = true)))))
);


ALTER TABLE public.ir_trigger OWNER TO tryton;

--
-- Name: TABLE ir_trigger; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_trigger IS 'Trigger';


--
-- Name: ir_trigger__history___id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_trigger__history___id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_trigger__history___id_seq OWNER TO tryton;

--
-- Name: ir_trigger__history; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_trigger__history (
    id integer,
    __id integer DEFAULT nextval('public.ir_trigger__history___id_seq'::regclass) NOT NULL
);


ALTER TABLE public.ir_trigger__history OWNER TO tryton;

--
-- Name: TABLE ir_trigger__history; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_trigger__history IS 'Trigger';


--
-- Name: ir_trigger_log_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_trigger_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_trigger_log_id_seq OWNER TO tryton;

--
-- Name: ir_trigger_log; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_trigger_log (
    id integer DEFAULT nextval('public.ir_trigger_log_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    record_id integer NOT NULL,
    trigger integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_trigger_log_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_trigger_log OWNER TO tryton;

--
-- Name: TABLE ir_trigger_log; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_trigger_log IS 'Trigger Log';


--
-- Name: ir_ui_icon_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_ui_icon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_ui_icon_id_seq OWNER TO tryton;

--
-- Name: ir_ui_icon; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_ui_icon (
    id integer DEFAULT nextval('public.ir_ui_icon_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    module character varying NOT NULL,
    name character varying NOT NULL,
    path character varying NOT NULL,
    sequence integer,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_ui_icon_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_ui_icon OWNER TO tryton;

--
-- Name: TABLE ir_ui_icon; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_ui_icon IS 'Icon';


--
-- Name: ir_ui_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_ui_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_ui_menu_id_seq OWNER TO tryton;

--
-- Name: ir_ui_menu; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_ui_menu (
    id integer DEFAULT nextval('public.ir_ui_menu_id_seq'::regclass) NOT NULL,
    parent integer,
    name character varying NOT NULL,
    icon character varying,
    active boolean DEFAULT false,
    create_date timestamp(6) without time zone,
    create_uid integer,
    sequence integer,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_ui_menu_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_ui_menu OWNER TO tryton;

--
-- Name: TABLE ir_ui_menu; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_ui_menu IS 'UI menu';


--
-- Name: ir_ui_menu-res_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public."ir_ui_menu-res_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ir_ui_menu-res_group_id_seq" OWNER TO tryton;

--
-- Name: ir_ui_menu-res_group; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public."ir_ui_menu-res_group" (
    id integer DEFAULT nextval('public."ir_ui_menu-res_group_id_seq"'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    "group" integer NOT NULL,
    menu integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT "ir_ui_menu-res_group_id_positive" CHECK ((id >= 0))
);


ALTER TABLE public."ir_ui_menu-res_group" OWNER TO tryton;

--
-- Name: TABLE "ir_ui_menu-res_group"; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public."ir_ui_menu-res_group" IS 'UI Menu - Group';


--
-- Name: ir_ui_menu_favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_ui_menu_favorite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_ui_menu_favorite_id_seq OWNER TO tryton;

--
-- Name: ir_ui_menu_favorite; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_ui_menu_favorite (
    id integer DEFAULT nextval('public.ir_ui_menu_favorite_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    menu integer NOT NULL,
    sequence integer,
    "user" integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_ui_menu_favorite_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_ui_menu_favorite OWNER TO tryton;

--
-- Name: TABLE ir_ui_menu_favorite; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_ui_menu_favorite IS 'Menu Favorite';


--
-- Name: ir_ui_view_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_ui_view_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_ui_view_id_seq OWNER TO tryton;

--
-- Name: ir_ui_view; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_ui_view (
    id integer DEFAULT nextval('public.ir_ui_view_id_seq'::regclass) NOT NULL,
    model character varying,
    type character varying,
    data text,
    field_childs character varying,
    priority integer NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    domain character varying,
    inherit integer,
    module character varying,
    name character varying,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_ui_view_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_ui_view OWNER TO tryton;

--
-- Name: TABLE ir_ui_view; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_ui_view IS 'View';


--
-- Name: ir_ui_view_search_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_ui_view_search_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_ui_view_search_id_seq OWNER TO tryton;

--
-- Name: ir_ui_view_search; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_ui_view_search (
    id integer DEFAULT nextval('public.ir_ui_view_search_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    domain character varying,
    model character varying NOT NULL,
    name character varying NOT NULL,
    "user" integer,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_ui_view_search_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_ui_view_search OWNER TO tryton;

--
-- Name: TABLE ir_ui_view_search; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_ui_view_search IS 'View Search';


--
-- Name: ir_ui_view_tree_optional_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_ui_view_tree_optional_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_ui_view_tree_optional_id_seq OWNER TO tryton;

--
-- Name: ir_ui_view_tree_optional; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_ui_view_tree_optional (
    id integer DEFAULT nextval('public.ir_ui_view_tree_optional_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    field character varying NOT NULL,
    "user" integer NOT NULL,
    value boolean DEFAULT false,
    view_id integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_ui_view_tree_optional_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_ui_view_tree_optional OWNER TO tryton;

--
-- Name: TABLE ir_ui_view_tree_optional; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_ui_view_tree_optional IS 'View Tree Optional';


--
-- Name: ir_ui_view_tree_state_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_ui_view_tree_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_ui_view_tree_state_id_seq OWNER TO tryton;

--
-- Name: ir_ui_view_tree_state; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_ui_view_tree_state (
    id integer DEFAULT nextval('public.ir_ui_view_tree_state_id_seq'::regclass) NOT NULL,
    child_name character varying,
    create_date timestamp(6) without time zone,
    create_uid integer,
    domain character varying NOT NULL,
    model character varying NOT NULL,
    nodes text,
    selected_nodes text,
    "user" integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_ui_view_tree_state_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_ui_view_tree_state OWNER TO tryton;

--
-- Name: TABLE ir_ui_view_tree_state; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_ui_view_tree_state IS 'View Tree State';


--
-- Name: ir_ui_view_tree_width_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.ir_ui_view_tree_width_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_ui_view_tree_width_id_seq OWNER TO tryton;

--
-- Name: ir_ui_view_tree_width; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.ir_ui_view_tree_width (
    id integer DEFAULT nextval('public.ir_ui_view_tree_width_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    field character varying NOT NULL,
    model character varying NOT NULL,
    "user" integer NOT NULL,
    width integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT ir_ui_view_tree_width_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.ir_ui_view_tree_width OWNER TO tryton;

--
-- Name: TABLE ir_ui_view_tree_width; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.ir_ui_view_tree_width IS 'View Tree Width';


--
-- Name: res_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.res_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.res_group_id_seq OWNER TO tryton;

--
-- Name: res_group; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.res_group (
    id integer DEFAULT nextval('public.res_group_id_seq'::regclass) NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT false,
    create_date timestamp(6) without time zone,
    create_uid integer,
    parent integer,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT res_group_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.res_group OWNER TO tryton;

--
-- Name: TABLE res_group; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.res_group IS 'Group';


--
-- Name: res_user_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.res_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.res_user_id_seq OWNER TO tryton;

--
-- Name: res_user; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.res_user (
    id integer DEFAULT nextval('public.res_user_id_seq'::regclass) NOT NULL,
    name character varying,
    active boolean DEFAULT false,
    login character varying NOT NULL,
    password character varying,
    create_date timestamp(6) without time zone,
    create_uid integer,
    email character varying,
    language integer,
    menu integer NOT NULL,
    password_hash character varying,
    password_reset character varying,
    password_reset_expire timestamp(6) without time zone,
    signature text,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT res_user_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.res_user OWNER TO tryton;

--
-- Name: TABLE res_user; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.res_user IS 'User';


--
-- Name: res_user-ir_action_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public."res_user-ir_action_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."res_user-ir_action_id_seq" OWNER TO tryton;

--
-- Name: res_user-ir_action; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public."res_user-ir_action" (
    id integer DEFAULT nextval('public."res_user-ir_action_id_seq"'::regclass) NOT NULL,
    action integer NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    "user" integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT "res_user-ir_action_id_positive" CHECK ((id >= 0))
);


ALTER TABLE public."res_user-ir_action" OWNER TO tryton;

--
-- Name: TABLE "res_user-ir_action"; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public."res_user-ir_action" IS 'User - Action';


--
-- Name: res_user-res_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public."res_user-res_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."res_user-res_group_id_seq" OWNER TO tryton;

--
-- Name: res_user-res_group; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public."res_user-res_group" (
    id integer DEFAULT nextval('public."res_user-res_group_id_seq"'::regclass) NOT NULL,
    "user" integer NOT NULL,
    "group" integer NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT "res_user-res_group_id_positive" CHECK ((id >= 0))
);


ALTER TABLE public."res_user-res_group" OWNER TO tryton;

--
-- Name: TABLE "res_user-res_group"; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public."res_user-res_group" IS 'User - Group';


--
-- Name: res_user_application_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.res_user_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.res_user_application_id_seq OWNER TO tryton;

--
-- Name: res_user_application; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.res_user_application (
    id integer DEFAULT nextval('public.res_user_application_id_seq'::regclass) NOT NULL,
    application character varying,
    create_date timestamp(6) without time zone,
    create_uid integer,
    key character varying NOT NULL,
    state character varying,
    "user" integer,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT res_user_application_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.res_user_application OWNER TO tryton;

--
-- Name: TABLE res_user_application; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.res_user_application IS 'User Application';


--
-- Name: res_user_device_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.res_user_device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.res_user_device_id_seq OWNER TO tryton;

--
-- Name: res_user_device; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.res_user_device (
    id integer DEFAULT nextval('public.res_user_device_id_seq'::regclass) NOT NULL,
    cookie character varying NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    login character varying NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT res_user_device_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.res_user_device OWNER TO tryton;

--
-- Name: TABLE res_user_device; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.res_user_device IS 'User Device';


--
-- Name: res_user_login_attempt_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.res_user_login_attempt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.res_user_login_attempt_id_seq OWNER TO tryton;

--
-- Name: res_user_login_attempt; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.res_user_login_attempt (
    id integer DEFAULT nextval('public.res_user_login_attempt_id_seq'::regclass) NOT NULL,
    create_date timestamp(6) without time zone,
    create_uid integer,
    device_cookie character varying,
    ip_address character varying,
    ip_network character varying,
    login character varying(512),
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT res_user_login_attempt_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.res_user_login_attempt OWNER TO tryton;

--
-- Name: TABLE res_user_login_attempt; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.res_user_login_attempt IS 'Login Attempt

    This class is separated from the res.user one in order to prevent locking
    the res.user table when in a long running process.
    ';


--
-- Name: res_user_warning_id_seq; Type: SEQUENCE; Schema: public; Owner: tryton
--

CREATE SEQUENCE public.res_user_warning_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.res_user_warning_id_seq OWNER TO tryton;

--
-- Name: res_user_warning; Type: TABLE; Schema: public; Owner: tryton
--

CREATE TABLE public.res_user_warning (
    id integer DEFAULT nextval('public.res_user_warning_id_seq'::regclass) NOT NULL,
    always boolean DEFAULT false,
    create_date timestamp(6) without time zone,
    create_uid integer,
    name character varying NOT NULL,
    "user" integer NOT NULL,
    write_date timestamp(6) without time zone,
    write_uid integer,
    CONSTRAINT res_user_warning_id_positive CHECK ((id >= 0))
);


ALTER TABLE public.res_user_warning OWNER TO tryton;

--
-- Name: TABLE res_user_warning; Type: COMMENT; Schema: public; Owner: tryton
--

COMMENT ON TABLE public.res_user_warning IS 'User Warning';


--
-- Data for Name: ir_action; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_action (id, active, create_date, create_uid, icon, name, records, type, usage, write_date, write_uid) FROM stdin;
1	t	2023-01-18 22:26:47.309666	0	\N	Icons	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
2	t	2023-01-18 22:26:47.309666	0	\N	Menu	selected	ir.action.act_window	menu	2023-01-18 22:26:47.309666	0
3	t	2023-01-18 22:26:47.309666	0	\N	Menu	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
4	t	2023-01-18 22:26:47.309666	0	\N	Show View	selected	ir.action.wizard	\N	2023-01-18 22:26:47.309666	0
5	t	2023-01-18 22:26:47.309666	0	\N	Views	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
6	t	2023-01-18 22:26:47.309666	0	\N	View Tree Width	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
7	t	2023-01-18 22:26:47.309666	0	\N	View Tree Optional	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
8	t	2023-01-18 22:26:47.309666	0	\N	Tree State	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
9	t	2023-01-18 22:26:47.309666	0	\N	View Search	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
10	t	2023-01-18 22:26:47.309666	0	\N	Actions	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
11	t	2023-01-18 22:26:47.309666	0	\N	Reports	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
12	t	2023-01-18 22:26:47.309666	0	\N	Window Actions	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
13	t	2023-01-18 22:26:47.309666	0	\N	Wizards	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
14	t	2023-01-18 22:26:47.309666	0	\N	URLs	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
15	t	2023-01-18 22:26:47.309666	0	\N	Models	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
16	t	2023-01-18 22:26:47.309666	0	\N	Fields	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
17	t	2023-01-18 22:26:47.309666	0	\N	Models Access	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
18	t	2023-01-18 22:26:47.309666	0	\N	Access	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
19	t	2023-01-18 22:26:47.309666	0	\N	Fields Access	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
20	t	2023-01-18 22:26:47.309666	0	\N	Access	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
21	t	2023-01-18 22:26:47.309666	0	\N	Graph	selected	ir.action.report	\N	2023-01-18 22:26:47.309666	0
22	t	2023-01-18 22:26:47.309666	0	\N	Graph	selected	ir.action.wizard	\N	2023-01-18 22:26:47.309666	0
23	t	2023-01-18 22:26:47.309666	0	\N	Workflow Graph	selected	ir.action.report	\N	2023-01-18 22:26:47.309666	0
24	t	2023-01-18 22:26:47.309666	0	\N	Buttons	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
25	t	2023-01-18 22:26:47.309666	0	\N	Clicks	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
26	t	2023-01-18 22:26:47.309666	0	\N	Data	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
27	t	2023-01-18 22:26:47.309666	0	\N	Sequences	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
28	t	2023-01-18 22:26:47.309666	0	\N	Sequences Strict	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
29	t	2023-01-18 22:26:47.309666	0	\N	Types	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
30	t	2023-01-18 22:26:47.309666	0	\N	Attachments	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
31	t	2023-01-18 22:26:47.309666	0	\N	Notes	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
32	t	2023-01-18 22:26:47.309666	0	\N	Actions	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
33	t	2023-01-18 22:26:47.309666	0	\N	Languages	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
34	t	2023-01-18 22:26:47.309666	0	\N	Configure Languages	selected	ir.action.wizard	\N	2023-01-18 22:26:47.309666	0
35	t	2023-01-18 22:26:47.309666	0	\N	Translations	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
36	t	2023-01-18 22:26:47.309666	0	\N	Translations	selected	ir.action.wizard	\N	2023-01-18 22:26:47.309666	0
37	t	2023-01-18 22:26:47.309666	0	\N	Translations	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
38	t	2023-01-18 22:26:47.309666	0	\N	Set Translations	selected	ir.action.wizard	\N	2023-01-18 22:26:47.309666	0
39	t	2023-01-18 22:26:47.309666	0	\N	Clean Translations	selected	ir.action.wizard	\N	2023-01-18 22:26:47.309666	0
40	t	2023-01-18 22:26:47.309666	0	\N	Synchronize Translations	selected	ir.action.wizard	\N	2023-01-18 22:26:47.309666	0
41	t	2023-01-18 22:26:47.309666	0	\N	Export Translations	selected	ir.action.wizard	\N	2023-01-18 22:26:47.309666	0
42	t	2023-01-18 22:26:47.309666	0	\N	Exports	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
43	t	2023-01-18 22:26:47.309666	0	\N	Record Rules	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
44	t	2023-01-18 22:26:47.309666	0	\N	Modules	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
45	t	2023-01-18 22:26:47.309666	0	\N	Config Wizard Items	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
46	t	2023-01-18 22:26:47.309666	0	\N	Module Configuration	selected	ir.action.wizard	\N	2023-01-18 22:26:47.309666	0
56	t	2023-01-18 22:27:08.693829	0	\N	Users	selected	ir.action.act_window	\N	2023-01-18 22:27:08.693829	0
47	t	2023-01-18 22:26:47.309666	0	\N	Perform Pending Activation/Upgrade	selected	ir.action.wizard	\N	2023-01-18 22:26:47.309666	0
57	t	2023-01-18 22:27:08.693829	0	\N	Configure Users	selected	ir.action.wizard	\N	2023-01-18 22:27:08.693829	0
48	t	2023-01-18 22:26:47.309666	0	\N	Configure Modules	selected	ir.action.wizard	\N	2023-01-18 22:26:47.309666	0
49	t	2023-01-18 22:26:47.309666	0	\N	Triggers	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
58	t	2023-01-18 22:27:08.693829	0	\N	Reset Password	selected	ir.action.report	\N	2023-01-18 22:27:08.693829	0
50	t	2023-01-18 22:26:47.309666	0	\N	Message	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
51	t	2023-01-18 22:26:47.309666	0	\N	E-mails	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
52	t	2023-01-18 22:26:47.309666	0	\N	E-mail Archives	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
53	t	2023-01-18 22:26:47.309666	0	\N	E-mail Templates	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
54	t	2023-01-18 22:26:47.309666	0	\N	Errors	selected	ir.action.act_window	\N	2023-01-18 22:26:47.309666	0
55	t	2023-01-18 22:27:08.693829	0	\N	Groups	selected	ir.action.act_window	\N	2023-01-18 22:27:08.693829	0
\.


--
-- Data for Name: ir_action-res_group; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public."ir_action-res_group" (id, action, create_date, create_uid, "group", write_date, write_uid) FROM stdin;
1	47	2023-01-18 22:27:08.693829	0	1	\N	\N
2	40	2023-01-18 22:27:08.693829	0	1	\N	\N
3	41	2023-01-18 22:27:08.693829	0	1	\N	\N
4	34	2023-01-18 22:27:08.693829	0	1	\N	\N
\.


--
-- Data for Name: ir_action_act_window; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_action_act_window (id, action, context, context_domain, context_model, create_date, create_uid, domain, "limit", "order", res_model, search_value, write_date, write_uid) FROM stdin;
1	1	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.ui.icon	[]	2023-01-18 22:26:47.309666	0
2	2	{}	\N	\N	2023-01-18 22:26:47.309666	0	[["parent", "=", null]]	\N	\N	ir.ui.menu	[]	2023-01-18 22:26:47.309666	0
56	56	{}	\N	\N	2023-01-18 22:27:08.693829	0	\N	\N	\N	res.user	[]	2023-01-18 22:27:08.693829	0
3	3	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.ui.menu	[]	2023-01-18 22:26:47.309666	0
5	5	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.ui.view	[]	2023-01-18 22:26:47.309666	0
6	6	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.ui.view_tree_width	[]	2023-01-18 22:26:47.309666	0
7	7	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.ui.view_tree_optional	[]	2023-01-18 22:26:47.309666	0
8	8	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.ui.view_tree_state	[]	2023-01-18 22:26:47.309666	0
9	9	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.ui.view_search	[]	2023-01-18 22:26:47.309666	0
10	10	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.action	[]	2023-01-18 22:26:47.309666	0
11	11	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.action.report	[]	2023-01-18 22:26:47.309666	0
12	12	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.action.act_window	[]	2023-01-18 22:26:47.309666	0
13	13	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.action.wizard	[]	2023-01-18 22:26:47.309666	0
14	14	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.action.url	[]	2023-01-18 22:26:47.309666	0
15	15	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.model	[]	2023-01-18 22:26:47.309666	0
16	16	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.model.field	[]	2023-01-18 22:26:47.309666	0
17	17	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.model.access	[]	2023-01-18 22:26:47.309666	0
18	18	{}	\N	\N	2023-01-18 22:26:47.309666	0	[{"__class__": "If", "c": {"__class__": "Equal", "s1": {"__class__": "Eval", "d": [], "v": "active_ids"}, "s2": [{"__class__": "Eval", "d": "", "v": "active_id"}]}, "e": ["model", "in", {"__class__": "Eval", "d": "", "v": "active_ids"}], "t": ["model", "=", {"__class__": "Eval", "d": "", "v": "active_id"}]}]	\N	\N	ir.model.access	[]	2023-01-18 22:26:47.309666	0
19	19	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.model.field.access	[]	2023-01-18 22:26:47.309666	0
20	20	{}	\N	\N	2023-01-18 22:26:47.309666	0	[{"__class__": "If", "c": {"__class__": "Equal", "s1": {"__class__": "Eval", "d": [], "v": "active_ids"}, "s2": [{"__class__": "Eval", "d": "", "v": "active_id"}]}, "e": ["field", "in", {"__class__": "Eval", "d": "", "v": "active_ids"}], "t": ["field", "=", {"__class__": "Eval", "d": "", "v": "active_id"}]}]	\N	\N	ir.model.field.access	[]	2023-01-18 22:26:47.309666	0
24	24	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.model.button	[]	2023-01-18 22:26:47.309666	0
25	25	{}	\N	\N	2023-01-18 22:26:47.309666	0	[{"__class__": "If", "c": {"__class__": "Equal", "s1": {"__class__": "Eval", "d": [], "v": "active_ids"}, "s2": [{"__class__": "Eval", "d": "", "v": "active_id"}]}, "e": ["button", "in", {"__class__": "Eval", "d": "", "v": "active_ids"}], "t": ["button", "=", {"__class__": "Eval", "d": "", "v": "active_id"}]}]	\N	\N	ir.model.button.click	[]	2023-01-18 22:26:47.309666	0
26	26	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.model.data	[]	2023-01-18 22:26:47.309666	0
27	27		\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.sequence	[]	2023-01-18 22:26:47.309666	0
55	55	{}	\N	\N	2023-01-18 22:27:08.693829	0	\N	\N	\N	res.group	[]	2023-01-18 22:27:08.693829	0
28	28		\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.sequence.strict	[]	2023-01-18 22:26:47.309666	0
29	29	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.sequence.type	[]	2023-01-18 22:26:47.309666	0
30	30	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.attachment	[]	2023-01-18 22:26:47.309666	0
31	31	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.note	[]	2023-01-18 22:26:47.309666	0
32	32		\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.cron	[]	2023-01-18 22:26:47.309666	0
33	33		\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.lang	[]	2023-01-18 22:26:47.309666	0
35	35	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.translation	[]	2023-01-18 22:26:47.309666	0
37	37	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.translation	[]	2023-01-18 22:26:47.309666	0
42	42	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.export	[]	2023-01-18 22:26:47.309666	0
43	43	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.rule.group	[]	2023-01-18 22:26:47.309666	0
44	44	{}	\N	\N	2023-01-18 22:26:47.309666	0	[["name", "!=", "tests"]]	\N	\N	ir.module	[]	2023-01-18 22:26:47.309666	0
45	45	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.module.config_wizard.item	[]	2023-01-18 22:26:47.309666	0
49	49	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.trigger	[]	2023-01-18 22:26:47.309666	0
50	50	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.message	[]	2023-01-18 22:26:47.309666	0
51	51	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.email	[]	2023-01-18 22:26:47.309666	0
52	52	{}	\N	\N	2023-01-18 22:26:47.309666	0	[{"__class__": "If", "c": {"__class__": "Equal", "s1": {"__class__": "Eval", "d": [], "v": "active_ids"}, "s2": [{"__class__": "Eval", "d": "", "v": "active_id"}]}, "e": ["resource.id", "in", {"__class__": "Eval", "d": "", "v": "active_ids"}, {"__class__": "Eval", "d": "", "v": "active_model"}], "t": ["resource", "=", [{"__class__": "Eval", "d": "", "v": "active_model"}, {"__class__": "Eval", "d": "", "v": "active_id"}]]}]	\N	\N	ir.email	[]	2023-01-18 22:26:47.309666	0
53	53	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.email.template	[]	2023-01-18 22:26:47.309666	0
54	54	{}	\N	\N	2023-01-18 22:26:47.309666	0	\N	\N	\N	ir.error	[]	2023-01-18 22:26:47.309666	0
\.


--
-- Data for Name: ir_action_act_window_domain; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_action_act_window_domain (id, act_window, active, count, create_date, create_uid, domain, name, sequence, write_date, write_uid) FROM stdin;
1	26	t	t	2023-01-18 22:26:47.309666	0	[["out_of_sync", "=", true]]	Out of Sync	10	\N	\N
2	26	t	f	2023-01-18 22:26:47.309666	0		All	9999	\N	\N
3	35	t	f	2023-01-18 22:26:47.309666	0	[["module", "!=", null]]	Modules	10	\N	\N
4	35	t	f	2023-01-18 22:26:47.309666	0	[["module", "=", null]]	Local	20	\N	\N
5	54	t	t	2023-01-18 22:26:47.309666	0	[["state", "=", "open"]]	Open	10	\N	\N
6	54	t	t	2023-01-18 22:26:47.309666	0	[["state", "=", "processing"]]	Processing	20	\N	\N
7	54	t	f	2023-01-18 22:26:47.309666	0		All	9999	\N	\N
\.


--
-- Data for Name: ir_action_act_window_view; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_action_act_window_view (id, act_window, active, create_date, create_uid, sequence, view, write_date, write_uid) FROM stdin;
1	1	t	2023-01-18 22:26:47.309666	0	10	1	\N	\N
2	1	t	2023-01-18 22:26:47.309666	0	20	2	\N	\N
3	2	t	2023-01-18 22:26:47.309666	0	1	3	\N	\N
4	3	t	2023-01-18 22:26:47.309666	0	10	4	\N	\N
5	3	t	2023-01-18 22:26:47.309666	0	20	5	\N	\N
6	5	t	2023-01-18 22:26:47.309666	0	1	9	\N	\N
7	5	t	2023-01-18 22:26:47.309666	0	2	8	\N	\N
8	6	t	2023-01-18 22:26:47.309666	0	1	11	\N	\N
9	6	t	2023-01-18 22:26:47.309666	0	2	10	\N	\N
10	7	t	2023-01-18 22:26:47.309666	0	10	13	\N	\N
11	7	t	2023-01-18 22:26:47.309666	0	20	12	\N	\N
12	8	t	2023-01-18 22:26:47.309666	0	10	15	\N	\N
13	8	t	2023-01-18 22:26:47.309666	0	20	14	\N	\N
14	9	t	2023-01-18 22:26:47.309666	0	10	17	\N	\N
15	9	t	2023-01-18 22:26:47.309666	0	20	16	\N	\N
16	10	t	2023-01-18 22:26:47.309666	0	1	19	\N	\N
17	10	t	2023-01-18 22:26:47.309666	0	2	18	\N	\N
18	11	t	2023-01-18 22:26:47.309666	0	1	23	\N	\N
19	11	t	2023-01-18 22:26:47.309666	0	2	22	\N	\N
20	12	t	2023-01-18 22:26:47.309666	0	1	25	\N	\N
21	12	t	2023-01-18 22:26:47.309666	0	2	24	\N	\N
22	13	t	2023-01-18 22:26:47.309666	0	1	33	\N	\N
23	13	t	2023-01-18 22:26:47.309666	0	2	32	\N	\N
24	14	t	2023-01-18 22:26:47.309666	0	1	35	\N	\N
25	14	t	2023-01-18 22:26:47.309666	0	2	34	\N	\N
26	15	t	2023-01-18 22:26:47.309666	0	1	37	\N	\N
27	15	t	2023-01-18 22:26:47.309666	0	2	36	\N	\N
28	16	t	2023-01-18 22:26:47.309666	0	1	39	\N	\N
29	16	t	2023-01-18 22:26:47.309666	0	2	38	\N	\N
30	17	t	2023-01-18 22:26:47.309666	0	1	40	\N	\N
31	17	t	2023-01-18 22:26:47.309666	0	2	41	\N	\N
32	19	t	2023-01-18 22:26:47.309666	0	10	42	\N	\N
33	19	t	2023-01-18 22:26:47.309666	0	20	43	\N	\N
34	24	t	2023-01-18 22:26:47.309666	0	10	45	\N	\N
35	24	t	2023-01-18 22:26:47.309666	0	20	46	\N	\N
36	26	t	2023-01-18 22:26:47.309666	0	10	51	\N	\N
37	26	t	2023-01-18 22:26:47.309666	0	20	52	\N	\N
38	27	t	2023-01-18 22:26:47.309666	0	1	54	\N	\N
39	27	t	2023-01-18 22:26:47.309666	0	2	53	\N	\N
40	28	t	2023-01-18 22:26:47.309666	0	1	56	\N	\N
41	28	t	2023-01-18 22:26:47.309666	0	2	55	\N	\N
42	29	t	2023-01-18 22:26:47.309666	0	1	58	\N	\N
43	29	t	2023-01-18 22:26:47.309666	0	2	57	\N	\N
44	30	t	2023-01-18 22:26:47.309666	0	1	61	\N	\N
45	30	t	2023-01-18 22:26:47.309666	0	2	59	\N	\N
46	31	t	2023-01-18 22:26:47.309666	0	1	63	\N	\N
47	31	t	2023-01-18 22:26:47.309666	0	2	62	\N	\N
48	32	t	2023-01-18 22:26:47.309666	0	1	64	\N	\N
49	32	t	2023-01-18 22:26:47.309666	0	2	65	\N	\N
50	33	t	2023-01-18 22:26:47.309666	0	1	66	\N	\N
51	33	t	2023-01-18 22:26:47.309666	0	2	67	\N	\N
52	35	t	2023-01-18 22:26:47.309666	0	1	70	\N	\N
53	35	t	2023-01-18 22:26:47.309666	0	2	69	\N	\N
54	42	t	2023-01-18 22:26:47.309666	0	1	79	\N	\N
55	42	t	2023-01-18 22:26:47.309666	0	2	78	\N	\N
56	43	t	2023-01-18 22:26:47.309666	0	1	83	\N	\N
57	43	t	2023-01-18 22:26:47.309666	0	2	82	\N	\N
58	44	t	2023-01-18 22:26:47.309666	0	1	87	\N	\N
59	44	t	2023-01-18 22:26:47.309666	0	2	86	\N	\N
60	45	t	2023-01-18 22:26:47.309666	0	10	90	\N	\N
61	49	t	2023-01-18 22:26:47.309666	0	10	98	\N	\N
62	49	t	2023-01-18 22:26:47.309666	0	20	97	\N	\N
63	50	t	2023-01-18 22:26:47.309666	0	10	99	\N	\N
64	50	t	2023-01-18 22:26:47.309666	0	20	100	\N	\N
65	51	t	2023-01-18 22:26:47.309666	0	10	102	\N	\N
66	51	t	2023-01-18 22:26:47.309666	0	20	101	\N	\N
67	52	t	2023-01-18 22:26:47.309666	0	10	102	\N	\N
68	52	t	2023-01-18 22:26:47.309666	0	20	101	\N	\N
69	53	t	2023-01-18 22:26:47.309666	0	10	104	\N	\N
70	53	t	2023-01-18 22:26:47.309666	0	20	103	\N	\N
71	54	t	2023-01-18 22:26:47.309666	0	10	105	\N	\N
72	54	t	2023-01-18 22:26:47.309666	0	20	106	\N	\N
73	55	t	2023-01-18 22:27:08.693829	0	1	108	\N	\N
74	55	t	2023-01-18 22:27:08.693829	0	2	107	\N	\N
75	56	t	2023-01-18 22:27:08.693829	0	1	111	\N	\N
76	56	t	2023-01-18 22:27:08.693829	0	2	109	\N	\N
\.


--
-- Data for Name: ir_action_keyword; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_action_keyword (id, action, create_date, create_uid, keyword, model, write_date, write_uid) FROM stdin;
1	1	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,3	\N	\N
2	3	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,4	\N	\N
3	5	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,5	\N	\N
4	6	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,6	\N	\N
5	7	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,7	\N	\N
6	8	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,8	\N	\N
7	9	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,9	\N	\N
8	10	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,11	\N	\N
9	11	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,12	\N	\N
10	12	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,13	\N	\N
11	13	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,14	\N	\N
12	14	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,15	\N	\N
13	15	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,17	\N	\N
14	16	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,18	\N	\N
15	17	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,19	\N	\N
16	18	2023-01-18 22:26:47.309666	0	form_relate	ir.model,-1	\N	\N
17	19	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,20	\N	\N
18	20	2023-01-18 22:26:47.309666	0	form_relate	ir.model.field,-1	\N	\N
19	22	2023-01-18 22:26:47.309666	0	form_print	ir.model,-1	\N	\N
20	23	2023-01-18 22:26:47.309666	0	form_print	ir.model,-1	\N	\N
21	24	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,21	\N	\N
22	25	2023-01-18 22:26:47.309666	0	form_relate	ir.model.button,-1	\N	\N
23	26	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,22	\N	\N
24	27	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,24	\N	\N
25	28	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,25	\N	\N
26	29	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,26	\N	\N
27	30	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,27	\N	\N
28	31	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,28	\N	\N
29	32	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,30	\N	\N
30	33	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,32	\N	\N
31	35	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,33	\N	\N
32	36	2023-01-18 22:26:47.309666	0	form_relate	ir.action.report,-1	\N	\N
33	38	2023-01-18 22:26:47.309666	0	form_action	ir.action.report,-1	\N	\N
34	38	2023-01-18 22:26:47.309666	0	form_action	ir.ui.view,-1	\N	\N
35	38	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,34	\N	\N
36	39	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,35	\N	\N
37	40	2023-01-18 22:26:47.309666	0	form_action	ir.action.report,-1	\N	\N
38	40	2023-01-18 22:26:47.309666	0	form_action	ir.ui.view,-1	\N	\N
39	40	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,36	\N	\N
40	41	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,37	\N	\N
41	42	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,38	\N	\N
42	43	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,39	\N	\N
43	44	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,41	\N	\N
44	45	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,42	\N	\N
45	46	2023-01-18 22:26:47.309666	0	form_action	ir.module.config_wizard.item,-1	\N	\N
46	47	2023-01-18 22:26:47.309666	0	form_action	ir.module,-1	\N	\N
47	47	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,43	\N	\N
48	49	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,44	\N	\N
49	50	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,45	\N	\N
50	51	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,46	\N	\N
51	52	2023-01-18 22:26:47.309666	0	form_relate	\N	\N	\N
52	53	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,47	\N	\N
53	54	2023-01-18 22:26:47.309666	0	tree_open	ir.ui.menu,48	\N	\N
54	55	2023-01-18 22:27:08.693829	0	tree_open	ir.ui.menu,50	\N	\N
55	56	2023-01-18 22:27:08.693829	0	tree_open	ir.ui.menu,51	\N	\N
\.


--
-- Data for Name: ir_action_report; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_action_report (id, action, create_date, create_uid, direct_print, extension, model, module, record_name, report, report_content_custom, report_name, single, template_extension, translatable, write_date, write_uid) FROM stdin;
21	21	2023-01-18 22:26:47.309666	0	f		ir.model	ir	\N	\N	\N	ir.model.graph	f	odt	t	2023-01-18 22:26:47.309666	0
23	23	2023-01-18 22:26:47.309666	0	f		ir.model	ir	\N	\N	\N	ir.model.workflow_graph	f	odt	t	2023-01-18 22:26:47.309666	0
58	58	2023-01-18 22:27:08.693829	0	f		res.user	res	\N	res/email_reset_password.html	\N	res.user.email_reset_password	f	html	t	2023-01-18 22:27:08.693829	0
\.


--
-- Data for Name: ir_action_url; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_action_url (id, action, create_date, create_uid, url, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_action_wizard; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_action_wizard (id, action, create_date, create_uid, model, "window", wiz_name, write_date, write_uid) FROM stdin;
4	4	2023-01-18 22:26:47.309666	0	\N	f	ir.ui.view.show	2023-01-18 22:26:47.309666	0
22	22	2023-01-18 22:26:47.309666	0	ir.model	f	ir.model.print_model_graph	2023-01-18 22:26:47.309666	0
34	34	2023-01-18 22:26:47.309666	0	\N	t	ir.lang.config	2023-01-18 22:26:47.309666	0
36	36	2023-01-18 22:26:47.309666	0	ir.action.report	f	ir.translation.report	2023-01-18 22:26:47.309666	0
38	38	2023-01-18 22:26:47.309666	0	\N	f	ir.translation.set	2023-01-18 22:26:47.309666	0
39	39	2023-01-18 22:26:47.309666	0	\N	f	ir.translation.clean	2023-01-18 22:26:47.309666	0
40	40	2023-01-18 22:26:47.309666	0	\N	f	ir.translation.update	2023-01-18 22:26:47.309666	0
41	41	2023-01-18 22:26:47.309666	0	\N	f	ir.translation.export	2023-01-18 22:26:47.309666	0
46	46	2023-01-18 22:26:47.309666	0	\N	t	ir.module.config_wizard	2023-01-18 22:26:47.309666	0
47	47	2023-01-18 22:26:47.309666	0	\N	f	ir.module.activate_upgrade	2023-01-18 22:26:47.309666	0
48	48	2023-01-18 22:26:47.309666	0	\N	t	ir.module.config	2023-01-18 22:26:47.309666	0
57	57	2023-01-18 22:27:08.693829	0	\N	t	res.user.config	2023-01-18 22:27:08.693829	0
\.


--
-- Data for Name: ir_attachment; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_attachment (id, copy_to_resources, create_date, create_uid, data, description, file_id, link, name, resource, type, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_avatar; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_avatar (id, copy_to_resources, create_date, create_uid, image, image_id, resource, uuid, write_date, write_uid) FROM stdin;
1	\N	2023-01-18 22:27:08.693829	0	\\xffd8ffe000104a46494600010100000100010000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc00011080064006403012200021101031101ffc4001a000100030101010000000000000000000000050607040302ffc4003310000103030105030b0500000000000000000102030405110607122141811415911622315162717292a1a2c234556195b1ffc400190101000301010000000000000000000000000102030405ffc4001e11010003000202030000000000000000000001021112210322415171ffda000c03010002110311003f0080001e9b8c0000000000000000000000000000000000f486096a66643044f9657ae1ac6355ce72ff00089e9097983b2aad372a18925abb7d5411aaeea3e681cc455f56553d3c14e323740004a000000000000000002f5b2eb5f6bd412d7bdb98e8e3f357db7704fa6f145361d271b34c6cf25b9ccd447c8c754aa2f3ca6189d787cc65e59cae47caf48ed33a9a961d43a52e3053b9247c7bfbb8f4a491af14f7e5153a9829a86caef0f966b85b67915cf7af6a62af355e0ffc7ea523555afb9f535751a3711a48af8fe07714f045c7429e2f599a2d7ee22c86001d0c80000000000000001d969b7beeb76a4a18f3bd3cad6653922af15e899534ada7dc194564a3b353e1a92aa395a9ca367044f1c7ca43ecaed7da6f751727b7cca58f758bedbb87f88be259aefab747f794d05ca8d955514ee585ce7d2364c6157288abcb3939af6dbc75b8d6b1ebfaccb4bdd3b9f5250d6abb11b6446c9f03b83be8b9e85db6b36cf3a86eac6f0545a7917ee6fe474f955a03f6783faf6137755a3d61a16a9f6f45735cc5742d56e151ec5ca26396718f72916b4f28b4c62623d663587000ea620000000000000000d974c319a5f672faf95a8923e375539179ab930c4ea9bbe2638f7ba591d23dcae7b955ce55e6aa7c8295a71999fb5ad6dc80d3b64d73fd7dadeef554469f6bbf133102f5e51856727533aaed7dd1a9aba95adc46926fc7f03b8a78671d08600b4464224001280000000000000000000000000000000000000000000000000000000000007fffd9	\N	res.user,1	f2ae83b906fc46339708e4d3ee877dc7	2023-01-18 22:27:08.693829	0
\.


--
-- Data for Name: ir_avatar_cache; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_avatar_cache (id, avatar, create_date, create_uid, image, image_id, size, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_cache; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_cache (id, name, "timestamp", create_date, create_uid, write_date, write_uid) FROM stdin;
1	project_work_status.get_window_domains	2023-01-18 22:27:22.517047	\N	\N	\N	\N
3	ir.model.get_names	2023-01-18 22:27:22.534479	\N	\N	\N	\N
4	_digits_mixin..get_digits	2023-01-18 22:27:22.545584	\N	\N	\N	\N
5	currency.cron.get_rs_list_types	2023-01-18 22:27:22.556811	\N	\N	\N	\N
6	ir_action_keyword.get_keyword	2023-01-18 22:27:22.567717	\N	\N	\N	\N
7	ir.model.button.view_attributes	2023-01-18 22:27:22.579705	\N	\N	\N	\N
8	stock.location.default_warehouse	2023-01-18 22:27:22.592417	\N	\N	\N	\N
9	attendance.period	2023-01-18 22:27:22.603276	\N	\N	\N	\N
10	account_payment_stripe_customer.payment_methods	2023-01-18 22:27:22.614764	\N	\N	\N	\N
11	carrier.credential.sendcloud.shipping_methods	2023-01-18 22:27:22.626087	\N	\N	\N	\N
12	ir.calendar.day	2023-01-18 22:27:22.636966	\N	\N	\N	\N
13	ir_session.session_reset	2023-01-18 22:27:22.648888	\N	\N	\N	\N
14	ir.calendar.month	2023-01-18 22:27:22.659531	\N	\N	\N	\N
16	party.address.subdivision_type.get_types	2023-01-18 22:27:22.681566	\N	\N	\N	\N
17	modelview.view_toolbar_get	2023-01-18 22:27:22.692811	\N	\N	\N	\N
18	ir_ui_view.view_get	2023-01-18 22:27:22.703744	\N	\N	\N	\N
20	project_work_status.get_default_status	2023-01-18 22:27:22.725861	\N	\N	\N	\N
22	ir_trigger.get_triggers	2023-01-18 22:27:22.74848	\N	\N	\N	\N
23	ir.ui.view.dashboard_id	2023-01-18 22:27:22.759349	\N	\N	\N	\N
26	ir.model.button.reset	2023-01-18 22:27:22.793838	\N	\N	\N	\N
27	account_payment_braintree_customer.payment_methods	2023-01-18 22:27:22.80369	\N	\N	\N	\N
28	incoterm.incoterm.get_incoterms	2023-01-18 22:27:22.8149	\N	\N	\N	\N
29	ir.translation.get_report	2023-01-18 22:27:22.826486	\N	\N	\N	\N
30	carrier.credential.sendcloud.addresses_sender	2023-01-18 22:27:22.837594	\N	\N	\N	\N
32	ir.message	2023-01-18 22:27:22.859253	\N	\N	\N	\N
33	party.address.format.get_format	2023-01-18 22:27:22.870873	\N	\N	\N	\N
34	company_employee.cost_prices	2023-01-18 22:27:22.881365	\N	\N	\N	\N
36	account_payment_stripe_customer.sources	2023-01-18 22:27:22.903666	\N	\N	\N	\N
37	sale.product.association.rule._find_rules	2023-01-18 22:27:22.915166	\N	\N	\N	\N
38	ir.model.button.rules	2023-01-18 22:27:22.926774	\N	\N	\N	\N
39	ir.model.button.groups	2023-01-18 22:27:23.049518	\N	\N	\N	\N
40	ir.model.field.get_name	2023-01-18 22:27:23.175087	\N	\N	\N	\N
41	carrier.selection.get_carriers	2023-01-18 22:27:23.203639	\N	\N	\N	\N
42	web.shop-stock.location.get_shopify_locations	2023-01-18 22:27:23.215445	\N	\N	\N	\N
43	_dict_schema_mixin.get_relation_fields	2023-01-18 22:27:23.225982	\N	\N	\N	\N
44	ir_ui_view.get_rng	2023-01-18 22:27:23.23751	\N	\N	\N	\N
45	modelstorage.count	2023-01-18 22:27:23.248508	\N	\N	\N	\N
46	ir_model_data.has_model	2023-01-18 22:27:23.259549	\N	\N	\N	\N
47	web.shop.name	2023-01-18 22:27:23.269998	\N	\N	\N	\N
48	ir.translation	2023-01-18 22:27:23.281957	\N	\N	\N	\N
49	ir.ui.icon.list_icons	2023-01-18 22:27:23.292673	\N	\N	\N	\N
51	ir_model_data.get_id	2023-01-18 22:27:23.315289	\N	\N	\N	\N
52	ir.action.report.template	2023-01-18 22:27:23.326407	\N	\N	\N	\N
31	ir.translation.get_language	2023-01-18 22:27:23.39407	\N	\N	\N	\N
35	ir.lang	2023-01-18 22:27:23.404832	\N	\N	\N	\N
19	ir.lang.code	2023-01-18 22:27:23.415345	\N	\N	\N	\N
21	modelview.fields_view_get	2023-01-18 22:28:11.784723	\N	\N	\N	\N
2	ir_configuration.get_language	2023-01-18 22:28:11.829294	\N	\N	\N	\N
24	ir_model_field_access.check	2023-01-18 22:28:11.851252	\N	\N	\N	\N
50	ir_rule.domain_get	2023-01-18 22:28:11.906659	\N	\N	\N	\N
25	ir_model_access.get_access	2023-01-18 22:28:11.95144	\N	\N	\N	\N
15	res_user.get_groups	2023-01-18 22:28:11.973751	\N	\N	\N	\N
\.


--
-- Data for Name: ir_calendar_day; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_calendar_day (id, abbreviation, create_date, create_uid, index, name, write_date, write_uid) FROM stdin;
1	Mon	2023-01-18 22:26:47.309666	0	0	Monday	\N	\N
2	Tue	2023-01-18 22:26:47.309666	0	1	Tuesday	\N	\N
3	Wed	2023-01-18 22:26:47.309666	0	2	Wednesday	\N	\N
4	Thu	2023-01-18 22:26:47.309666	0	3	Thursday	\N	\N
5	Fri	2023-01-18 22:26:47.309666	0	4	Friday	\N	\N
6	Sat	2023-01-18 22:26:47.309666	0	5	Saturday	\N	\N
7	Sun	2023-01-18 22:26:47.309666	0	6	Sunday	\N	\N
\.


--
-- Data for Name: ir_calendar_month; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_calendar_month (id, abbreviation, create_date, create_uid, index, name, write_date, write_uid) FROM stdin;
1	Jan	2023-01-18 22:26:47.309666	0	1	January	\N	\N
2	Feb	2023-01-18 22:26:47.309666	0	2	February	\N	\N
3	Mar	2023-01-18 22:26:47.309666	0	3	March	\N	\N
4	Apr	2023-01-18 22:26:47.309666	0	4	April	\N	\N
5	May	2023-01-18 22:26:47.309666	0	5	May	\N	\N
6	Jun	2023-01-18 22:26:47.309666	0	6	June	\N	\N
7	Jul	2023-01-18 22:26:47.309666	0	7	July	\N	\N
8	Aug	2023-01-18 22:26:47.309666	0	8	August	\N	\N
9	Sep	2023-01-18 22:26:47.309666	0	9	September	\N	\N
10	Oct	2023-01-18 22:26:47.309666	0	10	October	\N	\N
11	Nov	2023-01-18 22:26:47.309666	0	11	November	\N	\N
12	Dec	2023-01-18 22:26:47.309666	0	12	December	\N	\N
\.


--
-- Data for Name: ir_configuration; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_configuration (id, language, hostname, create_date, create_uid, write_date, write_uid) FROM stdin;
1	en	\N	2023-01-18 22:27:23.443067	0	2023-01-18 22:27:23.443067	0
\.


--
-- Data for Name: ir_cron; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_cron (id, active, create_date, create_uid, day, hour, interval_number, interval_type, method, minute, next_call, weekday, write_date, write_uid) FROM stdin;
1	t	2023-01-18 22:26:47.309666	0	\N	\N	1	days	ir.queue|clean	\N	\N	\N	\N	\N
2	t	2023-01-18 22:26:47.309666	0	\N	\N	1	months	ir.error|clean	\N	\N	\N	\N	\N
3	t	2023-01-18 22:27:08.693829	0	\N	\N	5	minutes	ir.trigger|trigger_time	\N	\N	\N	\N	\N
\.


--
-- Data for Name: ir_email; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_email (id, body, create_date, create_uid, recipients, recipients_hidden, recipients_secondary, resource, subject, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_email_address; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_email_address (id, address, create_date, create_uid, email, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_email_template; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_email_template (id, body, create_date, create_uid, model, name, recipients, recipients_hidden, recipients_hidden_pyson, recipients_pyson, recipients_secondary, recipients_secondary_pyson, subject, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_email_template-ir_action_report; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public."ir_email_template-ir_action_report" (id, create_date, create_uid, report, template, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_error; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_error (id, create_date, create_uid, description, message, origin, processed_by, solved_by, state, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_export; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_export (id, create_date, create_uid, header, name, resource, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_export-res_group; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public."ir_export-res_group" (id, create_date, create_uid, export, "group", write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_export-write-res_group; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public."ir_export-write-res_group" (id, create_date, create_uid, export, "group", write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_export_line; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_export_line (id, create_date, create_uid, export, name, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_lang; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_lang (id, name, code, translatable, parent, active, direction, am, create_date, create_uid, date, decimal_point, "grouping", mon_decimal_point, mon_grouping, mon_thousands_sep, n_cs_precedes, n_sep_by_space, n_sign_posn, negative_sign, p_cs_precedes, p_sep_by_space, p_sign_posn, pg_text_search, pm, positive_sign, thousands_sep, write_date, write_uid) FROM stdin;
2	Bulgarian	bg	f	\N	t	ltr		2023-01-18 22:26:47.309666	0	%d.%m.%Y	,	[3, 3, 0]	,	[3, 3, 0]		f	t	1	-	f	t	1	\N			.	\N	\N
3	Català	ca	f	\N	t	ltr	a. m.	2023-01-18 22:26:47.309666	0	%d/%m/%Y	,	[3, 3, 0]	,	[3, 3, 0]	.	f	t	1	-	f	t	1	\N	p. m.		 	\N	\N
4	Czech	cs	f	\N	t	ltr		2023-01-18 22:26:47.309666	0	%d.%m.%Y	,	[3, 3, 0]	,	[3, 3, 0]		f	t	1	-	f	t	1	\N			 	\N	\N
5	German	de	f	\N	t	ltr		2023-01-18 22:26:47.309666	0	%d.%m.%Y	,	[3, 3, 0]	,	[3, 3, 0]	.	f	t	1	-	f	t	1	\N			.	\N	\N
6	Spanish	es	f	\N	t	ltr		2023-01-18 22:26:47.309666	0	%d/%m/%Y	,	[3, 3, 0]	,	[3, 3, 0]	.	f	t	1	-	f	t	1	\N			.	\N	\N
7	Spanish (Latin American)	es_419	f	\N	t	ltr		2023-01-18 22:26:47.309666	0	%d/%m/%Y	.	[3, 3, 0]	.	[3, 3, 0]	,	f	t	1	-	f	t	1	\N			,	\N	\N
8	Estonian	et	f	\N	t	ltr	\N	2023-01-18 22:26:47.309666	0	%d.%m.%Y	,	[3, 3]	,	[3, 3]		f	t	1	-	f	t	1	\N	\N		 	\N	\N
9	Persian	fa	f	\N	t	rtl		2023-01-18 22:26:47.309666	0	%Y/%m/%d	.	[3, 0]	٫	[3, 0]	٬	f	t	1	-	f	t	1	\N			,	\N	\N
10	Finnish	fi	f	\N	t	ltr	\N	2023-01-18 22:26:47.309666	0	%d.%m.%Y	,	[3, 3, 0]	,	[3, 3, 0]		f	t	1	-	f	t	1	\N	\N		 	\N	\N
11	French	fr	f	\N	t	ltr		2023-01-18 22:26:47.309666	0	%d.%m.%Y	,	[3, 0]	,	[3, 0]		f	t	1	-	f	t	1	\N			 	\N	\N
12	Hungarian	hu	f	\N	t	ltr		2023-01-18 22:26:47.309666	0	%Y-%m-%d	,	[3, 3, 0]	,	[3, 3, 0]	.	f	t	1	-	f	t	1	\N			.	\N	\N
13	Indonesian	id	f	\N	t	ltr		2023-01-18 22:26:47.309666	0	%d/%m/%Y	,	[3, 3]	,	[3, 3]	.	t	f	1	-	t	f	1	\N			.	\N	\N
14	Italian	it	f	\N	t	ltr		2023-01-18 22:26:47.309666	0	%d/%m/%Y	,	[]	,	[3, 3, 0]	.	t	t	1	-	t	t	1	\N				\N	\N
15	Lao	lo	f	\N	t	ltr	AM	2023-01-18 22:26:47.309666	0	%d/%m/%Y	.	[3, 3, 0]	.	[3, 3, 0]	,	t	t	4	-	t	t	4	\N	PM		,	\N	\N
16	Lithuanian	lt	f	\N	t	ltr		2023-01-18 22:26:47.309666	0	%Y-%m-%d	,	[3, 3, 0]	,	[3, 3, 0]	.	f	t	1	-	f	t	1	\N			.	\N	\N
17	Dutch	nl	f	\N	t	ltr		2023-01-18 22:26:47.309666	0	%d-%m-%Y	,	[]	,	[3, 3, 0]		t	t	2	-	t	t	1	\N				\N	\N
18	Polish	pl	f	\N	t	ltr		2023-01-18 22:26:47.309666	0	%d.%m.%Y	,	[3, 3, 0]	,	[3, 0, 0]		f	t	1	-	f	t	1	\N			 	\N	\N
19	Portuguese	pt	f	\N	t	ltr		2023-01-18 22:26:47.309666	0	%d-%m-%Y	,	[]	,	[3, 3, 0]	.	t	t	1	-	t	t	1	\N				\N	\N
20	Romanian	ro	f	\N	t	ltr		2023-01-18 22:26:47.309666	0	%d.%m.%Y	,	[3,3]	,	[3,3]	.	t	t	1	-	t	t	1	\N			.	\N	\N
21	Russian	ru	f	\N	t	ltr		2023-01-18 22:26:47.309666	0	%d.%m.%Y	,	[3, 3, 0]	.	[3, 3, 0]		f	t	1	-	f	t	1	\N			 	\N	\N
22	Slovenian	sl	f	\N	t	ltr		2023-01-18 22:26:47.309666	0	%d.%m.%Y	,	[]	,	[3, 3, 0]		f	t	1	-	f	t	1	\N			 	\N	\N
23	Turkish	tr	f	\N	t	ltr	\N	2023-01-18 22:26:47.309666	0	%d-%m-%Y	,	[3, 3, 0]	,	[3, 3, 0]	.	f	t	1	-	f	t	1	\N	\N		.	\N	\N
24	Ukrainian	uk	f	\N	t	ltr	\N	2023-01-18 22:26:47.309666	0	%d.%m.%Y	,	[3, 3]	,	[3, 3]		f	t	1	-	f	t	1	\N	\N		 	\N	\N
25	Chinese Simplified	zh_CN	f	\N	t	ltr	上午	2023-01-18 22:26:47.309666	0	%Y-%m-%d	.	[3, 0]	.	[3, 0]	,	t	f	4	-	t	f	4	\N	下午		,	\N	\N
1	English	en	t	\N	t	ltr	AM	2023-01-18 22:26:47.309666	0	%m/%d/%Y	.	[3, 3, 0]	.	[3, 3, 0]	,	t	f	1	-	t	f	1	\N	PM		,	2023-01-18 22:27:23.35443	0
\.


--
-- Data for Name: ir_message; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_message (id, create_date, create_uid, text, write_date, write_uid) FROM stdin;
1	2023-01-18 22:26:47.309666	0	ID	\N	\N
2	2023-01-18 22:26:47.309666	0	Created by	\N	\N
3	2023-01-18 22:26:47.309666	0	Created at	\N	\N
4	2023-01-18 22:26:47.309666	0	Edited by	\N	\N
5	2023-01-18 22:26:47.309666	0	Edited at	\N	\N
6	2023-01-18 22:26:47.309666	0	Record Name	\N	\N
7	2023-01-18 22:26:47.309666	0	Active	\N	\N
8	2023-01-18 22:26:47.309666	0	Uncheck to exclude from future use.	\N	\N
9	2023-01-18 22:26:47.309666	0	Name	\N	\N
10	2023-01-18 22:26:47.309666	0	String	\N	\N
11	2023-01-18 22:26:47.309666	0	Help	\N	\N
12	2023-01-18 22:26:47.309666	0	Type	\N	\N
13	2023-01-18 22:26:47.309666	0	Boolean	\N	\N
14	2023-01-18 22:26:47.309666	0	Integer	\N	\N
15	2023-01-18 22:26:47.309666	0	Char	\N	\N
16	2023-01-18 22:26:47.309666	0	Float	\N	\N
17	2023-01-18 22:26:47.309666	0	Numeric	\N	\N
18	2023-01-18 22:26:47.309666	0	Date	\N	\N
19	2023-01-18 22:26:47.309666	0	DateTime	\N	\N
20	2023-01-18 22:26:47.309666	0	Selection	\N	\N
21	2023-01-18 22:26:47.309666	0	MultiSelection	\N	\N
22	2023-01-18 22:26:47.309666	0	Digits	\N	\N
23	2023-01-18 22:26:47.309666	0	Domain	\N	\N
24	2023-01-18 22:26:47.309666	0	A couple of key and label separated by ":" per line.	\N	\N
25	2023-01-18 22:26:47.309666	0	Selection Sorted	\N	\N
26	2023-01-18 22:26:47.309666	0	If the selection must be sorted on label.	\N	\N
27	2023-01-18 22:26:47.309666	0	Help Selection	\N	\N
28	2023-01-18 22:26:47.309666	0	The key followed by the help text separated by a ":", one per line.	\N	\N
29	2023-01-18 22:26:47.309666	0	Selection JSON	\N	\N
30	2023-01-18 22:26:47.309666	0	Help Selection JSON	\N	\N
31	2023-01-18 22:26:47.309666	0	Yes	\N	\N
32	2023-01-18 22:26:47.309666	0	No	\N	\N
33	2023-01-18 22:26:47.309666	0	Sequence	\N	\N
34	2023-01-18 22:26:47.309666	0	ID must be positive.	\N	\N
35	2023-01-18 22:26:47.309666	0	You are not allowed to modify this record.	\N	\N
36	2023-01-18 22:26:47.309666	0	You are not allowed to delete this record.	\N	\N
37	2023-01-18 22:26:47.309666	0	This record is part of the base configuration.	\N	\N
38	2023-01-18 22:26:47.309666	0	Relation not found: %(value)r in "%(model)s" (%(column)s).	\N	\N
39	2023-01-18 22:26:47.309666	0	Too many relations found: %(value)r in "%(model)s" (%(column)s).	\N	\N
40	2023-01-18 22:26:47.309666	0	Syntax error for value: %(value)r in "%(field)s" of "%(model)s" (%(column)s).	\N	\N
41	2023-01-18 22:26:47.309666	0	Syntax error for reference: %(value)r in "%(field)s" of "%(model)s" (%(column)s).	\N	\N
42	2023-01-18 22:26:47.309666	0	Syntax error for XML id: %(value)r in "%(field)s" of "%(model)s" (%(column)s).	\N	\N
43	2023-01-18 22:26:47.309666	0	The value "%(value)s" for field "%(field)s" in "%(record)s" of "%(model)s" is not valid according to its domain.	\N	\N
44	2023-01-18 22:26:47.309666	0	A value is required for field "%(field)s" in "%(model)s".	\N	\N
45	2023-01-18 22:26:47.309666	0	A value is required for field "%(field)s" in "%(record)s" of "%(model)s".	\N	\N
46	2023-01-18 22:26:47.309666	0	The value "%(value)s" for field "%(field)s" in "%(model)s" is too long (%(size)i > %(max_size)i).	\N	\N
47	2023-01-18 22:26:47.309666	0	The value "%(value)s" for field "%(field)s" in "%(record)s" of "%(model)s" is too long (%(size)i > %(max_size)i).	\N	\N
48	2023-01-18 22:26:47.309666	0	The number of digits in the value "%(value)r" for field "%(field)s" in "%(record)s" of "%(model)s" exceeds the limit of "%(digits)i".	\N	\N
49	2023-01-18 22:26:47.309666	0	The value "%(value)s" for field "%(field)s" in "%(record)s" of "%(model)s" contains some invalid chars "%(chars)s".	\N	\N
50	2023-01-18 22:26:47.309666	0	The value "%(value)s" for field "%(field)s" in "%(record)s" of "%(model)s" is not one of the allowed options.	\N	\N
51	2023-01-18 22:26:47.309666	0	The time value "%(value)s" for field "%(field)s" in "%(record)s" of "%(model)s" is not valid.	\N	\N
52	2023-01-18 22:26:47.309666	0	The value "%(value)s" for field "%(field)s" in "%(model)s" does not exist.	\N	\N
53	2023-01-18 22:26:47.309666	0	The records could not be deleted because they are used by field "%(field)s" of "%(model)s".	\N	\N
54	2023-01-18 22:26:47.309666	0	You are not allowed to access "%(model)s".	\N	\N
55	2023-01-18 22:26:47.309666	0	You are not allowed to access "%(model)s.%(field)s".	\N	\N
56	2023-01-18 22:26:47.309666	0	You are not allowed to create records of "%(model)s" because they fail on at least one of these rules:\n%(rules)s	\N	\N
57	2023-01-18 22:26:47.309666	0	You are not allowed to read records "%(ids)s" of "%(model)s" because of at least one of these rules:\n%(rules)s	\N	\N
58	2023-01-18 22:26:47.309666	0	You are trying to read records "%(ids)s" of "%(model)s" that don't exist anymore.	\N	\N
59	2023-01-18 22:26:47.309666	0	You are not allowed to write to records "%(ids)s" of "%(model)s" because of at least one of these rules:\n%(rules)s	\N	\N
60	2023-01-18 22:26:47.309666	0	You are trying to write to records "%(ids)s" of "%(model)s" that don't exist anymore.	\N	\N
61	2023-01-18 22:26:47.309666	0	You are not allowed to delete records "%(ids)s" of "%(model)s" because of at lease one of those rules:\n%(rules)s	\N	\N
62	2023-01-18 22:26:47.309666	0	Invalid domain in schema "%(schema)s".	\N	\N
63	2023-01-18 22:26:47.309666	0	Invalid selection in schema "%(schema)s".	\N	\N
64	2023-01-18 22:26:47.309666	0	Invalid help selection in schema "%(schema)s".	\N	\N
65	2023-01-18 22:26:47.309666	0	Recursion error: Record "%(rec_name)s" with parent "%(parent_rec_name)s" was configured as ancestor of itself.	\N	\N
66	2023-01-18 22:26:47.309666	0	Missing search function for field "%(field)s" in "%(model)s".	\N	\N
67	2023-01-18 22:26:47.309666	0	Missing setter function for field "%(field)s" in "%(model)s".	\N	\N
68	2023-01-18 22:26:47.309666	0	Calling button "%(button)s on "%(model)s" is not allowed.	\N	\N
69	2023-01-18 22:26:47.309666	0	Invalid XML for view "%(name)s".	\N	\N
70	2023-01-18 22:26:47.309666	0	Wrong wizard model in keyword action "%(name)s".	\N	\N
71	2023-01-18 22:26:47.309666	0	Invalid email definition for report "%(name)s".	\N	\N
72	2023-01-18 22:26:47.309666	0	Invalid record name definition for report "%(report)s" with exception "%(exception)s".	\N	\N
73	2023-01-18 22:26:47.309666	0	Invalid view "%(view)s" for action "%(action)s".	\N	\N
74	2023-01-18 22:26:47.309666	0	Invalid domain or search criteria "%(domain)s" for action "%(action)s".	\N	\N
75	2023-01-18 22:26:47.309666	0	Invalid context "%(context)s" for action "%(action)s".	\N	\N
76	2023-01-18 22:26:47.309666	0	The condition "%(condition)s" is not a valid PYSON expression for button rule "%(rule)s".	\N	\N
77	2023-01-18 22:26:47.309666	0	Missing sequence.	\N	\N
78	2023-01-18 22:26:47.309666	0	Invalid prefix "%(affix)s" for sequence "%(sequence)s".	\N	\N
79	2023-01-18 22:26:47.309666	0	Invalid suffix "%(affix)s" for sequence "%(sequence)s".	\N	\N
80	2023-01-18 22:26:47.309666	0	The "Last Timestamp" cannot be in the future for sequence "%s".	\N	\N
81	2023-01-18 22:26:47.309666	0	You cannot change the sequence type of a sequence instead create a new sequence.	\N	\N
82	2023-01-18 22:26:47.309666	0	Invalid "Increment Number" (%(number_increment)s) or "Next Number" (%(number_next)s) with exception "%(exception)s".	\N	\N
83	2023-01-18 22:26:47.309666	0	Invalid grouping "%(grouping)s" for language "%(language)s".	\N	\N
84	2023-01-18 22:26:47.309666	0	Invalid date format "%(format)s" for language "%(language)s".	\N	\N
85	2023-01-18 22:26:47.309666	0	The default language "%(language)s" must be translatable.	\N	\N
86	2023-01-18 22:26:47.309666	0	The default language "%(language)s" can not be deleted.	\N	\N
87	2023-01-18 22:26:47.309666	0	Invalid domain in rule "%(name)s".	\N	\N
88	2023-01-18 22:26:47.309666	0	You can not export translation "%(name)s" because it has been overridden by module "%(overriding_module)s".	\N	\N
89	2023-01-18 22:26:47.309666	0	You can not remove a module that is activated or that is about to be activated.	\N	\N
90	2023-01-18 22:26:47.309666	0	Some activated modules depend on the ones you are trying to deactivate:	\N	\N
91	2023-01-18 22:26:47.309666	0	Condition "%(condition)s" is not a valid PYSON expression for trigger "%(trigger)s".	\N	\N
92	2023-01-18 22:26:47.309666	0	Failed to save, please retry.	\N	\N
93	2023-01-18 22:26:47.309666	0	Y	\N	\N
94	2023-01-18 22:26:47.309666	0	M	\N	\N
95	2023-01-18 22:26:47.309666	0	w	\N	\N
96	2023-01-18 22:26:47.309666	0	d	\N	\N
97	2023-01-18 22:26:47.309666	0	h	\N	\N
98	2023-01-18 22:26:47.309666	0	m	\N	\N
99	2023-01-18 22:26:47.309666	0	s	\N	\N
100	2023-01-18 22:26:47.309666	0	The resources to which this record must be copied.	\N	\N
101	2023-01-18 22:26:47.309666	0	Attachments	\N	\N
102	2023-01-18 22:26:47.309666	0	Notes	\N	\N
103	2023-01-18 22:26:47.309666	0	You are not allowed to execute wizard "%(wizard)s".	\N	\N
104	2023-01-18 22:26:47.309666	0	You are not allowed to execute wizard "%(wizard)s" on "%(model)s".	\N	\N
105	2023-01-18 22:26:47.309666	0	Invalid subject in e-mail template "%(template)s" with exception "%(exception)s".	\N	\N
106	2023-01-18 22:26:47.309666	0	Invalid body in e-mail template "%(template)s" with exception "%(exception)s".	\N	\N
107	2023-01-18 22:26:47.309666	0	Invalid PYSON %(field)s in e-mail template "%(template)s" with exception "%(exception)s".	\N	\N
108	2023-01-18 22:26:47.309666	0	The PYSON %(field)s in e-mail template "%(template)s" must generate a list.	\N	\N
109	2023-01-18 22:26:47.309666	0	Only one avatar is allowed per resource.	\N	\N
110	2023-01-18 22:26:47.309666	0	The size of an avatar must be unique.	\N	\N
111	2023-01-18 22:26:47.309666	0	Avatar	\N	\N
112	2023-01-18 22:26:47.309666	0	Avatars	\N	\N
113	2023-01-18 22:26:47.309666	0	Avatar URL	\N	\N
114	2023-01-18 22:26:47.309666	0	The code on language must be unique.	\N	\N
115	2023-01-18 22:26:47.309666	0	The name of the button must be unique per model.	\N	\N
116	2023-01-18 22:26:47.309666	0	Invalid domain or search criteria "%(domain)s" for search "%(search)s".	\N	\N
117	2023-01-18 22:26:47.309666	0	%(field)s (string)	\N	\N
118	2023-01-18 22:26:47.309666	0	%(field)s (model name)	\N	\N
119	2023-01-18 22:27:08.693829	0	The password must have at least %(length)i characters.	\N	\N
120	2023-01-18 22:27:08.693829	0	The password is forbidden.	\N	\N
121	2023-01-18 22:27:08.693829	0	The password cannot be the same as user's name.	\N	\N
122	2023-01-18 22:27:08.693829	0	The password cannot be the same as user's login.	\N	\N
123	2023-01-18 22:27:08.693829	0	The password cannot be the same as user's email address.	\N	\N
124	2023-01-18 22:27:08.693829	0	For logging purposes users cannot be deleted, instead they should be deactivated.	\N	\N
125	2023-01-18 22:27:08.693829	0	Password for %(login)s	\N	\N
\.


--
-- Data for Name: ir_model; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_model (id, model, name, info, module, create_date, create_uid, global_search_p, write_date, write_uid) FROM stdin;
1	ir.configuration	Configuration	Configuration	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
2	ir.translation	Translation	Translation	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
3	ir.translation.set.start	Set Translation	Set Translation	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
4	ir.translation.set.succeed	Set Translation	Set Translation	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
5	ir.translation.clean.start	Clean translation	Clean translation	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
6	ir.translation.clean.succeed	Clean translation	Clean translation	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
7	ir.translation.update.start	Update translation	Update translation	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
8	ir.translation.export.start	Export translation	Export translation	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
9	ir.translation.export.result	Export translation	Export translation	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
10	ir.sequence.type	Sequence type	Sequence type	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
11	ir.sequence	Sequence	Sequence	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
12	ir.sequence.strict	Sequence Strict	Sequence Strict	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
13	ir.ui.menu	UI menu	UI menu	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
14	ir.ui.menu.favorite	Menu Favorite	Menu Favorite	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
15	ir.ui.view	View	View	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
16	ir.ui.view.show.start	Show view	Show view	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
17	ir.ui.view_tree_width	View Tree Width	View Tree Width	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
18	ir.ui.view_tree_optional	View Tree Optional	View Tree Optional	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
19	ir.ui.view_tree_state	View Tree State	View Tree State	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
20	ir.ui.view_search	View Search	View Search	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
21	ir.ui.icon	Icon	Icon	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
22	ir.action	Action	Action	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
23	ir.action.keyword	Action keyword	Action keyword	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
24	ir.action.report	Action report	Action report	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
25	ir.action.act_window	Action act window	Action act window	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
26	ir.action.act_window.view	Action act window view	Action act window view	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
27	ir.action.act_window.domain	Action act window domain	Action act window domain	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
28	ir.action.wizard	Action wizard	Action wizard	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
29	ir.action.url	Action URL	Action URL	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
30	ir.model	Model	Model	ir	2023-01-18 22:26:51.247266	0	\N	\N	\N
31	ir.model.field	Model field	Model field	ir	\N	\N	f	\N	\N
32	ir.model.access	Model access	Model access	ir	\N	\N	f	\N	\N
33	ir.model.field.access	Model Field Access	Model Field Access	ir	\N	\N	f	\N	\N
34	ir.model.button	Model Button	Model Button	ir	\N	\N	f	\N	\N
35	ir.model.button.rule	Model Button Rule	Model Button Rule	ir	\N	\N	f	\N	\N
36	ir.model.button.click	Model Button Click	Model Button Click	ir	\N	\N	f	\N	\N
37	ir.model.button-button.reset	Model Button Reset	Model Button Reset	ir	\N	\N	f	\N	\N
38	ir.model.data	Model data	Model data	ir	\N	\N	f	\N	\N
39	ir.model.print_model_graph.start	Print Model Graph	Print Model Graph	ir	\N	\N	f	\N	\N
40	ir.attachment	Attachment	Attachment	ir	\N	\N	f	\N	\N
41	ir.note	Note	Note	ir	\N	\N	f	\N	\N
42	ir.note.read	Note Read	Note Read	ir	\N	\N	f	\N	\N
43	ir.avatar	Avatar	Avatar	ir	\N	\N	f	\N	\N
44	ir.avatar.cache	Avatar Cache	Avatar Cache	ir	\N	\N	f	\N	\N
45	ir.cron	Cron	Cron	ir	\N	\N	f	\N	\N
46	ir.lang	Language	Language	ir	\N	\N	f	\N	\N
47	ir.lang.config.start	Configure languages	Configure languages	ir	\N	\N	f	\N	\N
48	ir.export	Export	Export	ir	\N	\N	f	\N	\N
49	ir.export.line	Export line	Export line	ir	\N	\N	f	\N	\N
50	ir.rule.group	Rule group	Rule group	ir	\N	\N	f	\N	\N
51	ir.rule	Rule	Rule	ir	\N	\N	f	\N	\N
52	ir.module	Module	Module	ir	\N	\N	f	\N	\N
53	ir.module.dependency	Module dependency	Module dependency	ir	\N	\N	f	\N	\N
54	ir.module.config_wizard.item	Config wizard to run after activating a module	Config wizard to run after activating a module	ir	\N	\N	f	\N	\N
55	ir.module.config_wizard.first	Module Config Wizard First	Module Config Wizard First	ir	\N	\N	f	\N	\N
56	ir.module.config_wizard.other	Module Config Wizard Other	Module Config Wizard Other	ir	\N	\N	f	\N	\N
57	ir.module.config_wizard.done	Module Config Wizard Done	Module Config Wizard Done	ir	\N	\N	f	\N	\N
58	ir.module.activate_upgrade.start	Module Activate Upgrade Start	Module Activate Upgrade Start	ir	\N	\N	f	\N	\N
59	ir.module.activate_upgrade.done	Module Activate Upgrade Done	Module Activate Upgrade Done	ir	\N	\N	f	\N	\N
60	ir.module.config.start	Configure Modules	Configure Modules	ir	\N	\N	f	\N	\N
61	ir.cache	Cache	Cache	ir	\N	\N	f	\N	\N
62	ir.date	Date	Date	ir	\N	\N	f	\N	\N
63	ir.trigger	Trigger	Trigger	ir	\N	\N	f	\N	\N
64	ir.trigger.log	Trigger Log	Trigger Log	ir	\N	\N	f	\N	\N
65	ir.session	Session	Session	ir	\N	\N	f	\N	\N
66	ir.session.wizard	Session Wizard	Session Wizard	ir	\N	\N	f	\N	\N
67	ir.queue	Queue	Queue	ir	\N	\N	f	\N	\N
68	ir.calendar.month	Month	Month	ir	\N	\N	f	\N	\N
69	ir.calendar.day	Day	Day	ir	\N	\N	f	\N	\N
70	ir.message	Message	Message	ir	\N	\N	f	\N	\N
71	ir.email	Email	Email	ir	\N	\N	f	\N	\N
72	ir.email.address	Email Address	Email Address	ir	\N	\N	f	\N	\N
73	ir.email.template	Email Template	Email Template	ir	\N	\N	f	\N	\N
74	ir.email.template-ir.action.report	Email Template - Report	Email Template - Report	ir	\N	\N	f	\N	\N
75	ir.error	Error	Error	ir	\N	\N	f	\N	\N
76	res.group	Group	Group	res	\N	\N	f	\N	\N
77	res.user	User	User	res	\N	\N	f	\N	\N
78	res.user.login.attempt	Login Attempt	Login Attempt\n\n    This class is separated from the res.user one in order to prevent locking\n    the res.user table when in a long running process.\n    	res	\N	\N	f	\N	\N
79	res.user.device	User Device	User Device	res	\N	\N	f	\N	\N
80	res.user-ir.action	User - Action	User - Action	res	\N	\N	f	\N	\N
81	res.user-res.group	User - Group	User - Group	res	\N	\N	f	\N	\N
82	res.user.warning	User Warning	User Warning	res	\N	\N	f	\N	\N
83	res.user.application	User Application	User Application	res	\N	\N	f	\N	\N
84	res.user.config.start	User Config Init	User Config Init	res	\N	\N	f	\N	\N
85	ir.ui.menu-res.group	UI Menu - Group	UI Menu - Group	res	\N	\N	f	\N	\N
86	ir.action-res.group	Action - Group	Action - Group	res	\N	\N	f	\N	\N
87	ir.model.button-res.group	Model Button - Group	Model Button - Group	res	\N	\N	f	\N	\N
88	ir.rule.group-res.group	Rule Group - Group	Rule Group - Group	res	\N	\N	f	\N	\N
89	ir.sequence.type-res.group	Sequence Type - Group	Sequence Type - Group	res	\N	\N	f	\N	\N
90	ir.export-res.group	Export Group	Export Group	res	\N	\N	f	\N	\N
91	ir.export-write-res.group	Export Modification Group	Export Modification Group	res	\N	\N	f	\N	\N
\.


--
-- Data for Name: ir_model_access; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_model_access (id, active, create_date, create_uid, description, "group", model, perm_create, perm_delete, perm_read, perm_write, write_date, write_uid) FROM stdin;
1	t	2023-01-18 22:26:47.309666	0	\N	\N	71	t	f	t	f	\N	\N
2	t	2023-01-18 22:27:08.693829	0	\N	\N	76	f	f	t	f	\N	\N
3	t	2023-01-18 22:27:08.693829	0	\N	1	76	t	t	t	t	\N	\N
4	t	2023-01-18 22:27:08.693829	0	\N	\N	77	f	f	t	f	\N	\N
5	t	2023-01-18 22:27:08.693829	0	\N	1	77	t	t	t	t	\N	\N
6	t	2023-01-18 22:27:08.693829	0	\N	\N	10	f	f	t	f	\N	\N
7	t	2023-01-18 22:27:08.693829	0	\N	1	10	t	t	t	t	\N	\N
8	t	2023-01-18 22:27:08.693829	0	\N	\N	21	f	f	t	f	\N	\N
9	t	2023-01-18 22:27:08.693829	0	\N	1	21	t	t	t	t	\N	\N
10	t	2023-01-18 22:27:08.693829	0	\N	\N	13	f	f	t	f	\N	\N
11	t	2023-01-18 22:27:08.693829	0	\N	1	13	t	t	t	t	\N	\N
12	t	2023-01-18 22:27:08.693829	0	\N	\N	15	f	f	t	f	\N	\N
13	t	2023-01-18 22:27:08.693829	0	\N	1	15	t	t	t	t	\N	\N
14	t	2023-01-18 22:27:08.693829	0	\N	\N	22	f	f	t	f	\N	\N
15	t	2023-01-18 22:27:08.693829	0	\N	1	22	t	t	t	t	\N	\N
16	t	2023-01-18 22:27:08.693829	0	\N	\N	23	f	f	t	f	\N	\N
17	t	2023-01-18 22:27:08.693829	0	\N	1	23	t	t	t	t	\N	\N
18	t	2023-01-18 22:27:08.693829	0	\N	\N	24	f	f	t	f	\N	\N
19	t	2023-01-18 22:27:08.693829	0	\N	1	24	t	t	t	t	\N	\N
20	t	2023-01-18 22:27:08.693829	0	\N	\N	25	f	f	t	f	\N	\N
21	t	2023-01-18 22:27:08.693829	0	\N	1	25	t	t	t	t	\N	\N
22	t	2023-01-18 22:27:08.693829	0	\N	\N	26	f	f	t	f	\N	\N
23	t	2023-01-18 22:27:08.693829	0	\N	1	26	t	t	t	t	\N	\N
24	t	2023-01-18 22:27:08.693829	0	\N	\N	27	f	f	t	f	\N	\N
25	t	2023-01-18 22:27:08.693829	0	\N	1	27	t	t	t	t	\N	\N
26	t	2023-01-18 22:27:08.693829	0	\N	\N	28	f	f	t	f	\N	\N
27	t	2023-01-18 22:27:08.693829	0	\N	1	28	t	t	t	t	\N	\N
28	t	2023-01-18 22:27:08.693829	0	\N	\N	29	f	f	t	f	\N	\N
29	t	2023-01-18 22:27:08.693829	0	\N	1	29	t	t	t	t	\N	\N
30	t	2023-01-18 22:27:08.693829	0	\N	\N	30	f	f	t	f	\N	\N
31	t	2023-01-18 22:27:08.693829	0	\N	1	30	t	t	t	t	\N	\N
32	t	2023-01-18 22:27:08.693829	0	\N	\N	31	f	f	t	f	\N	\N
33	t	2023-01-18 22:27:08.693829	0	\N	1	31	t	t	t	t	\N	\N
34	t	2023-01-18 22:27:08.693829	0	\N	\N	32	f	f	t	f	\N	\N
35	t	2023-01-18 22:27:08.693829	0	\N	1	32	t	t	t	t	\N	\N
36	t	2023-01-18 22:27:08.693829	0	\N	\N	34	f	f	t	f	\N	\N
37	t	2023-01-18 22:27:08.693829	0	\N	1	34	t	t	t	t	\N	\N
38	t	2023-01-18 22:27:08.693829	0	\N	\N	35	f	f	t	f	\N	\N
39	t	2023-01-18 22:27:08.693829	0	\N	1	35	t	t	t	t	\N	\N
40	t	2023-01-18 22:27:08.693829	0	\N	\N	36	f	f	t	f	\N	\N
41	t	2023-01-18 22:27:08.693829	0	\N	1	36	t	t	t	t	\N	\N
42	t	2023-01-18 22:27:08.693829	0	\N	\N	38	f	f	t	f	\N	\N
43	t	2023-01-18 22:27:08.693829	0	\N	\N	45	f	f	t	f	\N	\N
44	t	2023-01-18 22:27:08.693829	0	\N	1	45	t	t	t	t	\N	\N
45	t	2023-01-18 22:27:08.693829	0	\N	\N	67	f	f	f	f	\N	\N
46	t	2023-01-18 22:27:08.693829	0	\N	1	67	f	f	t	f	\N	\N
47	t	2023-01-18 22:27:08.693829	0	\N	\N	46	f	f	t	f	\N	\N
48	t	2023-01-18 22:27:08.693829	0	\N	1	46	t	t	t	t	\N	\N
49	t	2023-01-18 22:27:08.693829	0	\N	\N	2	f	f	t	f	\N	\N
50	t	2023-01-18 22:27:08.693829	0	\N	1	2	t	t	t	t	\N	\N
51	t	2023-01-18 22:27:08.693829	0	\N	\N	50	f	f	t	f	\N	\N
52	t	2023-01-18 22:27:08.693829	0	\N	1	50	t	t	t	t	\N	\N
53	t	2023-01-18 22:27:08.693829	0	\N	\N	51	f	f	t	f	\N	\N
54	t	2023-01-18 22:27:08.693829	0	\N	1	51	t	t	t	t	\N	\N
55	t	2023-01-18 22:27:08.693829	0	\N	\N	52	f	f	t	f	\N	\N
56	t	2023-01-18 22:27:08.693829	0	\N	1	52	t	t	t	t	\N	\N
57	t	2023-01-18 22:27:08.693829	0	\N	\N	53	f	f	t	f	\N	\N
58	t	2023-01-18 22:27:08.693829	0	\N	1	53	t	t	t	t	\N	\N
59	t	2023-01-18 22:27:08.693829	0	\N	\N	63	f	f	t	f	\N	\N
60	t	2023-01-18 22:27:08.693829	0	\N	1	63	t	t	t	t	\N	\N
61	t	2023-01-18 22:27:08.693829	0	\N	\N	64	f	f	t	f	\N	\N
62	t	2023-01-18 22:27:08.693829	0	\N	1	64	t	t	t	t	\N	\N
63	t	2023-01-18 22:27:08.693829	0	\N	\N	19	f	f	f	f	\N	\N
64	t	2023-01-18 22:27:08.693829	0	\N	1	19	t	t	t	t	\N	\N
65	t	2023-01-18 22:27:08.693829	0	\N	\N	70	f	f	t	f	\N	\N
66	t	2023-01-18 22:27:08.693829	0	\N	1	70	t	t	t	t	\N	\N
67	t	2023-01-18 22:27:08.693829	0	\N	\N	73	f	f	t	f	\N	\N
68	t	2023-01-18 22:27:08.693829	0	\N	1	73	t	t	t	t	\N	\N
69	t	2023-01-18 22:27:08.693829	0	\N	\N	75	f	f	f	f	\N	\N
70	t	2023-01-18 22:27:08.693829	0	\N	1	75	f	t	t	t	\N	\N
\.


--
-- Data for Name: ir_model_button; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_model_button (id, active, confirm, create_date, create_uid, help, model, name, string, write_date, write_uid) FROM stdin;
1	t	\N	2023-01-18 22:26:47.309666	0	\N	15	show	Show	\N	\N
2	t	\N	2023-01-18 22:26:47.309666	0	\N	38	sync	Sync	\N	\N
3	t	\N	2023-01-18 22:26:47.309666	0	\N	45	run_once	Run Once	\N	\N
4	t	Are you sure you want to load languages' translations?	2023-01-18 22:26:47.309666	0	\N	46	load_translations	Load translations	\N	\N
5	t	Are you sure you want to remove languages' translations?	2023-01-18 22:26:47.309666	0	\N	46	unload_translations	Unload translations	\N	\N
6	t	\N	2023-01-18 22:26:47.309666	0	\N	52	activate	Mark for Activation	\N	\N
7	t	\N	2023-01-18 22:26:47.309666	0	\N	52	activate_cancel	Cancel Activation	\N	\N
8	t	\N	2023-01-18 22:26:47.309666	0	\N	52	deactivate	Mark for Deactivation (beta)	\N	\N
9	t	\N	2023-01-18 22:26:47.309666	0	\N	52	deactivate_cancel	Cancel Deactivation	\N	\N
10	t	\N	2023-01-18 22:26:47.309666	0	\N	52	upgrade	Mark for Upgrade	\N	\N
11	t	\N	2023-01-18 22:26:47.309666	0	\N	52	upgrade_cancel	Cancel Upgrade	\N	\N
12	t	\N	2023-01-18 22:26:47.309666	0	\N	75	open	Open	\N	\N
13	t	\N	2023-01-18 22:26:47.309666	0	\N	75	process	Process	\N	\N
14	t	\N	2023-01-18 22:26:47.309666	0	\N	75	solve	Solve	\N	\N
15	t	\N	2023-01-18 22:27:08.693829	0	Send by email a new temporary password to the user	77	reset_password	Reset Password	\N	\N
16	t	\N	2023-01-18 22:27:08.693829	0	\N	83	validate_	Validate	\N	\N
17	t	\N	2023-01-18 22:27:08.693829	0	\N	83	cancel	Cancel	\N	\N
\.


--
-- Data for Name: ir_model_button-button_reset; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public."ir_model_button-button_reset" (id, button, button_ruled, create_date, create_uid, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_model_button-res_group; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public."ir_model_button-res_group" (id, active, button, create_date, create_uid, "group", write_date, write_uid) FROM stdin;
1	t	6	2023-01-18 22:27:08.693829	0	1	\N	\N
2	t	7	2023-01-18 22:27:08.693829	0	1	\N	\N
3	t	8	2023-01-18 22:27:08.693829	0	1	\N	\N
4	t	9	2023-01-18 22:27:08.693829	0	1	\N	\N
5	t	10	2023-01-18 22:27:08.693829	0	1	\N	\N
6	t	11	2023-01-18 22:27:08.693829	0	1	\N	\N
7	t	3	2023-01-18 22:27:08.693829	0	1	\N	\N
8	t	2	2023-01-18 22:27:08.693829	0	1	\N	\N
9	t	1	2023-01-18 22:27:08.693829	0	1	\N	\N
\.


--
-- Data for Name: ir_model_button_click; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_model_button_click (id, active, button, create_date, create_uid, record_id, write_date, write_uid, "user") FROM stdin;
\.


--
-- Data for Name: ir_model_button_rule; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_model_button_rule (id, button, condition, create_date, create_uid, description, number_user, write_date, write_uid, "group") FROM stdin;
\.


--
-- Data for Name: ir_model_data; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_model_data (id, create_date, create_uid, db_id, fs_id, fs_values, model, module, noupdate, "values", write_date, write_uid) FROM stdin;
1	2023-01-18 22:26:47.309666	0	1	lang_en	[["am","AM"],["code","en"],["date","%m/%d/%Y"],["decimal_point","."],["grouping","[3, 3, 0]"],["mon_decimal_point","."],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",","],["n_cs_precedes",true],["n_sep_by_space",false],["n_sign_posn",1],["name","English"],["negative_sign","-"],["p_cs_precedes",true],["p_sep_by_space",false],["p_sign_posn",1],["pm","PM"],["positive_sign",""],["thousands_sep",","]]	ir.lang	ir	f	[["am","AM"],["code","en"],["date","%m/%d/%Y"],["decimal_point","."],["grouping","[3, 3, 0]"],["mon_decimal_point","."],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",","],["n_cs_precedes",true],["n_sep_by_space",false],["n_sign_posn",1],["name","English"],["negative_sign","-"],["p_cs_precedes",true],["p_sep_by_space",false],["p_sign_posn",1],["pm","PM"],["positive_sign",""],["thousands_sep",","]]	\N	\N
2	2023-01-18 22:26:47.309666	0	1	board_icon	[["name","tryton-board"],["path","ui/icons/tryton-board.svg"]]	ir.ui.icon	ir	f	[["name","tryton-board"],["path","ui/icons/tryton-board.svg"]]	\N	\N
3	2023-01-18 22:26:47.309666	0	2	calendar_icon	[["name","tryton-calendar"],["path","ui/icons/tryton-calendar.svg"]]	ir.ui.icon	ir	f	[["name","tryton-calendar"],["path","ui/icons/tryton-calendar.svg"]]	\N	\N
4	2023-01-18 22:26:47.309666	0	3	folder_icon	[["name","tryton-folder"],["path","ui/icons/tryton-folder.svg"]]	ir.ui.icon	ir	f	[["name","tryton-folder"],["path","ui/icons/tryton-folder.svg"]]	\N	\N
5	2023-01-18 22:26:47.309666	0	4	form_icon	[["name","tryton-form"],["path","ui/icons/tryton-form.svg"]]	ir.ui.icon	ir	f	[["name","tryton-form"],["path","ui/icons/tryton-form.svg"]]	\N	\N
6	2023-01-18 22:26:47.309666	0	5	graph_icon	[["name","tryton-graph"],["path","ui/icons/tryton-graph.svg"]]	ir.ui.icon	ir	f	[["name","tryton-graph"],["path","ui/icons/tryton-graph.svg"]]	\N	\N
7	2023-01-18 22:26:47.309666	0	6	list_icon	[["name","tryton-list"],["path","ui/icons/tryton-list.svg"]]	ir.ui.icon	ir	f	[["name","tryton-list"],["path","ui/icons/tryton-list.svg"]]	\N	\N
8	2023-01-18 22:26:47.309666	0	7	settings_icon	[["name","tryton-settings"],["path","ui/icons/tryton-settings.svg"]]	ir.ui.icon	ir	f	[["name","tryton-settings"],["path","ui/icons/tryton-settings.svg"]]	\N	\N
9	2023-01-18 22:26:47.309666	0	8	tree_icon	[["name","tryton-tree"],["path","ui/icons/tryton-tree.svg"]]	ir.ui.icon	ir	f	[["name","tryton-tree"],["path","ui/icons/tryton-tree.svg"]]	\N	\N
10	2023-01-18 22:26:47.309666	0	1	menu_administration	[["icon","tryton-settings"],["name","Administration"],["sequence",9999]]	ir.ui.menu	ir	f	[["icon","tryton-settings"],["name","Administration"],["sequence",9999]]	\N	\N
11	2023-01-18 22:26:47.309666	0	2	menu_ui	[["icon","tryton-folder"],["name","User Interface"],["parent",1],["sequence",50]]	ir.ui.menu	ir	f	[["icon","tryton-folder"],["name","User Interface"],["parent",1],["sequence",50]]	\N	\N
12	2023-01-18 22:26:47.309666	0	1	icon_view_tree	[["model","ir.ui.icon"],["name","icon_view_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.ui.icon"],["name","icon_view_list"],["type","tree"]]	\N	\N
13	2023-01-18 22:26:47.309666	0	2	icon_view_form	[["model","ir.ui.icon"],["name","icon_view_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.ui.icon"],["name","icon_view_form"],["type","form"]]	\N	\N
14	2023-01-18 22:26:47.309666	0	1	act_icon_form	[["name","Icons"],["res_model","ir.ui.icon"]]	ir.action.act_window	ir	f	[["name","Icons"],["res_model","ir.ui.icon"]]	\N	\N
15	2023-01-18 22:26:47.309666	0	1	act_icon_form_view1	[["act_window",1],["sequence",10],["view",1]]	ir.action.act_window.view	ir	f	[["act_window",1],["sequence",10],["view",1]]	\N	\N
16	2023-01-18 22:26:47.309666	0	2	act_icon_form_view2	[["act_window",1],["sequence",20],["view",2]]	ir.action.act_window.view	ir	f	[["act_window",1],["sequence",20],["view",2]]	\N	\N
17	2023-01-18 22:26:47.309666	0	3	menu_icon_form	[["action","ir.action.act_window,1"],["icon","tryton-list"],["name","Icons"],["parent",2],["sequence",20]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,1"],["icon","tryton-list"],["name","Icons"],["parent",2],["sequence",20]]	\N	\N
18	2023-01-18 22:26:47.309666	0	3	menu_view_tree_tree	[["field_childs","childs"],["model","ir.ui.menu"],["name","ui_menu_tree"],["priority",20],["type","tree"]]	ir.ui.view	ir	f	[["field_childs","childs"],["model","ir.ui.menu"],["name","ui_menu_tree"],["priority",20],["type","tree"]]	\N	\N
19	2023-01-18 22:26:47.309666	0	4	menu_view_list	[["model","ir.ui.menu"],["name","ui_menu_list"],["priority",10],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.ui.menu"],["name","ui_menu_list"],["priority",10],["type","tree"]]	\N	\N
20	2023-01-18 22:26:47.309666	0	5	menu_view_form	[["model","ir.ui.menu"],["name","ui_menu_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.ui.menu"],["name","ui_menu_form"],["type","form"]]	\N	\N
21	2023-01-18 22:26:47.309666	0	2	act_menu_tree	[["domain","[[\\"parent\\", \\"=\\", null]]"],["name","Menu"],["res_model","ir.ui.menu"],["usage","menu"]]	ir.action.act_window	ir	f	[["domain","[[\\"parent\\", \\"=\\", null]]"],["name","Menu"],["res_model","ir.ui.menu"],["usage","menu"]]	\N	\N
22	2023-01-18 22:26:47.309666	0	3	act_menu_tree_view1	[["act_window",2],["sequence",1],["view",3]]	ir.action.act_window.view	ir	f	[["act_window",2],["sequence",1],["view",3]]	\N	\N
23	2023-01-18 22:26:47.309666	0	3	act_menu_list	[["name","Menu"],["res_model","ir.ui.menu"]]	ir.action.act_window	ir	f	[["name","Menu"],["res_model","ir.ui.menu"]]	\N	\N
24	2023-01-18 22:26:47.309666	0	4	act_menu_list_view1	[["act_window",3],["sequence",10],["view",4]]	ir.action.act_window.view	ir	f	[["act_window",3],["sequence",10],["view",4]]	\N	\N
25	2023-01-18 22:26:47.309666	0	5	act_menu_list_view2	[["act_window",3],["sequence",20],["view",5]]	ir.action.act_window.view	ir	f	[["act_window",3],["sequence",20],["view",5]]	\N	\N
26	2023-01-18 22:26:47.309666	0	4	menu_menu_list	[["action","ir.action.act_window,3"],["icon","tryton-list"],["name","Menu"],["parent",2],["sequence",10]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,3"],["icon","tryton-list"],["name","Menu"],["parent",2],["sequence",10]]	\N	\N
27	2023-01-18 22:26:47.309666	0	6	menu_favorite_view_list	[["model","ir.ui.menu.favorite"],["name","ui_menu_favorite_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.ui.menu.favorite"],["name","ui_menu_favorite_list"],["type","tree"]]	\N	\N
28	2023-01-18 22:26:47.309666	0	7	menu_favorite_view_form	[["model","ir.ui.menu.favorite"],["name","ui_menu_favorite_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.ui.menu.favorite"],["name","ui_menu_favorite_form"],["type","form"]]	\N	\N
29	2023-01-18 22:26:47.309666	0	4	act_view_show	[["name","Show View"],["wiz_name","ir.ui.view.show"]]	ir.action.wizard	ir	f	[["name","Show View"],["wiz_name","ir.ui.view.show"]]	\N	\N
30	2023-01-18 22:26:47.309666	0	8	view_view_form	[["model","ir.ui.view"],["name","ui_view_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.ui.view"],["name","ui_view_form"],["type","form"]]	\N	\N
31	2023-01-18 22:26:47.309666	0	9	view_view_tree	[["model","ir.ui.view"],["name","ui_view_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.ui.view"],["name","ui_view_list"],["type","tree"]]	\N	\N
32	2023-01-18 22:26:47.309666	0	5	act_view_form	[["name","Views"],["res_model","ir.ui.view"],["type","ir.action.act_window"]]	ir.action.act_window	ir	f	[["name","Views"],["res_model","ir.ui.view"],["type","ir.action.act_window"]]	\N	\N
33	2023-01-18 22:26:47.309666	0	6	act_view_form_view1	[["act_window",5],["sequence",1],["view",9]]	ir.action.act_window.view	ir	f	[["act_window",5],["sequence",1],["view",9]]	\N	\N
34	2023-01-18 22:26:47.309666	0	7	act_view_form_view2	[["act_window",5],["sequence",2],["view",8]]	ir.action.act_window.view	ir	f	[["act_window",5],["sequence",2],["view",8]]	\N	\N
35	2023-01-18 22:26:47.309666	0	5	menu_view	[["action","ir.action.act_window,5"],["icon","tryton-list"],["name","Views"],["parent",2],["sequence",10]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,5"],["icon","tryton-list"],["name","Views"],["parent",2],["sequence",10]]	\N	\N
36	2023-01-18 22:26:47.309666	0	1	view_show_button	[["model",15],["name","show"],["string","Show"]]	ir.model.button	ir	f	[["model",15],["name","show"],["string","Show"]]	\N	\N
37	2023-01-18 22:26:47.309666	0	10	view_tree_width_view_form	[["model","ir.ui.view_tree_width"],["name","ui_view_tree_width_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.ui.view_tree_width"],["name","ui_view_tree_width_form"],["type","form"]]	\N	\N
38	2023-01-18 22:26:47.309666	0	11	view_tree_width_view_tree	[["model","ir.ui.view_tree_width"],["name","ui_view_tree_width_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.ui.view_tree_width"],["name","ui_view_tree_width_list"],["type","tree"]]	\N	\N
39	2023-01-18 22:26:47.309666	0	6	act_view_tree_width_form	[["name","View Tree Width"],["res_model","ir.ui.view_tree_width"],["type","ir.action.act_window"]]	ir.action.act_window	ir	f	[["name","View Tree Width"],["res_model","ir.ui.view_tree_width"],["type","ir.action.act_window"]]	\N	\N
40	2023-01-18 22:26:47.309666	0	8	act_view_tree_width_form_view1	[["act_window",6],["sequence",1],["view",11]]	ir.action.act_window.view	ir	f	[["act_window",6],["sequence",1],["view",11]]	\N	\N
41	2023-01-18 22:26:47.309666	0	9	act_view_tree_width_form_view2	[["act_window",6],["sequence",2],["view",10]]	ir.action.act_window.view	ir	f	[["act_window",6],["sequence",2],["view",10]]	\N	\N
42	2023-01-18 22:26:47.309666	0	6	menu_view_tree_width	[["action","ir.action.act_window,6"],["icon","tryton-list"],["name","View Tree Width"],["parent",2],["sequence",50]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,6"],["icon","tryton-list"],["name","View Tree Width"],["parent",2],["sequence",50]]	\N	\N
43	2023-01-18 22:26:47.309666	0	12	view_tree_optional_view_form	[["model","ir.ui.view_tree_optional"],["name","ui_view_tree_optional_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.ui.view_tree_optional"],["name","ui_view_tree_optional_form"],["type","form"]]	\N	\N
44	2023-01-18 22:26:47.309666	0	13	view_tree_optional_view_tree	[["model","ir.ui.view_tree_optional"],["name","ui_view_tree_optional_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.ui.view_tree_optional"],["name","ui_view_tree_optional_list"],["type","tree"]]	\N	\N
45	2023-01-18 22:26:47.309666	0	7	act_view_tree_optional_form	[["name","View Tree Optional"],["res_model","ir.ui.view_tree_optional"]]	ir.action.act_window	ir	f	[["name","View Tree Optional"],["res_model","ir.ui.view_tree_optional"]]	\N	\N
46	2023-01-18 22:26:47.309666	0	10	act_view_tree_optional_form_view1	[["act_window",7],["sequence",10],["view",13]]	ir.action.act_window.view	ir	f	[["act_window",7],["sequence",10],["view",13]]	\N	\N
47	2023-01-18 22:26:47.309666	0	11	act_view_tree_optional_form_view2	[["act_window",7],["sequence",20],["view",12]]	ir.action.act_window.view	ir	f	[["act_window",7],["sequence",20],["view",12]]	\N	\N
48	2023-01-18 22:26:47.309666	0	7	menu_view_tree_optional	[["action","ir.action.act_window,7"],["icon","tryton-list"],["name","View Tree Optional"],["parent",2],["sequence",50]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,7"],["icon","tryton-list"],["name","View Tree Optional"],["parent",2],["sequence",50]]	\N	\N
49	2023-01-18 22:26:47.309666	0	14	view_tree_state_form	[["model","ir.ui.view_tree_state"],["name","ui_view_tree_state_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.ui.view_tree_state"],["name","ui_view_tree_state_form"],["type","form"]]	\N	\N
50	2023-01-18 22:26:47.309666	0	15	view_tree_state_tree	[["model","ir.ui.view_tree_state"],["name","ui_view_tree_state_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.ui.view_tree_state"],["name","ui_view_tree_state_list"],["type","tree"]]	\N	\N
51	2023-01-18 22:26:47.309666	0	8	act_view_tree_state	[["name","Tree State"],["res_model","ir.ui.view_tree_state"],["type","ir.action.act_window"]]	ir.action.act_window	ir	f	[["name","Tree State"],["res_model","ir.ui.view_tree_state"],["type","ir.action.act_window"]]	\N	\N
52	2023-01-18 22:26:47.309666	0	12	act_view_tree_state_tree	[["act_window",8],["sequence",10],["view",15]]	ir.action.act_window.view	ir	f	[["act_window",8],["sequence",10],["view",15]]	\N	\N
53	2023-01-18 22:26:47.309666	0	13	act_view_tree_state_form	[["act_window",8],["sequence",20],["view",14]]	ir.action.act_window.view	ir	f	[["act_window",8],["sequence",20],["view",14]]	\N	\N
54	2023-01-18 22:26:47.309666	0	8	menu_view_tree_state	[["action","ir.action.act_window,8"],["icon","tryton-list"],["name","Tree State"],["parent",2],["sequence",50]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,8"],["icon","tryton-list"],["name","Tree State"],["parent",2],["sequence",50]]	\N	\N
55	2023-01-18 22:26:47.309666	0	16	view_search_form	[["model","ir.ui.view_search"],["name","ui_view_search_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.ui.view_search"],["name","ui_view_search_form"],["type","form"]]	\N	\N
56	2023-01-18 22:26:47.309666	0	17	view_search_tree	[["model","ir.ui.view_search"],["name","ui_view_search_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.ui.view_search"],["name","ui_view_search_list"],["type","tree"]]	\N	\N
57	2023-01-18 22:26:47.309666	0	9	act_view_search	[["name","View Search"],["res_model","ir.ui.view_search"],["type","ir.action.act_window"]]	ir.action.act_window	ir	f	[["name","View Search"],["res_model","ir.ui.view_search"],["type","ir.action.act_window"]]	\N	\N
58	2023-01-18 22:26:47.309666	0	14	act_view_search_tree	[["act_window",9],["sequence",10],["view",17]]	ir.action.act_window.view	ir	f	[["act_window",9],["sequence",10],["view",17]]	\N	\N
59	2023-01-18 22:26:47.309666	0	15	act_view_search_form	[["act_window",9],["sequence",20],["view",16]]	ir.action.act_window.view	ir	f	[["act_window",9],["sequence",20],["view",16]]	\N	\N
60	2023-01-18 22:26:47.309666	0	9	menu_view_search	[["action","ir.action.act_window,9"],["icon","tryton-list"],["name","View Search"],["parent",2],["sequence",50]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,9"],["icon","tryton-list"],["name","View Search"],["parent",2],["sequence",50]]	\N	\N
61	2023-01-18 22:26:47.309666	0	10	menu_action	[["icon","tryton-folder"],["name","Actions"],["parent",2],["sequence",50]]	ir.ui.menu	ir	f	[["icon","tryton-folder"],["name","Actions"],["parent",2],["sequence",50]]	\N	\N
62	2023-01-18 22:26:47.309666	0	18	action_view_form	[["model","ir.action"],["name","action_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.action"],["name","action_form"],["type","form"]]	\N	\N
63	2023-01-18 22:26:47.309666	0	19	action_view_tree	[["model","ir.action"],["name","action_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.action"],["name","action_list"],["type","tree"]]	\N	\N
64	2023-01-18 22:26:47.309666	0	10	act_action_form	[["name","Actions"],["res_model","ir.action"],["type","ir.action.act_window"]]	ir.action.act_window	ir	f	[["name","Actions"],["res_model","ir.action"],["type","ir.action.act_window"]]	\N	\N
65	2023-01-18 22:26:47.309666	0	16	act_action_form_view1	[["act_window",10],["sequence",1],["view",19]]	ir.action.act_window.view	ir	f	[["act_window",10],["sequence",1],["view",19]]	\N	\N
66	2023-01-18 22:26:47.309666	0	17	act_action_form_view2	[["act_window",10],["sequence",2],["view",18]]	ir.action.act_window.view	ir	f	[["act_window",10],["sequence",2],["view",18]]	\N	\N
67	2023-01-18 22:26:47.309666	0	11	menu_act_action	[["action","ir.action.act_window,10"],["icon","tryton-list"],["name","Actions"],["parent",10],["sequence",10]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,10"],["icon","tryton-list"],["name","Actions"],["parent",10],["sequence",10]]	\N	\N
68	2023-01-18 22:26:47.309666	0	20	action_keyword_view_list	[["model","ir.action.keyword"],["name","action_keyword_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.action.keyword"],["name","action_keyword_list"],["type","tree"]]	\N	\N
69	2023-01-18 22:26:47.309666	0	21	action_keyword_view_form	[["model","ir.action.keyword"],["name","action_keyword_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.action.keyword"],["name","action_keyword_form"],["type","form"]]	\N	\N
70	2023-01-18 22:26:47.309666	0	22	action_report_view_form	[["model","ir.action.report"],["name","action_report_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.action.report"],["name","action_report_form"],["type","form"]]	\N	\N
71	2023-01-18 22:26:47.309666	0	23	action_report_view_tree	[["model","ir.action.report"],["name","action_report_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.action.report"],["name","action_report_list"],["type","tree"]]	\N	\N
72	2023-01-18 22:26:47.309666	0	11	act_action_report_form	[["name","Reports"],["res_model","ir.action.report"],["type","ir.action.act_window"]]	ir.action.act_window	ir	f	[["name","Reports"],["res_model","ir.action.report"],["type","ir.action.act_window"]]	\N	\N
73	2023-01-18 22:26:47.309666	0	18	act_action_report_form_view1	[["act_window",11],["sequence",1],["view",23]]	ir.action.act_window.view	ir	f	[["act_window",11],["sequence",1],["view",23]]	\N	\N
74	2023-01-18 22:26:47.309666	0	19	act_action_report_form_view2	[["act_window",11],["sequence",2],["view",22]]	ir.action.act_window.view	ir	f	[["act_window",11],["sequence",2],["view",22]]	\N	\N
75	2023-01-18 22:26:47.309666	0	12	menu_action_report_form	[["action","ir.action.act_window,11"],["icon","tryton-list"],["name","Reports"],["parent",10],["sequence",20]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,11"],["icon","tryton-list"],["name","Reports"],["parent",10],["sequence",20]]	\N	\N
76	2023-01-18 22:26:47.309666	0	24	action_act_window_view_form	[["model","ir.action.act_window"],["name","action_act_window_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.action.act_window"],["name","action_act_window_form"],["type","form"]]	\N	\N
77	2023-01-18 22:26:47.309666	0	25	action_act_window_view_tree	[["model","ir.action.act_window"],["name","action_act_window_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.action.act_window"],["name","action_act_window_list"],["type","tree"]]	\N	\N
78	2023-01-18 22:26:47.309666	0	12	act_action_act_window_form	[["name","Window Actions"],["res_model","ir.action.act_window"],["type","ir.action.act_window"]]	ir.action.act_window	ir	f	[["name","Window Actions"],["res_model","ir.action.act_window"],["type","ir.action.act_window"]]	\N	\N
79	2023-01-18 22:26:47.309666	0	20	act_action_act_window_view1	[["act_window",12],["sequence",1],["view",25]]	ir.action.act_window.view	ir	f	[["act_window",12],["sequence",1],["view",25]]	\N	\N
80	2023-01-18 22:26:47.309666	0	21	act_action_act_window_view2	[["act_window",12],["sequence",2],["view",24]]	ir.action.act_window.view	ir	f	[["act_window",12],["sequence",2],["view",24]]	\N	\N
81	2023-01-18 22:26:47.309666	0	13	menu_action_act_window	[["action","ir.action.act_window,12"],["icon","tryton-list"],["name","Window Actions"],["parent",10],["sequence",20]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,12"],["icon","tryton-list"],["name","Window Actions"],["parent",10],["sequence",20]]	\N	\N
82	2023-01-18 22:26:47.309666	0	26	act_window_view_view_form	[["model","ir.action.act_window.view"],["name","action_act_window_view_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.action.act_window.view"],["name","action_act_window_view_form"],["type","form"]]	\N	\N
83	2023-01-18 22:26:47.309666	0	27	act_window_view_view_list	[["model","ir.action.act_window.view"],["name","action_act_window_view_list"],["priority",10],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.action.act_window.view"],["name","action_act_window_view_list"],["priority",10],["type","tree"]]	\N	\N
84	2023-01-18 22:26:47.309666	0	28	act_window_view_view_list2	[["model","ir.action.act_window.view"],["name","action_act_window_view_list2"],["priority",20],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.action.act_window.view"],["name","action_act_window_view_list2"],["priority",20],["type","tree"]]	\N	\N
85	2023-01-18 22:26:47.309666	0	29	act_window_domain_view_form	[["model","ir.action.act_window.domain"],["name","action_act_window_domain_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.action.act_window.domain"],["name","action_act_window_domain_form"],["type","form"]]	\N	\N
86	2023-01-18 22:26:47.309666	0	30	act_window_domain_view_list	[["model","ir.action.act_window.domain"],["name","action_act_window_domain_list"],["priority",10],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.action.act_window.domain"],["name","action_act_window_domain_list"],["priority",10],["type","tree"]]	\N	\N
87	2023-01-18 22:26:47.309666	0	31	act_window_domain_view_list2	[["model","ir.action.act_window.domain"],["name","action_act_window_domain_list2"],["priority",20],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.action.act_window.domain"],["name","action_act_window_domain_list2"],["priority",20],["type","tree"]]	\N	\N
88	2023-01-18 22:26:47.309666	0	32	action_wizard_view_form	[["model","ir.action.wizard"],["name","action_wizard_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.action.wizard"],["name","action_wizard_form"],["type","form"]]	\N	\N
89	2023-01-18 22:26:47.309666	0	33	action_wizard_view_tree	[["model","ir.action.wizard"],["name","action_wizard_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.action.wizard"],["name","action_wizard_list"],["type","tree"]]	\N	\N
90	2023-01-18 22:26:47.309666	0	13	act_action_wizard_form	[["name","Wizards"],["res_model","ir.action.wizard"],["type","ir.action.act_window"]]	ir.action.act_window	ir	f	[["name","Wizards"],["res_model","ir.action.wizard"],["type","ir.action.act_window"]]	\N	\N
91	2023-01-18 22:26:47.309666	0	22	act_action_wizard_form_view1	[["act_window",13],["sequence",1],["view",33]]	ir.action.act_window.view	ir	f	[["act_window",13],["sequence",1],["view",33]]	\N	\N
92	2023-01-18 22:26:47.309666	0	23	act_action_wizard_form_view2	[["act_window",13],["sequence",2],["view",32]]	ir.action.act_window.view	ir	f	[["act_window",13],["sequence",2],["view",32]]	\N	\N
177	2023-01-18 22:26:47.309666	0	61	attachment_view_tree	[["model","ir.attachment"],["name","attachment_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.attachment"],["name","attachment_list"],["type","tree"]]	\N	\N
93	2023-01-18 22:26:47.309666	0	14	menu_action_wizard	[["action","ir.action.act_window,13"],["icon","tryton-list"],["name","Wizards"],["parent",10]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,13"],["icon","tryton-list"],["name","Wizards"],["parent",10]]	\N	\N
94	2023-01-18 22:26:47.309666	0	34	action_url_view_form	[["model","ir.action.url"],["name","action_url_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.action.url"],["name","action_url_form"],["type","form"]]	\N	\N
95	2023-01-18 22:26:47.309666	0	35	action_url_view_tree	[["model","ir.action.url"],["name","action_url_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.action.url"],["name","action_url_list"],["type","tree"]]	\N	\N
96	2023-01-18 22:26:47.309666	0	14	act_action_url_form	[["name","URLs"],["res_model","ir.action.url"],["type","ir.action.act_window"]]	ir.action.act_window	ir	f	[["name","URLs"],["res_model","ir.action.url"],["type","ir.action.act_window"]]	\N	\N
97	2023-01-18 22:26:47.309666	0	24	act_action_url_form_view1	[["act_window",14],["sequence",1],["view",35]]	ir.action.act_window.view	ir	f	[["act_window",14],["sequence",1],["view",35]]	\N	\N
98	2023-01-18 22:26:47.309666	0	25	act_action_url_form_view2	[["act_window",14],["sequence",2],["view",34]]	ir.action.act_window.view	ir	f	[["act_window",14],["sequence",2],["view",34]]	\N	\N
99	2023-01-18 22:26:47.309666	0	15	menu_action_url	[["action","ir.action.act_window,14"],["icon","tryton-list"],["name","URLs"],["parent",10],["sequence",20]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,14"],["icon","tryton-list"],["name","URLs"],["parent",10],["sequence",20]]	\N	\N
100	2023-01-18 22:26:47.309666	0	16	menu_models	[["icon","tryton-folder"],["name","Models"],["parent",1],["sequence",50]]	ir.ui.menu	ir	f	[["icon","tryton-folder"],["name","Models"],["parent",1],["sequence",50]]	\N	\N
101	2023-01-18 22:26:47.309666	0	36	model_view_form	[["model","ir.model"],["name","model_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.model"],["name","model_form"],["type","form"]]	\N	\N
102	2023-01-18 22:26:47.309666	0	37	model_view_tree	[["model","ir.model"],["name","model_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.model"],["name","model_list"],["type","tree"]]	\N	\N
103	2023-01-18 22:26:47.309666	0	15	act_model_form	[["name","Models"],["res_model","ir.model"]]	ir.action.act_window	ir	f	[["name","Models"],["res_model","ir.model"]]	\N	\N
104	2023-01-18 22:26:47.309666	0	26	act_model_form_view1	[["act_window",15],["sequence",1],["view",37]]	ir.action.act_window.view	ir	f	[["act_window",15],["sequence",1],["view",37]]	\N	\N
105	2023-01-18 22:26:47.309666	0	27	act_model_form_view2	[["act_window",15],["sequence",2],["view",36]]	ir.action.act_window.view	ir	f	[["act_window",15],["sequence",2],["view",36]]	\N	\N
106	2023-01-18 22:26:47.309666	0	17	menu_model_form	[["action","ir.action.act_window,15"],["icon","tryton-list"],["name","Models"],["parent",16],["sequence",10]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,15"],["icon","tryton-list"],["name","Models"],["parent",16],["sequence",10]]	\N	\N
107	2023-01-18 22:26:47.309666	0	38	model_fields_view_form	[["model","ir.model.field"],["name","model_field_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.model.field"],["name","model_field_form"],["type","form"]]	\N	\N
108	2023-01-18 22:26:47.309666	0	39	model_fields_view_tree	[["model","ir.model.field"],["name","model_field_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.model.field"],["name","model_field_list"],["type","tree"]]	\N	\N
109	2023-01-18 22:26:47.309666	0	16	act_model_fields_form	[["name","Fields"],["res_model","ir.model.field"]]	ir.action.act_window	ir	f	[["name","Fields"],["res_model","ir.model.field"]]	\N	\N
110	2023-01-18 22:26:47.309666	0	28	act_model_fields_form_view1	[["act_window",16],["sequence",1],["view",39]]	ir.action.act_window.view	ir	f	[["act_window",16],["sequence",1],["view",39]]	\N	\N
111	2023-01-18 22:26:47.309666	0	29	act_model_fields_form_view2	[["act_window",16],["sequence",2],["view",38]]	ir.action.act_window.view	ir	f	[["act_window",16],["sequence",2],["view",38]]	\N	\N
112	2023-01-18 22:26:47.309666	0	18	model_model_fields_form	[["action","ir.action.act_window,16"],["icon","tryton-list"],["name","Fields"],["parent",17],["sequence",20]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,16"],["icon","tryton-list"],["name","Fields"],["parent",17],["sequence",20]]	\N	\N
113	2023-01-18 22:26:47.309666	0	40	model_access_view_tree	[["model","ir.model.access"],["name","model_access_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.model.access"],["name","model_access_list"],["type","tree"]]	\N	\N
114	2023-01-18 22:26:47.309666	0	41	model_access_view_form	[["model","ir.model.access"],["name","model_access_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.model.access"],["name","model_access_form"],["type","form"]]	\N	\N
115	2023-01-18 22:26:47.309666	0	17	act_model_access_form	[["name","Models Access"],["res_model","ir.model.access"]]	ir.action.act_window	ir	f	[["name","Models Access"],["res_model","ir.model.access"]]	\N	\N
116	2023-01-18 22:26:47.309666	0	30	act_model_access_form_view1	[["act_window",17],["sequence",1],["view",40]]	ir.action.act_window.view	ir	f	[["act_window",17],["sequence",1],["view",40]]	\N	\N
117	2023-01-18 22:26:47.309666	0	31	act_model_access_form_view2	[["act_window",17],["sequence",2],["view",41]]	ir.action.act_window.view	ir	f	[["act_window",17],["sequence",2],["view",41]]	\N	\N
118	2023-01-18 22:26:47.309666	0	19	menu_model_access_form	[["action","ir.action.act_window,17"],["icon","tryton-list"],["name","Models Access"],["parent",16],["sequence",30]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,17"],["icon","tryton-list"],["name","Models Access"],["parent",16],["sequence",30]]	\N	\N
119	2023-01-18 22:26:47.309666	0	18	act_model_access_form_relate_model	[["domain","[{\\"__class__\\": \\"If\\", \\"c\\": {\\"__class__\\": \\"Equal\\", \\"s1\\": {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"active_ids\\"}, \\"s2\\": [{\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_id\\"}]}, \\"e\\": [\\"model\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_ids\\"}], \\"t\\": [\\"model\\", \\"=\\", {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_id\\"}]}]"],["name","Access"],["res_model","ir.model.access"]]	ir.action.act_window	ir	f	[["domain","[{\\"__class__\\": \\"If\\", \\"c\\": {\\"__class__\\": \\"Equal\\", \\"s1\\": {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"active_ids\\"}, \\"s2\\": [{\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_id\\"}]}, \\"e\\": [\\"model\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_ids\\"}], \\"t\\": [\\"model\\", \\"=\\", {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_id\\"}]}]"],["name","Access"],["res_model","ir.model.access"]]	\N	\N
120	2023-01-18 22:26:47.309666	0	16	act_model_access_form_relate_model_keyword1	[["action",18],["keyword","form_relate"],["model","ir.model,-1"]]	ir.action.keyword	ir	f	[["action",18],["keyword","form_relate"],["model","ir.model,-1"]]	\N	\N
121	2023-01-18 22:26:47.309666	0	42	model_field_access_view_tree	[["model","ir.model.field.access"],["name","model_field_access_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.model.field.access"],["name","model_field_access_list"],["type","tree"]]	\N	\N
274	2023-01-18 22:26:47.309666	0	57	act_rule_group_form_view2	[["act_window",43],["sequence",2],["view",82]]	ir.action.act_window.view	ir	f	[["act_window",43],["sequence",2],["view",82]]	\N	\N
122	2023-01-18 22:26:47.309666	0	43	model_field_access_view_form	[["model","ir.model.field.access"],["name","model_field_access_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.model.field.access"],["name","model_field_access_form"],["type","form"]]	\N	\N
123	2023-01-18 22:26:47.309666	0	19	act_model_field_access_form	[["name","Fields Access"],["res_model","ir.model.field.access"]]	ir.action.act_window	ir	f	[["name","Fields Access"],["res_model","ir.model.field.access"]]	\N	\N
124	2023-01-18 22:26:47.309666	0	32	act_model_field_access_form_view1	[["act_window",19],["sequence",10],["view",42]]	ir.action.act_window.view	ir	f	[["act_window",19],["sequence",10],["view",42]]	\N	\N
125	2023-01-18 22:26:47.309666	0	33	act_model_field_access_form_view2	[["act_window",19],["sequence",20],["view",43]]	ir.action.act_window.view	ir	f	[["act_window",19],["sequence",20],["view",43]]	\N	\N
126	2023-01-18 22:26:47.309666	0	20	menu_model_field_access_form	[["action","ir.action.act_window,19"],["icon","tryton-list"],["name","Fields Access"],["parent",19],["sequence",10]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,19"],["icon","tryton-list"],["name","Fields Access"],["parent",19],["sequence",10]]	\N	\N
127	2023-01-18 22:26:47.309666	0	20	act_model_field_access_form_relate_field	[["domain","[{\\"__class__\\": \\"If\\", \\"c\\": {\\"__class__\\": \\"Equal\\", \\"s1\\": {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"active_ids\\"}, \\"s2\\": [{\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_id\\"}]}, \\"e\\": [\\"field\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_ids\\"}], \\"t\\": [\\"field\\", \\"=\\", {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_id\\"}]}]"],["name","Access"],["res_model","ir.model.field.access"]]	ir.action.act_window	ir	f	[["domain","[{\\"__class__\\": \\"If\\", \\"c\\": {\\"__class__\\": \\"Equal\\", \\"s1\\": {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"active_ids\\"}, \\"s2\\": [{\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_id\\"}]}, \\"e\\": [\\"field\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_ids\\"}], \\"t\\": [\\"field\\", \\"=\\", {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_id\\"}]}]"],["name","Access"],["res_model","ir.model.field.access"]]	\N	\N
128	2023-01-18 22:26:47.309666	0	18	act_modelfield__access_form_relate_field_keyword1	[["action",20],["keyword","form_relate"],["model","ir.model.field,-1"]]	ir.action.keyword	ir	f	[["action",20],["keyword","form_relate"],["model","ir.model.field,-1"]]	\N	\N
129	2023-01-18 22:26:47.309666	0	21	report_model_graph	[["model","ir.model"],["name","Graph"],["report_name","ir.model.graph"]]	ir.action.report	ir	f	[["model","ir.model"],["name","Graph"],["report_name","ir.model.graph"]]	\N	\N
130	2023-01-18 22:26:47.309666	0	44	print_model_graph_start_view_form	[["model","ir.model.print_model_graph.start"],["name","model_print_model_graph_start_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.model.print_model_graph.start"],["name","model_print_model_graph_start_form"],["type","form"]]	\N	\N
131	2023-01-18 22:26:47.309666	0	22	print_model_graph	[["model","ir.model"],["name","Graph"],["wiz_name","ir.model.print_model_graph"]]	ir.action.wizard	ir	f	[["model","ir.model"],["name","Graph"],["wiz_name","ir.model.print_model_graph"]]	\N	\N
132	2023-01-18 22:26:47.309666	0	19	print_model_graph_keyword	[["action",22],["keyword","form_print"],["model","ir.model,-1"]]	ir.action.keyword	ir	f	[["action",22],["keyword","form_print"],["model","ir.model,-1"]]	\N	\N
133	2023-01-18 22:26:47.309666	0	23	report_model_workflow_graph	[["model","ir.model"],["name","Workflow Graph"],["report_name","ir.model.workflow_graph"]]	ir.action.report	ir	f	[["model","ir.model"],["name","Workflow Graph"],["report_name","ir.model.workflow_graph"]]	\N	\N
134	2023-01-18 22:26:47.309666	0	20	print_model_workflow_graph_keyword	[["action",23],["keyword","form_print"],["model","ir.model,-1"]]	ir.action.keyword	ir	f	[["action",23],["keyword","form_print"],["model","ir.model,-1"]]	\N	\N
135	2023-01-18 22:26:47.309666	0	45	model_button_view_list	[["model","ir.model.button"],["name","model_button_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.model.button"],["name","model_button_list"],["type","tree"]]	\N	\N
136	2023-01-18 22:26:47.309666	0	46	model_button_view_form	[["model","ir.model.button"],["name","model_button_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.model.button"],["name","model_button_form"],["type","form"]]	\N	\N
137	2023-01-18 22:26:47.309666	0	24	act_model_button_form	[["name","Buttons"],["res_model","ir.model.button"]]	ir.action.act_window	ir	f	[["name","Buttons"],["res_model","ir.model.button"]]	\N	\N
138	2023-01-18 22:26:47.309666	0	34	act_model_button_form_view1	[["act_window",24],["sequence",10],["view",45]]	ir.action.act_window.view	ir	f	[["act_window",24],["sequence",10],["view",45]]	\N	\N
139	2023-01-18 22:26:47.309666	0	35	act_model_button_form_view2	[["act_window",24],["sequence",20],["view",46]]	ir.action.act_window.view	ir	f	[["act_window",24],["sequence",20],["view",46]]	\N	\N
140	2023-01-18 22:26:47.309666	0	21	menu_model_button_form	[["action","ir.action.act_window,24"],["icon","tryton-list"],["name","Buttons"],["parent",19],["sequence",20]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,24"],["icon","tryton-list"],["name","Buttons"],["parent",19],["sequence",20]]	\N	\N
141	2023-01-18 22:26:47.309666	0	47	model_button_rule_view_list	[["model","ir.model.button.rule"],["name","model_button_rule_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.model.button.rule"],["name","model_button_rule_list"],["type","tree"]]	\N	\N
142	2023-01-18 22:26:47.309666	0	48	model_button_rule_view_form	[["model","ir.model.button.rule"],["name","model_button_rule_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.model.button.rule"],["name","model_button_rule_form"],["type","form"]]	\N	\N
143	2023-01-18 22:26:47.309666	0	49	model_button_click_view_list	[["model","ir.model.button.click"],["name","model_button_click_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.model.button.click"],["name","model_button_click_list"],["type","tree"]]	\N	\N
144	2023-01-18 22:26:47.309666	0	50	model_button_click_view_form	[["model","ir.model.button.click"],["name","model_button_click_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.model.button.click"],["name","model_button_click_form"],["type","form"]]	\N	\N
145	2023-01-18 22:26:47.309666	0	25	act_model_button_click_form_relate_model_button	[["domain","[{\\"__class__\\": \\"If\\", \\"c\\": {\\"__class__\\": \\"Equal\\", \\"s1\\": {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"active_ids\\"}, \\"s2\\": [{\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_id\\"}]}, \\"e\\": [\\"button\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_ids\\"}], \\"t\\": [\\"button\\", \\"=\\", {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_id\\"}]}]"],["name","Clicks"],["res_model","ir.model.button.click"]]	ir.action.act_window	ir	f	[["domain","[{\\"__class__\\": \\"If\\", \\"c\\": {\\"__class__\\": \\"Equal\\", \\"s1\\": {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"active_ids\\"}, \\"s2\\": [{\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_id\\"}]}, \\"e\\": [\\"button\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_ids\\"}], \\"t\\": [\\"button\\", \\"=\\", {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_id\\"}]}]"],["name","Clicks"],["res_model","ir.model.button.click"]]	\N	\N
411	2023-01-18 22:26:47.309666	0	71	msg_report_invalid_email	[["text","Invalid email definition for report \\"%(name)s\\"."]]	ir.message	ir	f	[["text","Invalid email definition for report \\"%(name)s\\"."]]	\N	\N
146	2023-01-18 22:26:47.309666	0	22	act_model_button_click_form_relate_model_button_keyword1	[["action",25],["keyword","form_relate"],["model","ir.model.button,-1"]]	ir.action.keyword	ir	f	[["action",25],["keyword","form_relate"],["model","ir.model.button,-1"]]	\N	\N
147	2023-01-18 22:26:47.309666	0	51	model_data_view_list	[["model","ir.model.data"],["name","model_data_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.model.data"],["name","model_data_list"],["type","tree"]]	\N	\N
148	2023-01-18 22:26:47.309666	0	52	model_data_view_form	[["model","ir.model.data"],["name","model_data_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.model.data"],["name","model_data_form"],["type","form"]]	\N	\N
149	2023-01-18 22:26:47.309666	0	26	act_model_data_form	[["name","Data"],["res_model","ir.model.data"]]	ir.action.act_window	ir	f	[["name","Data"],["res_model","ir.model.data"]]	\N	\N
150	2023-01-18 22:26:47.309666	0	36	act_model_data_form_view1	[["act_window",26],["sequence",10],["view",51]]	ir.action.act_window.view	ir	f	[["act_window",26],["sequence",10],["view",51]]	\N	\N
151	2023-01-18 22:26:47.309666	0	37	act_model_data_form_view2	[["act_window",26],["sequence",20],["view",52]]	ir.action.act_window.view	ir	f	[["act_window",26],["sequence",20],["view",52]]	\N	\N
152	2023-01-18 22:26:47.309666	0	1	act_model_data_form_domain_out_of_sync	[["act_window",26],["count",true],["domain","[[\\"out_of_sync\\", \\"=\\", true]]"],["name","Out of Sync"],["sequence",10]]	ir.action.act_window.domain	ir	f	[["act_window",26],["count",true],["domain","[[\\"out_of_sync\\", \\"=\\", true]]"],["name","Out of Sync"],["sequence",10]]	\N	\N
153	2023-01-18 22:26:47.309666	0	2	act_model_data_form_domain_all	[["act_window",26],["domain",""],["name","All"],["sequence",9999]]	ir.action.act_window.domain	ir	f	[["act_window",26],["domain",""],["name","All"],["sequence",9999]]	\N	\N
154	2023-01-18 22:26:47.309666	0	22	menu_model_data_form	[["action","ir.action.act_window,26"],["icon","tryton-list"],["name","Data"],["parent",17],["sequence",50]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,26"],["icon","tryton-list"],["name","Data"],["parent",17],["sequence",50]]	\N	\N
155	2023-01-18 22:26:47.309666	0	2	model_data_sync_button	[["model",38],["name","sync"],["string","Sync"]]	ir.model.button	ir	f	[["model",38],["name","sync"],["string","Sync"]]	\N	\N
156	2023-01-18 22:26:47.309666	0	23	menu_sequences	[["icon","tryton-folder"],["name","Sequences"],["parent",1],["sequence",20]]	ir.ui.menu	ir	f	[["icon","tryton-folder"],["name","Sequences"],["parent",1],["sequence",20]]	\N	\N
157	2023-01-18 22:26:47.309666	0	53	sequence_view_form	[["model","ir.sequence"],["name","sequence_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.sequence"],["name","sequence_form"],["type","form"]]	\N	\N
158	2023-01-18 22:26:47.309666	0	54	sequence_view_tree	[["model","ir.sequence"],["name","sequence_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.sequence"],["name","sequence_list"],["type","tree"]]	\N	\N
159	2023-01-18 22:26:47.309666	0	27	act_sequence_form	[["context",""],["name","Sequences"],["res_model","ir.sequence"],["type","ir.action.act_window"]]	ir.action.act_window	ir	f	[["context",""],["name","Sequences"],["res_model","ir.sequence"],["type","ir.action.act_window"]]	\N	\N
160	2023-01-18 22:26:47.309666	0	38	act_sequence_form_view1	[["act_window",27],["sequence",1],["view",54]]	ir.action.act_window.view	ir	f	[["act_window",27],["sequence",1],["view",54]]	\N	\N
161	2023-01-18 22:26:47.309666	0	39	act_sequence_form_view2	[["act_window",27],["sequence",2],["view",53]]	ir.action.act_window.view	ir	f	[["act_window",27],["sequence",2],["view",53]]	\N	\N
162	2023-01-18 22:26:47.309666	0	24	menu_sequence_form	[["action","ir.action.act_window,27"],["icon","tryton-list"],["name","Sequences"],["parent",23],["sequence",10]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,27"],["icon","tryton-list"],["name","Sequences"],["parent",23],["sequence",10]]	\N	\N
163	2023-01-18 22:26:47.309666	0	55	sequence_strict_view_form	[["inherit",53],["model","ir.sequence.strict"],["type",null]]	ir.ui.view	ir	f	[["inherit",53],["model","ir.sequence.strict"],["type",null]]	\N	\N
164	2023-01-18 22:26:47.309666	0	56	sequence_strict_view_tree	[["inherit",54],["model","ir.sequence.strict"],["type",null]]	ir.ui.view	ir	f	[["inherit",54],["model","ir.sequence.strict"],["type",null]]	\N	\N
165	2023-01-18 22:26:47.309666	0	28	act_sequence_strict_form	[["context",""],["name","Sequences Strict"],["res_model","ir.sequence.strict"],["type","ir.action.act_window"]]	ir.action.act_window	ir	f	[["context",""],["name","Sequences Strict"],["res_model","ir.sequence.strict"],["type","ir.action.act_window"]]	\N	\N
166	2023-01-18 22:26:47.309666	0	40	act_sequence_strict_form_view1	[["act_window",28],["sequence",1],["view",56]]	ir.action.act_window.view	ir	f	[["act_window",28],["sequence",1],["view",56]]	\N	\N
167	2023-01-18 22:26:47.309666	0	41	act_sequence_strict_form_view2	[["act_window",28],["sequence",2],["view",55]]	ir.action.act_window.view	ir	f	[["act_window",28],["sequence",2],["view",55]]	\N	\N
168	2023-01-18 22:26:47.309666	0	25	menu_sequence_strict_form	[["action","ir.action.act_window,28"],["icon","tryton-list"],["name","Sequences Strict"],["parent",23],["sequence",10]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,28"],["icon","tryton-list"],["name","Sequences Strict"],["parent",23],["sequence",10]]	\N	\N
169	2023-01-18 22:26:47.309666	0	57	sequence_type_view_form	[["model","ir.sequence.type"],["name","sequence_type_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.sequence.type"],["name","sequence_type_form"],["type","form"]]	\N	\N
170	2023-01-18 22:26:47.309666	0	58	sequence_type_view_tree	[["model","ir.sequence.type"],["name","sequence_type_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.sequence.type"],["name","sequence_type_list"],["type","tree"]]	\N	\N
171	2023-01-18 22:26:47.309666	0	29	act_sequence_type_form	[["name","Types"],["res_model","ir.sequence.type"],["type","ir.action.act_window"]]	ir.action.act_window	ir	f	[["name","Types"],["res_model","ir.sequence.type"],["type","ir.action.act_window"]]	\N	\N
172	2023-01-18 22:26:47.309666	0	42	act_sequence_type_form_view1	[["act_window",29],["sequence",1],["view",58]]	ir.action.act_window.view	ir	f	[["act_window",29],["sequence",1],["view",58]]	\N	\N
173	2023-01-18 22:26:47.309666	0	43	act_sequence_type_form_view2	[["act_window",29],["sequence",2],["view",57]]	ir.action.act_window.view	ir	f	[["act_window",29],["sequence",2],["view",57]]	\N	\N
174	2023-01-18 22:26:47.309666	0	26	menu_ir_sequence_type	[["action","ir.action.act_window,29"],["icon","tryton-list"],["name","Types"],["parent",23],["sequence",20]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,29"],["icon","tryton-list"],["name","Types"],["parent",23],["sequence",20]]	\N	\N
175	2023-01-18 22:26:47.309666	0	59	attachment_view_form	[["model","ir.attachment"],["name","attachment_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.attachment"],["name","attachment_form"],["type","form"]]	\N	\N
176	2023-01-18 22:26:47.309666	0	60	attachment_view_form_preview	[["model","ir.attachment"],["name","attachment_form_preview"],["priority",50],["type","form"]]	ir.ui.view	ir	f	[["model","ir.attachment"],["name","attachment_form_preview"],["priority",50],["type","form"]]	\N	\N
178	2023-01-18 22:26:47.309666	0	30	act_attachment_form	[["name","Attachments"],["res_model","ir.attachment"],["type","ir.action.act_window"]]	ir.action.act_window	ir	f	[["name","Attachments"],["res_model","ir.attachment"],["type","ir.action.act_window"]]	\N	\N
179	2023-01-18 22:26:47.309666	0	44	act_attachment_form_view1	[["act_window",30],["sequence",1],["view",61]]	ir.action.act_window.view	ir	f	[["act_window",30],["sequence",1],["view",61]]	\N	\N
180	2023-01-18 22:26:47.309666	0	45	act_attachment_form_view2	[["act_window",30],["sequence",2],["view",59]]	ir.action.act_window.view	ir	f	[["act_window",30],["sequence",2],["view",59]]	\N	\N
181	2023-01-18 22:26:47.309666	0	27	menu_attachment_form	[["action","ir.action.act_window,30"],["icon","tryton-list"],["name","Attachments"],["parent",16],["sequence",50]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,30"],["icon","tryton-list"],["name","Attachments"],["parent",16],["sequence",50]]	\N	\N
182	2023-01-18 22:26:47.309666	0	62	note_view_form	[["model","ir.note"],["name","note_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.note"],["name","note_form"],["type","form"]]	\N	\N
183	2023-01-18 22:26:47.309666	0	63	note_view_list	[["model","ir.note"],["name","note_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.note"],["name","note_list"],["type","tree"]]	\N	\N
184	2023-01-18 22:26:47.309666	0	31	act_note_form	[["name","Notes"],["res_model","ir.note"],["type","ir.action.act_window"]]	ir.action.act_window	ir	f	[["name","Notes"],["res_model","ir.note"],["type","ir.action.act_window"]]	\N	\N
185	2023-01-18 22:26:47.309666	0	46	act_note_form_view1	[["act_window",31],["sequence",1],["view",63]]	ir.action.act_window.view	ir	f	[["act_window",31],["sequence",1],["view",63]]	\N	\N
186	2023-01-18 22:26:47.309666	0	47	act_note_form_view2	[["act_window",31],["sequence",2],["view",62]]	ir.action.act_window.view	ir	f	[["act_window",31],["sequence",2],["view",62]]	\N	\N
187	2023-01-18 22:26:47.309666	0	28	menu_note_form	[["action","ir.action.act_window,31"],["icon","tryton-list"],["name","Notes"],["parent",16],["sequence",50]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,31"],["icon","tryton-list"],["name","Notes"],["parent",16],["sequence",50]]	\N	\N
188	2023-01-18 22:26:47.309666	0	29	menu_scheduler	[["icon","tryton-folder"],["name","Scheduler"],["parent",1],["sequence",50]]	ir.ui.menu	ir	f	[["icon","tryton-folder"],["name","Scheduler"],["parent",1],["sequence",50]]	\N	\N
189	2023-01-18 22:26:47.309666	0	64	cron_view_tree	[["model","ir.cron"],["name","cron_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.cron"],["name","cron_list"],["type","tree"]]	\N	\N
190	2023-01-18 22:26:47.309666	0	65	cron_view_form	[["model","ir.cron"],["name","cron_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.cron"],["name","cron_form"],["type","form"]]	\N	\N
191	2023-01-18 22:26:47.309666	0	32	act_cron_form	[["context",""],["name","Actions"],["res_model","ir.cron"]]	ir.action.act_window	ir	f	[["context",""],["name","Actions"],["res_model","ir.cron"]]	\N	\N
192	2023-01-18 22:26:47.309666	0	48	act_cron_form_view1	[["act_window",32],["sequence",1],["view",64]]	ir.action.act_window.view	ir	f	[["act_window",32],["sequence",1],["view",64]]	\N	\N
193	2023-01-18 22:26:47.309666	0	49	act_cron_form_view2	[["act_window",32],["sequence",2],["view",65]]	ir.action.act_window.view	ir	f	[["act_window",32],["sequence",2],["view",65]]	\N	\N
194	2023-01-18 22:26:47.309666	0	30	menu_cron_form	[["action","ir.action.act_window,32"],["icon","tryton-list"],["name","Actions"],["parent",29],["sequence",10]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,32"],["icon","tryton-list"],["name","Actions"],["parent",29],["sequence",10]]	\N	\N
195	2023-01-18 22:26:47.309666	0	3	cron_run_once_button	[["model",45],["name","run_once"],["string","Run Once"]]	ir.model.button	ir	f	[["model",45],["name","run_once"],["string","Run Once"]]	\N	\N
196	2023-01-18 22:26:47.309666	0	31	menu_localization	[["icon","tryton-folder"],["name","Localization"],["parent",1],["sequence",30]]	ir.ui.menu	ir	f	[["icon","tryton-folder"],["name","Localization"],["parent",1],["sequence",30]]	\N	\N
197	2023-01-18 22:26:47.309666	0	2	lang_bg	[["am",""],["code","bg"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Bulgarian"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep","."]]	ir.lang	ir	f	[["am",""],["code","bg"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Bulgarian"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep","."]]	\N	\N
198	2023-01-18 22:26:47.309666	0	3	lang_ca	[["am","a. m."],["code","ca"],["date","%d/%m/%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep","."],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Catal\\u00e0"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm","p. m."],["positive_sign",""],["thousands_sep"," "]]	ir.lang	ir	f	[["am","a. m."],["code","ca"],["date","%d/%m/%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep","."],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Catal\\u00e0"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm","p. m."],["positive_sign",""],["thousands_sep"," "]]	\N	\N
199	2023-01-18 22:26:47.309666	0	4	lang_cs	[["am",""],["code","cs"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Czech"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep"," "]]	ir.lang	ir	f	[["am",""],["code","cs"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Czech"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep"," "]]	\N	\N
200	2023-01-18 22:26:47.309666	0	5	lang_de	[["am",""],["code","de"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep","."],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","German"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep","."]]	ir.lang	ir	f	[["am",""],["code","de"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep","."],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","German"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep","."]]	\N	\N
201	2023-01-18 22:26:47.309666	0	6	lang_es	[["am",""],["code","es"],["date","%d/%m/%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep","."],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Spanish"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep","."]]	ir.lang	ir	f	[["am",""],["code","es"],["date","%d/%m/%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep","."],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Spanish"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep","."]]	\N	\N
202	2023-01-18 22:26:47.309666	0	7	lang_es_419	[["am",""],["code","es_419"],["date","%d/%m/%Y"],["decimal_point","."],["grouping","[3, 3, 0]"],["mon_decimal_point","."],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",","],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Spanish (Latin American)"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep",","]]	ir.lang	ir	f	[["am",""],["code","es_419"],["date","%d/%m/%Y"],["decimal_point","."],["grouping","[3, 3, 0]"],["mon_decimal_point","."],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",","],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Spanish (Latin American)"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep",","]]	\N	\N
203	2023-01-18 22:26:47.309666	0	8	lang_et	[["code","et"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 3]"],["mon_decimal_point",","],["mon_grouping","[3, 3]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Estonian"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["positive_sign",""],["thousands_sep","\\u00a0"]]	ir.lang	ir	f	[["code","et"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 3]"],["mon_decimal_point",","],["mon_grouping","[3, 3]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Estonian"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["positive_sign",""],["thousands_sep","\\u00a0"]]	\N	\N
204	2023-01-18 22:26:47.309666	0	9	lang_fa	[["am",""],["code","fa"],["date","%Y/%m/%d"],["decimal_point","."],["direction","rtl"],["grouping","[3, 0]"],["mon_decimal_point","\\u066b"],["mon_grouping","[3, 0]"],["mon_thousands_sep","\\u066c"],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Persian"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep",","]]	ir.lang	ir	f	[["am",""],["code","fa"],["date","%Y/%m/%d"],["decimal_point","."],["direction","rtl"],["grouping","[3, 0]"],["mon_decimal_point","\\u066b"],["mon_grouping","[3, 0]"],["mon_thousands_sep","\\u066c"],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Persian"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep",","]]	\N	\N
205	2023-01-18 22:26:47.309666	0	10	lang_fi	[["code","fi"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Finnish"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["positive_sign",""],["thousands_sep","\\u00a0"]]	ir.lang	ir	f	[["code","fi"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Finnish"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["positive_sign",""],["thousands_sep","\\u00a0"]]	\N	\N
206	2023-01-18 22:26:47.309666	0	11	lang_fr	[["am",""],["code","fr"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 0]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","French"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep"," "]]	ir.lang	ir	f	[["am",""],["code","fr"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 0]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","French"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep"," "]]	\N	\N
207	2023-01-18 22:26:47.309666	0	12	lang_hu	[["am",""],["code","hu"],["date","%Y-%m-%d"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep","."],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Hungarian"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep","."]]	ir.lang	ir	f	[["am",""],["code","hu"],["date","%Y-%m-%d"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep","."],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Hungarian"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep","."]]	\N	\N
208	2023-01-18 22:26:47.309666	0	13	lang_id	[["am",""],["code","id"],["date","%d/%m/%Y"],["decimal_point",","],["grouping","[3, 3]"],["mon_decimal_point",","],["mon_grouping","[3, 3]"],["mon_thousands_sep","."],["n_cs_precedes",true],["n_sep_by_space",false],["n_sign_posn",1],["name","Indonesian"],["negative_sign","-"],["p_cs_precedes",true],["p_sep_by_space",false],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep","."]]	ir.lang	ir	f	[["am",""],["code","id"],["date","%d/%m/%Y"],["decimal_point",","],["grouping","[3, 3]"],["mon_decimal_point",","],["mon_grouping","[3, 3]"],["mon_thousands_sep","."],["n_cs_precedes",true],["n_sep_by_space",false],["n_sign_posn",1],["name","Indonesian"],["negative_sign","-"],["p_cs_precedes",true],["p_sep_by_space",false],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep","."]]	\N	\N
209	2023-01-18 22:26:47.309666	0	14	lang_it	[["am",""],["code","it"],["date","%d/%m/%Y"],["decimal_point",","],["grouping","[]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep","."],["n_cs_precedes",true],["n_sep_by_space",true],["n_sign_posn",1],["name","Italian"],["negative_sign","-"],["p_cs_precedes",true],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep",""]]	ir.lang	ir	f	[["am",""],["code","it"],["date","%d/%m/%Y"],["decimal_point",","],["grouping","[]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep","."],["n_cs_precedes",true],["n_sep_by_space",true],["n_sign_posn",1],["name","Italian"],["negative_sign","-"],["p_cs_precedes",true],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep",""]]	\N	\N
210	2023-01-18 22:26:47.309666	0	15	lang_lo	[["am","AM"],["code","lo"],["date","%d/%m/%Y"],["decimal_point","."],["grouping","[3, 3, 0]"],["mon_decimal_point","."],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",","],["n_cs_precedes",true],["n_sep_by_space",true],["n_sign_posn",4],["name","Lao"],["negative_sign","-"],["p_cs_precedes",true],["p_sep_by_space",true],["p_sign_posn",4],["pm","PM"],["positive_sign",""],["thousands_sep",","]]	ir.lang	ir	f	[["am","AM"],["code","lo"],["date","%d/%m/%Y"],["decimal_point","."],["grouping","[3, 3, 0]"],["mon_decimal_point","."],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",","],["n_cs_precedes",true],["n_sep_by_space",true],["n_sign_posn",4],["name","Lao"],["negative_sign","-"],["p_cs_precedes",true],["p_sep_by_space",true],["p_sign_posn",4],["pm","PM"],["positive_sign",""],["thousands_sep",","]]	\N	\N
211	2023-01-18 22:26:47.309666	0	16	lang_lt	[["am",""],["code","lt"],["date","%Y-%m-%d"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep","."],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Lithuanian"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep","."]]	ir.lang	ir	f	[["am",""],["code","lt"],["date","%Y-%m-%d"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep","."],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Lithuanian"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep","."]]	\N	\N
212	2023-01-18 22:26:47.309666	0	17	lang_nl	[["am",""],["code","nl"],["date","%d-%m-%Y"],["decimal_point",","],["grouping","[]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",""],["n_cs_precedes",true],["n_sep_by_space",true],["n_sign_posn",2],["name","Dutch"],["negative_sign","-"],["p_cs_precedes",true],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep",""]]	ir.lang	ir	f	[["am",""],["code","nl"],["date","%d-%m-%Y"],["decimal_point",","],["grouping","[]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",""],["n_cs_precedes",true],["n_sep_by_space",true],["n_sign_posn",2],["name","Dutch"],["negative_sign","-"],["p_cs_precedes",true],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep",""]]	\N	\N
213	2023-01-18 22:26:47.309666	0	18	lang_pl	[["am",""],["code","pl"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 0, 0]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Polish"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep"," "]]	ir.lang	ir	f	[["am",""],["code","pl"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 0, 0]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Polish"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep"," "]]	\N	\N
214	2023-01-18 22:26:47.309666	0	19	lang_pt	[["am",""],["code","pt"],["date","%d-%m-%Y"],["decimal_point",","],["grouping","[]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep","."],["n_cs_precedes",true],["n_sep_by_space",true],["n_sign_posn",1],["name","Portuguese"],["negative_sign","-"],["p_cs_precedes",true],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep",""]]	ir.lang	ir	f	[["am",""],["code","pt"],["date","%d-%m-%Y"],["decimal_point",","],["grouping","[]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep","."],["n_cs_precedes",true],["n_sep_by_space",true],["n_sign_posn",1],["name","Portuguese"],["negative_sign","-"],["p_cs_precedes",true],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep",""]]	\N	\N
215	2023-01-18 22:26:47.309666	0	20	lang_ro	[["am",""],["code","ro"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3,3]"],["mon_decimal_point",","],["mon_grouping","[3,3]"],["mon_thousands_sep","."],["n_cs_precedes",true],["n_sep_by_space",true],["n_sign_posn",1],["name","Romanian"],["negative_sign","-"],["p_cs_precedes",true],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep","."]]	ir.lang	ir	f	[["am",""],["code","ro"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3,3]"],["mon_decimal_point",","],["mon_grouping","[3,3]"],["mon_thousands_sep","."],["n_cs_precedes",true],["n_sep_by_space",true],["n_sign_posn",1],["name","Romanian"],["negative_sign","-"],["p_cs_precedes",true],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep","."]]	\N	\N
216	2023-01-18 22:26:47.309666	0	21	lang_ru	[["am",""],["code","ru"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point","."],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Russian"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep"," "]]	ir.lang	ir	f	[["am",""],["code","ru"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point","."],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Russian"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep"," "]]	\N	\N
217	2023-01-18 22:26:47.309666	0	22	lang_sl	[["am",""],["code","sl"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Slovenian"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep"," "]]	ir.lang	ir	f	[["am",""],["code","sl"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Slovenian"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["pm",""],["positive_sign",""],["thousands_sep"," "]]	\N	\N
218	2023-01-18 22:26:47.309666	0	23	lang_tr	[["code","tr"],["date","%d-%m-%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep","."],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Turkish"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["positive_sign",""],["thousands_sep","."]]	ir.lang	ir	f	[["code","tr"],["date","%d-%m-%Y"],["decimal_point",","],["grouping","[3, 3, 0]"],["mon_decimal_point",","],["mon_grouping","[3, 3, 0]"],["mon_thousands_sep","."],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Turkish"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["positive_sign",""],["thousands_sep","."]]	\N	\N
623	2023-01-18 22:27:08.693829	0	13	menu_action_act_window_group_admin	[["group",1],["menu",13]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",13]]	\N	\N
219	2023-01-18 22:26:47.309666	0	24	lang_uk	[["code","uk"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 3]"],["mon_decimal_point",","],["mon_grouping","[3, 3]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Ukrainian"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["positive_sign",""],["thousands_sep","\\u202f"]]	ir.lang	ir	f	[["code","uk"],["date","%d.%m.%Y"],["decimal_point",","],["grouping","[3, 3]"],["mon_decimal_point",","],["mon_grouping","[3, 3]"],["mon_thousands_sep",""],["n_cs_precedes",false],["n_sep_by_space",true],["n_sign_posn",1],["name","Ukrainian"],["negative_sign","-"],["p_cs_precedes",false],["p_sep_by_space",true],["p_sign_posn",1],["positive_sign",""],["thousands_sep","\\u202f"]]	\N	\N
220	2023-01-18 22:26:47.309666	0	25	lang_zh_CN	[["am","\\u4e0a\\u5348"],["code","zh_CN"],["date","%Y-%m-%d"],["decimal_point","."],["grouping","[3, 0]"],["mon_decimal_point","."],["mon_grouping","[3, 0]"],["mon_thousands_sep",","],["n_cs_precedes",true],["n_sep_by_space",false],["n_sign_posn",4],["name","Chinese Simplified"],["negative_sign","-"],["p_cs_precedes",true],["p_sep_by_space",false],["p_sign_posn",4],["pm","\\u4e0b\\u5348"],["positive_sign",""],["thousands_sep",","]]	ir.lang	ir	f	[["am","\\u4e0a\\u5348"],["code","zh_CN"],["date","%Y-%m-%d"],["decimal_point","."],["grouping","[3, 0]"],["mon_decimal_point","."],["mon_grouping","[3, 0]"],["mon_thousands_sep",","],["n_cs_precedes",true],["n_sep_by_space",false],["n_sign_posn",4],["name","Chinese Simplified"],["negative_sign","-"],["p_cs_precedes",true],["p_sep_by_space",false],["p_sign_posn",4],["pm","\\u4e0b\\u5348"],["positive_sign",""],["thousands_sep",","]]	\N	\N
221	2023-01-18 22:26:47.309666	0	66	lang_view_tree	[["model","ir.lang"],["name","lang_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.lang"],["name","lang_list"],["type","tree"]]	\N	\N
222	2023-01-18 22:26:47.309666	0	67	lang_view_form	[["model","ir.lang"],["name","lang_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.lang"],["name","lang_form"],["type","form"]]	\N	\N
223	2023-01-18 22:26:47.309666	0	33	act_lang_form	[["context",""],["name","Languages"],["res_model","ir.lang"]]	ir.action.act_window	ir	f	[["context",""],["name","Languages"],["res_model","ir.lang"]]	\N	\N
224	2023-01-18 22:26:47.309666	0	50	act_lang_form_view1	[["act_window",33],["sequence",1],["view",66]]	ir.action.act_window.view	ir	f	[["act_window",33],["sequence",1],["view",66]]	\N	\N
225	2023-01-18 22:26:47.309666	0	51	act_lang_form_view2	[["act_window",33],["sequence",2],["view",67]]	ir.action.act_window.view	ir	f	[["act_window",33],["sequence",2],["view",67]]	\N	\N
226	2023-01-18 22:26:47.309666	0	32	menu_lang_form	[["action","ir.action.act_window,33"],["icon","tryton-list"],["name","Languages"],["parent",31],["sequence",10]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,33"],["icon","tryton-list"],["name","Languages"],["parent",31],["sequence",10]]	\N	\N
227	2023-01-18 22:26:47.309666	0	4	lang_load_translations_button	[["confirm","Are you sure you want to load languages' translations?"],["model",46],["name","load_translations"],["string","Load translations"]]	ir.model.button	ir	f	[["confirm","Are you sure you want to load languages' translations?"],["model",46],["name","load_translations"],["string","Load translations"]]	\N	\N
228	2023-01-18 22:26:47.309666	0	5	lang_unload_translations_button	[["confirm","Are you sure you want to remove languages' translations?"],["model",46],["name","unload_translations"],["string","Unload translations"]]	ir.model.button	ir	f	[["confirm","Are you sure you want to remove languages' translations?"],["model",46],["name","unload_translations"],["string","Unload translations"]]	\N	\N
229	2023-01-18 22:26:47.309666	0	68	lang_config_start_view_form	[["model","ir.lang.config.start"],["name","lang_config_start_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.lang.config.start"],["name","lang_config_start_form"],["type","form"]]	\N	\N
230	2023-01-18 22:26:47.309666	0	34	act_lang_config	[["name","Configure Languages"],["window",true],["wiz_name","ir.lang.config"]]	ir.action.wizard	ir	f	[["name","Configure Languages"],["window",true],["wiz_name","ir.lang.config"]]	\N	\N
231	2023-01-18 22:26:47.309666	0	1	config_wizard_item_lang	[["action",34]]	ir.module.config_wizard.item	ir	f	[["action",34]]	\N	\N
232	2023-01-18 22:26:47.309666	0	69	translation_view_form	[["model","ir.translation"],["name","translation_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.translation"],["name","translation_form"],["type","form"]]	\N	\N
233	2023-01-18 22:26:47.309666	0	70	translation_view_tree	[["model","ir.translation"],["name","translation_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.translation"],["name","translation_list"],["type","tree"]]	\N	\N
234	2023-01-18 22:26:47.309666	0	35	act_translation_form	[["domain",null],["name","Translations"],["res_model","ir.translation"]]	ir.action.act_window	ir	f	[["domain",null],["name","Translations"],["res_model","ir.translation"]]	\N	\N
235	2023-01-18 22:26:47.309666	0	3	act_translation_form_domain_module	[["act_window",35],["domain","[[\\"module\\", \\"!=\\", null]]"],["name","Modules"],["sequence",10]]	ir.action.act_window.domain	ir	f	[["act_window",35],["domain","[[\\"module\\", \\"!=\\", null]]"],["name","Modules"],["sequence",10]]	\N	\N
236	2023-01-18 22:26:47.309666	0	4	act_translation_form_domain_local	[["act_window",35],["domain","[[\\"module\\", \\"=\\", null]]"],["name","Local"],["sequence",20]]	ir.action.act_window.domain	ir	f	[["act_window",35],["domain","[[\\"module\\", \\"=\\", null]]"],["name","Local"],["sequence",20]]	\N	\N
237	2023-01-18 22:26:47.309666	0	52	act_translation_form_view1	[["act_window",35],["sequence",1],["view",70]]	ir.action.act_window.view	ir	f	[["act_window",35],["sequence",1],["view",70]]	\N	\N
238	2023-01-18 22:26:47.309666	0	53	act_translation_form_view2	[["act_window",35],["sequence",2],["view",69]]	ir.action.act_window.view	ir	f	[["act_window",35],["sequence",2],["view",69]]	\N	\N
239	2023-01-18 22:26:47.309666	0	33	menu_translation_form	[["action","ir.action.act_window,35"],["icon","tryton-list"],["name","Translations"],["parent",31],["sequence",20]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,35"],["icon","tryton-list"],["name","Translations"],["parent",31],["sequence",20]]	\N	\N
240	2023-01-18 22:26:47.309666	0	36	wizard_translation_report	[["model","ir.action.report"],["name","Translations"],["wiz_name","ir.translation.report"]]	ir.action.wizard	ir	f	[["model","ir.action.report"],["name","Translations"],["wiz_name","ir.translation.report"]]	\N	\N
241	2023-01-18 22:26:47.309666	0	32	wizard_translation_report_keyword1	[["action",36],["keyword","form_relate"],["model","ir.action.report,-1"]]	ir.action.keyword	ir	f	[["action",36],["keyword","form_relate"],["model","ir.action.report,-1"]]	\N	\N
242	2023-01-18 22:26:47.309666	0	37	act_translation_report	[["name","Translations"],["res_model","ir.translation"]]	ir.action.act_window	ir	f	[["name","Translations"],["res_model","ir.translation"]]	\N	\N
243	2023-01-18 22:26:47.309666	0	71	translation_set_start_view_form	[["model","ir.translation.set.start"],["name","translation_set_start_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.translation.set.start"],["name","translation_set_start_form"],["type","form"]]	\N	\N
624	2023-01-18 22:27:08.693829	0	14	menu_action_wizard_group_admin	[["group",1],["menu",14]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",14]]	\N	\N
244	2023-01-18 22:26:47.309666	0	72	translation_set_succeed_view_form	[["model","ir.translation.set.succeed"],["name","translation_set_succeed_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.translation.set.succeed"],["name","translation_set_succeed_form"],["type","form"]]	\N	\N
245	2023-01-18 22:26:47.309666	0	38	act_translation_set	[["name","Set Translations"],["wiz_name","ir.translation.set"]]	ir.action.wizard	ir	f	[["name","Set Translations"],["wiz_name","ir.translation.set"]]	\N	\N
246	2023-01-18 22:26:47.309666	0	33	act_translation_set_keyword_report	[["action",38],["keyword","form_action"],["model","ir.action.report,-1"]]	ir.action.keyword	ir	f	[["action",38],["keyword","form_action"],["model","ir.action.report,-1"]]	\N	\N
247	2023-01-18 22:26:47.309666	0	34	act_translation_set_keyword_view	[["action",38],["keyword","form_action"],["model","ir.ui.view,-1"]]	ir.action.keyword	ir	f	[["action",38],["keyword","form_action"],["model","ir.ui.view,-1"]]	\N	\N
248	2023-01-18 22:26:47.309666	0	34	menu_translation_set	[["action","ir.action.wizard,38"],["icon","tryton-launch"],["name","Set Translations"],["parent",31],["sequence",90]]	ir.ui.menu	ir	f	[["action","ir.action.wizard,38"],["icon","tryton-launch"],["name","Set Translations"],["parent",31],["sequence",90]]	\N	\N
249	2023-01-18 22:26:47.309666	0	73	translation_clean_start_view_form	[["model","ir.translation.clean.start"],["name","translation_clean_start_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.translation.clean.start"],["name","translation_clean_start_form"],["type","form"]]	\N	\N
250	2023-01-18 22:26:47.309666	0	74	translation_clean_succeed_view_form	[["model","ir.translation.clean.succeed"],["name","translation_clean_succeed_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.translation.clean.succeed"],["name","translation_clean_succeed_form"],["type","form"]]	\N	\N
251	2023-01-18 22:26:47.309666	0	39	act_translation_clean	[["name","Clean Translations"],["wiz_name","ir.translation.clean"]]	ir.action.wizard	ir	f	[["name","Clean Translations"],["wiz_name","ir.translation.clean"]]	\N	\N
252	2023-01-18 22:26:47.309666	0	35	menu_translation_clean	[["action","ir.action.wizard,39"],["icon","tryton-launch"],["name","Clean Translations"],["parent",31],["sequence",91]]	ir.ui.menu	ir	f	[["action","ir.action.wizard,39"],["icon","tryton-launch"],["name","Clean Translations"],["parent",31],["sequence",91]]	\N	\N
253	2023-01-18 22:26:47.309666	0	75	translation_update_start_view_form	[["model","ir.translation.update.start"],["name","translation_update_start_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.translation.update.start"],["name","translation_update_start_form"],["type","form"]]	\N	\N
254	2023-01-18 22:26:47.309666	0	40	act_translation_update	[["name","Synchronize Translations"],["wiz_name","ir.translation.update"]]	ir.action.wizard	ir	f	[["name","Synchronize Translations"],["wiz_name","ir.translation.update"]]	\N	\N
255	2023-01-18 22:26:47.309666	0	37	act_translation_update_keyword_report	[["action",40],["keyword","form_action"],["model","ir.action.report,-1"]]	ir.action.keyword	ir	f	[["action",40],["keyword","form_action"],["model","ir.action.report,-1"]]	\N	\N
256	2023-01-18 22:26:47.309666	0	38	act_translation_update_keyword_view	[["action",40],["keyword","form_action"],["model","ir.ui.view,-1"]]	ir.action.keyword	ir	f	[["action",40],["keyword","form_action"],["model","ir.ui.view,-1"]]	\N	\N
257	2023-01-18 22:26:47.309666	0	36	menu_translation_update	[["action","ir.action.wizard,40"],["icon","tryton-launch"],["name","Synchronize Translations"],["parent",31],["sequence",92]]	ir.ui.menu	ir	f	[["action","ir.action.wizard,40"],["icon","tryton-launch"],["name","Synchronize Translations"],["parent",31],["sequence",92]]	\N	\N
258	2023-01-18 22:26:47.309666	0	76	translation_export_start_view_form	[["model","ir.translation.export.start"],["name","translation_export_start_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.translation.export.start"],["name","translation_export_start_form"],["type","form"]]	\N	\N
259	2023-01-18 22:26:47.309666	0	77	translation_export_result_view_form	[["model","ir.translation.export.result"],["name","translation_export_result_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.translation.export.result"],["name","translation_export_result_form"],["type","form"]]	\N	\N
260	2023-01-18 22:26:47.309666	0	41	act_translation_export	[["name","Export Translations"],["wiz_name","ir.translation.export"]]	ir.action.wizard	ir	f	[["name","Export Translations"],["wiz_name","ir.translation.export"]]	\N	\N
261	2023-01-18 22:26:47.309666	0	37	menu_translation_export	[["action","ir.action.wizard,41"],["icon","tryton-launch"],["name","Export Translations"],["parent",31],["sequence",93]]	ir.ui.menu	ir	f	[["action","ir.action.wizard,41"],["icon","tryton-launch"],["name","Export Translations"],["parent",31],["sequence",93]]	\N	\N
262	2023-01-18 22:26:47.309666	0	78	export_view_form	[["model","ir.export"],["name","export_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.export"],["name","export_form"],["type","form"]]	\N	\N
263	2023-01-18 22:26:47.309666	0	79	export_view_tree	[["model","ir.export"],["name","export_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.export"],["name","export_list"],["type","tree"]]	\N	\N
264	2023-01-18 22:26:47.309666	0	42	act_export_form	[["name","Exports"],["res_model","ir.export"],["type","ir.action.act_window"]]	ir.action.act_window	ir	f	[["name","Exports"],["res_model","ir.export"],["type","ir.action.act_window"]]	\N	\N
265	2023-01-18 22:26:47.309666	0	54	act_export_form_view1	[["act_window",42],["sequence",1],["view",79]]	ir.action.act_window.view	ir	f	[["act_window",42],["sequence",1],["view",79]]	\N	\N
266	2023-01-18 22:26:47.309666	0	55	act_export_form_view2	[["act_window",42],["sequence",2],["view",78]]	ir.action.act_window.view	ir	f	[["act_window",42],["sequence",2],["view",78]]	\N	\N
267	2023-01-18 22:26:47.309666	0	38	menu_export_form	[["action","ir.action.act_window,42"],["icon","tryton-list"],["name","Exports"],["parent",16],["sequence",50]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,42"],["icon","tryton-list"],["name","Exports"],["parent",16],["sequence",50]]	\N	\N
268	2023-01-18 22:26:47.309666	0	80	export_line_view_form	[["model","ir.export.line"],["name","export_line_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.export.line"],["name","export_line_form"],["type","form"]]	\N	\N
269	2023-01-18 22:26:47.309666	0	81	export_line_view_tree	[["model","ir.export.line"],["name","export_line_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.export.line"],["name","export_line_list"],["type","tree"]]	\N	\N
270	2023-01-18 22:26:47.309666	0	82	rule_group_view_form	[["model","ir.rule.group"],["name","rule_group_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.rule.group"],["name","rule_group_form"],["type","form"]]	\N	\N
271	2023-01-18 22:26:47.309666	0	83	rule_group_view_tree	[["model","ir.rule.group"],["name","rule_group_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.rule.group"],["name","rule_group_list"],["type","tree"]]	\N	\N
272	2023-01-18 22:26:47.309666	0	43	act_rule_group_form	[["name","Record Rules"],["res_model","ir.rule.group"]]	ir.action.act_window	ir	f	[["name","Record Rules"],["res_model","ir.rule.group"]]	\N	\N
273	2023-01-18 22:26:47.309666	0	56	act_rule_group_form_view1	[["act_window",43],["sequence",1],["view",83]]	ir.action.act_window.view	ir	f	[["act_window",43],["sequence",1],["view",83]]	\N	\N
275	2023-01-18 22:26:47.309666	0	39	menu_rule_group_form	[["action","ir.action.act_window,43"],["icon","tryton-list"],["name","Record Rules"],["parent",16],["sequence",30]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,43"],["icon","tryton-list"],["name","Record Rules"],["parent",16],["sequence",30]]	\N	\N
276	2023-01-18 22:26:47.309666	0	84	rule_view_form	[["model","ir.rule"],["name","rule_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.rule"],["name","rule_form"],["type","form"]]	\N	\N
277	2023-01-18 22:26:47.309666	0	85	rule_view_tree	[["model","ir.rule"],["name","rule_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.rule"],["name","rule_list"],["type","tree"]]	\N	\N
278	2023-01-18 22:26:47.309666	0	40	menu_modules	[["icon","tryton-folder"],["name","Modules"],["parent",1],["sequence",20]]	ir.ui.menu	ir	f	[["icon","tryton-folder"],["name","Modules"],["parent",1],["sequence",20]]	\N	\N
279	2023-01-18 22:26:47.309666	0	86	module_view_form	[["model","ir.module"],["name","module_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.module"],["name","module_form"],["type","form"]]	\N	\N
280	2023-01-18 22:26:47.309666	0	87	module_view_tree	[["model","ir.module"],["name","module_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.module"],["name","module_list"],["type","tree"]]	\N	\N
281	2023-01-18 22:26:47.309666	0	44	act_module_form	[["domain","[[\\"name\\", \\"!=\\", \\"tests\\"]]"],["name","Modules"],["res_model","ir.module"],["type","ir.action.act_window"]]	ir.action.act_window	ir	f	[["domain","[[\\"name\\", \\"!=\\", \\"tests\\"]]"],["name","Modules"],["res_model","ir.module"],["type","ir.action.act_window"]]	\N	\N
282	2023-01-18 22:26:47.309666	0	58	act_module_form_view1	[["act_window",44],["sequence",1],["view",87]]	ir.action.act_window.view	ir	f	[["act_window",44],["sequence",1],["view",87]]	\N	\N
283	2023-01-18 22:26:47.309666	0	59	act_module_form_view2	[["act_window",44],["sequence",2],["view",86]]	ir.action.act_window.view	ir	f	[["act_window",44],["sequence",2],["view",86]]	\N	\N
284	2023-01-18 22:26:47.309666	0	41	menu_module_form	[["action","ir.action.act_window,44"],["icon","tryton-list"],["name","Modules"],["parent",40],["sequence",10]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,44"],["icon","tryton-list"],["name","Modules"],["parent",40],["sequence",10]]	\N	\N
285	2023-01-18 22:26:47.309666	0	6	module_activate_button	[["model",52],["name","activate"],["string","Mark for Activation"]]	ir.model.button	ir	f	[["model",52],["name","activate"],["string","Mark for Activation"]]	\N	\N
286	2023-01-18 22:26:47.309666	0	7	module_activate_cancel_button	[["model",52],["name","activate_cancel"],["string","Cancel Activation"]]	ir.model.button	ir	f	[["model",52],["name","activate_cancel"],["string","Cancel Activation"]]	\N	\N
287	2023-01-18 22:26:47.309666	0	8	module_deactivate_button	[["model",52],["name","deactivate"],["string","Mark for Deactivation (beta)"]]	ir.model.button	ir	f	[["model",52],["name","deactivate"],["string","Mark for Deactivation (beta)"]]	\N	\N
288	2023-01-18 22:26:47.309666	0	9	module_deactivate_cancel_button	[["model",52],["name","deactivate_cancel"],["string","Cancel Deactivation"]]	ir.model.button	ir	f	[["model",52],["name","deactivate_cancel"],["string","Cancel Deactivation"]]	\N	\N
289	2023-01-18 22:26:47.309666	0	10	module_upgrade_button	[["model",52],["name","upgrade"],["string","Mark for Upgrade"]]	ir.model.button	ir	f	[["model",52],["name","upgrade"],["string","Mark for Upgrade"]]	\N	\N
290	2023-01-18 22:26:47.309666	0	11	module_upgrade_cancel_button	[["model",52],["name","upgrade_cancel"],["string","Cancel Upgrade"]]	ir.model.button	ir	f	[["model",52],["name","upgrade_cancel"],["string","Cancel Upgrade"]]	\N	\N
291	2023-01-18 22:26:47.309666	0	88	module_dependency_view_form	[["model","ir.module.dependency"],["name","module_dependency_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.module.dependency"],["name","module_dependency_form"],["type","form"]]	\N	\N
292	2023-01-18 22:26:47.309666	0	89	module_dependency_view_list	[["model","ir.module.dependency"],["name","module_dependency_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.module.dependency"],["name","module_dependency_list"],["type","tree"]]	\N	\N
293	2023-01-18 22:26:47.309666	0	90	config_wizard_item_view_tree	[["model","ir.module.config_wizard.item"],["name","module_config_wizard_item_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.module.config_wizard.item"],["name","module_config_wizard_item_list"],["type","tree"]]	\N	\N
294	2023-01-18 22:26:47.309666	0	45	act_config_wizard_item_form	[["name","Config Wizard Items"],["res_model","ir.module.config_wizard.item"]]	ir.action.act_window	ir	f	[["name","Config Wizard Items"],["res_model","ir.module.config_wizard.item"]]	\N	\N
295	2023-01-18 22:26:47.309666	0	60	act_config_wizard_item_form_view1	[["act_window",45],["sequence",10],["view",90]]	ir.action.act_window.view	ir	f	[["act_window",45],["sequence",10],["view",90]]	\N	\N
296	2023-01-18 22:26:47.309666	0	42	menu_config_wizard_item_form	[["action","ir.action.act_window,45"],["icon","tryton-list"],["name","Config Wizard Items"],["parent",40],["sequence",50]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,45"],["icon","tryton-list"],["name","Config Wizard Items"],["parent",40],["sequence",50]]	\N	\N
297	2023-01-18 22:26:47.309666	0	46	act_module_config_wizard	[["name","Module Configuration"],["window",true],["wiz_name","ir.module.config_wizard"]]	ir.action.wizard	ir	f	[["name","Module Configuration"],["window",true],["wiz_name","ir.module.config_wizard"]]	\N	\N
298	2023-01-18 22:26:47.309666	0	45	act_module_config_wizard_keyword	[["action",46],["keyword","form_action"],["model","ir.module.config_wizard.item,-1"]]	ir.action.keyword	ir	f	[["action",46],["keyword","form_action"],["model","ir.module.config_wizard.item,-1"]]	\N	\N
299	2023-01-18 22:26:47.309666	0	91	module_config_wizard_first_view_form	[["model","ir.module.config_wizard.first"],["name","module_config_wizard_first_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.module.config_wizard.first"],["name","module_config_wizard_first_form"],["type","form"]]	\N	\N
300	2023-01-18 22:26:47.309666	0	92	module_config_wizard_other_view_form	[["model","ir.module.config_wizard.other"],["name","module_config_wizard_other_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.module.config_wizard.other"],["name","module_config_wizard_other_form"],["type","form"]]	\N	\N
301	2023-01-18 22:26:47.309666	0	93	module_config_wizard_done_view_form	[["model","ir.module.config_wizard.done"],["name","module_config_wizard_done_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.module.config_wizard.done"],["name","module_config_wizard_done_form"],["type","form"]]	\N	\N
302	2023-01-18 22:26:47.309666	0	47	act_module_activate_upgrade	[["name","Perform Pending Activation/Upgrade"],["wiz_name","ir.module.activate_upgrade"]]	ir.action.wizard	ir	f	[["name","Perform Pending Activation/Upgrade"],["wiz_name","ir.module.activate_upgrade"]]	\N	\N
303	2023-01-18 22:26:47.309666	0	46	act_module_activate_upgrade_keyword1	[["action",47],["keyword","form_action"],["model","ir.module,-1"]]	ir.action.keyword	ir	f	[["action",47],["keyword","form_action"],["model","ir.module,-1"]]	\N	\N
384	2023-01-18 22:26:47.309666	0	44	msg_required_validation	[["text","A value is required for field \\"%(field)s\\" in \\"%(model)s\\"."]]	ir.message	ir	f	[["text","A value is required for field \\"%(field)s\\" in \\"%(model)s\\"."]]	\N	\N
304	2023-01-18 22:26:47.309666	0	94	module_activate_upgrade_start_view_form	[["model","ir.module.activate_upgrade.start"],["name","module_activate_upgrade_start_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.module.activate_upgrade.start"],["name","module_activate_upgrade_start_form"],["type","form"]]	\N	\N
305	2023-01-18 22:26:47.309666	0	95	module_activate_upgrade_done_view_form	[["model","ir.module.activate_upgrade.done"],["name","module_activate_upgrade_done_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.module.activate_upgrade.done"],["name","module_activate_upgrade_done_form"],["type","form"]]	\N	\N
306	2023-01-18 22:26:47.309666	0	43	menu_module_activate_upgrade	[["action","ir.action.wizard,47"],["icon","tryton-launch"],["name","Perform Pending Activation/Upgrade"],["parent",40],["sequence",90]]	ir.ui.menu	ir	f	[["action","ir.action.wizard,47"],["icon","tryton-launch"],["name","Perform Pending Activation/Upgrade"],["parent",40],["sequence",90]]	\N	\N
307	2023-01-18 22:26:47.309666	0	48	act_module_config	[["name","Configure Modules"],["window",true],["wiz_name","ir.module.config"]]	ir.action.wizard	ir	f	[["name","Configure Modules"],["window",true],["wiz_name","ir.module.config"]]	\N	\N
308	2023-01-18 22:26:47.309666	0	96	module_config_start_view_form	[["model","ir.module.config.start"],["name","module_config_start_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.module.config.start"],["name","module_config_start_form"],["type","form"]]	\N	\N
309	2023-01-18 22:26:47.309666	0	2	config_wizard_item_module	[["action",48],["sequence",10000]]	ir.module.config_wizard.item	ir	f	[["action",48],["sequence",10000]]	\N	\N
310	2023-01-18 22:26:47.309666	0	97	trigger_view_form	[["model","ir.trigger"],["name","trigger_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.trigger"],["name","trigger_form"],["type","form"]]	\N	\N
311	2023-01-18 22:26:47.309666	0	98	trigger_view_tree	[["model","ir.trigger"],["name","trigger_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.trigger"],["name","trigger_list"],["type","tree"]]	\N	\N
312	2023-01-18 22:26:47.309666	0	49	act_trigger_form	[["name","Triggers"],["res_model","ir.trigger"]]	ir.action.act_window	ir	f	[["name","Triggers"],["res_model","ir.trigger"]]	\N	\N
313	2023-01-18 22:26:47.309666	0	61	act_trigger_form_view1	[["act_window",49],["sequence",10],["view",98]]	ir.action.act_window.view	ir	f	[["act_window",49],["sequence",10],["view",98]]	\N	\N
314	2023-01-18 22:26:47.309666	0	62	act_trigger_form_view2	[["act_window",49],["sequence",20],["view",97]]	ir.action.act_window.view	ir	f	[["act_window",49],["sequence",20],["view",97]]	\N	\N
315	2023-01-18 22:26:47.309666	0	44	menu_trigger_form	[["action","ir.action.act_window,49"],["icon","tryton-list"],["name","Triggers"],["parent",16],["sequence",50]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,49"],["icon","tryton-list"],["name","Triggers"],["parent",16],["sequence",50]]	\N	\N
316	2023-01-18 22:26:47.309666	0	1	January	[["abbreviation","Jan"],["index",1],["name","January"]]	ir.calendar.month	ir	f	[["abbreviation","Jan"],["index",1],["name","January"]]	\N	\N
317	2023-01-18 22:26:47.309666	0	2	February	[["abbreviation","Feb"],["index",2],["name","February"]]	ir.calendar.month	ir	f	[["abbreviation","Feb"],["index",2],["name","February"]]	\N	\N
318	2023-01-18 22:26:47.309666	0	3	March	[["abbreviation","Mar"],["index",3],["name","March"]]	ir.calendar.month	ir	f	[["abbreviation","Mar"],["index",3],["name","March"]]	\N	\N
319	2023-01-18 22:26:47.309666	0	4	April	[["abbreviation","Apr"],["index",4],["name","April"]]	ir.calendar.month	ir	f	[["abbreviation","Apr"],["index",4],["name","April"]]	\N	\N
320	2023-01-18 22:26:47.309666	0	5	May	[["abbreviation","May"],["index",5],["name","May"]]	ir.calendar.month	ir	f	[["abbreviation","May"],["index",5],["name","May"]]	\N	\N
321	2023-01-18 22:26:47.309666	0	6	June	[["abbreviation","Jun"],["index",6],["name","June"]]	ir.calendar.month	ir	f	[["abbreviation","Jun"],["index",6],["name","June"]]	\N	\N
322	2023-01-18 22:26:47.309666	0	7	July	[["abbreviation","Jul"],["index",7],["name","July"]]	ir.calendar.month	ir	f	[["abbreviation","Jul"],["index",7],["name","July"]]	\N	\N
323	2023-01-18 22:26:47.309666	0	8	August	[["abbreviation","Aug"],["index",8],["name","August"]]	ir.calendar.month	ir	f	[["abbreviation","Aug"],["index",8],["name","August"]]	\N	\N
324	2023-01-18 22:26:47.309666	0	9	September	[["abbreviation","Sep"],["index",9],["name","September"]]	ir.calendar.month	ir	f	[["abbreviation","Sep"],["index",9],["name","September"]]	\N	\N
325	2023-01-18 22:26:47.309666	0	10	October	[["abbreviation","Oct"],["index",10],["name","October"]]	ir.calendar.month	ir	f	[["abbreviation","Oct"],["index",10],["name","October"]]	\N	\N
326	2023-01-18 22:26:47.309666	0	11	November	[["abbreviation","Nov"],["index",11],["name","November"]]	ir.calendar.month	ir	f	[["abbreviation","Nov"],["index",11],["name","November"]]	\N	\N
327	2023-01-18 22:26:47.309666	0	12	December	[["abbreviation","Dec"],["index",12],["name","December"]]	ir.calendar.month	ir	f	[["abbreviation","Dec"],["index",12],["name","December"]]	\N	\N
328	2023-01-18 22:26:47.309666	0	1	Monday	[["abbreviation","Mon"],["index",0],["name","Monday"]]	ir.calendar.day	ir	f	[["abbreviation","Mon"],["index",0],["name","Monday"]]	\N	\N
329	2023-01-18 22:26:47.309666	0	2	Tuesday	[["abbreviation","Tue"],["index",1],["name","Tuesday"]]	ir.calendar.day	ir	f	[["abbreviation","Tue"],["index",1],["name","Tuesday"]]	\N	\N
330	2023-01-18 22:26:47.309666	0	3	Wednesday	[["abbreviation","Wed"],["index",2],["name","Wednesday"]]	ir.calendar.day	ir	f	[["abbreviation","Wed"],["index",2],["name","Wednesday"]]	\N	\N
331	2023-01-18 22:26:47.309666	0	4	Thursday	[["abbreviation","Thu"],["index",3],["name","Thursday"]]	ir.calendar.day	ir	f	[["abbreviation","Thu"],["index",3],["name","Thursday"]]	\N	\N
332	2023-01-18 22:26:47.309666	0	5	Friday	[["abbreviation","Fri"],["index",4],["name","Friday"]]	ir.calendar.day	ir	f	[["abbreviation","Fri"],["index",4],["name","Friday"]]	\N	\N
333	2023-01-18 22:26:47.309666	0	6	Saturday	[["abbreviation","Sat"],["index",5],["name","Saturday"]]	ir.calendar.day	ir	f	[["abbreviation","Sat"],["index",5],["name","Saturday"]]	\N	\N
334	2023-01-18 22:26:47.309666	0	7	Sunday	[["abbreviation","Sun"],["index",6],["name","Sunday"]]	ir.calendar.day	ir	f	[["abbreviation","Sun"],["index",6],["name","Sunday"]]	\N	\N
335	2023-01-18 22:26:47.309666	0	99	message_view_tree	[["model","ir.message"],["name","message_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.message"],["name","message_list"],["type","tree"]]	\N	\N
336	2023-01-18 22:26:47.309666	0	100	message_view_form	[["model","ir.message"],["name","message_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.message"],["name","message_form"],["type","form"]]	\N	\N
337	2023-01-18 22:26:47.309666	0	50	act_message_form	[["name","Message"],["res_model","ir.message"]]	ir.action.act_window	ir	f	[["name","Message"],["res_model","ir.message"]]	\N	\N
338	2023-01-18 22:26:47.309666	0	63	act_message_form_view1	[["act_window",50],["sequence",10],["view",99]]	ir.action.act_window.view	ir	f	[["act_window",50],["sequence",10],["view",99]]	\N	\N
339	2023-01-18 22:26:47.309666	0	64	act_message_form_view2	[["act_window",50],["sequence",20],["view",100]]	ir.action.act_window.view	ir	f	[["act_window",50],["sequence",20],["view",100]]	\N	\N
340	2023-01-18 22:26:47.309666	0	45	menu_message_form	[["action","ir.action.act_window,50"],["icon","tryton-list"],["name","Message"],["parent",31],["sequence",20]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,50"],["icon","tryton-list"],["name","Message"],["parent",31],["sequence",20]]	\N	\N
341	2023-01-18 22:26:47.309666	0	1	msg_ID	[["text","ID"]]	ir.message	ir	f	[["text","ID"]]	\N	\N
342	2023-01-18 22:26:47.309666	0	2	msg_created_by	[["text","Created by"]]	ir.message	ir	f	[["text","Created by"]]	\N	\N
343	2023-01-18 22:26:47.309666	0	3	msg_created_at	[["text","Created at"]]	ir.message	ir	f	[["text","Created at"]]	\N	\N
344	2023-01-18 22:26:47.309666	0	4	msg_edited_by	[["text","Edited by"]]	ir.message	ir	f	[["text","Edited by"]]	\N	\N
345	2023-01-18 22:26:47.309666	0	5	msg_edited_at	[["text","Edited at"]]	ir.message	ir	f	[["text","Edited at"]]	\N	\N
346	2023-01-18 22:26:47.309666	0	6	msg_record_name	[["text","Record Name"]]	ir.message	ir	f	[["text","Record Name"]]	\N	\N
347	2023-01-18 22:26:47.309666	0	7	msg_active	[["text","Active"]]	ir.message	ir	f	[["text","Active"]]	\N	\N
348	2023-01-18 22:26:47.309666	0	8	msg_active_help	[["text","Uncheck to exclude from future use."]]	ir.message	ir	f	[["text","Uncheck to exclude from future use."]]	\N	\N
349	2023-01-18 22:26:47.309666	0	9	msg_dict_schema_name	[["text","Name"]]	ir.message	ir	f	[["text","Name"]]	\N	\N
350	2023-01-18 22:26:47.309666	0	10	msg_dict_schema_string	[["text","String"]]	ir.message	ir	f	[["text","String"]]	\N	\N
351	2023-01-18 22:26:47.309666	0	11	msg_dict_schema_help	[["text","Help"]]	ir.message	ir	f	[["text","Help"]]	\N	\N
352	2023-01-18 22:26:47.309666	0	12	msg_dict_schema_type	[["text","Type"]]	ir.message	ir	f	[["text","Type"]]	\N	\N
353	2023-01-18 22:26:47.309666	0	13	msg_dict_schema_boolean	[["text","Boolean"]]	ir.message	ir	f	[["text","Boolean"]]	\N	\N
354	2023-01-18 22:26:47.309666	0	14	msg_dict_schema_integer	[["text","Integer"]]	ir.message	ir	f	[["text","Integer"]]	\N	\N
355	2023-01-18 22:26:47.309666	0	15	msg_dict_schema_char	[["text","Char"]]	ir.message	ir	f	[["text","Char"]]	\N	\N
356	2023-01-18 22:26:47.309666	0	16	msg_dict_schema_float	[["text","Float"]]	ir.message	ir	f	[["text","Float"]]	\N	\N
357	2023-01-18 22:26:47.309666	0	17	msg_dict_schema_numeric	[["text","Numeric"]]	ir.message	ir	f	[["text","Numeric"]]	\N	\N
358	2023-01-18 22:26:47.309666	0	18	msg_dict_schema_date	[["text","Date"]]	ir.message	ir	f	[["text","Date"]]	\N	\N
359	2023-01-18 22:26:47.309666	0	19	msg_dict_schema_datetime	[["text","DateTime"]]	ir.message	ir	f	[["text","DateTime"]]	\N	\N
360	2023-01-18 22:26:47.309666	0	20	msg_dict_schema_selection	[["text","Selection"]]	ir.message	ir	f	[["text","Selection"]]	\N	\N
361	2023-01-18 22:26:47.309666	0	21	msg_dict_schema_multiselection	[["text","MultiSelection"]]	ir.message	ir	f	[["text","MultiSelection"]]	\N	\N
362	2023-01-18 22:26:47.309666	0	22	msg_dict_schema_digits	[["text","Digits"]]	ir.message	ir	f	[["text","Digits"]]	\N	\N
363	2023-01-18 22:26:47.309666	0	23	msg_dict_schema_domain	[["text","Domain"]]	ir.message	ir	f	[["text","Domain"]]	\N	\N
364	2023-01-18 22:26:47.309666	0	24	msg_dict_schema_selection_help	[["text","A couple of key and label separated by \\":\\" per line."]]	ir.message	ir	f	[["text","A couple of key and label separated by \\":\\" per line."]]	\N	\N
365	2023-01-18 22:26:47.309666	0	25	msg_dict_schema_selection_sorted	[["text","Selection Sorted"]]	ir.message	ir	f	[["text","Selection Sorted"]]	\N	\N
366	2023-01-18 22:26:47.309666	0	26	msg_dict_schema_selection_sorted_help	[["text","If the selection must be sorted on label."]]	ir.message	ir	f	[["text","If the selection must be sorted on label."]]	\N	\N
367	2023-01-18 22:26:47.309666	0	27	msg_dict_schema_help_selection	[["text","Help Selection"]]	ir.message	ir	f	[["text","Help Selection"]]	\N	\N
368	2023-01-18 22:26:47.309666	0	28	msg_dict_schema_help_selection_help	[["text","The key followed by the help text separated by a \\":\\", one per line."]]	ir.message	ir	f	[["text","The key followed by the help text separated by a \\":\\", one per line."]]	\N	\N
369	2023-01-18 22:26:47.309666	0	29	msg_dict_schema_selection_json	[["text","Selection JSON"]]	ir.message	ir	f	[["text","Selection JSON"]]	\N	\N
370	2023-01-18 22:26:47.309666	0	30	msg_dict_schema_help_selection_json	[["text","Help Selection JSON"]]	ir.message	ir	f	[["text","Help Selection JSON"]]	\N	\N
371	2023-01-18 22:26:47.309666	0	31	msg_dict_yes	[["text","Yes"]]	ir.message	ir	f	[["text","Yes"]]	\N	\N
372	2023-01-18 22:26:47.309666	0	32	msg_dict_no	[["text","No"]]	ir.message	ir	f	[["text","No"]]	\N	\N
373	2023-01-18 22:26:47.309666	0	33	msg_sequence	[["text","Sequence"]]	ir.message	ir	f	[["text","Sequence"]]	\N	\N
374	2023-01-18 22:26:47.309666	0	34	msg_id_positive	[["text","ID must be positive."]]	ir.message	ir	f	[["text","ID must be positive."]]	\N	\N
375	2023-01-18 22:26:47.309666	0	35	msg_write_xml_record	[["text","You are not allowed to modify this record."]]	ir.message	ir	f	[["text","You are not allowed to modify this record."]]	\N	\N
376	2023-01-18 22:26:47.309666	0	36	msg_delete_xml_record	[["text","You are not allowed to delete this record."]]	ir.message	ir	f	[["text","You are not allowed to delete this record."]]	\N	\N
377	2023-01-18 22:26:47.309666	0	37	msg_base_config_record	[["text","This record is part of the base configuration."]]	ir.message	ir	f	[["text","This record is part of the base configuration."]]	\N	\N
378	2023-01-18 22:26:47.309666	0	38	msg_relation_not_found	[["text","Relation not found: %(value)r in \\"%(model)s\\" (%(column)s)."]]	ir.message	ir	f	[["text","Relation not found: %(value)r in \\"%(model)s\\" (%(column)s)."]]	\N	\N
379	2023-01-18 22:26:47.309666	0	39	msg_too_many_relations_found	[["text","Too many relations found: %(value)r in \\"%(model)s\\" (%(column)s)."]]	ir.message	ir	f	[["text","Too many relations found: %(value)r in \\"%(model)s\\" (%(column)s)."]]	\N	\N
380	2023-01-18 22:26:47.309666	0	40	msg_value_syntax_error	[["text","Syntax error for value: %(value)r in \\"%(field)s\\" of \\"%(model)s\\" (%(column)s)."]]	ir.message	ir	f	[["text","Syntax error for value: %(value)r in \\"%(field)s\\" of \\"%(model)s\\" (%(column)s)."]]	\N	\N
381	2023-01-18 22:26:47.309666	0	41	msg_reference_syntax_error	[["text","Syntax error for reference: %(value)r in \\"%(field)s\\" of \\"%(model)s\\" (%(column)s)."]]	ir.message	ir	f	[["text","Syntax error for reference: %(value)r in \\"%(field)s\\" of \\"%(model)s\\" (%(column)s)."]]	\N	\N
382	2023-01-18 22:26:47.309666	0	42	msg_xml_id_syntax_error	[["text","Syntax error for XML id: %(value)r in \\"%(field)s\\" of \\"%(model)s\\" (%(column)s)."]]	ir.message	ir	f	[["text","Syntax error for XML id: %(value)r in \\"%(field)s\\" of \\"%(model)s\\" (%(column)s)."]]	\N	\N
383	2023-01-18 22:26:47.309666	0	43	msg_domain_validation_record	[["text","The value \\"%(value)s\\" for field \\"%(field)s\\" in \\"%(record)s\\" of \\"%(model)s\\" is not valid according to its domain."]]	ir.message	ir	f	[["text","The value \\"%(value)s\\" for field \\"%(field)s\\" in \\"%(record)s\\" of \\"%(model)s\\" is not valid according to its domain."]]	\N	\N
385	2023-01-18 22:26:47.309666	0	45	msg_required_validation_record	[["text","A value is required for field \\"%(field)s\\" in \\"%(record)s\\" of \\"%(model)s\\"."]]	ir.message	ir	f	[["text","A value is required for field \\"%(field)s\\" in \\"%(record)s\\" of \\"%(model)s\\"."]]	\N	\N
386	2023-01-18 22:26:47.309666	0	46	msg_size_validation	[["text","The value \\"%(value)s\\" for field \\"%(field)s\\" in \\"%(model)s\\" is too long (%(size)i > %(max_size)i)."]]	ir.message	ir	f	[["text","The value \\"%(value)s\\" for field \\"%(field)s\\" in \\"%(model)s\\" is too long (%(size)i > %(max_size)i)."]]	\N	\N
387	2023-01-18 22:26:47.309666	0	47	msg_size_validation_record	[["text","The value \\"%(value)s\\" for field \\"%(field)s\\" in \\"%(record)s\\" of \\"%(model)s\\" is too long (%(size)i > %(max_size)i)."]]	ir.message	ir	f	[["text","The value \\"%(value)s\\" for field \\"%(field)s\\" in \\"%(record)s\\" of \\"%(model)s\\" is too long (%(size)i > %(max_size)i)."]]	\N	\N
388	2023-01-18 22:26:47.309666	0	48	msg_digits_validation_record	[["text","The number of digits in the value \\"%(value)r\\" for field \\"%(field)s\\" in \\"%(record)s\\" of \\"%(model)s\\" exceeds the limit of \\"%(digits)i\\"."]]	ir.message	ir	f	[["text","The number of digits in the value \\"%(value)r\\" for field \\"%(field)s\\" in \\"%(record)s\\" of \\"%(model)s\\" exceeds the limit of \\"%(digits)i\\"."]]	\N	\N
389	2023-01-18 22:26:47.309666	0	49	msg_forbidden_char_validation_record	[["text","The value \\"%(value)s\\" for field \\"%(field)s\\" in \\"%(record)s\\" of \\"%(model)s\\" contains some invalid chars \\"%(chars)s\\"."]]	ir.message	ir	f	[["text","The value \\"%(value)s\\" for field \\"%(field)s\\" in \\"%(record)s\\" of \\"%(model)s\\" contains some invalid chars \\"%(chars)s\\"."]]	\N	\N
390	2023-01-18 22:26:47.309666	0	50	msg_selection_validation_record	[["text","The value \\"%(value)s\\" for field \\"%(field)s\\" in \\"%(record)s\\" of \\"%(model)s\\" is not one of the allowed options."]]	ir.message	ir	f	[["text","The value \\"%(value)s\\" for field \\"%(field)s\\" in \\"%(record)s\\" of \\"%(model)s\\" is not one of the allowed options."]]	\N	\N
391	2023-01-18 22:26:47.309666	0	51	msg_time_format_validation_record	[["text","The time value \\"%(value)s\\" for field \\"%(field)s\\" in \\"%(record)s\\" of \\"%(model)s\\" is not valid."]]	ir.message	ir	f	[["text","The time value \\"%(value)s\\" for field \\"%(field)s\\" in \\"%(record)s\\" of \\"%(model)s\\" is not valid."]]	\N	\N
392	2023-01-18 22:26:47.309666	0	52	msg_foreign_model_missing	[["text","The value \\"%(value)s\\" for field \\"%(field)s\\" in \\"%(model)s\\" does not exist."]]	ir.message	ir	f	[["text","The value \\"%(value)s\\" for field \\"%(field)s\\" in \\"%(model)s\\" does not exist."]]	\N	\N
393	2023-01-18 22:26:47.309666	0	53	msg_foreign_model_exist	[["text","The records could not be deleted because they are used by field \\"%(field)s\\" of \\"%(model)s\\"."]]	ir.message	ir	f	[["text","The records could not be deleted because they are used by field \\"%(field)s\\" of \\"%(model)s\\"."]]	\N	\N
394	2023-01-18 22:26:47.309666	0	54	msg_access_rule_error	[["text","You are not allowed to access \\"%(model)s\\"."]]	ir.message	ir	f	[["text","You are not allowed to access \\"%(model)s\\"."]]	\N	\N
395	2023-01-18 22:26:47.309666	0	55	msg_access_rule_field_error	[["text","You are not allowed to access \\"%(model)s.%(field)s\\"."]]	ir.message	ir	f	[["text","You are not allowed to access \\"%(model)s.%(field)s\\"."]]	\N	\N
396	2023-01-18 22:26:47.309666	0	56	msg_create_rule_error	[["text","You are not allowed to create records of \\"%(model)s\\" because they fail on at least one of these rules:\\n%(rules)s"]]	ir.message	ir	f	[["text","You are not allowed to create records of \\"%(model)s\\" because they fail on at least one of these rules:\\n%(rules)s"]]	\N	\N
397	2023-01-18 22:26:47.309666	0	57	msg_read_rule_error	[["text","You are not allowed to read records \\"%(ids)s\\" of \\"%(model)s\\" because of at least one of these rules:\\n%(rules)s"]]	ir.message	ir	f	[["text","You are not allowed to read records \\"%(ids)s\\" of \\"%(model)s\\" because of at least one of these rules:\\n%(rules)s"]]	\N	\N
398	2023-01-18 22:26:47.309666	0	58	msg_read_error	[["text","You are trying to read records \\"%(ids)s\\" of \\"%(model)s\\" that don't exist anymore."]]	ir.message	ir	f	[["text","You are trying to read records \\"%(ids)s\\" of \\"%(model)s\\" that don't exist anymore."]]	\N	\N
399	2023-01-18 22:26:47.309666	0	59	msg_write_rule_error	[["text","You are not allowed to write to records \\"%(ids)s\\" of \\"%(model)s\\" because of at least one of these rules:\\n%(rules)s"]]	ir.message	ir	f	[["text","You are not allowed to write to records \\"%(ids)s\\" of \\"%(model)s\\" because of at least one of these rules:\\n%(rules)s"]]	\N	\N
400	2023-01-18 22:26:47.309666	0	60	msg_write_error	[["text","You are trying to write to records \\"%(ids)s\\" of \\"%(model)s\\" that don't exist anymore."]]	ir.message	ir	f	[["text","You are trying to write to records \\"%(ids)s\\" of \\"%(model)s\\" that don't exist anymore."]]	\N	\N
401	2023-01-18 22:26:47.309666	0	61	msg_delete_rule_error	[["text","You are not allowed to delete records \\"%(ids)s\\" of \\"%(model)s\\" because of at lease one of those rules:\\n%(rules)s"]]	ir.message	ir	f	[["text","You are not allowed to delete records \\"%(ids)s\\" of \\"%(model)s\\" because of at lease one of those rules:\\n%(rules)s"]]	\N	\N
402	2023-01-18 22:26:47.309666	0	62	msg_dict_schema_invalid_domain	[["text","Invalid domain in schema \\"%(schema)s\\"."]]	ir.message	ir	f	[["text","Invalid domain in schema \\"%(schema)s\\"."]]	\N	\N
403	2023-01-18 22:26:47.309666	0	63	msg_dict_schema_invalid_selection	[["text","Invalid selection in schema \\"%(schema)s\\"."]]	ir.message	ir	f	[["text","Invalid selection in schema \\"%(schema)s\\"."]]	\N	\N
404	2023-01-18 22:26:47.309666	0	64	msg_dict_schema_invalid_help_selection	[["text","Invalid help selection in schema \\"%(schema)s\\"."]]	ir.message	ir	f	[["text","Invalid help selection in schema \\"%(schema)s\\"."]]	\N	\N
405	2023-01-18 22:26:47.309666	0	65	msg_recursion_error	[["text","Recursion error: Record \\"%(rec_name)s\\" with parent \\"%(parent_rec_name)s\\" was configured as ancestor of itself."]]	ir.message	ir	f	[["text","Recursion error: Record \\"%(rec_name)s\\" with parent \\"%(parent_rec_name)s\\" was configured as ancestor of itself."]]	\N	\N
406	2023-01-18 22:26:47.309666	0	66	msg_search_function_missing	[["text","Missing search function for field \\"%(field)s\\" in \\"%(model)s\\"."]]	ir.message	ir	f	[["text","Missing search function for field \\"%(field)s\\" in \\"%(model)s\\"."]]	\N	\N
407	2023-01-18 22:26:47.309666	0	67	msg_setter_function_missing	[["text","Missing setter function for field \\"%(field)s\\" in \\"%(model)s\\"."]]	ir.message	ir	f	[["text","Missing setter function for field \\"%(field)s\\" in \\"%(model)s\\"."]]	\N	\N
408	2023-01-18 22:26:47.309666	0	68	msg_access_button_error	[["text","Calling button \\"%(button)s on \\"%(model)s\\" is not allowed."]]	ir.message	ir	f	[["text","Calling button \\"%(button)s on \\"%(model)s\\" is not allowed."]]	\N	\N
409	2023-01-18 22:26:47.309666	0	69	msg_view_invalid_xml	[["text","Invalid XML for view \\"%(name)s\\"."]]	ir.message	ir	f	[["text","Invalid XML for view \\"%(name)s\\"."]]	\N	\N
410	2023-01-18 22:26:47.309666	0	70	msg_action_wrong_wizard_model	[["text","Wrong wizard model in keyword action \\"%(name)s\\"."]]	ir.message	ir	f	[["text","Wrong wizard model in keyword action \\"%(name)s\\"."]]	\N	\N
412	2023-01-18 22:26:47.309666	0	72	msg_report_invalid_record_name	[["text","Invalid record name definition for report \\"%(report)s\\" with exception \\"%(exception)s\\"."]]	ir.message	ir	f	[["text","Invalid record name definition for report \\"%(report)s\\" with exception \\"%(exception)s\\"."]]	\N	\N
413	2023-01-18 22:26:47.309666	0	73	msg_action_invalid_views	[["text","Invalid view \\"%(view)s\\" for action \\"%(action)s\\"."]]	ir.message	ir	f	[["text","Invalid view \\"%(view)s\\" for action \\"%(action)s\\"."]]	\N	\N
414	2023-01-18 22:26:47.309666	0	74	msg_action_invalid_domain	[["text","Invalid domain or search criteria \\"%(domain)s\\" for action \\"%(action)s\\"."]]	ir.message	ir	f	[["text","Invalid domain or search criteria \\"%(domain)s\\" for action \\"%(action)s\\"."]]	\N	\N
415	2023-01-18 22:26:47.309666	0	75	msg_action_invalid_context	[["text","Invalid context \\"%(context)s\\" for action \\"%(action)s\\"."]]	ir.message	ir	f	[["text","Invalid context \\"%(context)s\\" for action \\"%(action)s\\"."]]	\N	\N
416	2023-01-18 22:26:47.309666	0	76	msg_model_invalid_condition	[["text","The condition \\"%(condition)s\\" is not a valid PYSON expression for button rule \\"%(rule)s\\"."]]	ir.message	ir	f	[["text","The condition \\"%(condition)s\\" is not a valid PYSON expression for button rule \\"%(rule)s\\"."]]	\N	\N
417	2023-01-18 22:26:47.309666	0	77	msg_sequence_missing	[["text","Missing sequence."]]	ir.message	ir	f	[["text","Missing sequence."]]	\N	\N
418	2023-01-18 22:26:47.309666	0	78	msg_sequence_invalid_prefix	[["text","Invalid prefix \\"%(affix)s\\" for sequence \\"%(sequence)s\\"."]]	ir.message	ir	f	[["text","Invalid prefix \\"%(affix)s\\" for sequence \\"%(sequence)s\\"."]]	\N	\N
419	2023-01-18 22:26:47.309666	0	79	msg_sequence_invalid_suffix	[["text","Invalid suffix \\"%(affix)s\\" for sequence \\"%(sequence)s\\"."]]	ir.message	ir	f	[["text","Invalid suffix \\"%(affix)s\\" for sequence \\"%(sequence)s\\"."]]	\N	\N
420	2023-01-18 22:26:47.309666	0	80	msg_sequence_last_timestamp_future	[["text","The \\"Last Timestamp\\" cannot be in the future for sequence \\"%s\\"."]]	ir.message	ir	f	[["text","The \\"Last Timestamp\\" cannot be in the future for sequence \\"%s\\"."]]	\N	\N
421	2023-01-18 22:26:47.309666	0	81	msg_sequence_change_sequence_type	[["text","You cannot change the sequence type of a sequence instead create a new sequence."]]	ir.message	ir	f	[["text","You cannot change the sequence type of a sequence instead create a new sequence."]]	\N	\N
422	2023-01-18 22:26:47.309666	0	82	msg_sequence_invalid_number_increment_next	[["text","Invalid \\"Increment Number\\" (%(number_increment)s) or \\"Next Number\\" (%(number_next)s) with exception \\"%(exception)s\\"."]]	ir.message	ir	f	[["text","Invalid \\"Increment Number\\" (%(number_increment)s) or \\"Next Number\\" (%(number_next)s) with exception \\"%(exception)s\\"."]]	\N	\N
423	2023-01-18 22:26:47.309666	0	83	msg_language_invalid_grouping	[["text","Invalid grouping \\"%(grouping)s\\" for language \\"%(language)s\\"."]]	ir.message	ir	f	[["text","Invalid grouping \\"%(grouping)s\\" for language \\"%(language)s\\"."]]	\N	\N
424	2023-01-18 22:26:47.309666	0	84	msg_language_invalid_date	[["text","Invalid date format \\"%(format)s\\" for language \\"%(language)s\\"."]]	ir.message	ir	f	[["text","Invalid date format \\"%(format)s\\" for language \\"%(language)s\\"."]]	\N	\N
425	2023-01-18 22:26:47.309666	0	85	msg_language_default_translatable	[["text","The default language \\"%(language)s\\" must be translatable."]]	ir.message	ir	f	[["text","The default language \\"%(language)s\\" must be translatable."]]	\N	\N
426	2023-01-18 22:26:47.309666	0	86	msg_language_delete_default	[["text","The default language \\"%(language)s\\" can not be deleted."]]	ir.message	ir	f	[["text","The default language \\"%(language)s\\" can not be deleted."]]	\N	\N
427	2023-01-18 22:26:47.309666	0	87	msg_rule_invalid_domain	[["text","Invalid domain in rule \\"%(name)s\\"."]]	ir.message	ir	f	[["text","Invalid domain in rule \\"%(name)s\\"."]]	\N	\N
428	2023-01-18 22:26:47.309666	0	88	msg_translation_overridden	[["text","You can not export translation \\"%(name)s\\" because it has been overridden by module \\"%(overriding_module)s\\"."]]	ir.message	ir	f	[["text","You can not export translation \\"%(name)s\\" because it has been overridden by module \\"%(overriding_module)s\\"."]]	\N	\N
429	2023-01-18 22:26:47.309666	0	89	msg_module_delete_state	[["text","You can not remove a module that is activated or that is about to be activated."]]	ir.message	ir	f	[["text","You can not remove a module that is activated or that is about to be activated."]]	\N	\N
430	2023-01-18 22:26:47.309666	0	90	msg_module_deactivate_dependency	[["text","Some activated modules depend on the ones you are trying to deactivate:"]]	ir.message	ir	f	[["text","Some activated modules depend on the ones you are trying to deactivate:"]]	\N	\N
431	2023-01-18 22:26:47.309666	0	91	msg_trigger_invalid_condition	[["text","Condition \\"%(condition)s\\" is not a valid PYSON expression for trigger \\"%(trigger)s\\"."]]	ir.message	ir	f	[["text","Condition \\"%(condition)s\\" is not a valid PYSON expression for trigger \\"%(trigger)s\\"."]]	\N	\N
432	2023-01-18 22:26:47.309666	0	92	msg_html_editor_save_fail	[["text","Failed to save, please retry."]]	ir.message	ir	f	[["text","Failed to save, please retry."]]	\N	\N
433	2023-01-18 22:26:47.309666	0	93	msg_timedelta_Y	[["text","Y"]]	ir.message	ir	f	[["text","Y"]]	\N	\N
434	2023-01-18 22:26:47.309666	0	94	msg_timedelta_M	[["text","M"]]	ir.message	ir	f	[["text","M"]]	\N	\N
435	2023-01-18 22:26:47.309666	0	95	msg_timedelta_w	[["text","w"]]	ir.message	ir	f	[["text","w"]]	\N	\N
436	2023-01-18 22:26:47.309666	0	96	msg_timedelta_d	[["text","d"]]	ir.message	ir	f	[["text","d"]]	\N	\N
437	2023-01-18 22:26:47.309666	0	97	msg_timedelta_h	[["text","h"]]	ir.message	ir	f	[["text","h"]]	\N	\N
438	2023-01-18 22:26:47.309666	0	98	msg_timedelta_m	[["text","m"]]	ir.message	ir	f	[["text","m"]]	\N	\N
439	2023-01-18 22:26:47.309666	0	99	msg_timedelta_s	[["text","s"]]	ir.message	ir	f	[["text","s"]]	\N	\N
440	2023-01-18 22:26:47.309666	0	100	msg_resource_copy_help	[["text","The resources to which this record must be copied."]]	ir.message	ir	f	[["text","The resources to which this record must be copied."]]	\N	\N
441	2023-01-18 22:26:47.309666	0	101	msg_attachments	[["text","Attachments"]]	ir.message	ir	f	[["text","Attachments"]]	\N	\N
442	2023-01-18 22:26:47.309666	0	102	msg_notes	[["text","Notes"]]	ir.message	ir	f	[["text","Notes"]]	\N	\N
443	2023-01-18 22:26:47.309666	0	103	msg_access_wizard_error	[["text","You are not allowed to execute wizard \\"%(wizard)s\\"."]]	ir.message	ir	f	[["text","You are not allowed to execute wizard \\"%(wizard)s\\"."]]	\N	\N
444	2023-01-18 22:26:47.309666	0	104	msg_access_wizard_model_error	[["text","You are not allowed to execute wizard \\"%(wizard)s\\" on \\"%(model)s\\"."]]	ir.message	ir	f	[["text","You are not allowed to execute wizard \\"%(wizard)s\\" on \\"%(model)s\\"."]]	\N	\N
445	2023-01-18 22:26:47.309666	0	105	msg_email_template_invalid_subject	[["text","Invalid subject in e-mail template \\"%(template)s\\" with exception \\"%(exception)s\\"."]]	ir.message	ir	f	[["text","Invalid subject in e-mail template \\"%(template)s\\" with exception \\"%(exception)s\\"."]]	\N	\N
625	2023-01-18 22:27:08.693829	0	15	menu_action_url_group_admin	[["group",1],["menu",15]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",15]]	\N	\N
446	2023-01-18 22:26:47.309666	0	106	msg_email_template_invalid_body	[["text","Invalid body in e-mail template \\"%(template)s\\" with exception \\"%(exception)s\\"."]]	ir.message	ir	f	[["text","Invalid body in e-mail template \\"%(template)s\\" with exception \\"%(exception)s\\"."]]	\N	\N
447	2023-01-18 22:26:47.309666	0	107	msg_email_template_invalid_field_pyson	[["text","Invalid PYSON %(field)s in e-mail template \\"%(template)s\\" with exception \\"%(exception)s\\"."]]	ir.message	ir	f	[["text","Invalid PYSON %(field)s in e-mail template \\"%(template)s\\" with exception \\"%(exception)s\\"."]]	\N	\N
448	2023-01-18 22:26:47.309666	0	108	msg_email_template_invalid_field_pyson_type	[["text","The PYSON %(field)s in e-mail template \\"%(template)s\\" must generate a list."]]	ir.message	ir	f	[["text","The PYSON %(field)s in e-mail template \\"%(template)s\\" must generate a list."]]	\N	\N
449	2023-01-18 22:26:47.309666	0	109	msg_avatar_resource_unique	[["text","Only one avatar is allowed per resource."]]	ir.message	ir	f	[["text","Only one avatar is allowed per resource."]]	\N	\N
450	2023-01-18 22:26:47.309666	0	110	msg_avatar_size_unique	[["text","The size of an avatar must be unique."]]	ir.message	ir	f	[["text","The size of an avatar must be unique."]]	\N	\N
451	2023-01-18 22:26:47.309666	0	111	msg_avatar	[["text","Avatar"]]	ir.message	ir	f	[["text","Avatar"]]	\N	\N
452	2023-01-18 22:26:47.309666	0	112	msg_avatars	[["text","Avatars"]]	ir.message	ir	f	[["text","Avatars"]]	\N	\N
453	2023-01-18 22:26:47.309666	0	113	msg_avatar_url	[["text","Avatar URL"]]	ir.message	ir	f	[["text","Avatar URL"]]	\N	\N
454	2023-01-18 22:26:47.309666	0	114	msg_language_code_unique	[["text","The code on language must be unique."]]	ir.message	ir	f	[["text","The code on language must be unique."]]	\N	\N
455	2023-01-18 22:26:47.309666	0	115	msg_button_name_unique	[["text","The name of the button must be unique per model."]]	ir.message	ir	f	[["text","The name of the button must be unique per model."]]	\N	\N
456	2023-01-18 22:26:47.309666	0	116	msg_view_search_invalid_domain	[["text","Invalid domain or search criteria \\"%(domain)s\\" for search \\"%(search)s\\"."]]	ir.message	ir	f	[["text","Invalid domain or search criteria \\"%(domain)s\\" for search \\"%(search)s\\"."]]	\N	\N
457	2023-01-18 22:26:47.309666	0	117	msg_field_string	[["text","%(field)s (string)"]]	ir.message	ir	f	[["text","%(field)s (string)"]]	\N	\N
458	2023-01-18 22:26:47.309666	0	118	msg_field_model_name	[["text","%(field)s (model name)"]]	ir.message	ir	f	[["text","%(field)s (model name)"]]	\N	\N
459	2023-01-18 22:26:47.309666	0	1	cron_queue_clean	[["interval_number",1],["interval_type","days"],["method","ir.queue|clean"]]	ir.cron	ir	t	[["interval_number",1],["interval_type","days"],["method","ir.queue|clean"]]	\N	\N
460	2023-01-18 22:26:47.309666	0	101	email_view_form	[["model","ir.email"],["name","email_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.email"],["name","email_form"],["type","form"]]	\N	\N
461	2023-01-18 22:26:47.309666	0	102	email_view_list	[["model","ir.email"],["name","email_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.email"],["name","email_list"],["type","tree"]]	\N	\N
462	2023-01-18 22:26:47.309666	0	51	act_email_form	[["name","E-mails"],["res_model","ir.email"]]	ir.action.act_window	ir	f	[["name","E-mails"],["res_model","ir.email"]]	\N	\N
463	2023-01-18 22:26:47.309666	0	65	act_email_form_view1	[["act_window",51],["sequence",10],["view",102]]	ir.action.act_window.view	ir	f	[["act_window",51],["sequence",10],["view",102]]	\N	\N
464	2023-01-18 22:26:47.309666	0	66	act_email_form_view2	[["act_window",51],["sequence",20],["view",101]]	ir.action.act_window.view	ir	f	[["act_window",51],["sequence",20],["view",101]]	\N	\N
465	2023-01-18 22:26:47.309666	0	46	menu_email_form	[["action","ir.action.act_window,51"],["icon","tryton-list"],["name","E-mails"],["parent",16],["sequence",50]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,51"],["icon","tryton-list"],["name","E-mails"],["parent",16],["sequence",50]]	\N	\N
466	2023-01-18 22:26:47.309666	0	1	access_email	[["model",71],["perm_create",true],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	ir	f	[["model",71],["perm_create",true],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
467	2023-01-18 22:26:47.309666	0	52	act_email_form_relate	[["domain","[{\\"__class__\\": \\"If\\", \\"c\\": {\\"__class__\\": \\"Equal\\", \\"s1\\": {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"active_ids\\"}, \\"s2\\": [{\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_id\\"}]}, \\"e\\": [\\"resource.id\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_ids\\"}, {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_model\\"}], \\"t\\": [\\"resource\\", \\"=\\", [{\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_model\\"}, {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_id\\"}]]}]"],["name","E-mail Archives"],["res_model","ir.email"]]	ir.action.act_window	ir	f	[["domain","[{\\"__class__\\": \\"If\\", \\"c\\": {\\"__class__\\": \\"Equal\\", \\"s1\\": {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"active_ids\\"}, \\"s2\\": [{\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_id\\"}]}, \\"e\\": [\\"resource.id\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_ids\\"}, {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_model\\"}], \\"t\\": [\\"resource\\", \\"=\\", [{\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_model\\"}, {\\"__class__\\": \\"Eval\\", \\"d\\": \\"\\", \\"v\\": \\"active_id\\"}]]}]"],["name","E-mail Archives"],["res_model","ir.email"]]	\N	\N
468	2023-01-18 22:26:47.309666	0	67	act_email_form_relate_view1	[["act_window",52],["sequence",10],["view",102]]	ir.action.act_window.view	ir	f	[["act_window",52],["sequence",10],["view",102]]	\N	\N
469	2023-01-18 22:26:47.309666	0	68	act_email_form_relate_view2	[["act_window",52],["sequence",20],["view",101]]	ir.action.act_window.view	ir	f	[["act_window",52],["sequence",20],["view",101]]	\N	\N
470	2023-01-18 22:26:47.309666	0	51	act_email_form_relate_keyword1	[["action",52],["keyword","form_relate"]]	ir.action.keyword	ir	f	[["action",52],["keyword","form_relate"]]	\N	\N
471	2023-01-18 22:26:47.309666	0	103	email_template_view_form	[["model","ir.email.template"],["name","email_template_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.email.template"],["name","email_template_form"],["type","form"]]	\N	\N
472	2023-01-18 22:26:47.309666	0	104	email_template_view_list	[["model","ir.email.template"],["name","email_template_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.email.template"],["name","email_template_list"],["type","tree"]]	\N	\N
473	2023-01-18 22:26:47.309666	0	53	act_email_template_form	[["name","E-mail Templates"],["res_model","ir.email.template"]]	ir.action.act_window	ir	f	[["name","E-mail Templates"],["res_model","ir.email.template"]]	\N	\N
474	2023-01-18 22:26:47.309666	0	69	act_email_template_form_view1	[["act_window",53],["sequence",10],["view",104]]	ir.action.act_window.view	ir	f	[["act_window",53],["sequence",10],["view",104]]	\N	\N
475	2023-01-18 22:26:47.309666	0	70	act_email_template_form_view2	[["act_window",53],["sequence",20],["view",103]]	ir.action.act_window.view	ir	f	[["act_window",53],["sequence",20],["view",103]]	\N	\N
626	2023-01-18 22:27:08.693829	0	16	menu_models_group_admin	[["group",1],["menu",16]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",16]]	\N	\N
476	2023-01-18 22:26:47.309666	0	47	menu_email_template_form	[["action","ir.action.act_window,53"],["icon","tryton-list"],["name","E-mail Templates"],["parent",10],["sequence",50]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,53"],["icon","tryton-list"],["name","E-mail Templates"],["parent",10],["sequence",50]]	\N	\N
477	2023-01-18 22:26:47.309666	0	105	error_view_list	[["model","ir.error"],["name","error_list"],["type","tree"]]	ir.ui.view	ir	f	[["model","ir.error"],["name","error_list"],["type","tree"]]	\N	\N
478	2023-01-18 22:26:47.309666	0	106	error_view_form	[["model","ir.error"],["name","error_form"],["type","form"]]	ir.ui.view	ir	f	[["model","ir.error"],["name","error_form"],["type","form"]]	\N	\N
479	2023-01-18 22:26:47.309666	0	54	act_error_form	[["name","Errors"],["res_model","ir.error"]]	ir.action.act_window	ir	f	[["name","Errors"],["res_model","ir.error"]]	\N	\N
480	2023-01-18 22:26:47.309666	0	71	act_error_form_view1	[["act_window",54],["sequence",10],["view",105]]	ir.action.act_window.view	ir	f	[["act_window",54],["sequence",10],["view",105]]	\N	\N
481	2023-01-18 22:26:47.309666	0	72	act_error_form_view2	[["act_window",54],["sequence",20],["view",106]]	ir.action.act_window.view	ir	f	[["act_window",54],["sequence",20],["view",106]]	\N	\N
482	2023-01-18 22:26:47.309666	0	5	act_error_form_domain_open	[["act_window",54],["count",true],["domain","[[\\"state\\", \\"=\\", \\"open\\"]]"],["name","Open"],["sequence",10]]	ir.action.act_window.domain	ir	f	[["act_window",54],["count",true],["domain","[[\\"state\\", \\"=\\", \\"open\\"]]"],["name","Open"],["sequence",10]]	\N	\N
483	2023-01-18 22:26:47.309666	0	6	act_error_form_domain_processing	[["act_window",54],["count",true],["domain","[[\\"state\\", \\"=\\", \\"processing\\"]]"],["name","Processing"],["sequence",20]]	ir.action.act_window.domain	ir	f	[["act_window",54],["count",true],["domain","[[\\"state\\", \\"=\\", \\"processing\\"]]"],["name","Processing"],["sequence",20]]	\N	\N
484	2023-01-18 22:26:47.309666	0	7	act_error_form_domain_all	[["act_window",54],["domain",""],["name","All"],["sequence",9999]]	ir.action.act_window.domain	ir	f	[["act_window",54],["domain",""],["name","All"],["sequence",9999]]	\N	\N
485	2023-01-18 22:26:47.309666	0	48	menu_error_form	[["action","ir.action.act_window,54"],["icon","tryton-list"],["name","Errors"],["parent",29],["sequence",50]]	ir.ui.menu	ir	f	[["action","ir.action.act_window,54"],["icon","tryton-list"],["name","Errors"],["parent",29],["sequence",50]]	\N	\N
486	2023-01-18 22:26:47.309666	0	12	error_open_button	[["model",75],["name","open"],["string","Open"]]	ir.model.button	ir	f	[["model",75],["name","open"],["string","Open"]]	\N	\N
487	2023-01-18 22:26:47.309666	0	13	error_process_button	[["model",75],["name","process"],["string","Process"]]	ir.model.button	ir	f	[["model",75],["name","process"],["string","Process"]]	\N	\N
488	2023-01-18 22:26:47.309666	0	14	error_solve_button	[["model",75],["name","solve"],["string","Solve"]]	ir.model.button	ir	f	[["model",75],["name","solve"],["string","Solve"]]	\N	\N
489	2023-01-18 22:26:47.309666	0	2	cron_error_clean	[["interval_number",1],["interval_type","months"],["method","ir.error|clean"]]	ir.cron	ir	t	[["interval_number",1],["interval_type","months"],["method","ir.error|clean"]]	\N	\N
490	2023-01-18 22:27:08.693829	0	49	menu_res	[["icon","tryton-folder"],["name","Users"],["parent",1],["sequence",10]]	ir.ui.menu	res	f	[["icon","tryton-folder"],["name","Users"],["parent",1],["sequence",10]]	\N	\N
491	2023-01-18 22:27:08.693829	0	1	group_admin	[["name","Administration"]]	res.group	res	f	[["name","Administration"]]	\N	\N
492	2023-01-18 22:27:08.693829	0	107	group_view_form	[["model","res.group"],["name","group_form"],["type","form"]]	ir.ui.view	res	f	[["model","res.group"],["name","group_form"],["type","form"]]	\N	\N
493	2023-01-18 22:27:08.693829	0	108	group_view_tree	[["model","res.group"],["name","group_list"],["type","tree"]]	ir.ui.view	res	f	[["model","res.group"],["name","group_list"],["type","tree"]]	\N	\N
494	2023-01-18 22:27:08.693829	0	55	act_group_form	[["name","Groups"],["res_model","res.group"],["type","ir.action.act_window"]]	ir.action.act_window	res	f	[["name","Groups"],["res_model","res.group"],["type","ir.action.act_window"]]	\N	\N
495	2023-01-18 22:27:08.693829	0	73	act_group_form_view1	[["act_window",55],["sequence",1],["view",108]]	ir.action.act_window.view	res	f	[["act_window",55],["sequence",1],["view",108]]	\N	\N
496	2023-01-18 22:27:08.693829	0	74	act_group_form_view2	[["act_window",55],["sequence",2],["view",107]]	ir.action.act_window.view	res	f	[["act_window",55],["sequence",2],["view",107]]	\N	\N
497	2023-01-18 22:27:08.693829	0	50	menu_group_form	[["action","ir.action.act_window,55"],["icon","tryton-list"],["name","Groups"],["parent",49],["sequence",20]]	ir.ui.menu	res	f	[["action","ir.action.act_window,55"],["icon","tryton-list"],["name","Groups"],["parent",49],["sequence",20]]	\N	\N
498	2023-01-18 22:27:08.693829	0	1	menu_group_form_admin	[["group",1],["menu",50]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",50]]	\N	\N
499	2023-01-18 22:27:08.693829	0	2	access_group	[["model",76],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",76],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
500	2023-01-18 22:27:08.693829	0	3	access_group_admin	[["group",1],["model",76],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",76],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
501	2023-01-18 22:27:08.693829	0	1	user_admin	[["login","admin"],["menu",2],["name","Administrator"]]	res.user	res	t	[["login","admin"],["menu",2],["name","Administrator"]]	\N	\N
502	2023-01-18 22:27:08.693829	0	1	user_admin_group_admin	[["group",1],["user",1]]	res.user-res.group	res	f	[["group",1],["user",1]]	\N	\N
503	2023-01-18 22:27:08.693829	0	109	user_view_form	[["model","res.user"],["name","user_form"],["type","form"]]	ir.ui.view	res	f	[["model","res.user"],["name","user_form"],["type","form"]]	\N	\N
504	2023-01-18 22:27:08.693829	0	110	user_view_form_preferences	[["model","res.user"],["name","user_form_preferences"],["priority",20],["type","form"]]	ir.ui.view	res	f	[["model","res.user"],["name","user_form_preferences"],["priority",20],["type","form"]]	\N	\N
505	2023-01-18 22:27:08.693829	0	111	user_view_tree	[["model","res.user"],["name","user_list"],["type","tree"]]	ir.ui.view	res	f	[["model","res.user"],["name","user_list"],["type","tree"]]	\N	\N
506	2023-01-18 22:27:08.693829	0	56	act_user_form	[["name","Users"],["res_model","res.user"],["type","ir.action.act_window"]]	ir.action.act_window	res	f	[["name","Users"],["res_model","res.user"],["type","ir.action.act_window"]]	\N	\N
507	2023-01-18 22:27:08.693829	0	75	act_user_form_view1	[["act_window",56],["sequence",1],["view",111]]	ir.action.act_window.view	res	f	[["act_window",56],["sequence",1],["view",111]]	\N	\N
508	2023-01-18 22:27:08.693829	0	76	act_user_form_view2	[["act_window",56],["sequence",2],["view",109]]	ir.action.act_window.view	res	f	[["act_window",56],["sequence",2],["view",109]]	\N	\N
627	2023-01-18 22:27:08.693829	0	17	menu_model_form_group_admin	[["group",1],["menu",17]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",17]]	\N	\N
509	2023-01-18 22:27:08.693829	0	51	menu_user_form	[["action","ir.action.act_window,56"],["icon","tryton-list"],["name","Users"],["parent",49],["sequence",10]]	ir.ui.menu	res	f	[["action","ir.action.act_window,56"],["icon","tryton-list"],["name","Users"],["parent",49],["sequence",10]]	\N	\N
510	2023-01-18 22:27:08.693829	0	2	menu_user_form_group_admin	[["group",1],["menu",51]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",51]]	\N	\N
511	2023-01-18 22:27:08.693829	0	4	access_user	[["model",77],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",77],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
512	2023-01-18 22:27:08.693829	0	5	access_user_admin	[["group",1],["model",77],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",77],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
513	2023-01-18 22:27:08.693829	0	15	user_reset_password_button	[["help","Send by email a new temporary password to the user"],["model",77],["name","reset_password"],["string","Reset Password"]]	ir.model.button	res	f	[["help","Send by email a new temporary password to the user"],["model",77],["name","reset_password"],["string","Reset Password"]]	\N	\N
514	2023-01-18 22:27:08.693829	0	112	user_config_start_view_form	[["model","res.user.config.start"],["name","user_config_start_form"],["type","form"]]	ir.ui.view	res	f	[["model","res.user.config.start"],["name","user_config_start_form"],["type","form"]]	\N	\N
515	2023-01-18 22:27:08.693829	0	57	act_user_config	[["name","Configure Users"],["window",true],["wiz_name","res.user.config"]]	ir.action.wizard	res	f	[["name","Configure Users"],["window",true],["wiz_name","res.user.config"]]	\N	\N
516	2023-01-18 22:27:08.693829	0	3	config_wizard_item_user	[["action",57]]	ir.module.config_wizard.item	res	f	[["action",57]]	\N	\N
517	2023-01-18 22:27:08.693829	0	113	user_warning_view_form	[["model","res.user.warning"],["name","user_warning_form"],["type","form"]]	ir.ui.view	res	f	[["model","res.user.warning"],["name","user_warning_form"],["type","form"]]	\N	\N
518	2023-01-18 22:27:08.693829	0	114	user_warning_view_tree	[["model","res.user.warning"],["name","user_warning_tree"],["type","tree"]]	ir.ui.view	res	f	[["model","res.user.warning"],["name","user_warning_tree"],["type","tree"]]	\N	\N
519	2023-01-18 22:27:08.693829	0	1	rule_group_user_warning	[["global_p",true],["model",82],["name","Own warning"]]	ir.rule.group	res	f	[["global_p",true],["model",82],["name","Own warning"]]	\N	\N
520	2023-01-18 22:27:08.693829	0	1	rule_user_warning1	[["domain","[[\\"user\\", \\"=\\", {\\"__class__\\": \\"Get\\", \\"d\\": -1, \\"k\\": \\"id\\", \\"v\\": {\\"__class__\\": \\"Eval\\", \\"d\\": {}, \\"v\\": \\"user\\"}}]]"],["rule_group",1]]	ir.rule	res	f	[["domain","[[\\"user\\", \\"=\\", {\\"__class__\\": \\"Get\\", \\"d\\": -1, \\"k\\": \\"id\\", \\"v\\": {\\"__class__\\": \\"Eval\\", \\"d\\": {}, \\"v\\": \\"user\\"}}]]"],["rule_group",1]]	\N	\N
521	2023-01-18 22:27:08.693829	0	115	user_application_view_form	[["model","res.user.application"],["name","user_application_form"],["type","form"]]	ir.ui.view	res	f	[["model","res.user.application"],["name","user_application_form"],["type","form"]]	\N	\N
522	2023-01-18 22:27:08.693829	0	116	user_application_view_list	[["model","res.user.application"],["name","user_application_list"],["type","tree"]]	ir.ui.view	res	f	[["model","res.user.application"],["name","user_application_list"],["type","tree"]]	\N	\N
523	2023-01-18 22:27:08.693829	0	2	rule_group_user_application	[["default_p",true],["global_p",false],["model",83],["name","Own user application"]]	ir.rule.group	res	f	[["default_p",true],["global_p",false],["model",83],["name","Own user application"]]	\N	\N
524	2023-01-18 22:27:08.693829	0	2	rule_user_application1	[["domain","[[\\"user\\", \\"=\\", {\\"__class__\\": \\"Get\\", \\"d\\": -1, \\"k\\": \\"id\\", \\"v\\": {\\"__class__\\": \\"Eval\\", \\"d\\": {}, \\"v\\": \\"user\\"}}]]"],["rule_group",2]]	ir.rule	res	f	[["domain","[[\\"user\\", \\"=\\", {\\"__class__\\": \\"Get\\", \\"d\\": -1, \\"k\\": \\"id\\", \\"v\\": {\\"__class__\\": \\"Eval\\", \\"d\\": {}, \\"v\\": \\"user\\"}}]]"],["rule_group",2]]	\N	\N
525	2023-01-18 22:27:08.693829	0	3	rule_group_user_application_admin	[["default_p",false],["global_p",false],["model",83],["name","Any user application"]]	ir.rule.group	res	f	[["default_p",false],["global_p",false],["model",83],["name","Any user application"]]	\N	\N
526	2023-01-18 22:27:08.693829	0	3	rule_user_application_admin1	[["domain","[]"],["rule_group",3]]	ir.rule	res	f	[["domain","[]"],["rule_group",3]]	\N	\N
527	2023-01-18 22:27:08.693829	0	1	rule_user_application_admin_admin	[["group",1],["rule_group",3]]	ir.rule.group-res.group	res	f	[["group",1],["rule_group",3]]	\N	\N
528	2023-01-18 22:27:08.693829	0	58	report_email_reset_password	[["model","res.user"],["name","Reset Password"],["report","res/email_reset_password.html"],["report_name","res.user.email_reset_password"],["template_extension","html"]]	ir.action.report	res	f	[["model","res.user"],["name","Reset Password"],["report","res/email_reset_password.html"],["report_name","res.user.email_reset_password"],["template_extension","html"]]	\N	\N
529	2023-01-18 22:27:08.693829	0	16	user_application_validate_button	[["model",83],["name","validate_"],["string","Validate"]]	ir.model.button	res	f	[["model",83],["name","validate_"],["string","Validate"]]	\N	\N
530	2023-01-18 22:27:08.693829	0	17	user_application_cancel_button	[["model",83],["name","cancel"],["string","Cancel"]]	ir.model.button	res	f	[["model",83],["name","cancel"],["string","Cancel"]]	\N	\N
531	2023-01-18 22:27:08.693829	0	6	access_ir_sequence_type	[["model",10],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",10],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
532	2023-01-18 22:27:08.693829	0	7	access_ir_sequence_type_admin	[["group",1],["model",10],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",10],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
533	2023-01-18 22:27:08.693829	0	8	access_ir_ui_icon	[["model",21],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",21],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
534	2023-01-18 22:27:08.693829	0	9	access_ir_ui_icon_admin	[["group",1],["model",21],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",21],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
535	2023-01-18 22:27:08.693829	0	10	access_ir_ui_menu	[["model",13],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",13],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
536	2023-01-18 22:27:08.693829	0	11	access_ir_ui_menu_admin	[["group",1],["model",13],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",13],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
537	2023-01-18 22:27:08.693829	0	12	access_ir_ui_view	[["model",15],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",15],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
538	2023-01-18 22:27:08.693829	0	13	access_ir_ui_view_admin	[["group",1],["model",15],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",15],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
539	2023-01-18 22:27:08.693829	0	14	access_ir_action	[["model",22],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",22],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
540	2023-01-18 22:27:08.693829	0	15	access_ir_action_admin	[["group",1],["model",22],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",22],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
541	2023-01-18 22:27:08.693829	0	16	access_ir_action_keyword	[["model",23],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",23],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
542	2023-01-18 22:27:08.693829	0	17	access_ir_action_keyword_admin	[["group",1],["model",23],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",23],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
543	2023-01-18 22:27:08.693829	0	18	access_ir_action_report	[["model",24],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",24],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
544	2023-01-18 22:27:08.693829	0	19	access_ir_action_report_admin	[["group",1],["model",24],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",24],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
545	2023-01-18 22:27:08.693829	0	20	access_ir_action_act_window	[["model",25],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",25],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
546	2023-01-18 22:27:08.693829	0	21	access_ir_action_act_window_admin	[["group",1],["model",25],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",25],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
547	2023-01-18 22:27:08.693829	0	22	access_ir_action_act_window_view	[["model",26],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",26],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
548	2023-01-18 22:27:08.693829	0	23	access_ir_action_act_window_view_admin	[["group",1],["model",26],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",26],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
549	2023-01-18 22:27:08.693829	0	24	access_ir_action_act_window_domain	[["model",27],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",27],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
550	2023-01-18 22:27:08.693829	0	25	access_ir_action_act_window_domain_admin	[["group",1],["model",27],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",27],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
551	2023-01-18 22:27:08.693829	0	26	access_ir_action_wizard	[["model",28],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",28],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
552	2023-01-18 22:27:08.693829	0	27	access_ir_action_wizard_admin	[["group",1],["model",28],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",28],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
553	2023-01-18 22:27:08.693829	0	28	access_ir_action_url	[["model",29],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",29],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
554	2023-01-18 22:27:08.693829	0	29	access_ir_action_url_admin	[["group",1],["model",29],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",29],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
555	2023-01-18 22:27:08.693829	0	30	access_ir_model	[["model",30],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",30],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
556	2023-01-18 22:27:08.693829	0	31	access_ir_model_admin	[["group",1],["model",30],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",30],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
557	2023-01-18 22:27:08.693829	0	32	access_ir_model_field	[["model",31],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",31],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
558	2023-01-18 22:27:08.693829	0	33	access_ir_model_field_admin	[["group",1],["model",31],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",31],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
559	2023-01-18 22:27:08.693829	0	34	access_ir_model_access	[["model",32],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",32],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
560	2023-01-18 22:27:08.693829	0	35	access_ir_model_access_ir_admin	[["group",1],["model",32],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",32],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
561	2023-01-18 22:27:08.693829	0	36	access_ir_model_button	[["model",34],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",34],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
628	2023-01-18 22:27:08.693829	0	18	model_model_fields_form_group_admin	[["group",1],["menu",18]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",18]]	\N	\N
562	2023-01-18 22:27:08.693829	0	37	access_ir_model_button_admin	[["group",1],["model",34],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",34],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
563	2023-01-18 22:27:08.693829	0	38	access_ir_model_button_rule	[["model",35],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",35],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
564	2023-01-18 22:27:08.693829	0	39	access_ir_model_button_rule_admin	[["group",1],["model",35],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",35],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
565	2023-01-18 22:27:08.693829	0	40	access_ir_model_button_click	[["model",36],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",36],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
566	2023-01-18 22:27:08.693829	0	41	access_ir_model_button_click_admin	[["group",1],["model",36],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",36],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
567	2023-01-18 22:27:08.693829	0	42	access_ir_model_data	[["model",38],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",38],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
568	2023-01-18 22:27:08.693829	0	43	access_ir_cron	[["model",45],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",45],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
569	2023-01-18 22:27:08.693829	0	44	access_ir_cron_admin	[["group",1],["model",45],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",45],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
570	2023-01-18 22:27:08.693829	0	45	access_ir_queue	[["model",67],["perm_create",false],["perm_delete",false],["perm_read",false],["perm_write",false]]	ir.model.access	res	f	[["model",67],["perm_create",false],["perm_delete",false],["perm_read",false],["perm_write",false]]	\N	\N
571	2023-01-18 22:27:08.693829	0	46	access_ir_queue_admin	[["group",1],["model",67],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["group",1],["model",67],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
572	2023-01-18 22:27:08.693829	0	47	access_ir_lang	[["model",46],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",46],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
573	2023-01-18 22:27:08.693829	0	48	access_ir_lang_admin	[["group",1],["model",46],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",46],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
574	2023-01-18 22:27:08.693829	0	49	access_ir_translation	[["model",2],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",2],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
575	2023-01-18 22:27:08.693829	0	50	access_ir_translation_admin	[["group",1],["model",2],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",2],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
576	2023-01-18 22:27:08.693829	0	51	access_ir_rule_group	[["model",50],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",50],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
577	2023-01-18 22:27:08.693829	0	52	access_ir_rule_group_admin	[["group",1],["model",50],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",50],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
578	2023-01-18 22:27:08.693829	0	53	access_ir_rule	[["model",51],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",51],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
579	2023-01-18 22:27:08.693829	0	54	access_ir_rule_admin	[["group",1],["model",51],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",51],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
580	2023-01-18 22:27:08.693829	0	55	access_ir_module	[["model",52],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",52],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
581	2023-01-18 22:27:08.693829	0	56	access_ir_module_admin	[["group",1],["model",52],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",52],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
582	2023-01-18 22:27:08.693829	0	57	access_ir_module_dependency	[["model",53],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",53],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
583	2023-01-18 22:27:08.693829	0	58	access_ir_module_dependency_admin	[["group",1],["model",53],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",53],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
584	2023-01-18 22:27:08.693829	0	59	access_ir_trigger	[["model",63],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",63],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
585	2023-01-18 22:27:08.693829	0	60	access_ir_trigger_admin	[["group",1],["model",63],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",63],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
586	2023-01-18 22:27:08.693829	0	61	access_ir_trigger_log	[["model",64],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",64],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
629	2023-01-18 22:27:08.693829	0	19	menu_model_access_form_group_admin	[["group",1],["menu",19]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",19]]	\N	\N
587	2023-01-18 22:27:08.693829	0	62	access_ir_trigger_log_admin	[["group",1],["model",64],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",64],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
588	2023-01-18 22:27:08.693829	0	4	rule_group_menu	[["global_p",true],["model",13],["name","User in groups"]]	ir.rule.group	res	f	[["global_p",true],["model",13],["name","User in groups"]]	\N	\N
589	2023-01-18 22:27:08.693829	0	4	rule_menu1	[["domain","[[\\"groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",4]]	ir.rule	res	f	[["domain","[[\\"groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",4]]	\N	\N
590	2023-01-18 22:27:08.693829	0	5	rule_menu2	[["domain","[[\\"groups\\", \\"=\\", null]]"],["rule_group",4]]	ir.rule	res	f	[["domain","[[\\"groups\\", \\"=\\", null]]"],["rule_group",4]]	\N	\N
591	2023-01-18 22:27:08.693829	0	5	rule_group_action	[["global_p",true],["model",22],["name","User in groups"]]	ir.rule.group	res	f	[["global_p",true],["model",22],["name","User in groups"]]	\N	\N
592	2023-01-18 22:27:08.693829	0	6	rule_action1	[["domain","[[\\"groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",5]]	ir.rule	res	f	[["domain","[[\\"groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",5]]	\N	\N
593	2023-01-18 22:27:08.693829	0	7	rule_action2	[["domain","[[\\"groups\\", \\"=\\", null]]"],["rule_group",5]]	ir.rule	res	f	[["domain","[[\\"groups\\", \\"=\\", null]]"],["rule_group",5]]	\N	\N
594	2023-01-18 22:27:08.693829	0	6	rule_group_action_keyword	[["global_p",true],["model",23],["name","User in groups"]]	ir.rule.group	res	f	[["global_p",true],["model",23],["name","User in groups"]]	\N	\N
595	2023-01-18 22:27:08.693829	0	8	rule_action_keyword1	[["domain","[[\\"groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",6]]	ir.rule	res	f	[["domain","[[\\"groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",6]]	\N	\N
596	2023-01-18 22:27:08.693829	0	9	rule_action_keyword2	[["domain","[[\\"groups\\", \\"=\\", null]]"],["rule_group",6]]	ir.rule	res	f	[["domain","[[\\"groups\\", \\"=\\", null]]"],["rule_group",6]]	\N	\N
597	2023-01-18 22:27:08.693829	0	7	rule_group_action_report	[["global_p",true],["model",24],["name","User in groups"]]	ir.rule.group	res	f	[["global_p",true],["model",24],["name","User in groups"]]	\N	\N
598	2023-01-18 22:27:08.693829	0	10	rule_action_report1	[["domain","[[\\"groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",7]]	ir.rule	res	f	[["domain","[[\\"groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",7]]	\N	\N
599	2023-01-18 22:27:08.693829	0	11	rule_action_report2	[["domain","[[\\"groups\\", \\"=\\", null]]"],["rule_group",7]]	ir.rule	res	f	[["domain","[[\\"groups\\", \\"=\\", null]]"],["rule_group",7]]	\N	\N
600	2023-01-18 22:27:08.693829	0	8	rule_group_action_act_window	[["global_p",true],["model",25],["name","User in groups"]]	ir.rule.group	res	f	[["global_p",true],["model",25],["name","User in groups"]]	\N	\N
601	2023-01-18 22:27:08.693829	0	12	rule_action_act_window1	[["domain","[[\\"groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",8]]	ir.rule	res	f	[["domain","[[\\"groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",8]]	\N	\N
602	2023-01-18 22:27:08.693829	0	13	rule_action_act_window2	[["domain","[[\\"groups\\", \\"=\\", null]]"],["rule_group",8]]	ir.rule	res	f	[["domain","[[\\"groups\\", \\"=\\", null]]"],["rule_group",8]]	\N	\N
603	2023-01-18 22:27:08.693829	0	9	rule_group_action_wizard	[["global_p",true],["model",28],["name","User in groups"]]	ir.rule.group	res	f	[["global_p",true],["model",28],["name","User in groups"]]	\N	\N
604	2023-01-18 22:27:08.693829	0	14	rule_action_wizard1	[["domain","[[\\"groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",9]]	ir.rule	res	f	[["domain","[[\\"groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",9]]	\N	\N
605	2023-01-18 22:27:08.693829	0	15	rule_action_wizard2	[["domain","[[\\"groups\\", \\"=\\", null]]"],["rule_group",9]]	ir.rule	res	f	[["domain","[[\\"groups\\", \\"=\\", null]]"],["rule_group",9]]	\N	\N
606	2023-01-18 22:27:08.693829	0	10	rule_group_action_url	[["global_p",true],["model",29],["name","User in groups"]]	ir.rule.group	res	f	[["global_p",true],["model",29],["name","User in groups"]]	\N	\N
607	2023-01-18 22:27:08.693829	0	16	rule_action_url1	[["domain","[[\\"groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",10]]	ir.rule	res	f	[["domain","[[\\"groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",10]]	\N	\N
608	2023-01-18 22:27:08.693829	0	17	rule_action_url2	[["domain","[[\\"groups\\", \\"=\\", null]]"],["rule_group",10]]	ir.rule	res	f	[["domain","[[\\"groups\\", \\"=\\", null]]"],["rule_group",10]]	\N	\N
609	2023-01-18 22:27:08.693829	0	1	act_module_activate_upgrade_group_admin	[["action",47],["group",1]]	ir.action-res.group	res	f	[["action",47],["group",1]]	\N	\N
610	2023-01-18 22:27:08.693829	0	2	act_translation_update_group_admin	[["action",40],["group",1]]	ir.action-res.group	res	f	[["action",40],["group",1]]	\N	\N
611	2023-01-18 22:27:08.693829	0	3	act_translation_export_group_admin	[["action",41],["group",1]]	ir.action-res.group	res	f	[["action",41],["group",1]]	\N	\N
612	2023-01-18 22:27:08.693829	0	4	act_lang_config	[["action",34],["group",1]]	ir.action-res.group	res	f	[["action",34],["group",1]]	\N	\N
613	2023-01-18 22:27:08.693829	0	3	menu_administration_group_admin	[["group",1],["menu",1]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",1]]	\N	\N
614	2023-01-18 22:27:08.693829	0	4	menu_ui_group_admin	[["group",1],["menu",2]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",2]]	\N	\N
615	2023-01-18 22:27:08.693829	0	5	menu_icon_form_group_admin	[["group",1],["menu",3]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",3]]	\N	\N
616	2023-01-18 22:27:08.693829	0	6	menu_menu_tree_group_admin	[["group",1],["menu",4]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",4]]	\N	\N
617	2023-01-18 22:27:08.693829	0	7	menu_view_group_admin	[["group",1],["menu",5]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",5]]	\N	\N
618	2023-01-18 22:27:08.693829	0	8	menu_view_tree_width_group_admin	[["group",1],["menu",6]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",6]]	\N	\N
619	2023-01-18 22:27:08.693829	0	9	menu_view_tree_optional_group_admin	[["group",1],["menu",7]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",7]]	\N	\N
620	2023-01-18 22:27:08.693829	0	10	menu_action_group_admin	[["group",1],["menu",10]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",10]]	\N	\N
621	2023-01-18 22:27:08.693829	0	11	menu_act_action_group_admin	[["group",1],["menu",11]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",11]]	\N	\N
622	2023-01-18 22:27:08.693829	0	12	menu_action_report_form_group_admin	[["group",1],["menu",12]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",12]]	\N	\N
630	2023-01-18 22:27:08.693829	0	20	menu_model_field_access_form_group_admin	[["group",1],["menu",20]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",20]]	\N	\N
631	2023-01-18 22:27:08.693829	0	21	menu_sequences_group_admin	[["group",1],["menu",23]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",23]]	\N	\N
632	2023-01-18 22:27:08.693829	0	22	menu_sequence_form_group_admin	[["group",1],["menu",24]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",24]]	\N	\N
633	2023-01-18 22:27:08.693829	0	23	menu_sequence_strict_form_group_admin	[["group",1],["menu",25]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",25]]	\N	\N
634	2023-01-18 22:27:08.693829	0	24	menu_ir_sequence_type_group_admin	[["group",1],["menu",26]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",26]]	\N	\N
635	2023-01-18 22:27:08.693829	0	25	menu_attachment_form_group_admin	[["group",1],["menu",27]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",27]]	\N	\N
636	2023-01-18 22:27:08.693829	0	26	menu_scheduler_group_admin	[["group",1],["menu",29]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",29]]	\N	\N
637	2023-01-18 22:27:08.693829	0	27	menu_cron_form_group_admin	[["group",1],["menu",30]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",30]]	\N	\N
638	2023-01-18 22:27:08.693829	0	28	menu_localization_group_admin	[["group",1],["menu",31]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",31]]	\N	\N
639	2023-01-18 22:27:08.693829	0	29	menu_lang_form_group_admin	[["group",1],["menu",32]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",32]]	\N	\N
640	2023-01-18 22:27:08.693829	0	30	menu_translation_form_group_admin	[["group",1],["menu",33]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",33]]	\N	\N
641	2023-01-18 22:27:08.693829	0	31	menu_translation_set_group_admin	[["group",1],["menu",34]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",34]]	\N	\N
642	2023-01-18 22:27:08.693829	0	32	menu_translation_clean_group_admin	[["group",1],["menu",35]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",35]]	\N	\N
643	2023-01-18 22:27:08.693829	0	33	menu_translation_update_group_admin	[["group",1],["menu",36]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",36]]	\N	\N
644	2023-01-18 22:27:08.693829	0	34	menu_translation_export_group_admin	[["group",1],["menu",37]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",37]]	\N	\N
645	2023-01-18 22:27:08.693829	0	35	menu_export_form_group_admin	[["group",1],["menu",38]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",38]]	\N	\N
646	2023-01-18 22:27:08.693829	0	36	menu_rule_group_form_group_admin	[["group",1],["menu",39]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",39]]	\N	\N
647	2023-01-18 22:27:08.693829	0	37	menu_modules_group_admin	[["group",1],["menu",40]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",40]]	\N	\N
648	2023-01-18 22:27:08.693829	0	38	menu_module_form_group_admin	[["group",1],["menu",41]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",41]]	\N	\N
649	2023-01-18 22:27:08.693829	0	39	menu_config_wizard_item_form_group_admin	[["group",1],["menu",42]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",42]]	\N	\N
650	2023-01-18 22:27:08.693829	0	40	menu_module_activate_upgrade_group_admin	[["group",1],["menu",43]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",43]]	\N	\N
651	2023-01-18 22:27:08.693829	0	41	menu_trigger_form_group_admin	[["group",1],["menu",44]]	ir.ui.menu-res.group	res	f	[["group",1],["menu",44]]	\N	\N
652	2023-01-18 22:27:08.693829	0	1	module_activate_button_group_admin	[["button",6],["group",1]]	ir.model.button-res.group	res	f	[["button",6],["group",1]]	\N	\N
653	2023-01-18 22:27:08.693829	0	2	module_activate_cancel_button_group_admin	[["button",7],["group",1]]	ir.model.button-res.group	res	f	[["button",7],["group",1]]	\N	\N
654	2023-01-18 22:27:08.693829	0	3	module_deactivate_button_group_admin	[["button",8],["group",1]]	ir.model.button-res.group	res	f	[["button",8],["group",1]]	\N	\N
655	2023-01-18 22:27:08.693829	0	4	module_deactivate_cancel_button_group_admin	[["button",9],["group",1]]	ir.model.button-res.group	res	f	[["button",9],["group",1]]	\N	\N
656	2023-01-18 22:27:08.693829	0	5	module_upgrade_button_group_admin	[["button",10],["group",1]]	ir.model.button-res.group	res	f	[["button",10],["group",1]]	\N	\N
657	2023-01-18 22:27:08.693829	0	6	module_upgrade_cancel_button_group_admin	[["button",11],["group",1]]	ir.model.button-res.group	res	f	[["button",11],["group",1]]	\N	\N
658	2023-01-18 22:27:08.693829	0	7	cron_run_once_button_group_admin	[["button",3],["group",1]]	ir.model.button-res.group	res	f	[["button",3],["group",1]]	\N	\N
659	2023-01-18 22:27:08.693829	0	8	model_data_sync_button_group_admin	[["button",2],["group",1]]	ir.model.button-res.group	res	f	[["button",2],["group",1]]	\N	\N
660	2023-01-18 22:27:08.693829	0	9	view_show_button_group_admin	[["button",1],["group",1]]	ir.model.button-res.group	res	f	[["button",1],["group",1]]	\N	\N
661	2023-01-18 22:27:08.693829	0	117	sequence_type_view_form	[["inherit",57],["model","ir.sequence.type"],["name","sequence_type_form"]]	ir.ui.view	res	f	[["inherit",57],["model","ir.sequence.type"],["name","sequence_type_form"]]	\N	\N
662	2023-01-18 22:27:08.693829	0	11	rule_group_sequence	[["global_p",true],["model",11],["name","User in groups"],["perm_read",false]]	ir.rule.group	res	f	[["global_p",true],["model",11],["name","User in groups"],["perm_read",false]]	\N	\N
663	2023-01-18 22:27:08.693829	0	18	rule_sequence	[["domain","[[\\"sequence_type.groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",11]]	ir.rule	res	f	[["domain","[[\\"sequence_type.groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",11]]	\N	\N
664	2023-01-18 22:27:08.693829	0	12	rule_group_sequence_strict	[["global_p",true],["model",12],["name","User in groups"],["perm_read",false]]	ir.rule.group	res	f	[["global_p",true],["model",12],["name","User in groups"],["perm_read",false]]	\N	\N
665	2023-01-18 22:27:08.693829	0	19	rule_sequence_strict	[["domain","[[\\"sequence_type.groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",12]]	ir.rule	res	f	[["domain","[[\\"sequence_type.groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",12]]	\N	\N
666	2023-01-18 22:27:08.693829	0	3	cron_trigger_time	[["interval_number",5],["interval_type","minutes"],["method","ir.trigger|trigger_time"]]	ir.cron	res	f	[["interval_number",5],["interval_type","minutes"],["method","ir.trigger|trigger_time"]]	\N	\N
667	2023-01-18 22:27:08.693829	0	63	rule_default_view_tree_state	[["model",19],["perm_create",false],["perm_delete",false],["perm_read",false],["perm_write",false]]	ir.model.access	res	f	[["model",19],["perm_create",false],["perm_delete",false],["perm_read",false],["perm_write",false]]	\N	\N
668	2023-01-18 22:27:08.693829	0	64	rule_group_view_tree_state	[["group",1],["model",19],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",19],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
693	2023-01-18 22:27:08.693829	0	3	rule_group_export_any_admin	[["group",1],["rule_group",21]]	ir.rule.group-res.group	res	f	[["group",1],["rule_group",21]]	\N	\N
669	2023-01-18 22:27:08.693829	0	13	rule_group_view_search	[["default_p",true],["global_p",false],["model",20],["name","Own view search"],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.rule.group	res	f	[["default_p",true],["global_p",false],["model",20],["name","Own view search"],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
670	2023-01-18 22:27:08.693829	0	20	rule_group_view_search1	[["domain","[[\\"user\\", \\"=\\", {\\"__class__\\": \\"Get\\", \\"d\\": -1, \\"k\\": \\"id\\", \\"v\\": {\\"__class__\\": \\"Eval\\", \\"d\\": {}, \\"v\\": \\"user\\"}}]]"],["rule_group",13]]	ir.rule	res	f	[["domain","[[\\"user\\", \\"=\\", {\\"__class__\\": \\"Get\\", \\"d\\": -1, \\"k\\": \\"id\\", \\"v\\": {\\"__class__\\": \\"Eval\\", \\"d\\": {}, \\"v\\": \\"user\\"}}]]"],["rule_group",13]]	\N	\N
671	2023-01-18 22:27:08.693829	0	14	rule_group_view_search_common	[["default_p",true],["global_p",false],["model",20],["name","Common view search"],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.rule.group	res	f	[["default_p",true],["global_p",false],["model",20],["name","Common view search"],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
672	2023-01-18 22:27:08.693829	0	21	rule_group_view_search_common1	[["domain","[[\\"user\\", \\"=\\", null]]"],["rule_group",14]]	ir.rule	res	f	[["domain","[[\\"user\\", \\"=\\", null]]"],["rule_group",14]]	\N	\N
673	2023-01-18 22:27:08.693829	0	15	rule_group_view_search_admin	[["default_p",false],["global_p",false],["model",20],["name","Any view search"],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.rule.group	res	f	[["default_p",false],["global_p",false],["model",20],["name","Any view search"],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
674	2023-01-18 22:27:08.693829	0	2	rule_group_view_search_admin_group_admin	[["group",1],["rule_group",15]]	ir.rule.group-res.group	res	f	[["group",1],["rule_group",15]]	\N	\N
675	2023-01-18 22:27:08.693829	0	16	rule_group_session	[["global_p",true],["model",65],["name","Own session"]]	ir.rule.group	res	f	[["global_p",true],["model",65],["name","Own session"]]	\N	\N
676	2023-01-18 22:27:08.693829	0	22	rule_session1	[["domain","[[\\"create_uid\\", \\"=\\", {\\"__class__\\": \\"Get\\", \\"d\\": -1, \\"k\\": \\"id\\", \\"v\\": {\\"__class__\\": \\"Eval\\", \\"d\\": {}, \\"v\\": \\"user\\"}}]]"],["rule_group",16]]	ir.rule	res	f	[["domain","[[\\"create_uid\\", \\"=\\", {\\"__class__\\": \\"Get\\", \\"d\\": -1, \\"k\\": \\"id\\", \\"v\\": {\\"__class__\\": \\"Eval\\", \\"d\\": {}, \\"v\\": \\"user\\"}}]]"],["rule_group",16]]	\N	\N
677	2023-01-18 22:27:08.693829	0	17	rule_group_session_wizard	[["global_p",true],["model",66],["name","Own session"]]	ir.rule.group	res	f	[["global_p",true],["model",66],["name","Own session"]]	\N	\N
678	2023-01-18 22:27:08.693829	0	23	rule_session_wizard1	[["domain","[[\\"create_uid\\", \\"=\\", {\\"__class__\\": \\"Get\\", \\"d\\": -1, \\"k\\": \\"id\\", \\"v\\": {\\"__class__\\": \\"Eval\\", \\"d\\": {}, \\"v\\": \\"user\\"}}]]"],["rule_group",17]]	ir.rule	res	f	[["domain","[[\\"create_uid\\", \\"=\\", {\\"__class__\\": \\"Get\\", \\"d\\": -1, \\"k\\": \\"id\\", \\"v\\": {\\"__class__\\": \\"Eval\\", \\"d\\": {}, \\"v\\": \\"user\\"}}]]"],["rule_group",17]]	\N	\N
679	2023-01-18 22:27:08.693829	0	18	rule_group_ui_menu_favorite	[["global_p",true],["model",14],["name","Own favorite"]]	ir.rule.group	res	f	[["global_p",true],["model",14],["name","Own favorite"]]	\N	\N
680	2023-01-18 22:27:08.693829	0	24	rule_ui_menu_favorite1	[["domain","[[\\"create_uid\\", \\"=\\", {\\"__class__\\": \\"Get\\", \\"d\\": -1, \\"k\\": \\"id\\", \\"v\\": {\\"__class__\\": \\"Eval\\", \\"d\\": {}, \\"v\\": \\"user\\"}}]]"],["rule_group",18]]	ir.rule	res	f	[["domain","[[\\"create_uid\\", \\"=\\", {\\"__class__\\": \\"Get\\", \\"d\\": -1, \\"k\\": \\"id\\", \\"v\\": {\\"__class__\\": \\"Eval\\", \\"d\\": {}, \\"v\\": \\"user\\"}}]]"],["rule_group",18]]	\N	\N
681	2023-01-18 22:27:08.693829	0	65	access_message	[["model",70],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",70],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
682	2023-01-18 22:27:08.693829	0	66	access_message_group_admin	[["group",1],["model",70],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",70],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
683	2023-01-18 22:27:08.693829	0	118	export_view_form	[["inherit",78],["model","ir.export"],["name","export_form"]]	ir.ui.view	res	f	[["inherit",78],["model","ir.export"],["name","export_form"]]	\N	\N
684	2023-01-18 22:27:08.693829	0	119	export_view_list	[["inherit",79],["model","ir.export"],["name","export_list"]]	ir.ui.view	res	f	[["inherit",79],["model","ir.export"],["name","export_list"]]	\N	\N
685	2023-01-18 22:27:08.693829	0	19	rule_group_export_read	[["default_p",true],["global_p",false],["model",48],["name","User in groups"],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.rule.group	res	f	[["default_p",true],["global_p",false],["model",48],["name","User in groups"],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
686	2023-01-18 22:27:08.693829	0	25	rule_group_export_read1	[["domain","[[\\"groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",19]]	ir.rule	res	f	[["domain","[[\\"groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",19]]	\N	\N
687	2023-01-18 22:27:08.693829	0	26	rule_group_export_read2	[["domain","[[\\"create_uid\\", \\"=\\", {\\"__class__\\": \\"Eval\\", \\"d\\": -1, \\"v\\": \\"user.id\\"}]]"],["rule_group",19]]	ir.rule	res	f	[["domain","[[\\"create_uid\\", \\"=\\", {\\"__class__\\": \\"Eval\\", \\"d\\": -1, \\"v\\": \\"user.id\\"}]]"],["rule_group",19]]	\N	\N
688	2023-01-18 22:27:08.693829	0	20	rule_group_export_write	[["default_p",true],["global_p",false],["model",48],["name","User in modification groups"],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.rule.group	res	f	[["default_p",true],["global_p",false],["model",48],["name","User in modification groups"],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
689	2023-01-18 22:27:08.693829	0	27	rule_group_export_write1	[["domain","[[\\"write_groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",20]]	ir.rule	res	f	[["domain","[[\\"write_groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",20]]	\N	\N
690	2023-01-18 22:27:08.693829	0	28	rule_group_export_write2	[["domain","[[\\"create_uid\\", \\"=\\", {\\"__class__\\": \\"Eval\\", \\"d\\": -1, \\"v\\": \\"user.id\\"}]]"],["rule_group",20]]	ir.rule	res	f	[["domain","[[\\"create_uid\\", \\"=\\", {\\"__class__\\": \\"Eval\\", \\"d\\": -1, \\"v\\": \\"user.id\\"}]]"],["rule_group",20]]	\N	\N
691	2023-01-18 22:27:08.693829	0	21	rule_group_export_any	[["default_p",false],["global_p",false],["model",48],["name","Any export"],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.rule.group	res	f	[["default_p",false],["global_p",false],["model",48],["name","Any export"],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
692	2023-01-18 22:27:08.693829	0	29	rule_group_export_any1	[["domain","[]"],["rule_group",21]]	ir.rule	res	f	[["domain","[]"],["rule_group",21]]	\N	\N
694	2023-01-18 22:27:08.693829	0	22	rule_group_export_line_read	[["default_p",true],["global_p",false],["model",49],["name","User in groups"],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.rule.group	res	f	[["default_p",true],["global_p",false],["model",49],["name","User in groups"],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
695	2023-01-18 22:27:08.693829	0	30	rule_group_export_line_read1	[["domain","[[\\"export.groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",22]]	ir.rule	res	f	[["domain","[[\\"export.groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",22]]	\N	\N
696	2023-01-18 22:27:08.693829	0	31	rule_group_export_line_read2	[["domain","[[\\"export.create_uid\\", \\"=\\", {\\"__class__\\": \\"Eval\\", \\"d\\": -1, \\"v\\": \\"user.id\\"}]]"],["rule_group",22]]	ir.rule	res	f	[["domain","[[\\"export.create_uid\\", \\"=\\", {\\"__class__\\": \\"Eval\\", \\"d\\": -1, \\"v\\": \\"user.id\\"}]]"],["rule_group",22]]	\N	\N
697	2023-01-18 22:27:08.693829	0	23	rule_group_export_line_write	[["default_p",true],["global_p",false],["model",49],["name","User in modification groups"],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.rule.group	res	f	[["default_p",true],["global_p",false],["model",49],["name","User in modification groups"],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
698	2023-01-18 22:27:08.693829	0	32	rule_group_export_line_write1	[["domain","[[\\"export.write_groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",23]]	ir.rule	res	f	[["domain","[[\\"export.write_groups\\", \\"in\\", {\\"__class__\\": \\"Eval\\", \\"d\\": [], \\"v\\": \\"groups\\"}]]"],["rule_group",23]]	\N	\N
699	2023-01-18 22:27:08.693829	0	33	rule_group_export_line_write2	[["domain","[[\\"export.create_uid\\", \\"=\\", {\\"__class__\\": \\"Eval\\", \\"d\\": -1, \\"v\\": \\"user.id\\"}]]"],["rule_group",23]]	ir.rule	res	f	[["domain","[[\\"export.create_uid\\", \\"=\\", {\\"__class__\\": \\"Eval\\", \\"d\\": -1, \\"v\\": \\"user.id\\"}]]"],["rule_group",23]]	\N	\N
700	2023-01-18 22:27:08.693829	0	24	rule_group_export_line_any	[["default_p",false],["global_p",false],["model",49],["name","Any export"],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.rule.group	res	f	[["default_p",false],["global_p",false],["model",49],["name","Any export"],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
701	2023-01-18 22:27:08.693829	0	34	rule_group_export_line_any1	[["domain","[]"],["rule_group",24]]	ir.rule	res	f	[["domain","[]"],["rule_group",24]]	\N	\N
702	2023-01-18 22:27:08.693829	0	4	rule_group_export_line_any_admin	[["group",1],["rule_group",24]]	ir.rule.group-res.group	res	f	[["group",1],["rule_group",24]]	\N	\N
703	2023-01-18 22:27:08.693829	0	67	access_ir_email_template	[["model",73],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	ir.model.access	res	f	[["model",73],["perm_create",false],["perm_delete",false],["perm_read",true],["perm_write",false]]	\N	\N
704	2023-01-18 22:27:08.693829	0	68	access_ir_email_template_admin	[["group",1],["model",73],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",73],["perm_create",true],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
705	2023-01-18 22:27:08.693829	0	69	access_ir_error	[["model",75],["perm_create",false],["perm_delete",false],["perm_read",false],["perm_write",false]]	ir.model.access	res	f	[["model",75],["perm_create",false],["perm_delete",false],["perm_read",false],["perm_write",false]]	\N	\N
706	2023-01-18 22:27:08.693829	0	70	access_ir_error_admin	[["group",1],["model",75],["perm_create",false],["perm_delete",true],["perm_read",true],["perm_write",true]]	ir.model.access	res	f	[["group",1],["model",75],["perm_create",false],["perm_delete",true],["perm_read",true],["perm_write",true]]	\N	\N
707	2023-01-18 22:27:08.693829	0	119	msg_password_length	[["text","The password must have at least %(length)i characters."]]	ir.message	res	f	[["text","The password must have at least %(length)i characters."]]	\N	\N
708	2023-01-18 22:27:08.693829	0	120	msg_password_forbidden	[["text","The password is forbidden."]]	ir.message	res	f	[["text","The password is forbidden."]]	\N	\N
709	2023-01-18 22:27:08.693829	0	121	msg_password_name	[["text","The password cannot be the same as user's name."]]	ir.message	res	f	[["text","The password cannot be the same as user's name."]]	\N	\N
710	2023-01-18 22:27:08.693829	0	122	msg_password_login	[["text","The password cannot be the same as user's login."]]	ir.message	res	f	[["text","The password cannot be the same as user's login."]]	\N	\N
711	2023-01-18 22:27:08.693829	0	123	msg_password_email	[["text","The password cannot be the same as user's email address."]]	ir.message	res	f	[["text","The password cannot be the same as user's email address."]]	\N	\N
712	2023-01-18 22:27:08.693829	0	124	msg_user_delete_forbidden	[["text","For logging purposes users cannot be deleted, instead they should be deactivated."]]	ir.message	res	f	[["text","For logging purposes users cannot be deleted, instead they should be deactivated."]]	\N	\N
713	2023-01-18 22:27:08.693829	0	125	msg_user_password	[["text","Password for %(login)s"]]	ir.message	res	f	[["text","Password for %(login)s"]]	\N	\N
\.


--
-- Data for Name: ir_model_field; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_model_field (id, model, name, relation, field_description, ttype, help, module, access, create_date, create_uid, write_date, write_uid) FROM stdin;
1	1	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
2	1	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
3	1	hostname	\N	Hostname	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
4	1	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
5	1	language	\N	language	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
6	1	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
7	1	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
8	1	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
9	2	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
10	2	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
11	2	fuzzy	\N	Fuzzy	boolean		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
12	2	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
13	2	lang	\N	Language	selection		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
14	2	model	\N	Model	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
15	2	module	\N	Module	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
16	2	name	\N	Field Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
17	2	overriding_module	\N	Overriding Module	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
18	2	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
19	2	res_id	\N	Resource ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
20	2	src	\N	Source	text		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
21	2	type	\N	Type	selection		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
22	2	value	\N	Translation Value	text		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
23	2	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
24	2	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
25	3	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
26	4	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
27	5	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
28	6	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
29	7	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
30	7	language	ir.lang	Language	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
31	8	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
32	8	language	ir.lang	Language	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
33	8	module	ir.module	Module	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
34	9	file	\N	File	binary		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
35	9	filename	\N	Filename	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
36	9	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
37	9	language	ir.lang	Language	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
38	9	module	ir.module	Module	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
39	10	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
40	10	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
41	10	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
42	10	name	\N	Sequence Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
43	10	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
44	10	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
45	10	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
46	11	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
47	11	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
48	11	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
49	11	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
50	11	last_timestamp	\N	Last Timestamp	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
51	11	name	\N	Sequence Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
52	11	number_increment	\N	Increment Number	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
53	11	number_next	\N	Next Number	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
54	11	number_next_internal	\N	Next Number	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
55	11	padding	\N	Number padding	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
56	11	prefix	\N	Prefix	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
57	11	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
58	11	sequence_type	ir.sequence.type	Sequence Type	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
59	11	suffix	\N	Suffix	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
60	11	timestamp_offset	\N	Timestamp Offset	float		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
61	11	timestamp_rounding	\N	Timestamp Rounding	float		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
62	11	type	\N	Type	selection		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
63	11	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
64	11	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
65	12	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
66	12	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
67	12	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
68	12	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
69	12	last_timestamp	\N	Last Timestamp	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
70	12	name	\N	Sequence Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
71	12	number_increment	\N	Increment Number	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
72	12	number_next	\N	Next Number	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
73	12	number_next_internal	\N	Next Number	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
74	12	padding	\N	Number padding	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
75	12	prefix	\N	Prefix	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
76	12	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
77	12	sequence_type	ir.sequence.type	Sequence Type	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
78	12	suffix	\N	Suffix	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
79	12	timestamp_offset	\N	Timestamp Offset	float		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
80	12	timestamp_rounding	\N	Timestamp Rounding	float		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
81	12	type	\N	Type	selection		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
82	12	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
83	12	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
84	13	action	\N	Action	reference		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
85	13	action_keywords	ir.action.keyword	Action Keywords	one2many		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
86	13	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
87	13	childs	ir.ui.menu	Children	one2many		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
88	13	complete_name	\N	Complete Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
89	13	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
90	13	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
91	13	favorite	\N	Favorite	boolean		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
92	13	icon	\N	Icon	selection		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
93	13	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
94	13	name	\N	Menu	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
95	13	parent	ir.ui.menu	Parent Menu	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
96	13	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
97	13	sequence	\N	ir.msg_sequence	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
98	13	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
99	13	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
100	14	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
101	14	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
102	14	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
103	14	menu	ir.ui.menu	Menu	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
104	14	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
105	14	sequence	\N	ir.msg_sequence	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
106	14	user	res.user	User	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
107	14	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
108	14	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
109	15	arch	\N	View Architecture	text		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
110	15	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
111	15	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
112	15	data	\N	Data	text		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
113	15	domain	\N	Domain	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
114	15	field_childs	\N	Children Field	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
115	15	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
116	15	inherit	ir.ui.view	Inherited View	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
117	15	model	\N	Model	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
118	15	module	\N	Module	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
119	15	name	\N	Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
120	15	priority	\N	Priority	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
121	15	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
122	15	type	\N	View Type	selection		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
123	15	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
124	15	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
125	16	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
126	17	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
127	17	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
128	17	field	\N	Field	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
129	17	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
130	17	model	\N	Model	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
131	17	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
132	17	user	res.user	User	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
133	17	width	\N	Width	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
134	17	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
135	17	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
136	18	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
137	18	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
138	18	field	\N	Field	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
139	18	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
140	18	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
141	18	user	res.user	User	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
142	18	value	\N	Value	boolean		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
143	18	view_id	ir.ui.view	View ID	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
144	18	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
145	18	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
146	19	child_name	\N	Child Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
147	19	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
148	19	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
149	19	domain	\N	Domain	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
150	19	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
151	19	model	\N	Model	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
152	19	nodes	\N	Expanded Nodes	text		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
153	19	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
154	19	selected_nodes	\N	Selected Nodes	text		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
155	19	user	res.user	User	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
156	19	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
157	19	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
158	20	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
159	20	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
160	20	domain	\N	Domain	char	The PYSON domain.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
161	20	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
162	20	model	\N	Model	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
163	20	name	\N	Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
164	20	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
165	20	user	res.user	User	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
166	20	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
167	20	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
168	21	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
169	21	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
170	21	icon	\N	Icon	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
171	21	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
172	21	module	\N	Module	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
173	21	name	\N	Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
174	21	path	\N	SVG Path	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
175	21	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
176	21	sequence	\N	ir.msg_sequence	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
177	21	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
178	21	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
179	22	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
180	22	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
181	22	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
182	22	icon	ir.ui.icon	Icon	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
183	22	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
184	22	keywords	ir.action.keyword	Keywords	one2many		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
185	22	name	\N	Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
186	22	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
187	22	records	\N	Records	selection	The records on which the action runs.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
188	22	type	\N	Type	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
189	22	usage	\N	Usage	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
190	22	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
191	22	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
192	23	action	ir.action	Action	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
193	23	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
194	23	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
195	23	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
196	23	keyword	\N	Keyword	selection		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
197	23	model	\N	Model	reference		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
198	23	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
199	23	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
200	23	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
201	24	action	ir.action	Action	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
202	24	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
203	24	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
204	24	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
205	24	direct_print	\N	Direct Print	boolean		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
206	24	extension	\N	Extension	selection	Leave empty for the same as template, see LibreOffice documentation for compatible format.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
207	24	icon	ir.ui.icon	Icon	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
208	24	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
209	24	is_custom	\N	Is Custom	boolean		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
210	24	keywords	ir.action.keyword	Keywords	one2many		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
211	24	model	\N	Model	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
212	24	module	\N	Module	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
213	24	name	\N	Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
214	24	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
215	24	record_name	\N	Record Name	char	A Genshi expression to compute the name using 'record'.\nLeave empty for the default name.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
216	24	records	\N	Records	selection	The records on which the action runs.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
217	24	report	\N	Path	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
218	24	report_content	\N	Content	binary		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
219	24	report_content_custom	\N	Content	binary		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
220	24	report_content_html	\N	Content HTML	binary		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
221	24	report_content_name	\N	Content Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
222	24	report_name	\N	Internal Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
223	24	single	\N	Single	boolean	Check if the template works only for one record.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
224	24	template_extension	\N	Template Extension	selection		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
225	24	translatable	\N	Translatable	boolean	Uncheck to disable translations for this report.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
226	24	type	\N	Type	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
227	24	usage	\N	Usage	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
228	24	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
229	24	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
230	25	act_window_domains	ir.action.act_window.domain	Domains	one2many		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
231	25	act_window_views	ir.action.act_window.view	Views	one2many		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
232	25	action	ir.action	Action	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
233	25	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
234	25	context	\N	Context Value	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
235	25	context_domain	\N	Context Domain	char	Part of the domain that will be evaluated on each refresh.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
236	25	context_model	\N	Context Model	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
237	25	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
238	25	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
239	25	domain	\N	Domain Value	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
240	25	domains	\N	Domains	binary		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
241	25	icon	ir.ui.icon	Icon	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
242	25	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
243	25	keywords	ir.action.keyword	Keywords	one2many		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
244	25	limit	\N	Limit	integer	Default limit for the list view.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
245	25	name	\N	Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
246	25	order	\N	Order Value	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
247	25	pyson_context	\N	PySON Context	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
248	25	pyson_domain	\N	PySON Domain	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
249	25	pyson_order	\N	PySON Order	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
250	25	pyson_search_value	\N	PySON Search Criteria	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
251	25	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
252	25	records	\N	Records	selection	The records on which the action runs.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
253	25	res_model	\N	Model	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
254	25	search_value	\N	Search Criteria	char	Default search criteria for the list view.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
255	25	type	\N	Type	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
256	25	usage	\N	Usage	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
257	25	views	\N	Views	binary		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
258	25	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
259	25	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
260	26	act_window	ir.action.act_window	Action	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
261	26	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
262	26	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
263	26	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
264	26	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
265	26	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
266	26	sequence	\N	ir.msg_sequence	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
267	26	view	ir.ui.view	View	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
268	26	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
269	26	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
270	27	act_window	ir.action.act_window	Action	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
271	27	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
272	27	count	\N	Count	boolean		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
273	27	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
274	27	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
275	27	domain	\N	Domain	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
276	27	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
277	27	name	\N	Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
278	27	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
279	27	sequence	\N	ir.msg_sequence	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
280	27	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
281	27	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
282	28	action	ir.action	Action	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
283	28	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
284	28	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
285	28	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
286	28	icon	ir.ui.icon	Icon	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
287	28	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
288	28	keywords	ir.action.keyword	Keywords	one2many		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
289	28	model	\N	Model	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
290	28	name	\N	Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
291	28	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
292	28	records	\N	Records	selection	The records on which the action runs.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
293	28	type	\N	Type	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
294	28	usage	\N	Usage	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
295	28	window	\N	Window	boolean	Run wizard in a new window.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
296	28	wiz_name	\N	Wizard name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
297	28	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
298	28	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
299	29	action	ir.action	Action	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
300	29	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
301	29	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
302	29	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
303	29	icon	ir.ui.icon	Icon	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
304	29	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
305	29	keywords	ir.action.keyword	Keywords	one2many		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
306	29	name	\N	Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
307	29	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
308	29	records	\N	Records	selection	The records on which the action runs.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
309	29	type	\N	Type	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
310	29	url	\N	Action Url	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
311	29	usage	\N	Usage	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
312	29	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
313	29	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
314	30	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
315	30	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
316	30	fields	ir.model.field	Fields	one2many		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
317	30	global_search_p	\N	Global Search	boolean		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
318	30	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
319	30	info	\N	Information	text		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
320	30	model	\N	Model Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
321	30	module	\N	Module	char	Module in which this model is defined.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
322	30	name	\N	Model Description	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
323	30	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
324	30	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
325	30	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
326	31	access	\N	Access	boolean	If checked, the access right on the model of the field is also tested against the relation of the field.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
327	31	create_date	\N	ir.msg_created_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
328	31	create_uid	res.user	ir.msg_created_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
329	31	field_description	\N	Field Description	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
330	31	help	\N	Help	text		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
331	31	id	\N	ir.msg_ID	integer		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
332	31	model	ir.model	Model	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
333	31	module	\N	Module	char	Module in which this field is defined.	ir	f	2023-01-18 22:26:51.369844	0	\N	\N
334	31	name	\N	Name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
335	31	rec_name	\N	ir.msg_record_name	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
336	31	relation	\N	Model Relation	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
337	31	ttype	\N	Field Type	char		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
338	31	write_date	\N	ir.msg_edited_at	timestamp		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
339	31	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	2023-01-18 22:26:51.369844	0	\N	\N
340	32	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	\N	\N	\N	\N
341	32	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
342	32	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
343	32	description	\N	Description	text		ir	f	\N	\N	\N	\N
344	32	group	res.group	Group	many2one		ir	f	\N	\N	\N	\N
345	32	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
346	32	model	ir.model	Model	many2one		ir	f	\N	\N	\N	\N
347	32	perm_create	\N	Create Access	boolean		ir	f	\N	\N	\N	\N
348	32	perm_delete	\N	Delete Access	boolean		ir	f	\N	\N	\N	\N
349	32	perm_read	\N	Read Access	boolean		ir	f	\N	\N	\N	\N
350	32	perm_write	\N	Write Access	boolean		ir	f	\N	\N	\N	\N
351	32	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
352	32	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
353	32	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
354	33	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	\N	\N	\N	\N
355	33	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
356	33	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
357	33	description	\N	Description	text		ir	f	\N	\N	\N	\N
358	33	field	ir.model.field	Field	many2one		ir	f	\N	\N	\N	\N
359	33	group	res.group	Group	many2one		ir	f	\N	\N	\N	\N
360	33	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
361	33	perm_create	\N	Create Access	boolean		ir	f	\N	\N	\N	\N
362	33	perm_delete	\N	Delete Access	boolean		ir	f	\N	\N	\N	\N
363	33	perm_read	\N	Read Access	boolean		ir	f	\N	\N	\N	\N
364	33	perm_write	\N	Write Access	boolean		ir	f	\N	\N	\N	\N
365	33	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
366	33	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
367	33	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
368	34	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	\N	\N	\N	\N
369	34	clicks	ir.model.button.click	Clicks	one2many		ir	f	\N	\N	\N	\N
370	34	confirm	\N	Confirm	text	Text to ask user confirmation when clicking the button.	ir	f	\N	\N	\N	\N
371	34	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
372	34	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
373	34	help	\N	Help	text		ir	f	\N	\N	\N	\N
374	34	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
375	34	model	ir.model	Model	many2one		ir	f	\N	\N	\N	\N
376	34	name	\N	Name	char		ir	f	\N	\N	\N	\N
377	34	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
378	34	reset	ir.model.button-button.reset	Reset	many2many		ir	f	\N	\N	\N	\N
379	34	reset_by	ir.model.button-button.reset	Reset by	many2many	Button that should reset the rules.	ir	f	\N	\N	\N	\N
380	34	rules	ir.model.button.rule	Rules	one2many		ir	f	\N	\N	\N	\N
381	34	string	\N	Label	char		ir	f	\N	\N	\N	\N
382	34	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
383	34	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
384	35	button	ir.model.button	Button	many2one		ir	f	\N	\N	\N	\N
385	35	condition	\N	Condition	char	A PYSON statement evaluated with the record represented by "self"\nIt activate the rule if true.	ir	f	\N	\N	\N	\N
386	35	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
387	35	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
388	35	description	\N	Description	char		ir	f	\N	\N	\N	\N
389	35	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
390	35	number_user	\N	Number of User	integer		ir	f	\N	\N	\N	\N
391	35	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
392	35	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
393	35	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
394	36	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	\N	\N	\N	\N
395	36	button	ir.model.button	Button	many2one		ir	f	\N	\N	\N	\N
396	36	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
397	36	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
398	36	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
399	36	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
400	36	record_id	\N	Record ID	integer		ir	f	\N	\N	\N	\N
401	36	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
402	36	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
403	37	button	ir.model.button	Button	many2one		ir	f	\N	\N	\N	\N
404	37	button_ruled	ir.model.button	Button Ruled	many2one		ir	f	\N	\N	\N	\N
405	37	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
406	37	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
407	37	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
408	37	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
409	37	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
410	37	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
411	38	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
412	38	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
413	38	db_id	\N	Resource ID	integer	The id of the record in the database.	ir	f	\N	\N	\N	\N
414	38	fs_id	\N	Identifier on File System	char	The id of the record as known on the file system.	ir	f	\N	\N	\N	\N
415	38	fs_values	\N	Values on File System	text		ir	f	\N	\N	\N	\N
416	38	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
417	38	model	\N	Model	char		ir	f	\N	\N	\N	\N
418	38	module	\N	Module	char		ir	f	\N	\N	\N	\N
419	38	noupdate	\N	No Update	boolean		ir	f	\N	\N	\N	\N
420	38	out_of_sync	\N	Out of Sync	boolean		ir	f	\N	\N	\N	\N
421	38	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
422	38	values	\N	Values	text		ir	f	\N	\N	\N	\N
423	38	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
424	38	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
425	39	filter	\N	Filter	text	Entering a Python Regular Expression will exclude matching models from the graph.	ir	f	\N	\N	\N	\N
426	39	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
427	39	level	\N	Level	integer		ir	f	\N	\N	\N	\N
428	40	copy_to_resources	\N	Copy to Resources	multiselection		ir	f	\N	\N	\N	\N
429	40	copy_to_resources_visible	\N	Copy to Resources Visible	boolean		ir	f	\N	\N	\N	\N
430	40	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
431	40	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
432	40	data	\N	Data	binary		ir	f	\N	\N	\N	\N
433	40	data_size	\N	Data size	integer		ir	f	\N	\N	\N	\N
434	40	description	\N	Description	text		ir	f	\N	\N	\N	\N
435	40	file_id	\N	File ID	char		ir	f	\N	\N	\N	\N
436	40	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
437	40	last_modification	\N	Last Modification	datetime		ir	f	\N	\N	\N	\N
438	40	last_user	\N	Last User	char		ir	f	\N	\N	\N	\N
439	40	link	\N	Link	char		ir	f	\N	\N	\N	\N
440	40	name	\N	Name	char		ir	f	\N	\N	\N	\N
441	40	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
442	40	resource	\N	Resource	reference		ir	f	\N	\N	\N	\N
443	40	summary	\N	Summary	char		ir	f	\N	\N	\N	\N
444	40	type	\N	Type	selection		ir	f	\N	\N	\N	\N
445	40	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
446	40	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
447	41	copy_to_resources	\N	Copy to Resources	multiselection		ir	f	\N	\N	\N	\N
448	41	copy_to_resources_visible	\N	Copy to Resources Visible	boolean		ir	f	\N	\N	\N	\N
449	41	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
450	41	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
451	41	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
452	41	last_modification	\N	Last Modification	datetime		ir	f	\N	\N	\N	\N
453	41	last_user	\N	Last User	char		ir	f	\N	\N	\N	\N
454	41	message	\N	Message	text		ir	f	\N	\N	\N	\N
455	41	message_wrapped	\N	Message	text		ir	f	\N	\N	\N	\N
456	41	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
457	41	resource	\N	Resource	reference		ir	f	\N	\N	\N	\N
458	41	unread	\N	Unread	boolean		ir	f	\N	\N	\N	\N
459	41	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
460	41	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
461	42	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
462	42	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
463	42	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
464	42	note	ir.note	Note	many2one		ir	f	\N	\N	\N	\N
465	42	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
466	42	user	res.user	User	many2one		ir	f	\N	\N	\N	\N
467	42	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
468	42	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
469	43	cache	ir.avatar.cache	Cache	one2many		ir	f	\N	\N	\N	\N
470	43	copy_to_resources	\N	Copy to Resources	multiselection		ir	f	\N	\N	\N	\N
471	43	copy_to_resources_visible	\N	Copy to Resources Visible	boolean		ir	f	\N	\N	\N	\N
472	43	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
473	43	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
474	43	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
475	43	image	\N	Image	binary		ir	f	\N	\N	\N	\N
476	43	image_id	\N	Image ID	char		ir	f	\N	\N	\N	\N
477	43	last_modification	\N	Last Modification	datetime		ir	f	\N	\N	\N	\N
478	43	last_user	\N	Last User	char		ir	f	\N	\N	\N	\N
479	43	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
480	43	resource	\N	Resource	reference		ir	f	\N	\N	\N	\N
481	43	uuid	\N	UUID	char		ir	f	\N	\N	\N	\N
482	43	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
483	43	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
484	44	avatar	ir.avatar	Avatar	many2one		ir	f	\N	\N	\N	\N
485	44	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
486	44	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
487	44	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
488	44	image	\N	Image	binary		ir	f	\N	\N	\N	\N
489	44	image_id	\N	Image ID	char		ir	f	\N	\N	\N	\N
490	44	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
491	44	size	\N	Size	integer		ir	f	\N	\N	\N	\N
492	44	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
493	44	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
494	45	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	\N	\N	\N	\N
495	45	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
496	45	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
497	45	day	\N	Day	integer		ir	f	\N	\N	\N	\N
498	45	hour	\N	Hour	integer		ir	f	\N	\N	\N	\N
499	45	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
500	45	interval_number	\N	Interval Number	integer		ir	f	\N	\N	\N	\N
501	45	interval_type	\N	Interval Type	selection		ir	f	\N	\N	\N	\N
502	45	method	\N	Method	selection		ir	f	\N	\N	\N	\N
503	45	minute	\N	Minute	integer		ir	f	\N	\N	\N	\N
504	45	next_call	\N	Next Call	datetime		ir	f	\N	\N	\N	\N
505	45	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
506	45	timezone	\N	Timezone	char		ir	f	\N	\N	\N	\N
507	45	weekday	ir.calendar.day	Day of Week	many2one		ir	f	\N	\N	\N	\N
508	45	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
509	45	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
510	46	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	\N	\N	\N	\N
511	46	am	\N	AM	char		ir	f	\N	\N	\N	\N
512	46	code	\N	Code	char	RFC 4646 tag.	ir	f	\N	\N	\N	\N
513	46	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
514	46	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
515	46	date	\N	Date	char		ir	f	\N	\N	\N	\N
516	46	decimal_point	\N	Decimal Separator	char		ir	f	\N	\N	\N	\N
517	46	direction	\N	Direction	selection		ir	f	\N	\N	\N	\N
518	46	grouping	\N	Grouping	char		ir	f	\N	\N	\N	\N
519	46	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
520	46	mon_decimal_point	\N	Decimal Separator	char		ir	f	\N	\N	\N	\N
521	46	mon_grouping	\N	Grouping	char		ir	f	\N	\N	\N	\N
522	46	mon_thousands_sep	\N	Thousands Separator	char		ir	f	\N	\N	\N	\N
523	46	n_cs_precedes	\N	Negative Currency Symbol Precedes	boolean		ir	f	\N	\N	\N	\N
524	46	n_sep_by_space	\N	Negative Separate by Space	boolean		ir	f	\N	\N	\N	\N
525	46	n_sign_posn	\N	Negative Sign Position	integer		ir	f	\N	\N	\N	\N
526	46	name	\N	Name	char		ir	f	\N	\N	\N	\N
527	46	negative_sign	\N	Negative Sign	char		ir	f	\N	\N	\N	\N
528	46	p_cs_precedes	\N	Positive Currency Symbol Precedes	boolean		ir	f	\N	\N	\N	\N
529	46	p_sep_by_space	\N	Positive Separate by Space	boolean		ir	f	\N	\N	\N	\N
530	46	p_sign_posn	\N	Positive Sign Position	integer		ir	f	\N	\N	\N	\N
531	46	parent	\N	Parent Code	char	Code of the exceptional parent	ir	f	\N	\N	\N	\N
532	46	pg_text_search	\N	PostgreSQL Text Search Configuration	char		ir	f	\N	\N	\N	\N
533	46	pm	\N	PM	char		ir	f	\N	\N	\N	\N
534	46	positive_sign	\N	Positive Sign	char		ir	f	\N	\N	\N	\N
535	46	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
536	46	thousands_sep	\N	Thousands Separator	char		ir	f	\N	\N	\N	\N
537	46	translatable	\N	Translatable	boolean		ir	f	\N	\N	\N	\N
538	46	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
539	46	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
540	47	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
541	47	languages	ir.lang	Languages	many2many		ir	f	\N	\N	\N	\N
542	48	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
543	48	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
544	48	export_fields	ir.export.line	Fields	one2many		ir	f	\N	\N	\N	\N
545	48	header	\N	Header	boolean	Check to include field names on the export.	ir	f	\N	\N	\N	\N
546	48	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
547	48	name	\N	Name	char		ir	f	\N	\N	\N	\N
548	48	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
549	48	resource	\N	Resource	char		ir	f	\N	\N	\N	\N
550	48	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
551	48	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
552	49	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
553	49	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
554	49	export	ir.export	Export	many2one		ir	f	\N	\N	\N	\N
555	49	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
556	49	name	\N	Name	char		ir	f	\N	\N	\N	\N
557	49	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
558	49	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
559	49	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
560	50	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
561	50	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
562	50	default_p	\N	Default	boolean	Add this rule to all users by default.	ir	f	\N	\N	\N	\N
563	50	global_p	\N	Global	boolean	Make the rule global \nso every users must follow this rule.	ir	f	\N	\N	\N	\N
564	50	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
565	50	model	ir.model	Model	many2one		ir	f	\N	\N	\N	\N
566	50	name	\N	Name	char	Displayed to users when access error is raised for this rule.	ir	f	\N	\N	\N	\N
567	50	perm_create	\N	Create Access	boolean		ir	f	\N	\N	\N	\N
568	50	perm_delete	\N	Delete Access	boolean		ir	f	\N	\N	\N	\N
569	50	perm_read	\N	Read Access	boolean		ir	f	\N	\N	\N	\N
570	50	perm_write	\N	Write Access	boolean		ir	f	\N	\N	\N	\N
571	50	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
572	50	rules	ir.rule	Tests	one2many	The rule is satisfied if at least one test is True.	ir	f	\N	\N	\N	\N
573	50	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
574	50	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
575	51	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
576	51	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
577	51	domain	\N	Domain	char	Domain is evaluated with a PYSON context containing:\n- "user" as the current user\n- "groups" as list of ids from the current user	ir	f	\N	\N	\N	\N
578	51	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
579	51	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
580	51	rule_group	ir.rule.group	Group	many2one		ir	f	\N	\N	\N	\N
581	51	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
582	51	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
583	52	childs	ir.module	Childs	one2many		ir	f	\N	\N	\N	\N
584	52	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
585	52	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
586	52	dependencies	ir.module.dependency	Dependencies	one2many		ir	f	\N	\N	\N	\N
587	52	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
588	52	name	\N	Name	char		ir	f	\N	\N	\N	\N
589	52	parents	ir.module	Parents	one2many		ir	f	\N	\N	\N	\N
590	52	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
591	52	state	\N	State	selection		ir	f	\N	\N	\N	\N
592	52	version	\N	Version	char		ir	f	\N	\N	\N	\N
593	52	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
594	52	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
595	53	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
596	53	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
597	53	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
598	53	module	ir.module	Module	many2one		ir	f	\N	\N	\N	\N
599	53	name	\N	Name	char		ir	f	\N	\N	\N	\N
600	53	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
601	53	state	\N	State	selection		ir	f	\N	\N	\N	\N
602	53	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
603	53	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
604	54	action	ir.action	Action	many2one		ir	f	\N	\N	\N	\N
605	54	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
606	54	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
607	54	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
608	54	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
609	54	sequence	\N	ir.msg_sequence	integer		ir	f	\N	\N	\N	\N
610	54	state	\N	State	selection		ir	f	\N	\N	\N	\N
611	54	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
612	54	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
613	55	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
614	56	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
615	56	percentage	\N	Percentage	float		ir	f	\N	\N	\N	\N
616	57	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
617	58	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
618	58	module_info	\N	Modules to update	text		ir	f	\N	\N	\N	\N
619	59	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
620	60	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
621	60	modules	ir.module	Modules	many2many		ir	f	\N	\N	\N	\N
622	61	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
623	61	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
624	61	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
625	61	name	\N	Name	char		ir	f	\N	\N	\N	\N
626	61	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
627	61	timestamp	\N	Timestamp	timestamp		ir	f	\N	\N	\N	\N
628	61	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
629	61	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
630	62	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
631	63	action	\N	Action	selection		ir	f	\N	\N	\N	\N
632	63	active	\N	ir.msg_active	boolean	ir.msg_active_help	ir	f	\N	\N	\N	\N
633	63	condition	\N	Condition	char	A PYSON statement evaluated with record represented by "self"\nIt triggers the action if true.	ir	f	\N	\N	\N	\N
634	63	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
635	63	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
636	63	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
637	63	limit_number	\N	Limit Number	integer	Limit the number of call to "Action Function" by records.\n0 for no limit.	ir	f	\N	\N	\N	\N
638	63	minimum_time_delay	\N	Minimum Delay	timedelta	Set a minimum time delay between call to "Action Function" for the same record.\nempty for no delay.	ir	f	\N	\N	\N	\N
639	63	model	ir.model	Model	many2one		ir	f	\N	\N	\N	\N
640	63	name	\N	Name	char		ir	f	\N	\N	\N	\N
641	63	on_create	\N	On Create	boolean		ir	f	\N	\N	\N	\N
642	63	on_delete	\N	On Delete	boolean		ir	f	\N	\N	\N	\N
643	63	on_time	\N	On Time	boolean		ir	f	\N	\N	\N	\N
644	63	on_write	\N	On Write	boolean		ir	f	\N	\N	\N	\N
645	63	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
646	63	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
647	63	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
648	64	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
649	64	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
650	64	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
651	64	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
652	64	record_id	\N	Record ID	integer		ir	f	\N	\N	\N	\N
653	64	trigger	ir.trigger	Trigger	many2one		ir	f	\N	\N	\N	\N
654	64	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
655	64	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
656	65	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
657	65	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
658	65	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
659	65	key	\N	Key	char		ir	f	\N	\N	\N	\N
660	65	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
661	65	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
662	65	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
663	66	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
664	66	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
665	66	data	\N	Data	text		ir	f	\N	\N	\N	\N
666	66	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
667	66	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
668	66	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
669	66	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
670	67	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
671	67	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
672	67	data	\N	Data	dict		ir	f	\N	\N	\N	\N
673	67	dequeued_at	\N	Dequeued at	timestamp		ir	f	\N	\N	\N	\N
674	67	enqueued_at	\N	Enqueued at	timestamp		ir	f	\N	\N	\N	\N
675	67	expected_at	\N	Expected at	timestamp	When the task should be done.	ir	f	\N	\N	\N	\N
676	67	finished_at	\N	Finished at	timestamp		ir	f	\N	\N	\N	\N
677	67	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
678	67	name	\N	Name	char		ir	f	\N	\N	\N	\N
679	67	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
680	67	scheduled_at	\N	Scheduled at	timestamp	When the task can start.	ir	f	\N	\N	\N	\N
681	67	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
682	67	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
683	68	abbreviation	\N	Abbreviation	char		ir	f	\N	\N	\N	\N
684	68	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
685	68	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
686	68	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
687	68	index	\N	Index	integer		ir	f	\N	\N	\N	\N
688	68	name	\N	Name	char		ir	f	\N	\N	\N	\N
689	68	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
690	68	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
691	68	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
692	69	abbreviation	\N	Abbreviation	char		ir	f	\N	\N	\N	\N
693	69	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
694	69	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
695	69	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
696	69	index	\N	Index	integer		ir	f	\N	\N	\N	\N
697	69	name	\N	Name	char		ir	f	\N	\N	\N	\N
698	69	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
699	69	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
700	69	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
701	70	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
702	70	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
703	70	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
704	70	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
705	70	text	\N	Text	text		ir	f	\N	\N	\N	\N
706	70	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
707	70	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
708	71	addresses	ir.email.address	Addresses	one2many		ir	f	\N	\N	\N	\N
709	71	at	\N	At	datetime		ir	f	\N	\N	\N	\N
710	71	body	\N	Body	text		ir	f	\N	\N	\N	\N
711	71	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
712	71	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
713	71	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
714	71	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
715	71	recipients	\N	Recipients	char		ir	f	\N	\N	\N	\N
716	71	recipients_hidden	\N	Hidden Recipients	char		ir	f	\N	\N	\N	\N
717	71	recipients_secondary	\N	Secondary Recipients	char		ir	f	\N	\N	\N	\N
718	71	resource	\N	Resource	reference		ir	f	\N	\N	\N	\N
719	71	subject	\N	Subject	char		ir	f	\N	\N	\N	\N
720	71	user	\N	User	char		ir	f	\N	\N	\N	\N
721	71	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
722	71	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
723	72	address	\N	Address	char		ir	f	\N	\N	\N	\N
724	72	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
725	72	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
726	72	email	ir.email	E-mail	many2one		ir	f	\N	\N	\N	\N
727	72	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
728	72	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
729	72	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
730	72	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
731	73	body	\N	Body	text		ir	f	\N	\N	\N	\N
732	73	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
733	73	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
734	73	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
735	73	model	ir.model	Model	many2one		ir	f	\N	\N	\N	\N
736	73	model_name	\N	Model Name	char		ir	f	\N	\N	\N	\N
737	73	name	\N	Name	char		ir	f	\N	\N	\N	\N
738	73	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
739	73	recipients	ir.model.field	Recipients	many2one	The field that contains the recipient(s).	ir	f	\N	\N	\N	\N
740	73	recipients_hidden	ir.model.field	Hidden Recipients	many2one	The field that contains the secondary recipient(s).	ir	f	\N	\N	\N	\N
741	73	recipients_hidden_pyson	\N	Hidden Recipients	char	A PYSON expression that generates a list of hidden recipients with the record represented by "self".	ir	f	\N	\N	\N	\N
742	73	recipients_pyson	\N	Recipients	char	A PYSON expression that generates a list of recipients with the record represented by "self".	ir	f	\N	\N	\N	\N
743	73	recipients_secondary	ir.model.field	Secondary Recipients	many2one	The field that contains the secondary recipient(s).	ir	f	\N	\N	\N	\N
744	73	recipients_secondary_pyson	\N	Secondary Recipients	char	A PYSON expression that generates a list of secondary recipients with the record represented by "self".	ir	f	\N	\N	\N	\N
745	73	reports	ir.email.template-ir.action.report	Reports	many2many		ir	f	\N	\N	\N	\N
746	73	subject	\N	Subject	char		ir	f	\N	\N	\N	\N
747	73	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
748	73	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
749	74	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
750	74	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
751	74	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
752	74	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
753	74	report	ir.action.report	Report	many2one		ir	f	\N	\N	\N	\N
754	74	template	ir.email.template	Template	many2one		ir	f	\N	\N	\N	\N
755	74	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
756	74	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
757	75	create_date	\N	ir.msg_created_at	timestamp		ir	f	\N	\N	\N	\N
758	75	create_uid	res.user	ir.msg_created_by	many2one		ir	f	\N	\N	\N	\N
759	75	description	\N	Description	text		ir	f	\N	\N	\N	\N
760	75	id	\N	ir.msg_ID	integer		ir	f	\N	\N	\N	\N
761	75	message	\N	Message	text		ir	f	\N	\N	\N	\N
762	75	origin	\N	Origin	reference		ir	f	\N	\N	\N	\N
763	75	processed_by	res.user	Processed by	many2one		ir	f	\N	\N	\N	\N
764	75	rec_name	\N	ir.msg_record_name	char		ir	f	\N	\N	\N	\N
765	75	solved_by	res.user	Solved by	many2one		ir	f	\N	\N	\N	\N
766	75	state	\N	State	selection		ir	f	\N	\N	\N	\N
767	75	summary	\N	Summary	char		ir	f	\N	\N	\N	\N
768	75	write_date	\N	ir.msg_edited_at	timestamp		ir	f	\N	\N	\N	\N
769	75	write_uid	res.user	ir.msg_edited_by	many2one		ir	f	\N	\N	\N	\N
770	76	active	\N	ir.msg_active	boolean	ir.msg_active_help	res	f	\N	\N	\N	\N
771	76	buttons	ir.model.button-res.group	Buttons	many2many		res	f	\N	\N	\N	\N
772	76	create_date	\N	ir.msg_created_at	timestamp		res	f	\N	\N	\N	\N
773	76	create_uid	res.user	ir.msg_created_by	many2one		res	f	\N	\N	\N	\N
774	76	field_access	ir.model.field.access	Access Field	one2many		res	f	\N	\N	\N	\N
775	76	id	\N	ir.msg_ID	integer		res	f	\N	\N	\N	\N
776	76	menu_access	ir.ui.menu-res.group	Access Menu	many2many		res	f	\N	\N	\N	\N
777	76	model_access	ir.model.access	Access Model	one2many		res	f	\N	\N	\N	\N
778	76	name	\N	Name	char		res	f	\N	\N	\N	\N
779	76	parent	res.group	Parent	many2one	The group to inherit accesses from.	res	f	\N	\N	\N	\N
780	76	rec_name	\N	ir.msg_record_name	char		res	f	\N	\N	\N	\N
781	76	rule_groups	ir.rule.group-res.group	Rules	many2many		res	f	\N	\N	\N	\N
782	76	users	res.user-res.group	Users	many2many		res	f	\N	\N	\N	\N
783	76	write_date	\N	ir.msg_edited_at	timestamp		res	f	\N	\N	\N	\N
784	76	write_uid	res.user	ir.msg_edited_by	many2one		res	f	\N	\N	\N	\N
785	77	actions	res.user-ir.action	Actions	many2many	Actions that will be run at login.	res	f	\N	\N	\N	\N
786	77	active	\N	ir.msg_active	boolean	ir.msg_active_help	res	f	\N	\N	\N	\N
787	77	applications	res.user.application	Applications	one2many		res	f	\N	\N	\N	\N
788	77	avatar	\N	ir.msg_avatar	binary		res	f	\N	\N	\N	\N
789	77	avatar_badge_url	\N	Avatar Badge URL	char		res	f	\N	\N	\N	\N
790	77	avatar_url	\N	ir.msg_avatar_url	char		res	f	\N	\N	\N	\N
791	77	avatars	ir.avatar	ir.msg_avatars	one2many		res	f	\N	\N	\N	\N
792	77	create_date	\N	ir.msg_created_at	timestamp		res	f	\N	\N	\N	\N
793	77	create_uid	res.user	ir.msg_created_by	many2one		res	f	\N	\N	\N	\N
794	77	email	\N	Email	char		res	f	\N	\N	\N	\N
795	77	groups	res.user-res.group	Groups	many2many		res	f	\N	\N	\N	\N
796	77	id	\N	ir.msg_ID	integer		res	f	\N	\N	\N	\N
797	77	language	ir.lang	Language	many2one		res	f	\N	\N	\N	\N
798	77	language_direction	\N	Language Direction	char		res	f	\N	\N	\N	\N
799	77	login	\N	Login	char		res	f	\N	\N	\N	\N
800	77	menu	ir.action	Menu Action	many2one		res	f	\N	\N	\N	\N
801	77	name	\N	Name	char		res	f	\N	\N	\N	\N
802	77	password	\N	Password	char		res	f	\N	\N	\N	\N
803	77	password_hash	\N	Password Hash	char		res	f	\N	\N	\N	\N
804	77	password_reset	\N	Reset Password	char		res	f	\N	\N	\N	\N
805	77	password_reset_expire	\N	Reset Password Expire	timestamp		res	f	\N	\N	\N	\N
806	77	pyson_menu	\N	PySON Menu	char		res	f	\N	\N	\N	\N
807	77	rec_name	\N	ir.msg_record_name	char		res	f	\N	\N	\N	\N
808	77	sessions	\N	Sessions	integer		res	f	\N	\N	\N	\N
809	77	signature	\N	Signature	text		res	f	\N	\N	\N	\N
810	77	status_bar	\N	Status Bar	char		res	f	\N	\N	\N	\N
811	77	warnings	res.user.warning	Warnings	one2many		res	f	\N	\N	\N	\N
812	77	write_date	\N	ir.msg_edited_at	timestamp		res	f	\N	\N	\N	\N
813	77	write_uid	res.user	ir.msg_edited_by	many2one		res	f	\N	\N	\N	\N
814	78	create_date	\N	ir.msg_created_at	timestamp		res	f	\N	\N	\N	\N
815	78	create_uid	res.user	ir.msg_created_by	many2one		res	f	\N	\N	\N	\N
816	78	device_cookie	\N	Device Cookie	char		res	f	\N	\N	\N	\N
817	78	id	\N	ir.msg_ID	integer		res	f	\N	\N	\N	\N
818	78	ip_address	\N	IP Address	char		res	f	\N	\N	\N	\N
819	78	ip_network	\N	IP Network	char		res	f	\N	\N	\N	\N
820	78	login	\N	Login	char		res	f	\N	\N	\N	\N
821	78	rec_name	\N	ir.msg_record_name	char		res	f	\N	\N	\N	\N
822	78	write_date	\N	ir.msg_edited_at	timestamp		res	f	\N	\N	\N	\N
823	78	write_uid	res.user	ir.msg_edited_by	many2one		res	f	\N	\N	\N	\N
824	79	cookie	\N	Cookie	char		res	f	\N	\N	\N	\N
825	79	create_date	\N	ir.msg_created_at	timestamp		res	f	\N	\N	\N	\N
826	79	create_uid	res.user	ir.msg_created_by	many2one		res	f	\N	\N	\N	\N
827	79	id	\N	ir.msg_ID	integer		res	f	\N	\N	\N	\N
828	79	login	\N	Login	char		res	f	\N	\N	\N	\N
829	79	rec_name	\N	ir.msg_record_name	char		res	f	\N	\N	\N	\N
830	79	write_date	\N	ir.msg_edited_at	timestamp		res	f	\N	\N	\N	\N
831	79	write_uid	res.user	ir.msg_edited_by	many2one		res	f	\N	\N	\N	\N
832	80	action	ir.action	Action	many2one		res	f	\N	\N	\N	\N
833	80	create_date	\N	ir.msg_created_at	timestamp		res	f	\N	\N	\N	\N
834	80	create_uid	res.user	ir.msg_created_by	many2one		res	f	\N	\N	\N	\N
835	80	id	\N	ir.msg_ID	integer		res	f	\N	\N	\N	\N
836	80	rec_name	\N	ir.msg_record_name	char		res	f	\N	\N	\N	\N
837	80	user	res.user	User	many2one		res	f	\N	\N	\N	\N
838	80	write_date	\N	ir.msg_edited_at	timestamp		res	f	\N	\N	\N	\N
839	80	write_uid	res.user	ir.msg_edited_by	many2one		res	f	\N	\N	\N	\N
840	81	create_date	\N	ir.msg_created_at	timestamp		res	f	\N	\N	\N	\N
841	81	create_uid	res.user	ir.msg_created_by	many2one		res	f	\N	\N	\N	\N
842	81	group	res.group	Group	many2one		res	f	\N	\N	\N	\N
843	81	id	\N	ir.msg_ID	integer		res	f	\N	\N	\N	\N
844	81	rec_name	\N	ir.msg_record_name	char		res	f	\N	\N	\N	\N
845	81	user	res.user	User	many2one		res	f	\N	\N	\N	\N
846	81	write_date	\N	ir.msg_edited_at	timestamp		res	f	\N	\N	\N	\N
847	81	write_uid	res.user	ir.msg_edited_by	many2one		res	f	\N	\N	\N	\N
848	82	always	\N	Always	boolean		res	f	\N	\N	\N	\N
849	82	create_date	\N	ir.msg_created_at	timestamp		res	f	\N	\N	\N	\N
850	82	create_uid	res.user	ir.msg_created_by	many2one		res	f	\N	\N	\N	\N
851	82	id	\N	ir.msg_ID	integer		res	f	\N	\N	\N	\N
852	82	name	\N	Name	char		res	f	\N	\N	\N	\N
853	82	rec_name	\N	ir.msg_record_name	char		res	f	\N	\N	\N	\N
854	82	user	res.user	User	many2one		res	f	\N	\N	\N	\N
855	82	write_date	\N	ir.msg_edited_at	timestamp		res	f	\N	\N	\N	\N
856	82	write_uid	res.user	ir.msg_edited_by	many2one		res	f	\N	\N	\N	\N
857	83	application	\N	Application	selection		res	f	\N	\N	\N	\N
858	83	create_date	\N	ir.msg_created_at	timestamp		res	f	\N	\N	\N	\N
859	83	create_uid	res.user	ir.msg_created_by	many2one		res	f	\N	\N	\N	\N
860	83	id	\N	ir.msg_ID	integer		res	f	\N	\N	\N	\N
861	83	key	\N	Key	char		res	f	\N	\N	\N	\N
862	83	rec_name	\N	ir.msg_record_name	char		res	f	\N	\N	\N	\N
863	83	state	\N	State	selection		res	f	\N	\N	\N	\N
864	83	user	res.user	User	many2one		res	f	\N	\N	\N	\N
865	83	write_date	\N	ir.msg_edited_at	timestamp		res	f	\N	\N	\N	\N
866	83	write_uid	res.user	ir.msg_edited_by	many2one		res	f	\N	\N	\N	\N
867	84	id	\N	ir.msg_ID	integer		res	f	\N	\N	\N	\N
868	13	groups	ir.ui.menu-res.group	Groups	many2many		res	f	\N	\N	\N	\N
869	85	create_date	\N	ir.msg_created_at	timestamp		res	f	\N	\N	\N	\N
870	85	create_uid	res.user	ir.msg_created_by	many2one		res	f	\N	\N	\N	\N
871	85	group	res.group	Group	many2one		res	f	\N	\N	\N	\N
872	85	id	\N	ir.msg_ID	integer		res	f	\N	\N	\N	\N
873	85	menu	ir.ui.menu	Menu	many2one		res	f	\N	\N	\N	\N
874	85	rec_name	\N	ir.msg_record_name	char		res	f	\N	\N	\N	\N
875	85	write_date	\N	ir.msg_edited_at	timestamp		res	f	\N	\N	\N	\N
876	85	write_uid	res.user	ir.msg_edited_by	many2one		res	f	\N	\N	\N	\N
877	86	action	ir.action	Action	many2one		res	f	\N	\N	\N	\N
878	86	create_date	\N	ir.msg_created_at	timestamp		res	f	\N	\N	\N	\N
879	86	create_uid	res.user	ir.msg_created_by	many2one		res	f	\N	\N	\N	\N
880	86	group	res.group	Group	many2one		res	f	\N	\N	\N	\N
881	86	id	\N	ir.msg_ID	integer		res	f	\N	\N	\N	\N
882	86	rec_name	\N	ir.msg_record_name	char		res	f	\N	\N	\N	\N
883	86	write_date	\N	ir.msg_edited_at	timestamp		res	f	\N	\N	\N	\N
884	86	write_uid	res.user	ir.msg_edited_by	many2one		res	f	\N	\N	\N	\N
885	22	groups	ir.action-res.group	Groups	many2many		res	f	\N	\N	\N	\N
886	24	groups	ir.action-res.group	Groups	many2many		res	f	\N	\N	\N	\N
887	25	groups	ir.action-res.group	Groups	many2many		res	f	\N	\N	\N	\N
888	28	groups	ir.action-res.group	Groups	many2many		res	f	\N	\N	\N	\N
889	29	groups	ir.action-res.group	Groups	many2many		res	f	\N	\N	\N	\N
890	23	groups	res.group	Groups	one2many		res	f	\N	\N	\N	\N
891	34	groups	ir.model.button-res.group	Groups	many2many		res	f	\N	\N	\N	\N
892	87	active	\N	ir.msg_active	boolean	ir.msg_active_help	res	f	\N	\N	\N	\N
893	87	button	ir.model.button	Button	many2one		res	f	\N	\N	\N	\N
894	87	create_date	\N	ir.msg_created_at	timestamp		res	f	\N	\N	\N	\N
895	87	create_uid	res.user	ir.msg_created_by	many2one		res	f	\N	\N	\N	\N
896	87	group	res.group	Group	many2one		res	f	\N	\N	\N	\N
897	87	id	\N	ir.msg_ID	integer		res	f	\N	\N	\N	\N
898	87	rec_name	\N	ir.msg_record_name	char		res	f	\N	\N	\N	\N
899	87	write_date	\N	ir.msg_edited_at	timestamp		res	f	\N	\N	\N	\N
900	87	write_uid	res.user	ir.msg_edited_by	many2one		res	f	\N	\N	\N	\N
901	35	group	res.group	Group	many2one		res	f	\N	\N	\N	\N
902	36	user	res.user	User	many2one		res	f	\N	\N	\N	\N
903	50	groups	ir.rule.group-res.group	Groups	many2many		res	f	\N	\N	\N	\N
904	88	create_date	\N	ir.msg_created_at	timestamp		res	f	\N	\N	\N	\N
905	88	create_uid	res.user	ir.msg_created_by	many2one		res	f	\N	\N	\N	\N
906	88	group	res.group	Group	many2one		res	f	\N	\N	\N	\N
907	88	id	\N	ir.msg_ID	integer		res	f	\N	\N	\N	\N
908	88	rec_name	\N	ir.msg_record_name	char		res	f	\N	\N	\N	\N
909	88	rule_group	ir.rule.group	Rule Group	many2one		res	f	\N	\N	\N	\N
910	88	write_date	\N	ir.msg_edited_at	timestamp		res	f	\N	\N	\N	\N
911	88	write_uid	res.user	ir.msg_edited_by	many2one		res	f	\N	\N	\N	\N
912	10	groups	ir.sequence.type-res.group	User Groups	many2many	Groups allowed to edit the sequences of this type.	res	f	\N	\N	\N	\N
913	89	create_date	\N	ir.msg_created_at	timestamp		res	f	\N	\N	\N	\N
914	89	create_uid	res.user	ir.msg_created_by	many2one		res	f	\N	\N	\N	\N
915	89	group	res.group	User Groups	many2one		res	f	\N	\N	\N	\N
916	89	id	\N	ir.msg_ID	integer		res	f	\N	\N	\N	\N
917	89	rec_name	\N	ir.msg_record_name	char		res	f	\N	\N	\N	\N
918	89	sequence_type	ir.sequence.type	Sequence Type	many2one		res	f	\N	\N	\N	\N
919	89	write_date	\N	ir.msg_edited_at	timestamp		res	f	\N	\N	\N	\N
920	89	write_uid	res.user	ir.msg_edited_by	many2one		res	f	\N	\N	\N	\N
921	48	groups	ir.export-res.group	Groups	many2many	The user groups that can use the export.	res	f	\N	\N	\N	\N
922	48	write_groups	ir.export-write-res.group	Modification Groups	many2many	The user groups that can modify the export.	res	f	\N	\N	\N	\N
923	90	create_date	\N	ir.msg_created_at	timestamp		res	f	\N	\N	\N	\N
924	90	create_uid	res.user	ir.msg_created_by	many2one		res	f	\N	\N	\N	\N
925	90	export	ir.export	Export	many2one		res	f	\N	\N	\N	\N
926	90	group	res.group	Group	many2one		res	f	\N	\N	\N	\N
927	90	id	\N	ir.msg_ID	integer		res	f	\N	\N	\N	\N
928	90	rec_name	\N	ir.msg_record_name	char		res	f	\N	\N	\N	\N
929	90	write_date	\N	ir.msg_edited_at	timestamp		res	f	\N	\N	\N	\N
930	90	write_uid	res.user	ir.msg_edited_by	many2one		res	f	\N	\N	\N	\N
931	91	create_date	\N	ir.msg_created_at	timestamp		res	f	\N	\N	\N	\N
932	91	create_uid	res.user	ir.msg_created_by	many2one		res	f	\N	\N	\N	\N
933	91	export	ir.export	Export	many2one		res	f	\N	\N	\N	\N
934	91	group	res.group	Group	many2one		res	f	\N	\N	\N	\N
935	91	id	\N	ir.msg_ID	integer		res	f	\N	\N	\N	\N
936	91	rec_name	\N	ir.msg_record_name	char		res	f	\N	\N	\N	\N
937	91	write_date	\N	ir.msg_edited_at	timestamp		res	f	\N	\N	\N	\N
938	91	write_uid	res.user	ir.msg_edited_by	many2one		res	f	\N	\N	\N	\N
\.


--
-- Data for Name: ir_model_field_access; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_model_field_access (id, active, create_date, create_uid, description, field, "group", perm_create, perm_delete, perm_read, perm_write, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_module; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_module (id, create_uid, create_date, write_date, write_uid, name, state) FROM stdin;
1	0	2023-01-18 22:26:44.008778	\N	\N	ir	activated
2	0	2023-01-18 22:26:44.008778	\N	\N	res	activated
3	0	2023-01-18 22:27:21.493984	\N	\N	carrier_carriage	not activated
4	0	2023-01-18 22:27:21.493984	\N	\N	carrier_subdivision	not activated
5	0	2023-01-18 22:27:21.493984	\N	\N	account_es	not activated
6	0	2023-01-18 22:27:21.493984	\N	\N	sale_stock_quantity	not activated
7	0	2023-01-18 22:27:21.493984	\N	\N	company_work_time	not activated
8	0	2023-01-18 22:27:21.493984	\N	\N	commission_waiting	not activated
9	0	2023-01-18 22:27:21.493984	\N	\N	product_kit	not activated
10	0	2023-01-18 22:27:21.493984	\N	\N	stock_inventory_location	not activated
11	0	2023-01-18 22:27:21.493984	\N	\N	purchase_request_quotation	not activated
12	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice_secondary_unit	not activated
13	0	2023-01-18 22:27:21.493984	\N	\N	project	not activated
14	0	2023-01-18 22:27:21.493984	\N	\N	product	not activated
15	0	2023-01-18 22:27:21.493984	\N	\N	product_price_list_parent	not activated
16	0	2023-01-18 22:27:21.493984	\N	\N	account_asset	not activated
17	0	2023-01-18 22:27:21.493984	\N	\N	purchase	not activated
18	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice_stock	not activated
19	0	2023-01-18 22:27:21.493984	\N	\N	product_price_list_dates	not activated
20	0	2023-01-18 22:27:21.493984	\N	\N	stock_quantity_issue	not activated
21	0	2023-01-18 22:27:21.493984	\N	\N	product_cost_fifo	not activated
22	0	2023-01-18 22:27:21.493984	\N	\N	company	not activated
23	0	2023-01-18 22:27:21.493984	\N	\N	sale_opportunity	not activated
24	0	2023-01-18 22:27:21.493984	\N	\N	currency_rs	not activated
25	0	2023-01-18 22:27:21.493984	\N	\N	project_plan	not activated
26	0	2023-01-18 22:27:21.493984	\N	\N	analytic_account	not activated
27	0	2023-01-18 22:27:21.493984	\N	\N	user_role	not activated
28	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice_history	not activated
29	0	2023-01-18 22:27:21.493984	\N	\N	analytic_purchase	not activated
30	0	2023-01-18 22:27:21.493984	\N	\N	account_consolidation	not activated
31	0	2023-01-18 22:27:21.493984	\N	\N	purchase_history	not activated
32	0	2023-01-18 22:27:21.493984	\N	\N	sale_supply_production	not activated
33	0	2023-01-18 22:27:21.493984	\N	\N	sale_shipment_cost	not activated
34	0	2023-01-18 22:27:21.493984	\N	\N	purchase_amendment	not activated
35	0	2023-01-18 22:27:21.493984	\N	\N	sale_subscription	not activated
36	0	2023-01-18 22:27:21.493984	\N	\N	production	not activated
37	0	2023-01-18 22:27:21.493984	\N	\N	sale_extra	not activated
38	0	2023-01-18 22:27:21.493984	\N	\N	sale_subscription_asset	not activated
39	0	2023-01-18 22:27:21.493984	\N	\N	account_dunning_letter	not activated
40	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice_correction	not activated
41	0	2023-01-18 22:27:21.493984	\N	\N	account_stock_landed_cost_weight	not activated
42	0	2023-01-18 22:27:21.493984	\N	\N	account_budget	not activated
43	0	2023-01-18 22:27:21.493984	\N	\N	stock_split	not activated
44	0	2023-01-18 22:27:21.493984	\N	\N	sale_promotion_coupon	not activated
45	0	2023-01-18 22:27:21.493984	\N	\N	web_shop	not activated
46	0	2023-01-18 22:27:21.493984	\N	\N	account_statement	not activated
47	0	2023-01-18 22:27:21.493984	\N	\N	account_stock_landed_cost	not activated
48	0	2023-01-18 22:27:21.493984	\N	\N	sale_price_list	not activated
49	0	2023-01-18 22:27:21.493984	\N	\N	account_eu	not activated
50	0	2023-01-18 22:27:21.493984	\N	\N	sale_product_recommendation	not activated
51	0	2023-01-18 22:27:21.493984	\N	\N	purchase_secondary_unit	not activated
52	0	2023-01-18 22:27:21.493984	\N	\N	stock_package_shipping_ups	not activated
53	0	2023-01-18 22:27:21.493984	\N	\N	web_shop_shopify	not activated
54	0	2023-01-18 22:27:21.493984	\N	\N	stock_supply_day	not activated
55	0	2023-01-18 22:27:21.493984	\N	\N	sale_supply	not activated
56	0	2023-01-18 22:27:21.493984	\N	\N	account_payment	not activated
57	0	2023-01-18 22:27:21.493984	\N	\N	stock_forecast	not activated
58	0	2023-01-18 22:27:21.493984	\N	\N	production_outsourcing	not activated
59	0	2023-01-18 22:27:21.493984	\N	\N	stock_shipment_measurements	not activated
60	0	2023-01-18 22:27:21.493984	\N	\N	account_payment_braintree	not activated
61	0	2023-01-18 22:27:21.493984	\N	\N	country	not activated
62	0	2023-01-18 22:27:21.493984	\N	\N	project_revenue	not activated
63	0	2023-01-18 22:27:21.493984	\N	\N	bank	not activated
64	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice_watermark	not activated
65	0	2023-01-18 22:27:21.493984	\N	\N	timesheet_cost	not activated
66	0	2023-01-18 22:27:21.493984	\N	\N	account_stock_shipment_cost_weight	not activated
67	0	2023-01-18 22:27:21.493984	\N	\N	production_work	not activated
68	0	2023-01-18 22:27:21.493984	\N	\N	sale	not activated
69	0	2023-01-18 22:27:21.493984	\N	\N	account_fr	not activated
70	0	2023-01-18 22:27:21.493984	\N	\N	product_image	not activated
71	0	2023-01-18 22:27:21.493984	\N	\N	account_rule	not activated
72	0	2023-01-18 22:27:21.493984	\N	\N	web_shop_vue_storefront_stripe	not activated
73	0	2023-01-18 22:27:21.493984	\N	\N	stock_supply	not activated
74	0	2023-01-18 22:27:21.493984	\N	\N	commission	not activated
75	0	2023-01-18 22:27:21.493984	\N	\N	purchase_request	not activated
76	0	2023-01-18 22:27:21.493984	\N	\N	stock	not activated
77	0	2023-01-18 22:27:21.493984	\N	\N	google_maps	not activated
78	0	2023-01-18 22:27:21.493984	\N	\N	sale_complaint	not activated
79	0	2023-01-18 22:27:21.493984	\N	\N	sale_shipment_tolerance	not activated
80	0	2023-01-18 22:27:21.493984	\N	\N	account_statement_coda	not activated
81	0	2023-01-18 22:27:21.493984	\N	\N	product_measurements	not activated
82	0	2023-01-18 22:27:21.493984	\N	\N	account_statement_ofx	not activated
83	0	2023-01-18 22:27:21.493984	\N	\N	carrier_weight	not activated
84	0	2023-01-18 22:27:21.493984	\N	\N	purchase_blanket_agreement	not activated
85	0	2023-01-18 22:27:21.493984	\N	\N	account_product	not activated
86	0	2023-01-18 22:27:21.493984	\N	\N	sale_promotion_coupon_payment	not activated
87	0	2023-01-18 22:27:21.493984	\N	\N	customs	not activated
88	0	2023-01-18 22:27:21.493984	\N	\N	sale_promotion	not activated
89	0	2023-01-18 22:27:21.493984	\N	\N	product_classification_taxonomic	not activated
90	0	2023-01-18 22:27:21.493984	\N	\N	sale_product_recommendation_association_rule	not activated
91	0	2023-01-18 22:27:21.493984	\N	\N	sale_amendment	not activated
92	0	2023-01-18 22:27:21.493984	\N	\N	stock_lot_sled	not activated
93	0	2023-01-18 22:27:21.493984	\N	\N	production_split	not activated
94	0	2023-01-18 22:27:21.493984	\N	\N	sale_history	not activated
95	0	2023-01-18 22:27:21.493984	\N	\N	marketing_email	not activated
96	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice_defer	not activated
97	0	2023-01-18 22:27:21.493984	\N	\N	sale_payment	not activated
98	0	2023-01-18 22:27:21.493984	\N	\N	sale_invoice_grouping	not activated
99	0	2023-01-18 22:27:21.493984	\N	\N	account_fr_chorus	not activated
100	0	2023-01-18 22:27:21.493984	\N	\N	production_routing	not activated
101	0	2023-01-18 22:27:21.493984	\N	\N	carrier_percentage	not activated
102	0	2023-01-18 22:27:21.493984	\N	\N	sale_product_quantity	not activated
103	0	2023-01-18 22:27:21.493984	\N	\N	product_image_attribute	not activated
104	0	2023-01-18 22:27:21.493984	\N	\N	marketing	not activated
105	0	2023-01-18 22:27:21.493984	\N	\N	sale_gift_card	not activated
106	0	2023-01-18 22:27:21.493984	\N	\N	web_shortener	not activated
107	0	2023-01-18 22:27:21.493984	\N	\N	account_dunning_fee	not activated
108	0	2023-01-18 22:27:21.493984	\N	\N	party_relationship	not activated
109	0	2023-01-18 22:27:21.493984	\N	\N	carrier	not activated
110	0	2023-01-18 22:27:21.493984	\N	\N	account_dunning	not activated
111	0	2023-01-18 22:27:21.493984	\N	\N	authentication_sms	not activated
112	0	2023-01-18 22:27:21.493984	\N	\N	production_work_timesheet	not activated
113	0	2023-01-18 22:27:21.493984	\N	\N	account_deposit	not activated
114	0	2023-01-18 22:27:21.493984	\N	\N	account_de_skr03	not activated
115	0	2023-01-18 22:27:21.493984	\N	\N	account_payment_clearing	not activated
116	0	2023-01-18 22:27:21.493984	\N	\N	purchase_requisition	not activated
117	0	2023-01-18 22:27:21.493984	\N	\N	account_stock_continental	not activated
118	0	2023-01-18 22:27:21.493984	\N	\N	party_avatar	not activated
119	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	not activated
120	0	2023-01-18 22:27:21.493984	\N	\N	currency	not activated
121	0	2023-01-18 22:27:21.493984	\N	\N	sale_secondary_unit	not activated
122	0	2023-01-18 22:27:21.493984	\N	\N	ldap_authentication	not activated
123	0	2023-01-18 22:27:21.493984	\N	\N	stock_consignment	not activated
124	0	2023-01-18 22:27:21.493984	\N	\N	tests	not activated
125	0	2023-01-18 22:27:21.493984	\N	\N	stock_location_sequence	not activated
126	0	2023-01-18 22:27:21.493984	\N	\N	account_stock_anglo_saxon	not activated
127	0	2023-01-18 22:27:21.493984	\N	\N	attendance	not activated
128	0	2023-01-18 22:27:21.493984	\N	\N	account_statement_sepa	not activated
129	0	2023-01-18 22:27:21.493984	\N	\N	sale_discount	not activated
130	0	2023-01-18 22:27:21.493984	\N	\N	sale_advance_payment	not activated
131	0	2023-01-18 22:27:21.493984	\N	\N	account	not activated
132	0	2023-01-18 22:27:21.493984	\N	\N	marketing_automation	not activated
133	0	2023-01-18 22:27:21.493984	\N	\N	currency_ro	not activated
134	0	2023-01-18 22:27:21.493984	\N	\N	incoterm	not activated
135	0	2023-01-18 22:27:21.493984	\N	\N	stock_lot	not activated
136	0	2023-01-18 22:27:21.493984	\N	\N	sale_product_customer	not activated
137	0	2023-01-18 22:27:21.493984	\N	\N	account_tax_cash	not activated
138	0	2023-01-18 22:27:21.493984	\N	\N	edocument_unece	not activated
139	0	2023-01-18 22:27:21.493984	\N	\N	product_cost_warehouse	not activated
140	0	2023-01-18 22:27:21.493984	\N	\N	stock_shipment_cost_weight	not activated
141	0	2023-01-18 22:27:21.493984	\N	\N	timesheet	not activated
142	0	2023-01-18 22:27:21.493984	\N	\N	stock_lot_unit	not activated
143	0	2023-01-18 22:27:21.493984	\N	\N	party_siret	not activated
144	0	2023-01-18 22:27:21.493984	\N	\N	account_move_line_grouping	not activated
145	0	2023-01-18 22:27:21.493984	\N	\N	stock_package_shipping_dpd	not activated
146	0	2023-01-18 22:27:21.493984	\N	\N	project_invoice	not activated
147	0	2023-01-18 22:27:21.493984	\N	\N	party	not activated
148	0	2023-01-18 22:27:21.493984	\N	\N	analytic_budget	not activated
149	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice_line_standalone	not activated
150	0	2023-01-18 22:27:21.493984	\N	\N	stock_secondary_unit	not activated
151	0	2023-01-18 22:27:21.493984	\N	\N	product_price_list	not activated
152	0	2023-01-18 22:27:21.493984	\N	\N	stock_location_move	not activated
153	0	2023-01-18 22:27:21.493984	\N	\N	dashboard	not activated
154	0	2023-01-18 22:27:21.493984	\N	\N	account_cash_rounding	not activated
155	0	2023-01-18 22:27:21.493984	\N	\N	stock_quantity_early_planning	not activated
156	0	2023-01-18 22:27:21.493984	\N	\N	product_attribute	not activated
157	0	2023-01-18 22:27:21.493984	\N	\N	stock_package	not activated
158	0	2023-01-18 22:27:21.493984	\N	\N	sale_invoice_date	not activated
159	0	2023-01-18 22:27:21.493984	\N	\N	account_be	not activated
160	0	2023-01-18 22:27:21.493984	\N	\N	account_es_sii	not activated
161	0	2023-01-18 22:27:21.493984	\N	\N	analytic_invoice	not activated
162	0	2023-01-18 22:27:21.493984	\N	\N	marketing_campaign	not activated
163	0	2023-01-18 22:27:21.493984	\N	\N	product_classification	not activated
164	0	2023-01-18 22:27:21.493984	\N	\N	sale_supply_drop_shipment	not activated
165	0	2023-01-18 22:27:21.493984	\N	\N	purchase_shipment_cost	not activated
166	0	2023-01-18 22:27:21.493984	\N	\N	authentication_saml	not activated
167	0	2023-01-18 22:27:21.493984	\N	\N	stock_assign_manual	not activated
168	0	2023-01-18 22:27:21.493984	\N	\N	stock_package_shipping_mygls	not activated
169	0	2023-01-18 22:27:21.493984	\N	\N	sale_point	not activated
170	0	2023-01-18 22:27:21.493984	\N	\N	stock_shipment_cost	not activated
171	0	2023-01-18 22:27:21.493984	\N	\N	sale_shipment_grouping	not activated
172	0	2023-01-18 22:27:21.493984	\N	\N	account_receivable_rule	not activated
173	0	2023-01-18 22:27:21.493984	\N	\N	purchase_invoice_line_standalone	not activated
174	0	2023-01-18 22:27:21.493984	\N	\N	sale_blanket_agreement	not activated
175	0	2023-01-18 22:27:21.493984	\N	\N	web_shop_vue_storefront	not activated
176	0	2023-01-18 22:27:21.493984	\N	\N	stock_package_shipping_sendcloud	not activated
177	0	2023-01-18 22:27:21.493984	\N	\N	stock_package_shipping	not activated
178	0	2023-01-18 22:27:21.493984	\N	\N	account_payment_sepa	not activated
179	0	2023-01-18 22:27:21.493984	\N	\N	analytic_sale	not activated
180	0	2023-01-18 22:27:21.493984	\N	\N	account_payment_sepa_cfonb	not activated
181	0	2023-01-18 22:27:21.493984	\N	\N	account_credit_limit	not activated
182	0	2023-01-18 22:27:21.493984	\N	\N	account_tax_rule_country	not activated
183	0	2023-01-18 22:27:21.493984	\N	\N	account_tax_non_deductible	not activated
184	0	2023-01-18 22:27:21.493984	\N	\N	account_statement_aeb43	not activated
185	0	2023-01-18 22:27:21.493984	\N	\N	account_dunning_email	not activated
186	0	2023-01-18 22:27:21.493984	\N	\N	sale_credit_limit	not activated
187	0	2023-01-18 22:27:21.493984	\N	\N	stock_supply_forecast	not activated
188	0	2023-01-18 22:27:21.493984	\N	\N	stock_supply_production	not activated
189	0	2023-01-18 22:27:21.493984	\N	\N	account_stock_shipment_cost	not activated
190	0	2023-01-18 22:27:21.493984	\N	\N	stock_product_location	not activated
191	0	2023-01-18 22:27:21.493984	\N	\N	web_user	not activated
192	0	2023-01-18 22:27:21.493984	\N	\N	purchase_price_list	not activated
193	0	2023-01-18 22:27:21.493984	\N	\N	account_payment_stripe	not activated
194	0	2023-01-18 22:27:21.493984	\N	\N	notification_email	not activated
195	0	2023-01-18 22:27:21.493984	\N	\N	product_cost_history	not activated
196	0	2023-01-18 22:27:21.493984	\N	\N	edocument_uncefact	not activated
\.


--
-- Data for Name: ir_module_config_wizard_item; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_module_config_wizard_item (id, action, create_date, create_uid, sequence, state, write_date, write_uid) FROM stdin;
1	34	2023-01-18 22:26:47.309666	0	10	open	\N	\N
2	48	2023-01-18 22:26:47.309666	0	10000	open	\N	\N
3	57	2023-01-18 22:27:08.693829	0	10	open	\N	\N
\.


--
-- Data for Name: ir_module_dependency; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_module_dependency (id, create_uid, create_date, write_date, write_uid, name, module) FROM stdin;
1	0	2023-01-18 22:26:44.008778	\N	\N	ir	2
2	0	2023-01-18 22:27:21.493984	\N	\N	carrier	3
3	0	2023-01-18 22:27:21.493984	\N	\N	ir	3
4	0	2023-01-18 22:27:21.493984	\N	\N	stock	3
5	0	2023-01-18 22:27:21.493984	\N	\N	stock_shipment_cost	3
6	0	2023-01-18 22:27:21.493984	\N	\N	ir	4
7	0	2023-01-18 22:27:21.493984	\N	\N	carrier	4
8	0	2023-01-18 22:27:21.493984	\N	\N	company	5
9	0	2023-01-18 22:27:21.493984	\N	\N	currency	5
10	0	2023-01-18 22:27:21.493984	\N	\N	ir	5
11	0	2023-01-18 22:27:21.493984	\N	\N	account	5
12	0	2023-01-18 22:27:21.493984	\N	\N	account_eu	5
13	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	5
14	0	2023-01-18 22:27:21.493984	\N	\N	party	5
15	0	2023-01-18 22:27:21.493984	\N	\N	product	6
16	0	2023-01-18 22:27:21.493984	\N	\N	sale	6
17	0	2023-01-18 22:27:21.493984	\N	\N	stock	6
18	0	2023-01-18 22:27:21.493984	\N	\N	company	7
19	0	2023-01-18 22:27:21.493984	\N	\N	ir	7
20	0	2023-01-18 22:27:21.493984	\N	\N	account	8
21	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	8
22	0	2023-01-18 22:27:21.493984	\N	\N	commission	8
23	0	2023-01-18 22:27:21.493984	\N	\N	ir	8
24	0	2023-01-18 22:27:21.493984	\N	\N	ir	9
25	0	2023-01-18 22:27:21.493984	\N	\N	product	9
26	0	2023-01-18 22:27:21.493984	\N	\N	company	10
27	0	2023-01-18 22:27:21.493984	\N	\N	ir	10
28	0	2023-01-18 22:27:21.493984	\N	\N	product	10
29	0	2023-01-18 22:27:21.493984	\N	\N	stock	10
30	0	2023-01-18 22:27:21.493984	\N	\N	ir	11
31	0	2023-01-18 22:27:21.493984	\N	\N	company	11
32	0	2023-01-18 22:27:21.493984	\N	\N	currency	11
33	0	2023-01-18 22:27:21.493984	\N	\N	party	11
34	0	2023-01-18 22:27:21.493984	\N	\N	product	11
35	0	2023-01-18 22:27:21.493984	\N	\N	purchase_request	11
36	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	12
37	0	2023-01-18 22:27:21.493984	\N	\N	ir	12
38	0	2023-01-18 22:27:21.493984	\N	\N	product	12
39	0	2023-01-18 22:27:21.493984	\N	\N	company	13
40	0	2023-01-18 22:27:21.493984	\N	\N	company_work_time	13
41	0	2023-01-18 22:27:21.493984	\N	\N	ir	13
42	0	2023-01-18 22:27:21.493984	\N	\N	party	13
43	0	2023-01-18 22:27:21.493984	\N	\N	timesheet	13
44	0	2023-01-18 22:27:21.493984	\N	\N	company	14
45	0	2023-01-18 22:27:21.493984	\N	\N	ir	14
46	0	2023-01-18 22:27:21.493984	\N	\N	res	14
47	0	2023-01-18 22:27:21.493984	\N	\N	ir	15
48	0	2023-01-18 22:27:21.493984	\N	\N	product_price_list	15
49	0	2023-01-18 22:27:21.493984	\N	\N	ir	16
50	0	2023-01-18 22:27:21.493984	\N	\N	res	16
51	0	2023-01-18 22:27:21.493984	\N	\N	account	16
52	0	2023-01-18 22:27:21.493984	\N	\N	account_product	16
53	0	2023-01-18 22:27:21.493984	\N	\N	product	16
54	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	16
55	0	2023-01-18 22:27:21.493984	\N	\N	account	17
56	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	17
57	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice_stock	17
58	0	2023-01-18 22:27:21.493984	\N	\N	account_product	17
59	0	2023-01-18 22:27:21.493984	\N	\N	company	17
60	0	2023-01-18 22:27:21.493984	\N	\N	currency	17
61	0	2023-01-18 22:27:21.493984	\N	\N	ir	17
62	0	2023-01-18 22:27:21.493984	\N	\N	party	17
63	0	2023-01-18 22:27:21.493984	\N	\N	product	17
64	0	2023-01-18 22:27:21.493984	\N	\N	res	17
65	0	2023-01-18 22:27:21.493984	\N	\N	stock	17
66	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	18
67	0	2023-01-18 22:27:21.493984	\N	\N	stock	18
68	0	2023-01-18 22:27:21.493984	\N	\N	ir	18
69	0	2023-01-18 22:27:21.493984	\N	\N	product	18
70	0	2023-01-18 22:27:21.493984	\N	\N	ir	19
71	0	2023-01-18 22:27:21.493984	\N	\N	product_price_list	19
72	0	2023-01-18 22:27:21.493984	\N	\N	company	20
73	0	2023-01-18 22:27:21.493984	\N	\N	ir	20
74	0	2023-01-18 22:27:21.493984	\N	\N	product	20
75	0	2023-01-18 22:27:21.493984	\N	\N	stock	20
76	0	2023-01-18 22:27:21.493984	\N	\N	ir	21
77	0	2023-01-18 22:27:21.493984	\N	\N	product	21
78	0	2023-01-18 22:27:21.493984	\N	\N	stock	21
79	0	2023-01-18 22:27:21.493984	\N	\N	currency	22
80	0	2023-01-18 22:27:21.493984	\N	\N	ir	22
81	0	2023-01-18 22:27:21.493984	\N	\N	party	22
82	0	2023-01-18 22:27:21.493984	\N	\N	res	22
83	0	2023-01-18 22:27:21.493984	\N	\N	account	23
84	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	23
85	0	2023-01-18 22:27:21.493984	\N	\N	company	23
86	0	2023-01-18 22:27:21.493984	\N	\N	currency	23
87	0	2023-01-18 22:27:21.493984	\N	\N	party	23
88	0	2023-01-18 22:27:21.493984	\N	\N	product	23
89	0	2023-01-18 22:27:21.493984	\N	\N	sale	23
90	0	2023-01-18 22:27:21.493984	\N	\N	stock	23
91	0	2023-01-18 22:27:21.493984	\N	\N	currency	24
92	0	2023-01-18 22:27:21.493984	\N	\N	ir	24
93	0	2023-01-18 22:27:21.493984	\N	\N	ir	25
94	0	2023-01-18 22:27:21.493984	\N	\N	company	25
95	0	2023-01-18 22:27:21.493984	\N	\N	project	25
96	0	2023-01-18 22:27:21.493984	\N	\N	timesheet	25
97	0	2023-01-18 22:27:21.493984	\N	\N	account	26
98	0	2023-01-18 22:27:21.493984	\N	\N	company	26
99	0	2023-01-18 22:27:21.493984	\N	\N	currency	26
100	0	2023-01-18 22:27:21.493984	\N	\N	ir	26
101	0	2023-01-18 22:27:21.493984	\N	\N	party	26
102	0	2023-01-18 22:27:21.493984	\N	\N	res	26
103	0	2023-01-18 22:27:21.493984	\N	\N	ir	27
104	0	2023-01-18 22:27:21.493984	\N	\N	res	27
105	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	28
106	0	2023-01-18 22:27:21.493984	\N	\N	party	28
107	0	2023-01-18 22:27:21.493984	\N	\N	analytic_account	29
108	0	2023-01-18 22:27:21.493984	\N	\N	analytic_invoice	29
109	0	2023-01-18 22:27:21.493984	\N	\N	purchase	29
110	0	2023-01-18 22:27:21.493984	\N	\N	account	30
111	0	2023-01-18 22:27:21.493984	\N	\N	company	30
112	0	2023-01-18 22:27:21.493984	\N	\N	currency	30
113	0	2023-01-18 22:27:21.493984	\N	\N	ir	30
114	0	2023-01-18 22:27:21.493984	\N	\N	ir	31
115	0	2023-01-18 22:27:21.493984	\N	\N	purchase	31
116	0	2023-01-18 22:27:21.493984	\N	\N	ir	32
117	0	2023-01-18 22:27:21.493984	\N	\N	production	32
118	0	2023-01-18 22:27:21.493984	\N	\N	sale_supply	32
119	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	33
120	0	2023-01-18 22:27:21.493984	\N	\N	carrier	33
121	0	2023-01-18 22:27:21.493984	\N	\N	currency	33
122	0	2023-01-18 22:27:21.493984	\N	\N	ir	33
123	0	2023-01-18 22:27:21.493984	\N	\N	product	33
124	0	2023-01-18 22:27:21.493984	\N	\N	res	33
125	0	2023-01-18 22:27:21.493984	\N	\N	sale	33
126	0	2023-01-18 22:27:21.493984	\N	\N	stock	33
127	0	2023-01-18 22:27:21.493984	\N	\N	stock_shipment_cost	33
128	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	34
129	0	2023-01-18 22:27:21.493984	\N	\N	ir	34
130	0	2023-01-18 22:27:21.493984	\N	\N	purchase	34
131	0	2023-01-18 22:27:21.493984	\N	\N	purchase_history	34
132	0	2023-01-18 22:27:21.493984	\N	\N	stock	34
133	0	2023-01-18 22:27:21.493984	\N	\N	account	35
134	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	35
135	0	2023-01-18 22:27:21.493984	\N	\N	company	35
136	0	2023-01-18 22:27:21.493984	\N	\N	currency	35
137	0	2023-01-18 22:27:21.493984	\N	\N	ir	35
138	0	2023-01-18 22:27:21.493984	\N	\N	product	35
139	0	2023-01-18 22:27:21.493984	\N	\N	res	35
140	0	2023-01-18 22:27:21.493984	\N	\N	sale	35
141	0	2023-01-18 22:27:21.493984	\N	\N	company	36
142	0	2023-01-18 22:27:21.493984	\N	\N	ir	36
143	0	2023-01-18 22:27:21.493984	\N	\N	product	36
144	0	2023-01-18 22:27:21.493984	\N	\N	res	36
145	0	2023-01-18 22:27:21.493984	\N	\N	stock	36
146	0	2023-01-18 22:27:21.493984	\N	\N	company	37
147	0	2023-01-18 22:27:21.493984	\N	\N	ir	37
148	0	2023-01-18 22:27:21.493984	\N	\N	product	37
149	0	2023-01-18 22:27:21.493984	\N	\N	product_price_list	37
150	0	2023-01-18 22:27:21.493984	\N	\N	res	37
151	0	2023-01-18 22:27:21.493984	\N	\N	sale	37
152	0	2023-01-18 22:27:21.493984	\N	\N	sale_price_list	37
153	0	2023-01-18 22:27:21.493984	\N	\N	ir	38
154	0	2023-01-18 22:27:21.493984	\N	\N	sale_subscription	38
155	0	2023-01-18 22:27:21.493984	\N	\N	stock_lot	38
156	0	2023-01-18 22:27:21.493984	\N	\N	account	39
157	0	2023-01-18 22:27:21.493984	\N	\N	account_dunning	39
158	0	2023-01-18 22:27:21.493984	\N	\N	company	39
159	0	2023-01-18 22:27:21.493984	\N	\N	ir	39
160	0	2023-01-18 22:27:21.493984	\N	\N	party	39
161	0	2023-01-18 22:27:21.493984	\N	\N	ir	40
162	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	40
163	0	2023-01-18 22:27:21.493984	\N	\N	account_stock_landed_cost	41
164	0	2023-01-18 22:27:21.493984	\N	\N	ir	41
165	0	2023-01-18 22:27:21.493984	\N	\N	product	41
166	0	2023-01-18 22:27:21.493984	\N	\N	product_measurements	41
167	0	2023-01-18 22:27:21.493984	\N	\N	stock_shipment_measurements	41
168	0	2023-01-18 22:27:21.493984	\N	\N	account	42
169	0	2023-01-18 22:27:21.493984	\N	\N	company	42
170	0	2023-01-18 22:27:21.493984	\N	\N	currency	42
171	0	2023-01-18 22:27:21.493984	\N	\N	ir	43
172	0	2023-01-18 22:27:21.493984	\N	\N	stock	43
173	0	2023-01-18 22:27:21.493984	\N	\N	company	44
174	0	2023-01-18 22:27:21.493984	\N	\N	ir	44
175	0	2023-01-18 22:27:21.493984	\N	\N	sale	44
176	0	2023-01-18 22:27:21.493984	\N	\N	sale_promotion	44
177	0	2023-01-18 22:27:21.493984	\N	\N	account	45
178	0	2023-01-18 22:27:21.493984	\N	\N	company	45
179	0	2023-01-18 22:27:21.493984	\N	\N	currency	45
180	0	2023-01-18 22:27:21.493984	\N	\N	ir	45
181	0	2023-01-18 22:27:21.493984	\N	\N	product	45
182	0	2023-01-18 22:27:21.493984	\N	\N	sale	45
183	0	2023-01-18 22:27:21.493984	\N	\N	stock	45
184	0	2023-01-18 22:27:21.493984	\N	\N	web_user	45
185	0	2023-01-18 22:27:21.493984	\N	\N	account	46
186	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	46
187	0	2023-01-18 22:27:21.493984	\N	\N	bank	46
188	0	2023-01-18 22:27:21.493984	\N	\N	company	46
189	0	2023-01-18 22:27:21.493984	\N	\N	currency	46
190	0	2023-01-18 22:27:21.493984	\N	\N	party	46
191	0	2023-01-18 22:27:21.493984	\N	\N	account	47
192	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	47
193	0	2023-01-18 22:27:21.493984	\N	\N	ir	47
194	0	2023-01-18 22:27:21.493984	\N	\N	product	47
195	0	2023-01-18 22:27:21.493984	\N	\N	res	47
196	0	2023-01-18 22:27:21.493984	\N	\N	stock	47
197	0	2023-01-18 22:27:21.493984	\N	\N	company	48
198	0	2023-01-18 22:27:21.493984	\N	\N	ir	48
199	0	2023-01-18 22:27:21.493984	\N	\N	party	48
200	0	2023-01-18 22:27:21.493984	\N	\N	product_price_list	48
201	0	2023-01-18 22:27:21.493984	\N	\N	sale	48
202	0	2023-01-18 22:27:21.493984	\N	\N	account	49
203	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	49
204	0	2023-01-18 22:27:21.493984	\N	\N	company	49
205	0	2023-01-18 22:27:21.493984	\N	\N	currency	49
206	0	2023-01-18 22:27:21.493984	\N	\N	ir	49
207	0	2023-01-18 22:27:21.493984	\N	\N	party	49
208	0	2023-01-18 22:27:21.493984	\N	\N	ir	50
209	0	2023-01-18 22:27:21.493984	\N	\N	product	50
210	0	2023-01-18 22:27:21.493984	\N	\N	sale	50
211	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	51
212	0	2023-01-18 22:27:21.493984	\N	\N	ir	51
213	0	2023-01-18 22:27:21.493984	\N	\N	product	51
214	0	2023-01-18 22:27:21.493984	\N	\N	purchase	51
215	0	2023-01-18 22:27:21.493984	\N	\N	stock	51
216	0	2023-01-18 22:27:21.493984	\N	\N	ir	52
217	0	2023-01-18 22:27:21.493984	\N	\N	res	52
218	0	2023-01-18 22:27:21.493984	\N	\N	party	52
219	0	2023-01-18 22:27:21.493984	\N	\N	product	52
220	0	2023-01-18 22:27:21.493984	\N	\N	stock	52
221	0	2023-01-18 22:27:21.493984	\N	\N	stock_shipment_measurements	52
222	0	2023-01-18 22:27:21.493984	\N	\N	stock_package	52
223	0	2023-01-18 22:27:21.493984	\N	\N	stock_package_shipping	52
224	0	2023-01-18 22:27:21.493984	\N	\N	account_payment	53
225	0	2023-01-18 22:27:21.493984	\N	\N	currency	53
226	0	2023-01-18 22:27:21.493984	\N	\N	ir	53
227	0	2023-01-18 22:27:21.493984	\N	\N	party	53
228	0	2023-01-18 22:27:21.493984	\N	\N	product	53
229	0	2023-01-18 22:27:21.493984	\N	\N	product_attribute	53
230	0	2023-01-18 22:27:21.493984	\N	\N	sale	53
231	0	2023-01-18 22:27:21.493984	\N	\N	sale_amendment	53
232	0	2023-01-18 22:27:21.493984	\N	\N	sale_payment	53
233	0	2023-01-18 22:27:21.493984	\N	\N	stock	53
234	0	2023-01-18 22:27:21.493984	\N	\N	web_shop	53
235	0	2023-01-18 22:27:21.493984	\N	\N	ir	54
236	0	2023-01-18 22:27:21.493984	\N	\N	purchase	54
237	0	2023-01-18 22:27:21.493984	\N	\N	ir	55
238	0	2023-01-18 22:27:21.493984	\N	\N	purchase	55
239	0	2023-01-18 22:27:21.493984	\N	\N	purchase_request	55
240	0	2023-01-18 22:27:21.493984	\N	\N	sale	55
241	0	2023-01-18 22:27:21.493984	\N	\N	stock	55
242	0	2023-01-18 22:27:21.493984	\N	\N	account	56
243	0	2023-01-18 22:27:21.493984	\N	\N	company	56
244	0	2023-01-18 22:27:21.493984	\N	\N	currency	56
245	0	2023-01-18 22:27:21.493984	\N	\N	ir	56
246	0	2023-01-18 22:27:21.493984	\N	\N	party	56
247	0	2023-01-18 22:27:21.493984	\N	\N	res	56
248	0	2023-01-18 22:27:21.493984	\N	\N	company	57
249	0	2023-01-18 22:27:21.493984	\N	\N	ir	57
250	0	2023-01-18 22:27:21.493984	\N	\N	product	57
251	0	2023-01-18 22:27:21.493984	\N	\N	res	57
252	0	2023-01-18 22:27:21.493984	\N	\N	stock	57
253	0	2023-01-18 22:27:21.493984	\N	\N	ir	58
254	0	2023-01-18 22:27:21.493984	\N	\N	product	58
255	0	2023-01-18 22:27:21.493984	\N	\N	production	58
256	0	2023-01-18 22:27:21.493984	\N	\N	production_routing	58
257	0	2023-01-18 22:27:21.493984	\N	\N	purchase	58
258	0	2023-01-18 22:27:21.493984	\N	\N	company	59
259	0	2023-01-18 22:27:21.493984	\N	\N	ir	59
260	0	2023-01-18 22:27:21.493984	\N	\N	product	59
261	0	2023-01-18 22:27:21.493984	\N	\N	product_measurements	59
262	0	2023-01-18 22:27:21.493984	\N	\N	stock	59
263	0	2023-01-18 22:27:21.493984	\N	\N	account	60
264	0	2023-01-18 22:27:21.493984	\N	\N	account_payment	60
265	0	2023-01-18 22:27:21.493984	\N	\N	currency	60
266	0	2023-01-18 22:27:21.493984	\N	\N	ir	60
267	0	2023-01-18 22:27:21.493984	\N	\N	party	60
268	0	2023-01-18 22:27:21.493984	\N	\N	ir	61
269	0	2023-01-18 22:27:21.493984	\N	\N	res	61
270	0	2023-01-18 22:27:21.493984	\N	\N	ir	62
271	0	2023-01-18 22:27:21.493984	\N	\N	project	62
272	0	2023-01-18 22:27:21.493984	\N	\N	timesheet	62
273	0	2023-01-18 22:27:21.493984	\N	\N	timesheet_cost	62
274	0	2023-01-18 22:27:21.493984	\N	\N	company	62
275	0	2023-01-18 22:27:21.493984	\N	\N	product	62
276	0	2023-01-18 22:27:21.493984	\N	\N	ir	63
277	0	2023-01-18 22:27:21.493984	\N	\N	party	63
278	0	2023-01-18 22:27:21.493984	\N	\N	currency	63
279	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	64
280	0	2023-01-18 22:27:21.493984	\N	\N	ir	64
281	0	2023-01-18 22:27:21.493984	\N	\N	ir	65
282	0	2023-01-18 22:27:21.493984	\N	\N	company	65
283	0	2023-01-18 22:27:21.493984	\N	\N	party	65
284	0	2023-01-18 22:27:21.493984	\N	\N	timesheet	65
285	0	2023-01-18 22:27:21.493984	\N	\N	account_stock_shipment_cost	66
286	0	2023-01-18 22:27:21.493984	\N	\N	ir	66
287	0	2023-01-18 22:27:21.493984	\N	\N	stock_shipment_measurements	66
288	0	2023-01-18 22:27:21.493984	\N	\N	company	67
289	0	2023-01-18 22:27:21.493984	\N	\N	ir	67
290	0	2023-01-18 22:27:21.493984	\N	\N	product	67
291	0	2023-01-18 22:27:21.493984	\N	\N	production	67
292	0	2023-01-18 22:27:21.493984	\N	\N	production_routing	67
293	0	2023-01-18 22:27:21.493984	\N	\N	stock	67
294	0	2023-01-18 22:27:21.493984	\N	\N	account	68
295	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	68
296	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice_stock	68
297	0	2023-01-18 22:27:21.493984	\N	\N	account_product	68
298	0	2023-01-18 22:27:21.493984	\N	\N	company	68
299	0	2023-01-18 22:27:21.493984	\N	\N	country	68
300	0	2023-01-18 22:27:21.493984	\N	\N	currency	68
301	0	2023-01-18 22:27:21.493984	\N	\N	ir	68
302	0	2023-01-18 22:27:21.493984	\N	\N	party	68
303	0	2023-01-18 22:27:21.493984	\N	\N	product	68
304	0	2023-01-18 22:27:21.493984	\N	\N	res	68
305	0	2023-01-18 22:27:21.493984	\N	\N	stock	68
306	0	2023-01-18 22:27:21.493984	\N	\N	account	69
307	0	2023-01-18 22:27:21.493984	\N	\N	party_siret	69
308	0	2023-01-18 22:27:21.493984	\N	\N	ir	70
309	0	2023-01-18 22:27:21.493984	\N	\N	product	70
310	0	2023-01-18 22:27:21.493984	\N	\N	account	71
311	0	2023-01-18 22:27:21.493984	\N	\N	company	71
312	0	2023-01-18 22:27:21.493984	\N	\N	ir	71
313	0	2023-01-18 22:27:21.493984	\N	\N	party	71
314	0	2023-01-18 22:27:21.493984	\N	\N	account_payment_stripe	72
315	0	2023-01-18 22:27:21.493984	\N	\N	ir	72
316	0	2023-01-18 22:27:21.493984	\N	\N	sale_payment	72
317	0	2023-01-18 22:27:21.493984	\N	\N	web_shop	72
318	0	2023-01-18 22:27:21.493984	\N	\N	web_shop_vue_storefront	72
319	0	2023-01-18 22:27:21.493984	\N	\N	account	73
320	0	2023-01-18 22:27:21.493984	\N	\N	ir	73
321	0	2023-01-18 22:27:21.493984	\N	\N	party	73
322	0	2023-01-18 22:27:21.493984	\N	\N	product	73
323	0	2023-01-18 22:27:21.493984	\N	\N	purchase	73
324	0	2023-01-18 22:27:21.493984	\N	\N	purchase_request	73
325	0	2023-01-18 22:27:21.493984	\N	\N	res	73
326	0	2023-01-18 22:27:21.493984	\N	\N	stock	73
327	0	2023-01-18 22:27:21.493984	\N	\N	account	74
328	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	74
329	0	2023-01-18 22:27:21.493984	\N	\N	account_product	74
330	0	2023-01-18 22:27:21.493984	\N	\N	company	74
331	0	2023-01-18 22:27:21.493984	\N	\N	ir	74
332	0	2023-01-18 22:27:21.493984	\N	\N	party	74
333	0	2023-01-18 22:27:21.493984	\N	\N	product	74
334	0	2023-01-18 22:27:21.493984	\N	\N	res	74
335	0	2023-01-18 22:27:21.493984	\N	\N	ir	75
336	0	2023-01-18 22:27:21.493984	\N	\N	purchase	75
337	0	2023-01-18 22:27:21.493984	\N	\N	product	75
338	0	2023-01-18 22:27:21.493984	\N	\N	company	76
339	0	2023-01-18 22:27:21.493984	\N	\N	currency	76
340	0	2023-01-18 22:27:21.493984	\N	\N	ir	76
341	0	2023-01-18 22:27:21.493984	\N	\N	party	76
342	0	2023-01-18 22:27:21.493984	\N	\N	product	76
343	0	2023-01-18 22:27:21.493984	\N	\N	res	76
344	0	2023-01-18 22:27:21.493984	\N	\N	ir	77
345	0	2023-01-18 22:27:21.493984	\N	\N	party	77
346	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	78
347	0	2023-01-18 22:27:21.493984	\N	\N	company	78
348	0	2023-01-18 22:27:21.493984	\N	\N	ir	78
349	0	2023-01-18 22:27:21.493984	\N	\N	party	78
350	0	2023-01-18 22:27:21.493984	\N	\N	sale	78
351	0	2023-01-18 22:27:21.493984	\N	\N	ir	79
352	0	2023-01-18 22:27:21.493984	\N	\N	sale	79
353	0	2023-01-18 22:27:21.493984	\N	\N	stock	79
354	0	2023-01-18 22:27:21.493984	\N	\N	account_statement	80
355	0	2023-01-18 22:27:21.493984	\N	\N	bank	80
356	0	2023-01-18 22:27:21.493984	\N	\N	ir	80
357	0	2023-01-18 22:27:21.493984	\N	\N	ir	81
358	0	2023-01-18 22:27:21.493984	\N	\N	product	81
359	0	2023-01-18 22:27:21.493984	\N	\N	res	81
360	0	2023-01-18 22:27:21.493984	\N	\N	account_statement	82
361	0	2023-01-18 22:27:21.493984	\N	\N	bank	82
362	0	2023-01-18 22:27:21.493984	\N	\N	ir	82
363	0	2023-01-18 22:27:21.493984	\N	\N	party	82
364	0	2023-01-18 22:27:21.493984	\N	\N	carrier	83
365	0	2023-01-18 22:27:21.493984	\N	\N	company	83
366	0	2023-01-18 22:27:21.493984	\N	\N	currency	83
367	0	2023-01-18 22:27:21.493984	\N	\N	ir	83
368	0	2023-01-18 22:27:21.493984	\N	\N	product	83
369	0	2023-01-18 22:27:21.493984	\N	\N	product_measurements	83
370	0	2023-01-18 22:27:21.493984	\N	\N	res	83
371	0	2023-01-18 22:27:21.493984	\N	\N	ir	84
372	0	2023-01-18 22:27:21.493984	\N	\N	company	84
373	0	2023-01-18 22:27:21.493984	\N	\N	product	84
374	0	2023-01-18 22:27:21.493984	\N	\N	party	84
375	0	2023-01-18 22:27:21.493984	\N	\N	currency	84
376	0	2023-01-18 22:27:21.493984	\N	\N	purchase	84
377	0	2023-01-18 22:27:21.493984	\N	\N	account	85
378	0	2023-01-18 22:27:21.493984	\N	\N	company	85
379	0	2023-01-18 22:27:21.493984	\N	\N	ir	85
380	0	2023-01-18 22:27:21.493984	\N	\N	product	85
381	0	2023-01-18 22:27:21.493984	\N	\N	account_payment	86
382	0	2023-01-18 22:27:21.493984	\N	\N	ir	86
383	0	2023-01-18 22:27:21.493984	\N	\N	sale_promotion_coupon	86
384	0	2023-01-18 22:27:21.493984	\N	\N	country	87
385	0	2023-01-18 22:27:21.493984	\N	\N	currency	87
386	0	2023-01-18 22:27:21.493984	\N	\N	ir	87
387	0	2023-01-18 22:27:21.493984	\N	\N	product	87
388	0	2023-01-18 22:27:21.493984	\N	\N	res	87
389	0	2023-01-18 22:27:21.493984	\N	\N	company	88
390	0	2023-01-18 22:27:21.493984	\N	\N	currency	88
391	0	2023-01-18 22:27:21.493984	\N	\N	ir	88
392	0	2023-01-18 22:27:21.493984	\N	\N	product	88
393	0	2023-01-18 22:27:21.493984	\N	\N	product_price_list	88
394	0	2023-01-18 22:27:21.493984	\N	\N	res	88
395	0	2023-01-18 22:27:21.493984	\N	\N	sale	88
396	0	2023-01-18 22:27:21.493984	\N	\N	sale_price_list	88
397	0	2023-01-18 22:27:21.493984	\N	\N	ir	89
398	0	2023-01-18 22:27:21.493984	\N	\N	product_classification	89
399	0	2023-01-18 22:27:21.493984	\N	\N	ir	90
400	0	2023-01-18 22:27:21.493984	\N	\N	product	90
401	0	2023-01-18 22:27:21.493984	\N	\N	sale	90
402	0	2023-01-18 22:27:21.493984	\N	\N	sale_product_recommendation	90
403	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	91
404	0	2023-01-18 22:27:21.493984	\N	\N	ir	91
405	0	2023-01-18 22:27:21.493984	\N	\N	sale	91
406	0	2023-01-18 22:27:21.493984	\N	\N	sale_history	91
407	0	2023-01-18 22:27:21.493984	\N	\N	stock	91
408	0	2023-01-18 22:27:21.493984	\N	\N	ir	92
409	0	2023-01-18 22:27:21.493984	\N	\N	product	92
410	0	2023-01-18 22:27:21.493984	\N	\N	stock	92
411	0	2023-01-18 22:27:21.493984	\N	\N	stock_lot	92
412	0	2023-01-18 22:27:21.493984	\N	\N	ir	93
413	0	2023-01-18 22:27:21.493984	\N	\N	production	93
414	0	2023-01-18 22:27:21.493984	\N	\N	ir	94
415	0	2023-01-18 22:27:21.493984	\N	\N	sale	94
416	0	2023-01-18 22:27:21.493984	\N	\N	ir	95
417	0	2023-01-18 22:27:21.493984	\N	\N	marketing	95
418	0	2023-01-18 22:27:21.493984	\N	\N	party	95
419	0	2023-01-18 22:27:21.493984	\N	\N	res	95
420	0	2023-01-18 22:27:21.493984	\N	\N	web_user	95
421	0	2023-01-18 22:27:21.493984	\N	\N	web_shortener	95
422	0	2023-01-18 22:27:21.493984	\N	\N	account	96
423	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	96
424	0	2023-01-18 22:27:21.493984	\N	\N	company	96
425	0	2023-01-18 22:27:21.493984	\N	\N	ir	96
426	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	97
427	0	2023-01-18 22:27:21.493984	\N	\N	account_payment	97
428	0	2023-01-18 22:27:21.493984	\N	\N	ir	97
429	0	2023-01-18 22:27:21.493984	\N	\N	res	97
430	0	2023-01-18 22:27:21.493984	\N	\N	sale	97
431	0	2023-01-18 22:27:21.493984	\N	\N	ir	98
432	0	2023-01-18 22:27:21.493984	\N	\N	res	98
433	0	2023-01-18 22:27:21.493984	\N	\N	party	98
434	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	98
435	0	2023-01-18 22:27:21.493984	\N	\N	sale	98
436	0	2023-01-18 22:27:21.493984	\N	\N	account	99
437	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	99
438	0	2023-01-18 22:27:21.493984	\N	\N	company	99
439	0	2023-01-18 22:27:21.493984	\N	\N	ir	99
440	0	2023-01-18 22:27:21.493984	\N	\N	party	99
441	0	2023-01-18 22:27:21.493984	\N	\N	party_siret	99
442	0	2023-01-18 22:27:21.493984	\N	\N	ir	100
443	0	2023-01-18 22:27:21.493984	\N	\N	production	100
444	0	2023-01-18 22:27:21.493984	\N	\N	carrier	101
445	0	2023-01-18 22:27:21.493984	\N	\N	currency	101
446	0	2023-01-18 22:27:21.493984	\N	\N	ir	101
447	0	2023-01-18 22:27:21.493984	\N	\N	res	101
448	0	2023-01-18 22:27:21.493984	\N	\N	ir	102
449	0	2023-01-18 22:27:21.493984	\N	\N	product	102
450	0	2023-01-18 22:27:21.493984	\N	\N	sale	102
451	0	2023-01-18 22:27:21.493984	\N	\N	ir	103
452	0	2023-01-18 22:27:21.493984	\N	\N	product	103
453	0	2023-01-18 22:27:21.493984	\N	\N	product_attribute	103
454	0	2023-01-18 22:27:21.493984	\N	\N	product_image	103
455	0	2023-01-18 22:27:21.493984	\N	\N	ir	104
456	0	2023-01-18 22:27:21.493984	\N	\N	res	104
457	0	2023-01-18 22:27:21.493984	\N	\N	account	105
458	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	105
459	0	2023-01-18 22:27:21.493984	\N	\N	company	105
460	0	2023-01-18 22:27:21.493984	\N	\N	currency	105
461	0	2023-01-18 22:27:21.493984	\N	\N	ir	105
462	0	2023-01-18 22:27:21.493984	\N	\N	product	105
463	0	2023-01-18 22:27:21.493984	\N	\N	sale	105
464	0	2023-01-18 22:27:21.493984	\N	\N	stock	105
465	0	2023-01-18 22:27:21.493984	\N	\N	ir	106
466	0	2023-01-18 22:27:21.493984	\N	\N	account_dunning	107
467	0	2023-01-18 22:27:21.493984	\N	\N	account_product	107
468	0	2023-01-18 22:27:21.493984	\N	\N	ir	107
469	0	2023-01-18 22:27:21.493984	\N	\N	party	108
470	0	2023-01-18 22:27:21.493984	\N	\N	country	109
471	0	2023-01-18 22:27:21.493984	\N	\N	ir	109
472	0	2023-01-18 22:27:21.493984	\N	\N	party	109
473	0	2023-01-18 22:27:21.493984	\N	\N	product	109
474	0	2023-01-18 22:27:21.493984	\N	\N	res	109
475	0	2023-01-18 22:27:21.493984	\N	\N	account	110
476	0	2023-01-18 22:27:21.493984	\N	\N	company	110
477	0	2023-01-18 22:27:21.493984	\N	\N	ir	110
478	0	2023-01-18 22:27:21.493984	\N	\N	party	110
479	0	2023-01-18 22:27:21.493984	\N	\N	res	110
480	0	2023-01-18 22:27:21.493984	\N	\N	ir	111
481	0	2023-01-18 22:27:21.493984	\N	\N	res	111
482	0	2023-01-18 22:27:21.493984	\N	\N	ir	112
483	0	2023-01-18 22:27:21.493984	\N	\N	production_routing	112
484	0	2023-01-18 22:27:21.493984	\N	\N	production_work	112
485	0	2023-01-18 22:27:21.493984	\N	\N	timesheet	112
486	0	2023-01-18 22:27:21.493984	\N	\N	account	113
487	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	113
488	0	2023-01-18 22:27:21.493984	\N	\N	company	113
489	0	2023-01-18 22:27:21.493984	\N	\N	ir	113
490	0	2023-01-18 22:27:21.493984	\N	\N	party	113
491	0	2023-01-18 22:27:21.493984	\N	\N	res	113
492	0	2023-01-18 22:27:21.493984	\N	\N	account	114
493	0	2023-01-18 22:27:21.493984	\N	\N	account_payment	115
494	0	2023-01-18 22:27:21.493984	\N	\N	ir	115
495	0	2023-01-18 22:27:21.493984	\N	\N	company	116
496	0	2023-01-18 22:27:21.493984	\N	\N	currency	116
497	0	2023-01-18 22:27:21.493984	\N	\N	ir	116
498	0	2023-01-18 22:27:21.493984	\N	\N	party	116
499	0	2023-01-18 22:27:21.493984	\N	\N	product	116
500	0	2023-01-18 22:27:21.493984	\N	\N	purchase	116
501	0	2023-01-18 22:27:21.493984	\N	\N	purchase_request	116
502	0	2023-01-18 22:27:21.493984	\N	\N	account	117
503	0	2023-01-18 22:27:21.493984	\N	\N	account_product	117
504	0	2023-01-18 22:27:21.493984	\N	\N	ir	117
505	0	2023-01-18 22:27:21.493984	\N	\N	res	117
506	0	2023-01-18 22:27:21.493984	\N	\N	stock	117
507	0	2023-01-18 22:27:21.493984	\N	\N	ir	118
508	0	2023-01-18 22:27:21.493984	\N	\N	party	118
509	0	2023-01-18 22:27:21.493984	\N	\N	res	118
510	0	2023-01-18 22:27:21.493984	\N	\N	account	119
511	0	2023-01-18 22:27:21.493984	\N	\N	account_product	119
512	0	2023-01-18 22:27:21.493984	\N	\N	company	119
513	0	2023-01-18 22:27:21.493984	\N	\N	currency	119
514	0	2023-01-18 22:27:21.493984	\N	\N	ir	119
515	0	2023-01-18 22:27:21.493984	\N	\N	party	119
516	0	2023-01-18 22:27:21.493984	\N	\N	product	119
517	0	2023-01-18 22:27:21.493984	\N	\N	res	119
518	0	2023-01-18 22:27:21.493984	\N	\N	ir	120
519	0	2023-01-18 22:27:21.493984	\N	\N	res	120
520	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	121
521	0	2023-01-18 22:27:21.493984	\N	\N	ir	121
522	0	2023-01-18 22:27:21.493984	\N	\N	product	121
523	0	2023-01-18 22:27:21.493984	\N	\N	sale	121
524	0	2023-01-18 22:27:21.493984	\N	\N	stock	121
525	0	2023-01-18 22:27:21.493984	\N	\N	ir	122
526	0	2023-01-18 22:27:21.493984	\N	\N	res	122
527	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	123
528	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice_line_standalone	123
529	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice_stock	123
530	0	2023-01-18 22:27:21.493984	\N	\N	ir	123
531	0	2023-01-18 22:27:21.493984	\N	\N	product	123
532	0	2023-01-18 22:27:21.493984	\N	\N	purchase	123
533	0	2023-01-18 22:27:21.493984	\N	\N	sale	123
534	0	2023-01-18 22:27:21.493984	\N	\N	stock	123
535	0	2023-01-18 22:27:21.493984	\N	\N	ir	124
536	0	2023-01-18 22:27:21.493984	\N	\N	res	124
537	0	2023-01-18 22:27:21.493984	\N	\N	ir	125
538	0	2023-01-18 22:27:21.493984	\N	\N	stock	125
539	0	2023-01-18 22:27:21.493984	\N	\N	account	126
540	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	126
541	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice_stock	126
542	0	2023-01-18 22:27:21.493984	\N	\N	account_product	126
543	0	2023-01-18 22:27:21.493984	\N	\N	account_stock_continental	126
544	0	2023-01-18 22:27:21.493984	\N	\N	ir	126
545	0	2023-01-18 22:27:21.493984	\N	\N	res	126
546	0	2023-01-18 22:27:21.493984	\N	\N	ir	127
547	0	2023-01-18 22:27:21.493984	\N	\N	company	127
548	0	2023-01-18 22:27:21.493984	\N	\N	account_statement	128
549	0	2023-01-18 22:27:21.493984	\N	\N	bank	128
550	0	2023-01-18 22:27:21.493984	\N	\N	ir	128
551	0	2023-01-18 22:27:21.493984	\N	\N	ir	129
552	0	2023-01-18 22:27:21.493984	\N	\N	product	129
553	0	2023-01-18 22:27:21.493984	\N	\N	sale	129
554	0	2023-01-18 22:27:21.493984	\N	\N	account	130
555	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	130
556	0	2023-01-18 22:27:21.493984	\N	\N	ir	130
557	0	2023-01-18 22:27:21.493984	\N	\N	res	130
558	0	2023-01-18 22:27:21.493984	\N	\N	sale	130
559	0	2023-01-18 22:27:21.493984	\N	\N	company	131
560	0	2023-01-18 22:27:21.493984	\N	\N	currency	131
561	0	2023-01-18 22:27:21.493984	\N	\N	ir	131
562	0	2023-01-18 22:27:21.493984	\N	\N	party	131
563	0	2023-01-18 22:27:21.493984	\N	\N	res	131
564	0	2023-01-18 22:27:21.493984	\N	\N	ir	132
565	0	2023-01-18 22:27:21.493984	\N	\N	marketing	132
566	0	2023-01-18 22:27:21.493984	\N	\N	party	132
567	0	2023-01-18 22:27:21.493984	\N	\N	res	132
568	0	2023-01-18 22:27:21.493984	\N	\N	web_shortener	132
569	0	2023-01-18 22:27:21.493984	\N	\N	currency	133
570	0	2023-01-18 22:27:21.493984	\N	\N	ir	133
571	0	2023-01-18 22:27:21.493984	\N	\N	company	134
572	0	2023-01-18 22:27:21.493984	\N	\N	ir	134
573	0	2023-01-18 22:27:21.493984	\N	\N	party	134
574	0	2023-01-18 22:27:21.493984	\N	\N	ir	135
575	0	2023-01-18 22:27:21.493984	\N	\N	product	135
576	0	2023-01-18 22:27:21.493984	\N	\N	stock	135
577	0	2023-01-18 22:27:21.493984	\N	\N	ir	136
578	0	2023-01-18 22:27:21.493984	\N	\N	product	136
579	0	2023-01-18 22:27:21.493984	\N	\N	sale	136
580	0	2023-01-18 22:27:21.493984	\N	\N	account	137
581	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	137
582	0	2023-01-18 22:27:21.493984	\N	\N	ir	137
583	0	2023-01-18 22:27:21.493984	\N	\N	party	137
584	0	2023-01-18 22:27:21.493984	\N	\N	ir	138
585	0	2023-01-18 22:27:21.493984	\N	\N	product	138
586	0	2023-01-18 22:27:21.493984	\N	\N	account	138
587	0	2023-01-18 22:27:21.493984	\N	\N	company	139
588	0	2023-01-18 22:27:21.493984	\N	\N	ir	139
589	0	2023-01-18 22:27:21.493984	\N	\N	product	139
590	0	2023-01-18 22:27:21.493984	\N	\N	res	139
591	0	2023-01-18 22:27:21.493984	\N	\N	stock	139
592	0	2023-01-18 22:27:21.493984	\N	\N	carrier	140
593	0	2023-01-18 22:27:21.493984	\N	\N	ir	140
594	0	2023-01-18 22:27:21.493984	\N	\N	stock_shipment_cost	140
595	0	2023-01-18 22:27:21.493984	\N	\N	stock_shipment_measurements	140
596	0	2023-01-18 22:27:21.493984	\N	\N	company	141
597	0	2023-01-18 22:27:21.493984	\N	\N	company_work_time	141
598	0	2023-01-18 22:27:21.493984	\N	\N	ir	141
599	0	2023-01-18 22:27:21.493984	\N	\N	res	141
600	0	2023-01-18 22:27:21.493984	\N	\N	ir	142
601	0	2023-01-18 22:27:21.493984	\N	\N	res	142
602	0	2023-01-18 22:27:21.493984	\N	\N	product	142
603	0	2023-01-18 22:27:21.493984	\N	\N	stock	142
604	0	2023-01-18 22:27:21.493984	\N	\N	stock_lot	142
605	0	2023-01-18 22:27:21.493984	\N	\N	ir	143
606	0	2023-01-18 22:27:21.493984	\N	\N	party	143
607	0	2023-01-18 22:27:21.493984	\N	\N	account	144
608	0	2023-01-18 22:27:21.493984	\N	\N	ir	144
609	0	2023-01-18 22:27:21.493984	\N	\N	ir	145
610	0	2023-01-18 22:27:21.493984	\N	\N	res	145
611	0	2023-01-18 22:27:21.493984	\N	\N	party	145
612	0	2023-01-18 22:27:21.493984	\N	\N	product	145
613	0	2023-01-18 22:27:21.493984	\N	\N	stock	145
614	0	2023-01-18 22:27:21.493984	\N	\N	stock_shipment_measurements	145
615	0	2023-01-18 22:27:21.493984	\N	\N	stock_package	145
616	0	2023-01-18 22:27:21.493984	\N	\N	stock_package_shipping	145
617	0	2023-01-18 22:27:21.493984	\N	\N	currency	146
618	0	2023-01-18 22:27:21.493984	\N	\N	ir	146
619	0	2023-01-18 22:27:21.493984	\N	\N	project	146
620	0	2023-01-18 22:27:21.493984	\N	\N	project_revenue	146
621	0	2023-01-18 22:27:21.493984	\N	\N	timesheet	146
622	0	2023-01-18 22:27:21.493984	\N	\N	account	146
623	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	146
624	0	2023-01-18 22:27:21.493984	\N	\N	account_product	146
625	0	2023-01-18 22:27:21.493984	\N	\N	product	146
626	0	2023-01-18 22:27:21.493984	\N	\N	country	147
627	0	2023-01-18 22:27:21.493984	\N	\N	ir	147
628	0	2023-01-18 22:27:21.493984	\N	\N	res	147
629	0	2023-01-18 22:27:21.493984	\N	\N	account_budget	148
630	0	2023-01-18 22:27:21.493984	\N	\N	analytic_account	148
631	0	2023-01-18 22:27:21.493984	\N	\N	company	148
632	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	149
633	0	2023-01-18 22:27:21.493984	\N	\N	ir	149
634	0	2023-01-18 22:27:21.493984	\N	\N	ir	150
635	0	2023-01-18 22:27:21.493984	\N	\N	stock	150
636	0	2023-01-18 22:27:21.493984	\N	\N	product	150
637	0	2023-01-18 22:27:21.493984	\N	\N	company	151
638	0	2023-01-18 22:27:21.493984	\N	\N	ir	151
639	0	2023-01-18 22:27:21.493984	\N	\N	product	151
640	0	2023-01-18 22:27:21.493984	\N	\N	ir	152
641	0	2023-01-18 22:27:21.493984	\N	\N	stock	152
642	0	2023-01-18 22:27:21.493984	\N	\N	ir	153
643	0	2023-01-18 22:27:21.493984	\N	\N	res	153
644	0	2023-01-18 22:27:21.493984	\N	\N	account	154
645	0	2023-01-18 22:27:21.493984	\N	\N	currency	154
646	0	2023-01-18 22:27:21.493984	\N	\N	ir	154
647	0	2023-01-18 22:27:21.493984	\N	\N	company	155
648	0	2023-01-18 22:27:21.493984	\N	\N	ir	155
649	0	2023-01-18 22:27:21.493984	\N	\N	stock	155
650	0	2023-01-18 22:27:21.493984	\N	\N	ir	156
651	0	2023-01-18 22:27:21.493984	\N	\N	product	156
652	0	2023-01-18 22:27:21.493984	\N	\N	company	157
653	0	2023-01-18 22:27:21.493984	\N	\N	ir	157
654	0	2023-01-18 22:27:21.493984	\N	\N	product	157
655	0	2023-01-18 22:27:21.493984	\N	\N	res	157
656	0	2023-01-18 22:27:21.493984	\N	\N	stock	157
657	0	2023-01-18 22:27:21.493984	\N	\N	ir	158
658	0	2023-01-18 22:27:21.493984	\N	\N	sale	158
659	0	2023-01-18 22:27:21.493984	\N	\N	party	158
660	0	2023-01-18 22:27:21.493984	\N	\N	account	159
661	0	2023-01-18 22:27:21.493984	\N	\N	account_eu	159
662	0	2023-01-18 22:27:21.493984	\N	\N	account	160
663	0	2023-01-18 22:27:21.493984	\N	\N	account_es	160
664	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	160
665	0	2023-01-18 22:27:21.493984	\N	\N	ir	160
666	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	161
667	0	2023-01-18 22:27:21.493984	\N	\N	analytic_account	161
668	0	2023-01-18 22:27:21.493984	\N	\N	ir	162
669	0	2023-01-18 22:27:21.493984	\N	\N	marketing	162
670	0	2023-01-18 22:27:21.493984	\N	\N	ir	163
671	0	2023-01-18 22:27:21.493984	\N	\N	product	163
672	0	2023-01-18 22:27:21.493984	\N	\N	company	164
673	0	2023-01-18 22:27:21.493984	\N	\N	ir	164
674	0	2023-01-18 22:27:21.493984	\N	\N	product	164
675	0	2023-01-18 22:27:21.493984	\N	\N	purchase	164
676	0	2023-01-18 22:27:21.493984	\N	\N	purchase_request	164
677	0	2023-01-18 22:27:21.493984	\N	\N	sale	164
678	0	2023-01-18 22:27:21.493984	\N	\N	sale_supply	164
679	0	2023-01-18 22:27:21.493984	\N	\N	stock	164
680	0	2023-01-18 22:27:21.493984	\N	\N	carrier	165
681	0	2023-01-18 22:27:21.493984	\N	\N	currency	165
682	0	2023-01-18 22:27:21.493984	\N	\N	ir	165
683	0	2023-01-18 22:27:21.493984	\N	\N	product	165
684	0	2023-01-18 22:27:21.493984	\N	\N	res	165
685	0	2023-01-18 22:27:21.493984	\N	\N	stock	165
686	0	2023-01-18 22:27:21.493984	\N	\N	stock_shipment_cost	165
687	0	2023-01-18 22:27:21.493984	\N	\N	ir	166
688	0	2023-01-18 22:27:21.493984	\N	\N	ir	167
689	0	2023-01-18 22:27:21.493984	\N	\N	stock	167
690	0	2023-01-18 22:27:21.493984	\N	\N	carrier	168
691	0	2023-01-18 22:27:21.493984	\N	\N	ir	168
692	0	2023-01-18 22:27:21.493984	\N	\N	stock	168
693	0	2023-01-18 22:27:21.493984	\N	\N	stock_package	168
694	0	2023-01-18 22:27:21.493984	\N	\N	stock_package_shipping	168
695	0	2023-01-18 22:27:21.493984	\N	\N	account	169
696	0	2023-01-18 22:27:21.493984	\N	\N	account_product	169
697	0	2023-01-18 22:27:21.493984	\N	\N	company	169
698	0	2023-01-18 22:27:21.493984	\N	\N	ir	169
699	0	2023-01-18 22:27:21.493984	\N	\N	party	169
700	0	2023-01-18 22:27:21.493984	\N	\N	product	169
701	0	2023-01-18 22:27:21.493984	\N	\N	res	169
702	0	2023-01-18 22:27:21.493984	\N	\N	sale	169
703	0	2023-01-18 22:27:21.493984	\N	\N	stock	169
704	0	2023-01-18 22:27:21.493984	\N	\N	carrier	170
705	0	2023-01-18 22:27:21.493984	\N	\N	ir	170
706	0	2023-01-18 22:27:21.493984	\N	\N	product	170
707	0	2023-01-18 22:27:21.493984	\N	\N	stock	170
708	0	2023-01-18 22:27:21.493984	\N	\N	ir	171
709	0	2023-01-18 22:27:21.493984	\N	\N	res	171
710	0	2023-01-18 22:27:21.493984	\N	\N	party	171
711	0	2023-01-18 22:27:21.493984	\N	\N	stock	171
712	0	2023-01-18 22:27:21.493984	\N	\N	sale	171
713	0	2023-01-18 22:27:21.493984	\N	\N	account	172
714	0	2023-01-18 22:27:21.493984	\N	\N	company	172
715	0	2023-01-18 22:27:21.493984	\N	\N	ir	172
716	0	2023-01-18 22:27:21.493984	\N	\N	party	172
717	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice_line_standalone	173
718	0	2023-01-18 22:27:21.493984	\N	\N	ir	173
719	0	2023-01-18 22:27:21.493984	\N	\N	purchase	173
720	0	2023-01-18 22:27:21.493984	\N	\N	ir	174
721	0	2023-01-18 22:27:21.493984	\N	\N	company	174
722	0	2023-01-18 22:27:21.493984	\N	\N	product	174
723	0	2023-01-18 22:27:21.493984	\N	\N	party	174
724	0	2023-01-18 22:27:21.493984	\N	\N	currency	174
725	0	2023-01-18 22:27:21.493984	\N	\N	sale	174
726	0	2023-01-18 22:27:21.493984	\N	\N	ir	175
727	0	2023-01-18 22:27:21.493984	\N	\N	party	175
728	0	2023-01-18 22:27:21.493984	\N	\N	product	175
729	0	2023-01-18 22:27:21.493984	\N	\N	sale	175
730	0	2023-01-18 22:27:21.493984	\N	\N	web_shop	175
731	0	2023-01-18 22:27:21.493984	\N	\N	web_user	175
732	0	2023-01-18 22:27:21.493984	\N	\N	carrier	176
733	0	2023-01-18 22:27:21.493984	\N	\N	company	176
734	0	2023-01-18 22:27:21.493984	\N	\N	ir	176
735	0	2023-01-18 22:27:21.493984	\N	\N	party	176
736	0	2023-01-18 22:27:21.493984	\N	\N	product	176
737	0	2023-01-18 22:27:21.493984	\N	\N	stock	176
738	0	2023-01-18 22:27:21.493984	\N	\N	stock_shipment_measurements	176
739	0	2023-01-18 22:27:21.493984	\N	\N	stock_package	176
740	0	2023-01-18 22:27:21.493984	\N	\N	stock_package_shipping	176
741	0	2023-01-18 22:27:21.493984	\N	\N	ir	177
742	0	2023-01-18 22:27:21.493984	\N	\N	res	177
743	0	2023-01-18 22:27:21.493984	\N	\N	carrier	177
744	0	2023-01-18 22:27:21.493984	\N	\N	product	177
745	0	2023-01-18 22:27:21.493984	\N	\N	stock	177
746	0	2023-01-18 22:27:21.493984	\N	\N	stock_package	177
747	0	2023-01-18 22:27:21.493984	\N	\N	stock_shipment_measurements	177
748	0	2023-01-18 22:27:21.493984	\N	\N	stock_shipment_cost	177
749	0	2023-01-18 22:27:21.493984	\N	\N	product_measurements	177
750	0	2023-01-18 22:27:21.493984	\N	\N	account_payment	178
751	0	2023-01-18 22:27:21.493984	\N	\N	company	178
752	0	2023-01-18 22:27:21.493984	\N	\N	ir	178
753	0	2023-01-18 22:27:21.493984	\N	\N	bank	178
754	0	2023-01-18 22:27:21.493984	\N	\N	party	178
755	0	2023-01-18 22:27:21.493984	\N	\N	analytic_account	179
756	0	2023-01-18 22:27:21.493984	\N	\N	analytic_invoice	179
757	0	2023-01-18 22:27:21.493984	\N	\N	sale	179
758	0	2023-01-18 22:27:21.493984	\N	\N	account_payment	180
759	0	2023-01-18 22:27:21.493984	\N	\N	account_payment_sepa	180
760	0	2023-01-18 22:27:21.493984	\N	\N	company	180
761	0	2023-01-18 22:27:21.493984	\N	\N	bank	180
762	0	2023-01-18 22:27:21.493984	\N	\N	party	180
763	0	2023-01-18 22:27:21.493984	\N	\N	account	181
764	0	2023-01-18 22:27:21.493984	\N	\N	company	181
765	0	2023-01-18 22:27:21.493984	\N	\N	ir	181
766	0	2023-01-18 22:27:21.493984	\N	\N	party	181
767	0	2023-01-18 22:27:21.493984	\N	\N	account	182
768	0	2023-01-18 22:27:21.493984	\N	\N	country	182
769	0	2023-01-18 22:27:21.493984	\N	\N	account	183
770	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	183
771	0	2023-01-18 22:27:21.493984	\N	\N	ir	183
772	0	2023-01-18 22:27:21.493984	\N	\N	account_statement	184
773	0	2023-01-18 22:27:21.493984	\N	\N	bank	184
774	0	2023-01-18 22:27:21.493984	\N	\N	ir	184
775	0	2023-01-18 22:27:21.493984	\N	\N	account_dunning	185
776	0	2023-01-18 22:27:21.493984	\N	\N	account_dunning_letter	185
777	0	2023-01-18 22:27:21.493984	\N	\N	ir	185
778	0	2023-01-18 22:27:21.493984	\N	\N	party	185
779	0	2023-01-18 22:27:21.493984	\N	\N	ir	186
780	0	2023-01-18 22:27:21.493984	\N	\N	account_credit_limit	186
781	0	2023-01-18 22:27:21.493984	\N	\N	sale	186
782	0	2023-01-18 22:27:21.493984	\N	\N	currency	186
783	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	186
784	0	2023-01-18 22:27:21.493984	\N	\N	company	186
785	0	2023-01-18 22:27:21.493984	\N	\N	ir	187
786	0	2023-01-18 22:27:21.493984	\N	\N	stock_supply	187
787	0	2023-01-18 22:27:21.493984	\N	\N	stock_forecast	187
788	0	2023-01-18 22:27:21.493984	\N	\N	ir	188
789	0	2023-01-18 22:27:21.493984	\N	\N	product	188
790	0	2023-01-18 22:27:21.493984	\N	\N	production	188
791	0	2023-01-18 22:27:21.493984	\N	\N	stock	188
792	0	2023-01-18 22:27:21.493984	\N	\N	stock_supply	188
793	0	2023-01-18 22:27:21.493984	\N	\N	account	189
794	0	2023-01-18 22:27:21.493984	\N	\N	account_invoice	189
795	0	2023-01-18 22:27:21.493984	\N	\N	ir	189
796	0	2023-01-18 22:27:21.493984	\N	\N	product	189
797	0	2023-01-18 22:27:21.493984	\N	\N	stock	189
798	0	2023-01-18 22:27:21.493984	\N	\N	stock_shipment_cost	189
799	0	2023-01-18 22:27:21.493984	\N	\N	ir	190
800	0	2023-01-18 22:27:21.493984	\N	\N	product	190
801	0	2023-01-18 22:27:21.493984	\N	\N	stock	190
802	0	2023-01-18 22:27:21.493984	\N	\N	ir	191
803	0	2023-01-18 22:27:21.493984	\N	\N	party	191
804	0	2023-01-18 22:27:21.493984	\N	\N	account	192
805	0	2023-01-18 22:27:21.493984	\N	\N	company	192
806	0	2023-01-18 22:27:21.493984	\N	\N	ir	192
807	0	2023-01-18 22:27:21.493984	\N	\N	party	192
808	0	2023-01-18 22:27:21.493984	\N	\N	product	192
809	0	2023-01-18 22:27:21.493984	\N	\N	product_price_list	192
810	0	2023-01-18 22:27:21.493984	\N	\N	purchase	192
811	0	2023-01-18 22:27:21.493984	\N	\N	account	193
812	0	2023-01-18 22:27:21.493984	\N	\N	account_payment	193
813	0	2023-01-18 22:27:21.493984	\N	\N	ir	193
814	0	2023-01-18 22:27:21.493984	\N	\N	party	193
815	0	2023-01-18 22:27:21.493984	\N	\N	ir	194
816	0	2023-01-18 22:27:21.493984	\N	\N	res	194
817	0	2023-01-18 22:27:21.493984	\N	\N	ir	195
818	0	2023-01-18 22:27:21.493984	\N	\N	product	195
819	0	2023-01-18 22:27:21.493984	\N	\N	stock	195
820	0	2023-01-18 22:27:21.493984	\N	\N	ir	196
821	0	2023-01-18 22:27:21.493984	\N	\N	edocument_unece	196
\.


--
-- Data for Name: ir_note; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_note (id, copy_to_resources, create_date, create_uid, message, resource, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_note_read; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_note_read (id, create_date, create_uid, note, "user", write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_queue; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_queue (id, create_date, create_uid, data, dequeued_at, enqueued_at, expected_at, finished_at, name, scheduled_at, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_rule; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_rule (id, create_date, create_uid, domain, rule_group, write_date, write_uid) FROM stdin;
1	2023-01-18 22:27:08.693829	0	[["user", "=", {"__class__": "Get", "d": -1, "k": "id", "v": {"__class__": "Eval", "d": {}, "v": "user"}}]]	1	\N	\N
2	2023-01-18 22:27:08.693829	0	[["user", "=", {"__class__": "Get", "d": -1, "k": "id", "v": {"__class__": "Eval", "d": {}, "v": "user"}}]]	2	\N	\N
3	2023-01-18 22:27:08.693829	0	[]	3	\N	\N
4	2023-01-18 22:27:08.693829	0	[["groups", "in", {"__class__": "Eval", "d": [], "v": "groups"}]]	4	\N	\N
5	2023-01-18 22:27:08.693829	0	[["groups", "=", null]]	4	\N	\N
6	2023-01-18 22:27:08.693829	0	[["groups", "in", {"__class__": "Eval", "d": [], "v": "groups"}]]	5	\N	\N
7	2023-01-18 22:27:08.693829	0	[["groups", "=", null]]	5	\N	\N
8	2023-01-18 22:27:08.693829	0	[["groups", "in", {"__class__": "Eval", "d": [], "v": "groups"}]]	6	\N	\N
9	2023-01-18 22:27:08.693829	0	[["groups", "=", null]]	6	\N	\N
10	2023-01-18 22:27:08.693829	0	[["groups", "in", {"__class__": "Eval", "d": [], "v": "groups"}]]	7	\N	\N
11	2023-01-18 22:27:08.693829	0	[["groups", "=", null]]	7	\N	\N
12	2023-01-18 22:27:08.693829	0	[["groups", "in", {"__class__": "Eval", "d": [], "v": "groups"}]]	8	\N	\N
13	2023-01-18 22:27:08.693829	0	[["groups", "=", null]]	8	\N	\N
14	2023-01-18 22:27:08.693829	0	[["groups", "in", {"__class__": "Eval", "d": [], "v": "groups"}]]	9	\N	\N
15	2023-01-18 22:27:08.693829	0	[["groups", "=", null]]	9	\N	\N
16	2023-01-18 22:27:08.693829	0	[["groups", "in", {"__class__": "Eval", "d": [], "v": "groups"}]]	10	\N	\N
17	2023-01-18 22:27:08.693829	0	[["groups", "=", null]]	10	\N	\N
18	2023-01-18 22:27:08.693829	0	[["sequence_type.groups", "in", {"__class__": "Eval", "d": [], "v": "groups"}]]	11	\N	\N
19	2023-01-18 22:27:08.693829	0	[["sequence_type.groups", "in", {"__class__": "Eval", "d": [], "v": "groups"}]]	12	\N	\N
20	2023-01-18 22:27:08.693829	0	[["user", "=", {"__class__": "Get", "d": -1, "k": "id", "v": {"__class__": "Eval", "d": {}, "v": "user"}}]]	13	\N	\N
21	2023-01-18 22:27:08.693829	0	[["user", "=", null]]	14	\N	\N
22	2023-01-18 22:27:08.693829	0	[["create_uid", "=", {"__class__": "Get", "d": -1, "k": "id", "v": {"__class__": "Eval", "d": {}, "v": "user"}}]]	16	\N	\N
23	2023-01-18 22:27:08.693829	0	[["create_uid", "=", {"__class__": "Get", "d": -1, "k": "id", "v": {"__class__": "Eval", "d": {}, "v": "user"}}]]	17	\N	\N
24	2023-01-18 22:27:08.693829	0	[["create_uid", "=", {"__class__": "Get", "d": -1, "k": "id", "v": {"__class__": "Eval", "d": {}, "v": "user"}}]]	18	\N	\N
25	2023-01-18 22:27:08.693829	0	[["groups", "in", {"__class__": "Eval", "d": [], "v": "groups"}]]	19	\N	\N
26	2023-01-18 22:27:08.693829	0	[["create_uid", "=", {"__class__": "Eval", "d": -1, "v": "user.id"}]]	19	\N	\N
27	2023-01-18 22:27:08.693829	0	[["write_groups", "in", {"__class__": "Eval", "d": [], "v": "groups"}]]	20	\N	\N
28	2023-01-18 22:27:08.693829	0	[["create_uid", "=", {"__class__": "Eval", "d": -1, "v": "user.id"}]]	20	\N	\N
29	2023-01-18 22:27:08.693829	0	[]	21	\N	\N
30	2023-01-18 22:27:08.693829	0	[["export.groups", "in", {"__class__": "Eval", "d": [], "v": "groups"}]]	22	\N	\N
31	2023-01-18 22:27:08.693829	0	[["export.create_uid", "=", {"__class__": "Eval", "d": -1, "v": "user.id"}]]	22	\N	\N
32	2023-01-18 22:27:08.693829	0	[["export.write_groups", "in", {"__class__": "Eval", "d": [], "v": "groups"}]]	23	\N	\N
33	2023-01-18 22:27:08.693829	0	[["export.create_uid", "=", {"__class__": "Eval", "d": -1, "v": "user.id"}]]	23	\N	\N
34	2023-01-18 22:27:08.693829	0	[]	24	\N	\N
\.


--
-- Data for Name: ir_rule_group; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_rule_group (id, create_date, create_uid, default_p, global_p, model, name, perm_create, perm_delete, perm_read, perm_write, write_date, write_uid) FROM stdin;
1	2023-01-18 22:27:08.693829	0	f	t	82	Own warning	t	t	t	t	\N	\N
2	2023-01-18 22:27:08.693829	0	t	f	83	Own user application	t	t	t	t	\N	\N
3	2023-01-18 22:27:08.693829	0	f	f	83	Any user application	t	t	t	t	\N	\N
4	2023-01-18 22:27:08.693829	0	f	t	13	User in groups	t	t	t	t	\N	\N
5	2023-01-18 22:27:08.693829	0	f	t	22	User in groups	t	t	t	t	\N	\N
6	2023-01-18 22:27:08.693829	0	f	t	23	User in groups	t	t	t	t	\N	\N
7	2023-01-18 22:27:08.693829	0	f	t	24	User in groups	t	t	t	t	\N	\N
8	2023-01-18 22:27:08.693829	0	f	t	25	User in groups	t	t	t	t	\N	\N
9	2023-01-18 22:27:08.693829	0	f	t	28	User in groups	t	t	t	t	\N	\N
10	2023-01-18 22:27:08.693829	0	f	t	29	User in groups	t	t	t	t	\N	\N
11	2023-01-18 22:27:08.693829	0	f	t	11	User in groups	t	t	f	t	\N	\N
12	2023-01-18 22:27:08.693829	0	f	t	12	User in groups	t	t	f	t	\N	\N
13	2023-01-18 22:27:08.693829	0	t	f	20	Own view search	t	t	t	t	\N	\N
14	2023-01-18 22:27:08.693829	0	t	f	20	Common view search	f	f	t	f	\N	\N
15	2023-01-18 22:27:08.693829	0	f	f	20	Any view search	t	t	t	t	\N	\N
16	2023-01-18 22:27:08.693829	0	f	t	65	Own session	t	t	t	t	\N	\N
17	2023-01-18 22:27:08.693829	0	f	t	66	Own session	t	t	t	t	\N	\N
18	2023-01-18 22:27:08.693829	0	f	t	14	Own favorite	t	t	t	t	\N	\N
19	2023-01-18 22:27:08.693829	0	t	f	48	User in groups	f	f	t	f	\N	\N
20	2023-01-18 22:27:08.693829	0	t	f	48	User in modification groups	t	t	t	t	\N	\N
21	2023-01-18 22:27:08.693829	0	f	f	48	Any export	t	t	t	t	\N	\N
22	2023-01-18 22:27:08.693829	0	t	f	49	User in groups	f	f	t	f	\N	\N
23	2023-01-18 22:27:08.693829	0	t	f	49	User in modification groups	t	t	t	t	\N	\N
24	2023-01-18 22:27:08.693829	0	f	f	49	Any export	t	t	t	t	\N	\N
\.


--
-- Data for Name: ir_rule_group-res_group; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public."ir_rule_group-res_group" (id, create_date, create_uid, "group", rule_group, write_date, write_uid) FROM stdin;
1	2023-01-18 22:27:08.693829	0	1	3	\N	\N
2	2023-01-18 22:27:08.693829	0	1	15	\N	\N
3	2023-01-18 22:27:08.693829	0	1	21	\N	\N
4	2023-01-18 22:27:08.693829	0	1	24	\N	\N
\.


--
-- Data for Name: ir_sequence; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_sequence (id, active, create_date, create_uid, last_timestamp, name, number_increment, number_next_internal, padding, prefix, sequence_type, suffix, timestamp_offset, timestamp_rounding, type, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_sequence_strict; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_sequence_strict (id, active, create_date, create_uid, last_timestamp, name, number_increment, number_next_internal, padding, prefix, sequence_type, suffix, timestamp_offset, timestamp_rounding, type, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_sequence_type; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_sequence_type (id, create_date, create_uid, name, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_sequence_type-res_group; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public."ir_sequence_type-res_group" (id, create_date, create_uid, "group", sequence_type, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_session; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_session (id, create_date, create_uid, key, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_session_wizard; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_session_wizard (id, create_date, create_uid, data, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_translation; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_translation (id, lang, src, name, res_id, value, type, module, fuzzy, create_date, create_uid, overriding_module, write_date, write_uid) FROM stdin;
988	en	Export Modification Group	ir.export-write-res.group,name	-1		model	res	f	\N	\N	\N	\N	\N
989	en	Export	ir.export-write-res.group,export	-1		field	res	f	\N	\N	\N	\N	\N
990	en	Group	ir.export-write-res.group,group	-1		field	res	f	\N	\N	\N	\N	\N
991	en	Cancel	res.user.config,start,end	-1		wizard_button	res	f	\N	\N	\N	\N	\N
992	en	OK	res.user.config,start,user	-1		wizard_button	res	f	\N	\N	\N	\N	\N
993	en	End	res.user.config,user,end	-1		wizard_button	res	f	\N	\N	\N	\N	\N
994	en	Add	res.user.config,user,add	-1		wizard_button	res	f	\N	\N	\N	\N	\N
995	en	Users	ir.ui.menu,name	49	Users	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
996	en	Administration	res.group,name	1	Administration	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
997	en	Groups	ir.action,name	55	Groups	model	res	f	2023-01-18 22:27:08.693829	0	\N	2023-01-18 22:27:08.693829	0
998	en	Groups	ir.ui.menu,name	50	Groups	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
999	en	Users	ir.action,name	56	Users	model	res	f	2023-01-18 22:27:08.693829	0	\N	2023-01-18 22:27:08.693829	0
1000	en	Users	ir.ui.menu,name	51	Users	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1001	en	Reset Password	ir.model.button,string	15	Reset Password	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1002	en	Send by email a new temporary password to the user	ir.model.button,help	15	Send by email a new temporary password to the user	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1003	en	Configure Users	ir.action,name	57	Configure Users	model	res	f	2023-01-18 22:27:08.693829	0	\N	2023-01-18 22:27:08.693829	0
1004	en	Own warning	ir.rule.group,name	1	Own warning	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1005	en	Own user application	ir.rule.group,name	2	Own user application	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1	en	Configuration	ir.configuration,name	-1		model	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
2	en	Hostname	ir.configuration,hostname	-1		field	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
3	en	language	ir.configuration,language	-1		field	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
4	en	Translation	ir.translation,name	-1		model	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
5	en	Fuzzy	ir.translation,fuzzy	-1		field	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
6	en	Language	ir.translation,lang	-1		field	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
7	en	Model	ir.translation,model	-1		field	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
8	en	Module	ir.translation,module	-1		field	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
9	en	Field Name	ir.translation,name	-1		field	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
10	en	Overriding Module	ir.translation,overriding_module	-1		field	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
11	en	Resource ID	ir.translation,res_id	-1		field	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
12	en	Source	ir.translation,src	-1		field	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
13	en	Type	ir.translation,type	-1		field	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
14	en	Field	ir.translation,type	-1		selection	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
15	en	Model	ir.translation,type	-1		selection	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
16	en	Report	ir.translation,type	-1		selection	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
17	en	Selection	ir.translation,type	-1		selection	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
18	en	View	ir.translation,type	-1		selection	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
19	en	Wizard Button	ir.translation,type	-1		selection	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
20	en	Help	ir.translation,type	-1		selection	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
21	en	Translation Value	ir.translation,value	-1		field	ir	f	2023-01-18 22:26:47.50999	0	\N	\N	\N
22	en	Set Translation	ir.translation.set.start,name	-1		model	ir	f	\N	\N	\N	\N	\N
23	en	Set Translation	ir.translation.set.succeed,name	-1		model	ir	f	\N	\N	\N	\N	\N
24	en	Clean translation	ir.translation.clean.start,name	-1		model	ir	f	\N	\N	\N	\N	\N
25	en	Clean translation	ir.translation.clean.succeed,name	-1		model	ir	f	\N	\N	\N	\N	\N
26	en	Update translation	ir.translation.update.start,name	-1		model	ir	f	\N	\N	\N	\N	\N
27	en	Language	ir.translation.update.start,language	-1		field	ir	f	\N	\N	\N	\N	\N
28	en	Export translation	ir.translation.export.start,name	-1		model	ir	f	\N	\N	\N	\N	\N
29	en	Language	ir.translation.export.start,language	-1		field	ir	f	\N	\N	\N	\N	\N
30	en	Module	ir.translation.export.start,module	-1		field	ir	f	\N	\N	\N	\N	\N
31	en	Export translation	ir.translation.export.result,name	-1		model	ir	f	\N	\N	\N	\N	\N
32	en	File	ir.translation.export.result,file	-1		field	ir	f	\N	\N	\N	\N	\N
33	en	Filename	ir.translation.export.result,filename	-1		field	ir	f	\N	\N	\N	\N	\N
34	en	Language	ir.translation.export.result,language	-1		field	ir	f	\N	\N	\N	\N	\N
35	en	Module	ir.translation.export.result,module	-1		field	ir	f	\N	\N	\N	\N	\N
36	en	Sequence type	ir.sequence.type,name	-1		model	ir	f	\N	\N	\N	\N	\N
37	en	Sequence Name	ir.sequence.type,name	-1		field	ir	f	\N	\N	\N	\N	\N
38	en	Sequence	ir.sequence,name	-1		model	ir	f	\N	\N	\N	\N	\N
39	en	Last Timestamp	ir.sequence,last_timestamp	-1		field	ir	f	\N	\N	\N	\N	\N
40	en	Sequence Name	ir.sequence,name	-1		field	ir	f	\N	\N	\N	\N	\N
41	en	Increment Number	ir.sequence,number_increment	-1		field	ir	f	\N	\N	\N	\N	\N
1006	en	Any user application	ir.rule.group,name	3	Any user application	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1007	en	Reset Password	ir.action,name	58	Reset Password	model	res	f	2023-01-18 22:27:08.693829	0	\N	2023-01-18 22:27:08.693829	0
1008	en	Validate	ir.model.button,string	16	Validate	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1009	en	Cancel	ir.model.button,string	17	Cancel	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1010	en	User in groups	ir.rule.group,name	4	User in groups	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1011	en	User in groups	ir.rule.group,name	5	User in groups	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1012	en	User in groups	ir.rule.group,name	6	User in groups	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1013	en	User in groups	ir.rule.group,name	7	User in groups	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
42	en	Next Number	ir.sequence,number_next	-1		field	ir	f	\N	\N	\N	\N	\N
43	en	Next Number	ir.sequence,number_next_internal	-1		field	ir	f	\N	\N	\N	\N	\N
44	en	Number padding	ir.sequence,padding	-1		field	ir	f	\N	\N	\N	\N	\N
45	en	Prefix	ir.sequence,prefix	-1		field	ir	f	\N	\N	\N	\N	\N
46	en	Sequence Type	ir.sequence,sequence_type	-1		field	ir	f	\N	\N	\N	\N	\N
47	en	Suffix	ir.sequence,suffix	-1		field	ir	f	\N	\N	\N	\N	\N
48	en	Timestamp Offset	ir.sequence,timestamp_offset	-1		field	ir	f	\N	\N	\N	\N	\N
49	en	Timestamp Rounding	ir.sequence,timestamp_rounding	-1		field	ir	f	\N	\N	\N	\N	\N
50	en	Type	ir.sequence,type	-1		field	ir	f	\N	\N	\N	\N	\N
51	en	Incremental	ir.sequence,type	-1		selection	ir	f	\N	\N	\N	\N	\N
52	en	Decimal Timestamp	ir.sequence,type	-1		selection	ir	f	\N	\N	\N	\N	\N
53	en	Hexadecimal Timestamp	ir.sequence,type	-1		selection	ir	f	\N	\N	\N	\N	\N
54	en	Sequence Strict	ir.sequence.strict,name	-1		model	ir	f	\N	\N	\N	\N	\N
55	en	Last Timestamp	ir.sequence.strict,last_timestamp	-1		field	ir	f	\N	\N	\N	\N	\N
56	en	Sequence Name	ir.sequence.strict,name	-1		field	ir	f	\N	\N	\N	\N	\N
57	en	Increment Number	ir.sequence.strict,number_increment	-1		field	ir	f	\N	\N	\N	\N	\N
58	en	Next Number	ir.sequence.strict,number_next	-1		field	ir	f	\N	\N	\N	\N	\N
59	en	Next Number	ir.sequence.strict,number_next_internal	-1		field	ir	f	\N	\N	\N	\N	\N
60	en	Number padding	ir.sequence.strict,padding	-1		field	ir	f	\N	\N	\N	\N	\N
61	en	Prefix	ir.sequence.strict,prefix	-1		field	ir	f	\N	\N	\N	\N	\N
62	en	Sequence Type	ir.sequence.strict,sequence_type	-1		field	ir	f	\N	\N	\N	\N	\N
63	en	Suffix	ir.sequence.strict,suffix	-1		field	ir	f	\N	\N	\N	\N	\N
64	en	Timestamp Offset	ir.sequence.strict,timestamp_offset	-1		field	ir	f	\N	\N	\N	\N	\N
65	en	Timestamp Rounding	ir.sequence.strict,timestamp_rounding	-1		field	ir	f	\N	\N	\N	\N	\N
66	en	Type	ir.sequence.strict,type	-1		field	ir	f	\N	\N	\N	\N	\N
67	en	Incremental	ir.sequence.strict,type	-1		selection	ir	f	\N	\N	\N	\N	\N
68	en	Decimal Timestamp	ir.sequence.strict,type	-1		selection	ir	f	\N	\N	\N	\N	\N
69	en	Hexadecimal Timestamp	ir.sequence.strict,type	-1		selection	ir	f	\N	\N	\N	\N	\N
70	en	UI menu	ir.ui.menu,name	-1		model	ir	f	\N	\N	\N	\N	\N
71	en	Action	ir.ui.menu,action	-1		field	ir	f	\N	\N	\N	\N	\N
72	en	Action Keywords	ir.ui.menu,action_keywords	-1		field	ir	f	\N	\N	\N	\N	\N
73	en	Children	ir.ui.menu,childs	-1		field	ir	f	\N	\N	\N	\N	\N
74	en	Complete Name	ir.ui.menu,complete_name	-1		field	ir	f	\N	\N	\N	\N	\N
75	en	Favorite	ir.ui.menu,favorite	-1		field	ir	f	\N	\N	\N	\N	\N
76	en	Icon	ir.ui.menu,icon	-1		field	ir	f	\N	\N	\N	\N	\N
77	en	Menu	ir.ui.menu,name	-1		field	ir	f	\N	\N	\N	\N	\N
78	en	Parent Menu	ir.ui.menu,parent	-1		field	ir	f	\N	\N	\N	\N	\N
79	en	Menu Favorite	ir.ui.menu.favorite,name	-1		model	ir	f	\N	\N	\N	\N	\N
80	en	Menu	ir.ui.menu.favorite,menu	-1		field	ir	f	\N	\N	\N	\N	\N
81	en	User	ir.ui.menu.favorite,user	-1		field	ir	f	\N	\N	\N	\N	\N
82	en	View	ir.ui.view,name	-1		model	ir	f	\N	\N	\N	\N	\N
83	en	View Architecture	ir.ui.view,arch	-1		field	ir	f	\N	\N	\N	\N	\N
84	en	Data	ir.ui.view,data	-1		field	ir	f	\N	\N	\N	\N	\N
85	en	Domain	ir.ui.view,domain	-1		field	ir	f	\N	\N	\N	\N	\N
86	en	Children Field	ir.ui.view,field_childs	-1		field	ir	f	\N	\N	\N	\N	\N
87	en	Inherited View	ir.ui.view,inherit	-1		field	ir	f	\N	\N	\N	\N	\N
88	en	Model	ir.ui.view,model	-1		field	ir	f	\N	\N	\N	\N	\N
89	en	Module	ir.ui.view,module	-1		field	ir	f	\N	\N	\N	\N	\N
90	en	Name	ir.ui.view,name	-1		field	ir	f	\N	\N	\N	\N	\N
91	en	Priority	ir.ui.view,priority	-1		field	ir	f	\N	\N	\N	\N	\N
92	en	View Type	ir.ui.view,type	-1		field	ir	f	\N	\N	\N	\N	\N
93	en	Tree	ir.ui.view,type	-1		selection	ir	f	\N	\N	\N	\N	\N
94	en	Form	ir.ui.view,type	-1		selection	ir	f	\N	\N	\N	\N	\N
95	en	Graph	ir.ui.view,type	-1		selection	ir	f	\N	\N	\N	\N	\N
96	en	Calendar	ir.ui.view,type	-1		selection	ir	f	\N	\N	\N	\N	\N
97	en	Board	ir.ui.view,type	-1		selection	ir	f	\N	\N	\N	\N	\N
98	en	List Form	ir.ui.view,type	-1		selection	ir	f	\N	\N	\N	\N	\N
99	en	Show view	ir.ui.view.show.start,name	-1		model	ir	f	\N	\N	\N	\N	\N
100	en	View Tree Width	ir.ui.view_tree_width,name	-1		model	ir	f	\N	\N	\N	\N	\N
101	en	Field	ir.ui.view_tree_width,field	-1		field	ir	f	\N	\N	\N	\N	\N
102	en	Model	ir.ui.view_tree_width,model	-1		field	ir	f	\N	\N	\N	\N	\N
103	en	User	ir.ui.view_tree_width,user	-1		field	ir	f	\N	\N	\N	\N	\N
104	en	Width	ir.ui.view_tree_width,width	-1		field	ir	f	\N	\N	\N	\N	\N
105	en	View Tree Optional	ir.ui.view_tree_optional,name	-1		model	ir	f	\N	\N	\N	\N	\N
106	en	Field	ir.ui.view_tree_optional,field	-1		field	ir	f	\N	\N	\N	\N	\N
107	en	User	ir.ui.view_tree_optional,user	-1		field	ir	f	\N	\N	\N	\N	\N
108	en	Value	ir.ui.view_tree_optional,value	-1		field	ir	f	\N	\N	\N	\N	\N
109	en	View ID	ir.ui.view_tree_optional,view_id	-1		field	ir	f	\N	\N	\N	\N	\N
110	en	View Tree State	ir.ui.view_tree_state,name	-1		model	ir	f	\N	\N	\N	\N	\N
111	en	Child Name	ir.ui.view_tree_state,child_name	-1		field	ir	f	\N	\N	\N	\N	\N
112	en	Domain	ir.ui.view_tree_state,domain	-1		field	ir	f	\N	\N	\N	\N	\N
113	en	Model	ir.ui.view_tree_state,model	-1		field	ir	f	\N	\N	\N	\N	\N
114	en	Expanded Nodes	ir.ui.view_tree_state,nodes	-1		field	ir	f	\N	\N	\N	\N	\N
115	en	Selected Nodes	ir.ui.view_tree_state,selected_nodes	-1		field	ir	f	\N	\N	\N	\N	\N
116	en	User	ir.ui.view_tree_state,user	-1		field	ir	f	\N	\N	\N	\N	\N
117	en	View Search	ir.ui.view_search,name	-1		model	ir	f	\N	\N	\N	\N	\N
118	en	Domain	ir.ui.view_search,domain	-1		field	ir	f	\N	\N	\N	\N	\N
119	en	The PYSON domain.	ir.ui.view_search,domain	-1		help	ir	f	\N	\N	\N	\N	\N
120	en	Model	ir.ui.view_search,model	-1		field	ir	f	\N	\N	\N	\N	\N
121	en	Name	ir.ui.view_search,name	-1		field	ir	f	\N	\N	\N	\N	\N
122	en	User	ir.ui.view_search,user	-1		field	ir	f	\N	\N	\N	\N	\N
123	en	Icon	ir.ui.icon,name	-1		model	ir	f	\N	\N	\N	\N	\N
124	en	Icon	ir.ui.icon,icon	-1		field	ir	f	\N	\N	\N	\N	\N
125	en	Module	ir.ui.icon,module	-1		field	ir	f	\N	\N	\N	\N	\N
126	en	Name	ir.ui.icon,name	-1		field	ir	f	\N	\N	\N	\N	\N
127	en	SVG Path	ir.ui.icon,path	-1		field	ir	f	\N	\N	\N	\N	\N
128	en	Action	ir.action,name	-1		model	ir	f	\N	\N	\N	\N	\N
129	en	Icon	ir.action,icon	-1		field	ir	f	\N	\N	\N	\N	\N
130	en	Keywords	ir.action,keywords	-1		field	ir	f	\N	\N	\N	\N	\N
131	en	Name	ir.action,name	-1		field	ir	f	\N	\N	\N	\N	\N
132	en	Records	ir.action,records	-1		field	ir	f	\N	\N	\N	\N	\N
133	en	The records on which the action runs.	ir.action,records	-1		help	ir	f	\N	\N	\N	\N	\N
134	en	Selected	ir.action,records	-1		selection	ir	f	\N	\N	\N	\N	\N
135	en	Listed	ir.action,records	-1		selection	ir	f	\N	\N	\N	\N	\N
136	en	Type	ir.action,type	-1		field	ir	f	\N	\N	\N	\N	\N
137	en	Usage	ir.action,usage	-1		field	ir	f	\N	\N	\N	\N	\N
138	en	Action keyword	ir.action.keyword,name	-1		model	ir	f	\N	\N	\N	\N	\N
139	en	Action	ir.action.keyword,action	-1		field	ir	f	\N	\N	\N	\N	\N
140	en	Keyword	ir.action.keyword,keyword	-1		field	ir	f	\N	\N	\N	\N	\N
141	en	Open tree	ir.action.keyword,keyword	-1		selection	ir	f	\N	\N	\N	\N	\N
142	en	Print form	ir.action.keyword,keyword	-1		selection	ir	f	\N	\N	\N	\N	\N
143	en	Action form	ir.action.keyword,keyword	-1		selection	ir	f	\N	\N	\N	\N	\N
144	en	Form relate	ir.action.keyword,keyword	-1		selection	ir	f	\N	\N	\N	\N	\N
145	en	Open Graph	ir.action.keyword,keyword	-1		selection	ir	f	\N	\N	\N	\N	\N
146	en	Model	ir.action.keyword,model	-1		field	ir	f	\N	\N	\N	\N	\N
147	en	Action report	ir.action.report,name	-1		model	ir	f	\N	\N	\N	\N	\N
148	en	Action	ir.action.report,action	-1		field	ir	f	\N	\N	\N	\N	\N
149	en	Direct Print	ir.action.report,direct_print	-1		field	ir	f	\N	\N	\N	\N	\N
150	en	Extension	ir.action.report,extension	-1		field	ir	f	\N	\N	\N	\N	\N
151	en	Leave empty for the same as template, see LibreOffice documentation for compatible format.	ir.action.report,extension	-1		help	ir	f	\N	\N	\N	\N	\N
152	en	Icon	ir.action.report,icon	-1		field	ir	f	\N	\N	\N	\N	\N
153	en	Is Custom	ir.action.report,is_custom	-1		field	ir	f	\N	\N	\N	\N	\N
154	en	Keywords	ir.action.report,keywords	-1		field	ir	f	\N	\N	\N	\N	\N
155	en	Model	ir.action.report,model	-1		field	ir	f	\N	\N	\N	\N	\N
156	en	Module	ir.action.report,module	-1		field	ir	f	\N	\N	\N	\N	\N
157	en	Name	ir.action.report,name	-1		field	ir	f	\N	\N	\N	\N	\N
158	en	Record Name	ir.action.report,record_name	-1		field	ir	f	\N	\N	\N	\N	\N
159	en	A Genshi expression to compute the name using 'record'.\nLeave empty for the default name.	ir.action.report,record_name	-1		help	ir	f	\N	\N	\N	\N	\N
160	en	Records	ir.action.report,records	-1		field	ir	f	\N	\N	\N	\N	\N
161	en	The records on which the action runs.	ir.action.report,records	-1		help	ir	f	\N	\N	\N	\N	\N
162	en	Selected	ir.action.report,records	-1		selection	ir	f	\N	\N	\N	\N	\N
163	en	Listed	ir.action.report,records	-1		selection	ir	f	\N	\N	\N	\N	\N
164	en	Path	ir.action.report,report	-1		field	ir	f	\N	\N	\N	\N	\N
165	en	Content	ir.action.report,report_content	-1		field	ir	f	\N	\N	\N	\N	\N
166	en	Content	ir.action.report,report_content_custom	-1		field	ir	f	\N	\N	\N	\N	\N
167	en	Content HTML	ir.action.report,report_content_html	-1		field	ir	f	\N	\N	\N	\N	\N
168	en	Content Name	ir.action.report,report_content_name	-1		field	ir	f	\N	\N	\N	\N	\N
169	en	Internal Name	ir.action.report,report_name	-1		field	ir	f	\N	\N	\N	\N	\N
170	en	Single	ir.action.report,single	-1		field	ir	f	\N	\N	\N	\N	\N
171	en	Check if the template works only for one record.	ir.action.report,single	-1		help	ir	f	\N	\N	\N	\N	\N
172	en	Template Extension	ir.action.report,template_extension	-1		field	ir	f	\N	\N	\N	\N	\N
173	en	Translatable	ir.action.report,translatable	-1		field	ir	f	\N	\N	\N	\N	\N
174	en	Uncheck to disable translations for this report.	ir.action.report,translatable	-1		help	ir	f	\N	\N	\N	\N	\N
175	en	Type	ir.action.report,type	-1		field	ir	f	\N	\N	\N	\N	\N
176	en	Usage	ir.action.report,usage	-1		field	ir	f	\N	\N	\N	\N	\N
177	en	Action act window	ir.action.act_window,name	-1		model	ir	f	\N	\N	\N	\N	\N
178	en	Domains	ir.action.act_window,act_window_domains	-1		field	ir	f	\N	\N	\N	\N	\N
179	en	Views	ir.action.act_window,act_window_views	-1		field	ir	f	\N	\N	\N	\N	\N
180	en	Action	ir.action.act_window,action	-1		field	ir	f	\N	\N	\N	\N	\N
181	en	Context Value	ir.action.act_window,context	-1		field	ir	f	\N	\N	\N	\N	\N
182	en	Context Domain	ir.action.act_window,context_domain	-1		field	ir	f	\N	\N	\N	\N	\N
183	en	Part of the domain that will be evaluated on each refresh.	ir.action.act_window,context_domain	-1		help	ir	f	\N	\N	\N	\N	\N
184	en	Context Model	ir.action.act_window,context_model	-1		field	ir	f	\N	\N	\N	\N	\N
185	en	Domain Value	ir.action.act_window,domain	-1		field	ir	f	\N	\N	\N	\N	\N
186	en	Domains	ir.action.act_window,domains	-1		field	ir	f	\N	\N	\N	\N	\N
187	en	Icon	ir.action.act_window,icon	-1		field	ir	f	\N	\N	\N	\N	\N
188	en	Keywords	ir.action.act_window,keywords	-1		field	ir	f	\N	\N	\N	\N	\N
189	en	Limit	ir.action.act_window,limit	-1		field	ir	f	\N	\N	\N	\N	\N
190	en	Default limit for the list view.	ir.action.act_window,limit	-1		help	ir	f	\N	\N	\N	\N	\N
191	en	Name	ir.action.act_window,name	-1		field	ir	f	\N	\N	\N	\N	\N
192	en	Order Value	ir.action.act_window,order	-1		field	ir	f	\N	\N	\N	\N	\N
193	en	PySON Context	ir.action.act_window,pyson_context	-1		field	ir	f	\N	\N	\N	\N	\N
194	en	PySON Domain	ir.action.act_window,pyson_domain	-1		field	ir	f	\N	\N	\N	\N	\N
195	en	PySON Order	ir.action.act_window,pyson_order	-1		field	ir	f	\N	\N	\N	\N	\N
196	en	PySON Search Criteria	ir.action.act_window,pyson_search_value	-1		field	ir	f	\N	\N	\N	\N	\N
197	en	Records	ir.action.act_window,records	-1		field	ir	f	\N	\N	\N	\N	\N
198	en	The records on which the action runs.	ir.action.act_window,records	-1		help	ir	f	\N	\N	\N	\N	\N
199	en	Selected	ir.action.act_window,records	-1		selection	ir	f	\N	\N	\N	\N	\N
200	en	Listed	ir.action.act_window,records	-1		selection	ir	f	\N	\N	\N	\N	\N
201	en	Model	ir.action.act_window,res_model	-1		field	ir	f	\N	\N	\N	\N	\N
202	en	Search Criteria	ir.action.act_window,search_value	-1		field	ir	f	\N	\N	\N	\N	\N
203	en	Default search criteria for the list view.	ir.action.act_window,search_value	-1		help	ir	f	\N	\N	\N	\N	\N
204	en	Type	ir.action.act_window,type	-1		field	ir	f	\N	\N	\N	\N	\N
205	en	Usage	ir.action.act_window,usage	-1		field	ir	f	\N	\N	\N	\N	\N
206	en	Views	ir.action.act_window,views	-1		field	ir	f	\N	\N	\N	\N	\N
207	en	Action act window view	ir.action.act_window.view,name	-1		model	ir	f	\N	\N	\N	\N	\N
208	en	Action	ir.action.act_window.view,act_window	-1		field	ir	f	\N	\N	\N	\N	\N
209	en	View	ir.action.act_window.view,view	-1		field	ir	f	\N	\N	\N	\N	\N
210	en	Action act window domain	ir.action.act_window.domain,name	-1		model	ir	f	\N	\N	\N	\N	\N
211	en	Action	ir.action.act_window.domain,act_window	-1		field	ir	f	\N	\N	\N	\N	\N
212	en	Count	ir.action.act_window.domain,count	-1		field	ir	f	\N	\N	\N	\N	\N
213	en	Domain	ir.action.act_window.domain,domain	-1		field	ir	f	\N	\N	\N	\N	\N
214	en	Name	ir.action.act_window.domain,name	-1		field	ir	f	\N	\N	\N	\N	\N
215	en	Action wizard	ir.action.wizard,name	-1		model	ir	f	\N	\N	\N	\N	\N
216	en	Action	ir.action.wizard,action	-1		field	ir	f	\N	\N	\N	\N	\N
217	en	Icon	ir.action.wizard,icon	-1		field	ir	f	\N	\N	\N	\N	\N
218	en	Keywords	ir.action.wizard,keywords	-1		field	ir	f	\N	\N	\N	\N	\N
219	en	Model	ir.action.wizard,model	-1		field	ir	f	\N	\N	\N	\N	\N
220	en	Name	ir.action.wizard,name	-1		field	ir	f	\N	\N	\N	\N	\N
221	en	Records	ir.action.wizard,records	-1		field	ir	f	\N	\N	\N	\N	\N
222	en	The records on which the action runs.	ir.action.wizard,records	-1		help	ir	f	\N	\N	\N	\N	\N
223	en	Selected	ir.action.wizard,records	-1		selection	ir	f	\N	\N	\N	\N	\N
224	en	Listed	ir.action.wizard,records	-1		selection	ir	f	\N	\N	\N	\N	\N
225	en	Type	ir.action.wizard,type	-1		field	ir	f	\N	\N	\N	\N	\N
226	en	Usage	ir.action.wizard,usage	-1		field	ir	f	\N	\N	\N	\N	\N
227	en	Window	ir.action.wizard,window	-1		field	ir	f	\N	\N	\N	\N	\N
228	en	Run wizard in a new window.	ir.action.wizard,window	-1		help	ir	f	\N	\N	\N	\N	\N
229	en	Wizard name	ir.action.wizard,wiz_name	-1		field	ir	f	\N	\N	\N	\N	\N
230	en	Action URL	ir.action.url,name	-1		model	ir	f	\N	\N	\N	\N	\N
231	en	Action	ir.action.url,action	-1		field	ir	f	\N	\N	\N	\N	\N
232	en	Icon	ir.action.url,icon	-1		field	ir	f	\N	\N	\N	\N	\N
233	en	Keywords	ir.action.url,keywords	-1		field	ir	f	\N	\N	\N	\N	\N
234	en	Name	ir.action.url,name	-1		field	ir	f	\N	\N	\N	\N	\N
235	en	Records	ir.action.url,records	-1		field	ir	f	\N	\N	\N	\N	\N
236	en	The records on which the action runs.	ir.action.url,records	-1		help	ir	f	\N	\N	\N	\N	\N
237	en	Selected	ir.action.url,records	-1		selection	ir	f	\N	\N	\N	\N	\N
238	en	Listed	ir.action.url,records	-1		selection	ir	f	\N	\N	\N	\N	\N
239	en	Type	ir.action.url,type	-1		field	ir	f	\N	\N	\N	\N	\N
240	en	Action Url	ir.action.url,url	-1		field	ir	f	\N	\N	\N	\N	\N
241	en	Usage	ir.action.url,usage	-1		field	ir	f	\N	\N	\N	\N	\N
242	en	Model	ir.model,name	-1		model	ir	f	\N	\N	\N	\N	\N
243	en	Fields	ir.model,fields	-1		field	ir	f	\N	\N	\N	\N	\N
244	en	Global Search	ir.model,global_search_p	-1		field	ir	f	\N	\N	\N	\N	\N
245	en	Information	ir.model,info	-1		field	ir	f	\N	\N	\N	\N	\N
246	en	Model Name	ir.model,model	-1		field	ir	f	\N	\N	\N	\N	\N
247	en	Module	ir.model,module	-1		field	ir	f	\N	\N	\N	\N	\N
248	en	Module in which this model is defined.	ir.model,module	-1		help	ir	f	\N	\N	\N	\N	\N
249	en	Model Description	ir.model,name	-1		field	ir	f	\N	\N	\N	\N	\N
250	en	Model field	ir.model.field,name	-1		model	ir	f	\N	\N	\N	\N	\N
251	en	Access	ir.model.field,access	-1		field	ir	f	\N	\N	\N	\N	\N
252	en	If checked, the access right on the model of the field is also tested against the relation of the field.	ir.model.field,access	-1		help	ir	f	\N	\N	\N	\N	\N
253	en	Field Description	ir.model.field,field_description	-1		field	ir	f	\N	\N	\N	\N	\N
254	en	Help	ir.model.field,help	-1		field	ir	f	\N	\N	\N	\N	\N
255	en	Model	ir.model.field,model	-1		field	ir	f	\N	\N	\N	\N	\N
256	en	Module	ir.model.field,module	-1		field	ir	f	\N	\N	\N	\N	\N
257	en	Module in which this field is defined.	ir.model.field,module	-1		help	ir	f	\N	\N	\N	\N	\N
258	en	Name	ir.model.field,name	-1		field	ir	f	\N	\N	\N	\N	\N
259	en	Model Relation	ir.model.field,relation	-1		field	ir	f	\N	\N	\N	\N	\N
260	en	Field Type	ir.model.field,ttype	-1		field	ir	f	\N	\N	\N	\N	\N
261	en	Model access	ir.model.access,name	-1		model	ir	f	\N	\N	\N	\N	\N
262	en	Description	ir.model.access,description	-1		field	ir	f	\N	\N	\N	\N	\N
263	en	Group	ir.model.access,group	-1		field	ir	f	\N	\N	\N	\N	\N
264	en	Model	ir.model.access,model	-1		field	ir	f	\N	\N	\N	\N	\N
265	en	Create Access	ir.model.access,perm_create	-1		field	ir	f	\N	\N	\N	\N	\N
266	en	Delete Access	ir.model.access,perm_delete	-1		field	ir	f	\N	\N	\N	\N	\N
267	en	Read Access	ir.model.access,perm_read	-1		field	ir	f	\N	\N	\N	\N	\N
268	en	Write Access	ir.model.access,perm_write	-1		field	ir	f	\N	\N	\N	\N	\N
269	en	Model Field Access	ir.model.field.access,name	-1		model	ir	f	\N	\N	\N	\N	\N
270	en	Description	ir.model.field.access,description	-1		field	ir	f	\N	\N	\N	\N	\N
271	en	Field	ir.model.field.access,field	-1		field	ir	f	\N	\N	\N	\N	\N
272	en	Group	ir.model.field.access,group	-1		field	ir	f	\N	\N	\N	\N	\N
273	en	Create Access	ir.model.field.access,perm_create	-1		field	ir	f	\N	\N	\N	\N	\N
274	en	Delete Access	ir.model.field.access,perm_delete	-1		field	ir	f	\N	\N	\N	\N	\N
275	en	Read Access	ir.model.field.access,perm_read	-1		field	ir	f	\N	\N	\N	\N	\N
276	en	Write Access	ir.model.field.access,perm_write	-1		field	ir	f	\N	\N	\N	\N	\N
277	en	Model Button	ir.model.button,name	-1		model	ir	f	\N	\N	\N	\N	\N
278	en	Clicks	ir.model.button,clicks	-1		field	ir	f	\N	\N	\N	\N	\N
279	en	Confirm	ir.model.button,confirm	-1		field	ir	f	\N	\N	\N	\N	\N
280	en	Text to ask user confirmation when clicking the button.	ir.model.button,confirm	-1		help	ir	f	\N	\N	\N	\N	\N
281	en	Help	ir.model.button,help	-1		field	ir	f	\N	\N	\N	\N	\N
282	en	Model	ir.model.button,model	-1		field	ir	f	\N	\N	\N	\N	\N
283	en	Name	ir.model.button,name	-1		field	ir	f	\N	\N	\N	\N	\N
284	en	Reset	ir.model.button,reset	-1		field	ir	f	\N	\N	\N	\N	\N
285	en	Reset by	ir.model.button,reset_by	-1		field	ir	f	\N	\N	\N	\N	\N
286	en	Button that should reset the rules.	ir.model.button,reset_by	-1		help	ir	f	\N	\N	\N	\N	\N
287	en	Rules	ir.model.button,rules	-1		field	ir	f	\N	\N	\N	\N	\N
288	en	Label	ir.model.button,string	-1		field	ir	f	\N	\N	\N	\N	\N
289	en	Model Button Rule	ir.model.button.rule,name	-1		model	ir	f	\N	\N	\N	\N	\N
290	en	Button	ir.model.button.rule,button	-1		field	ir	f	\N	\N	\N	\N	\N
291	en	Condition	ir.model.button.rule,condition	-1		field	ir	f	\N	\N	\N	\N	\N
292	en	A PYSON statement evaluated with the record represented by "self"\nIt activate the rule if true.	ir.model.button.rule,condition	-1		help	ir	f	\N	\N	\N	\N	\N
293	en	Description	ir.model.button.rule,description	-1		field	ir	f	\N	\N	\N	\N	\N
294	en	Number of User	ir.model.button.rule,number_user	-1		field	ir	f	\N	\N	\N	\N	\N
295	en	Model Button Click	ir.model.button.click,name	-1		model	ir	f	\N	\N	\N	\N	\N
296	en	Button	ir.model.button.click,button	-1		field	ir	f	\N	\N	\N	\N	\N
297	en	Record ID	ir.model.button.click,record_id	-1		field	ir	f	\N	\N	\N	\N	\N
298	en	Model Button Reset	ir.model.button-button.reset,name	-1		model	ir	f	\N	\N	\N	\N	\N
299	en	Button	ir.model.button-button.reset,button	-1		field	ir	f	\N	\N	\N	\N	\N
300	en	Button Ruled	ir.model.button-button.reset,button_ruled	-1		field	ir	f	\N	\N	\N	\N	\N
301	en	Model data	ir.model.data,name	-1		model	ir	f	\N	\N	\N	\N	\N
302	en	Resource ID	ir.model.data,db_id	-1		field	ir	f	\N	\N	\N	\N	\N
303	en	The id of the record in the database.	ir.model.data,db_id	-1		help	ir	f	\N	\N	\N	\N	\N
304	en	Identifier on File System	ir.model.data,fs_id	-1		field	ir	f	\N	\N	\N	\N	\N
305	en	The id of the record as known on the file system.	ir.model.data,fs_id	-1		help	ir	f	\N	\N	\N	\N	\N
306	en	Values on File System	ir.model.data,fs_values	-1		field	ir	f	\N	\N	\N	\N	\N
307	en	Model	ir.model.data,model	-1		field	ir	f	\N	\N	\N	\N	\N
308	en	Module	ir.model.data,module	-1		field	ir	f	\N	\N	\N	\N	\N
309	en	No Update	ir.model.data,noupdate	-1		field	ir	f	\N	\N	\N	\N	\N
310	en	Out of Sync	ir.model.data,out_of_sync	-1		field	ir	f	\N	\N	\N	\N	\N
311	en	Values	ir.model.data,values	-1		field	ir	f	\N	\N	\N	\N	\N
312	en	Print Model Graph	ir.model.print_model_graph.start,name	-1		model	ir	f	\N	\N	\N	\N	\N
313	en	Filter	ir.model.print_model_graph.start,filter	-1		field	ir	f	\N	\N	\N	\N	\N
314	en	Entering a Python Regular Expression will exclude matching models from the graph.	ir.model.print_model_graph.start,filter	-1		help	ir	f	\N	\N	\N	\N	\N
315	en	Level	ir.model.print_model_graph.start,level	-1		field	ir	f	\N	\N	\N	\N	\N
316	en	Attachment	ir.attachment,name	-1		model	ir	f	\N	\N	\N	\N	\N
317	en	Copy to Resources	ir.attachment,copy_to_resources	-1		field	ir	f	\N	\N	\N	\N	\N
318	en	Copy to Resources Visible	ir.attachment,copy_to_resources_visible	-1		field	ir	f	\N	\N	\N	\N	\N
319	en	Data	ir.attachment,data	-1		field	ir	f	\N	\N	\N	\N	\N
320	en	Data size	ir.attachment,data_size	-1		field	ir	f	\N	\N	\N	\N	\N
321	en	Description	ir.attachment,description	-1		field	ir	f	\N	\N	\N	\N	\N
322	en	File ID	ir.attachment,file_id	-1		field	ir	f	\N	\N	\N	\N	\N
323	en	Last Modification	ir.attachment,last_modification	-1		field	ir	f	\N	\N	\N	\N	\N
324	en	Last User	ir.attachment,last_user	-1		field	ir	f	\N	\N	\N	\N	\N
325	en	Link	ir.attachment,link	-1		field	ir	f	\N	\N	\N	\N	\N
326	en	Name	ir.attachment,name	-1		field	ir	f	\N	\N	\N	\N	\N
327	en	Resource	ir.attachment,resource	-1		field	ir	f	\N	\N	\N	\N	\N
328	en	Summary	ir.attachment,summary	-1		field	ir	f	\N	\N	\N	\N	\N
329	en	Type	ir.attachment,type	-1		field	ir	f	\N	\N	\N	\N	\N
330	en	Data	ir.attachment,type	-1		selection	ir	f	\N	\N	\N	\N	\N
331	en	Link	ir.attachment,type	-1		selection	ir	f	\N	\N	\N	\N	\N
332	en	Note	ir.note,name	-1		model	ir	f	\N	\N	\N	\N	\N
333	en	Copy to Resources	ir.note,copy_to_resources	-1		field	ir	f	\N	\N	\N	\N	\N
334	en	Copy to Resources Visible	ir.note,copy_to_resources_visible	-1		field	ir	f	\N	\N	\N	\N	\N
335	en	Last Modification	ir.note,last_modification	-1		field	ir	f	\N	\N	\N	\N	\N
336	en	Last User	ir.note,last_user	-1		field	ir	f	\N	\N	\N	\N	\N
337	en	Message	ir.note,message	-1		field	ir	f	\N	\N	\N	\N	\N
338	en	Message	ir.note,message_wrapped	-1		field	ir	f	\N	\N	\N	\N	\N
339	en	Resource	ir.note,resource	-1		field	ir	f	\N	\N	\N	\N	\N
340	en	Unread	ir.note,unread	-1		field	ir	f	\N	\N	\N	\N	\N
341	en	Note Read	ir.note.read,name	-1		model	ir	f	\N	\N	\N	\N	\N
342	en	Note	ir.note.read,note	-1		field	ir	f	\N	\N	\N	\N	\N
343	en	User	ir.note.read,user	-1		field	ir	f	\N	\N	\N	\N	\N
344	en	Avatar	ir.avatar,name	-1		model	ir	f	\N	\N	\N	\N	\N
345	en	Cache	ir.avatar,cache	-1		field	ir	f	\N	\N	\N	\N	\N
346	en	Copy to Resources	ir.avatar,copy_to_resources	-1		field	ir	f	\N	\N	\N	\N	\N
347	en	Copy to Resources Visible	ir.avatar,copy_to_resources_visible	-1		field	ir	f	\N	\N	\N	\N	\N
348	en	Image	ir.avatar,image	-1		field	ir	f	\N	\N	\N	\N	\N
349	en	Image ID	ir.avatar,image_id	-1		field	ir	f	\N	\N	\N	\N	\N
350	en	Last Modification	ir.avatar,last_modification	-1		field	ir	f	\N	\N	\N	\N	\N
351	en	Last User	ir.avatar,last_user	-1		field	ir	f	\N	\N	\N	\N	\N
352	en	Resource	ir.avatar,resource	-1		field	ir	f	\N	\N	\N	\N	\N
353	en	UUID	ir.avatar,uuid	-1		field	ir	f	\N	\N	\N	\N	\N
354	en	Avatar Cache	ir.avatar.cache,name	-1		model	ir	f	\N	\N	\N	\N	\N
355	en	Avatar	ir.avatar.cache,avatar	-1		field	ir	f	\N	\N	\N	\N	\N
356	en	Image	ir.avatar.cache,image	-1		field	ir	f	\N	\N	\N	\N	\N
357	en	Image ID	ir.avatar.cache,image_id	-1		field	ir	f	\N	\N	\N	\N	\N
358	en	Size	ir.avatar.cache,size	-1		field	ir	f	\N	\N	\N	\N	\N
359	en	Cron	ir.cron,name	-1		model	ir	f	\N	\N	\N	\N	\N
360	en	Day	ir.cron,day	-1		field	ir	f	\N	\N	\N	\N	\N
361	en	Hour	ir.cron,hour	-1		field	ir	f	\N	\N	\N	\N	\N
362	en	Interval Number	ir.cron,interval_number	-1		field	ir	f	\N	\N	\N	\N	\N
363	en	Interval Type	ir.cron,interval_type	-1		field	ir	f	\N	\N	\N	\N	\N
364	en	Minutes	ir.cron,interval_type	-1		selection	ir	f	\N	\N	\N	\N	\N
365	en	Hours	ir.cron,interval_type	-1		selection	ir	f	\N	\N	\N	\N	\N
366	en	Days	ir.cron,interval_type	-1		selection	ir	f	\N	\N	\N	\N	\N
367	en	Weeks	ir.cron,interval_type	-1		selection	ir	f	\N	\N	\N	\N	\N
368	en	Months	ir.cron,interval_type	-1		selection	ir	f	\N	\N	\N	\N	\N
369	en	Method	ir.cron,method	-1		field	ir	f	\N	\N	\N	\N	\N
370	en	Run On Time Triggers	ir.cron,method	-1		selection	ir	f	\N	\N	\N	\N	\N
371	en	Clean Task Queue	ir.cron,method	-1		selection	ir	f	\N	\N	\N	\N	\N
372	en	Clean Errors	ir.cron,method	-1		selection	ir	f	\N	\N	\N	\N	\N
373	en	Minute	ir.cron,minute	-1		field	ir	f	\N	\N	\N	\N	\N
374	en	Next Call	ir.cron,next_call	-1		field	ir	f	\N	\N	\N	\N	\N
375	en	Timezone	ir.cron,timezone	-1		field	ir	f	\N	\N	\N	\N	\N
376	en	Day of Week	ir.cron,weekday	-1		field	ir	f	\N	\N	\N	\N	\N
377	en	Language	ir.lang,name	-1		model	ir	f	\N	\N	\N	\N	\N
378	en	AM	ir.lang,am	-1		field	ir	f	\N	\N	\N	\N	\N
379	en	Code	ir.lang,code	-1		field	ir	f	\N	\N	\N	\N	\N
380	en	RFC 4646 tag.	ir.lang,code	-1		help	ir	f	\N	\N	\N	\N	\N
381	en	Date	ir.lang,date	-1		field	ir	f	\N	\N	\N	\N	\N
382	en	Decimal Separator	ir.lang,decimal_point	-1		field	ir	f	\N	\N	\N	\N	\N
383	en	Direction	ir.lang,direction	-1		field	ir	f	\N	\N	\N	\N	\N
384	en	Left-to-right	ir.lang,direction	-1		selection	ir	f	\N	\N	\N	\N	\N
385	en	Right-to-left	ir.lang,direction	-1		selection	ir	f	\N	\N	\N	\N	\N
386	en	Grouping	ir.lang,grouping	-1		field	ir	f	\N	\N	\N	\N	\N
387	en	Decimal Separator	ir.lang,mon_decimal_point	-1		field	ir	f	\N	\N	\N	\N	\N
388	en	Grouping	ir.lang,mon_grouping	-1		field	ir	f	\N	\N	\N	\N	\N
389	en	Thousands Separator	ir.lang,mon_thousands_sep	-1		field	ir	f	\N	\N	\N	\N	\N
390	en	Negative Currency Symbol Precedes	ir.lang,n_cs_precedes	-1		field	ir	f	\N	\N	\N	\N	\N
391	en	Negative Separate by Space	ir.lang,n_sep_by_space	-1		field	ir	f	\N	\N	\N	\N	\N
392	en	Negative Sign Position	ir.lang,n_sign_posn	-1		field	ir	f	\N	\N	\N	\N	\N
393	en	Name	ir.lang,name	-1		field	ir	f	\N	\N	\N	\N	\N
394	en	Negative Sign	ir.lang,negative_sign	-1		field	ir	f	\N	\N	\N	\N	\N
395	en	Positive Currency Symbol Precedes	ir.lang,p_cs_precedes	-1		field	ir	f	\N	\N	\N	\N	\N
396	en	Positive Separate by Space	ir.lang,p_sep_by_space	-1		field	ir	f	\N	\N	\N	\N	\N
397	en	Positive Sign Position	ir.lang,p_sign_posn	-1		field	ir	f	\N	\N	\N	\N	\N
398	en	Parent Code	ir.lang,parent	-1		field	ir	f	\N	\N	\N	\N	\N
399	en	Code of the exceptional parent	ir.lang,parent	-1		help	ir	f	\N	\N	\N	\N	\N
400	en	PostgreSQL Text Search Configuration	ir.lang,pg_text_search	-1		field	ir	f	\N	\N	\N	\N	\N
401	en	PM	ir.lang,pm	-1		field	ir	f	\N	\N	\N	\N	\N
402	en	Positive Sign	ir.lang,positive_sign	-1		field	ir	f	\N	\N	\N	\N	\N
403	en	Thousands Separator	ir.lang,thousands_sep	-1		field	ir	f	\N	\N	\N	\N	\N
404	en	Translatable	ir.lang,translatable	-1		field	ir	f	\N	\N	\N	\N	\N
405	en	Configure languages	ir.lang.config.start,name	-1		model	ir	f	\N	\N	\N	\N	\N
406	en	Languages	ir.lang.config.start,languages	-1		field	ir	f	\N	\N	\N	\N	\N
407	en	Export	ir.export,name	-1		model	ir	f	\N	\N	\N	\N	\N
408	en	Fields	ir.export,export_fields	-1		field	ir	f	\N	\N	\N	\N	\N
409	en	Header	ir.export,header	-1		field	ir	f	\N	\N	\N	\N	\N
410	en	Check to include field names on the export.	ir.export,header	-1		help	ir	f	\N	\N	\N	\N	\N
411	en	Name	ir.export,name	-1		field	ir	f	\N	\N	\N	\N	\N
412	en	Resource	ir.export,resource	-1		field	ir	f	\N	\N	\N	\N	\N
413	en	Export line	ir.export.line,name	-1		model	ir	f	\N	\N	\N	\N	\N
414	en	Export	ir.export.line,export	-1		field	ir	f	\N	\N	\N	\N	\N
415	en	Name	ir.export.line,name	-1		field	ir	f	\N	\N	\N	\N	\N
416	en	Rule group	ir.rule.group,name	-1		model	ir	f	\N	\N	\N	\N	\N
417	en	Default	ir.rule.group,default_p	-1		field	ir	f	\N	\N	\N	\N	\N
418	en	Add this rule to all users by default.	ir.rule.group,default_p	-1		help	ir	f	\N	\N	\N	\N	\N
419	en	Global	ir.rule.group,global_p	-1		field	ir	f	\N	\N	\N	\N	\N
420	en	Make the rule global \nso every users must follow this rule.	ir.rule.group,global_p	-1		help	ir	f	\N	\N	\N	\N	\N
421	en	Model	ir.rule.group,model	-1		field	ir	f	\N	\N	\N	\N	\N
422	en	Name	ir.rule.group,name	-1		field	ir	f	\N	\N	\N	\N	\N
423	en	Displayed to users when access error is raised for this rule.	ir.rule.group,name	-1		help	ir	f	\N	\N	\N	\N	\N
424	en	Create Access	ir.rule.group,perm_create	-1		field	ir	f	\N	\N	\N	\N	\N
425	en	Delete Access	ir.rule.group,perm_delete	-1		field	ir	f	\N	\N	\N	\N	\N
426	en	Read Access	ir.rule.group,perm_read	-1		field	ir	f	\N	\N	\N	\N	\N
427	en	Write Access	ir.rule.group,perm_write	-1		field	ir	f	\N	\N	\N	\N	\N
428	en	Tests	ir.rule.group,rules	-1		field	ir	f	\N	\N	\N	\N	\N
429	en	The rule is satisfied if at least one test is True.	ir.rule.group,rules	-1		help	ir	f	\N	\N	\N	\N	\N
430	en	Rule	ir.rule,name	-1		model	ir	f	\N	\N	\N	\N	\N
431	en	Domain	ir.rule,domain	-1		field	ir	f	\N	\N	\N	\N	\N
432	en	Domain is evaluated with a PYSON context containing:\n- "user" as the current user\n- "groups" as list of ids from the current user	ir.rule,domain	-1		help	ir	f	\N	\N	\N	\N	\N
433	en	Group	ir.rule,rule_group	-1		field	ir	f	\N	\N	\N	\N	\N
434	en	Module	ir.module,name	-1		model	ir	f	\N	\N	\N	\N	\N
435	en	Childs	ir.module,childs	-1		field	ir	f	\N	\N	\N	\N	\N
436	en	Dependencies	ir.module,dependencies	-1		field	ir	f	\N	\N	\N	\N	\N
437	en	Name	ir.module,name	-1		field	ir	f	\N	\N	\N	\N	\N
438	en	Parents	ir.module,parents	-1		field	ir	f	\N	\N	\N	\N	\N
439	en	State	ir.module,state	-1		field	ir	f	\N	\N	\N	\N	\N
440	en	Not Activated	ir.module,state	-1		selection	ir	f	\N	\N	\N	\N	\N
441	en	Activated	ir.module,state	-1		selection	ir	f	\N	\N	\N	\N	\N
442	en	To be upgraded	ir.module,state	-1		selection	ir	f	\N	\N	\N	\N	\N
443	en	To be removed	ir.module,state	-1		selection	ir	f	\N	\N	\N	\N	\N
444	en	To be activated	ir.module,state	-1		selection	ir	f	\N	\N	\N	\N	\N
445	en	Version	ir.module,version	-1		field	ir	f	\N	\N	\N	\N	\N
446	en	Module dependency	ir.module.dependency,name	-1		model	ir	f	\N	\N	\N	\N	\N
447	en	Module	ir.module.dependency,module	-1		field	ir	f	\N	\N	\N	\N	\N
448	en	Name	ir.module.dependency,name	-1		field	ir	f	\N	\N	\N	\N	\N
449	en	State	ir.module.dependency,state	-1		field	ir	f	\N	\N	\N	\N	\N
450	en	Not Activated	ir.module.dependency,state	-1		selection	ir	f	\N	\N	\N	\N	\N
451	en	Activated	ir.module.dependency,state	-1		selection	ir	f	\N	\N	\N	\N	\N
452	en	To be upgraded	ir.module.dependency,state	-1		selection	ir	f	\N	\N	\N	\N	\N
453	en	To be removed	ir.module.dependency,state	-1		selection	ir	f	\N	\N	\N	\N	\N
454	en	To be activated	ir.module.dependency,state	-1		selection	ir	f	\N	\N	\N	\N	\N
455	en	Unknown	ir.module.dependency,state	-1		selection	ir	f	\N	\N	\N	\N	\N
456	en	Config wizard to run after activating a module	ir.module.config_wizard.item,name	-1		model	ir	f	\N	\N	\N	\N	\N
457	en	Action	ir.module.config_wizard.item,action	-1		field	ir	f	\N	\N	\N	\N	\N
458	en	State	ir.module.config_wizard.item,state	-1		field	ir	f	\N	\N	\N	\N	\N
459	en	Open	ir.module.config_wizard.item,state	-1		selection	ir	f	\N	\N	\N	\N	\N
460	en	Done	ir.module.config_wizard.item,state	-1		selection	ir	f	\N	\N	\N	\N	\N
461	en	Module Config Wizard First	ir.module.config_wizard.first,name	-1		model	ir	f	\N	\N	\N	\N	\N
462	en	Module Config Wizard Other	ir.module.config_wizard.other,name	-1		model	ir	f	\N	\N	\N	\N	\N
463	en	Percentage	ir.module.config_wizard.other,percentage	-1		field	ir	f	\N	\N	\N	\N	\N
464	en	Module Config Wizard Done	ir.module.config_wizard.done,name	-1		model	ir	f	\N	\N	\N	\N	\N
465	en	Module Activate Upgrade Start	ir.module.activate_upgrade.start,name	-1		model	ir	f	\N	\N	\N	\N	\N
466	en	Modules to update	ir.module.activate_upgrade.start,module_info	-1		field	ir	f	\N	\N	\N	\N	\N
467	en	Module Activate Upgrade Done	ir.module.activate_upgrade.done,name	-1		model	ir	f	\N	\N	\N	\N	\N
468	en	Configure Modules	ir.module.config.start,name	-1		model	ir	f	\N	\N	\N	\N	\N
469	en	Modules	ir.module.config.start,modules	-1		field	ir	f	\N	\N	\N	\N	\N
470	en	Cache	ir.cache,name	-1		model	ir	f	\N	\N	\N	\N	\N
471	en	Name	ir.cache,name	-1		field	ir	f	\N	\N	\N	\N	\N
472	en	Timestamp	ir.cache,timestamp	-1		field	ir	f	\N	\N	\N	\N	\N
473	en	Date	ir.date,name	-1		model	ir	f	\N	\N	\N	\N	\N
474	en	Trigger	ir.trigger,name	-1		model	ir	f	\N	\N	\N	\N	\N
475	en	Action	ir.trigger,action	-1		field	ir	f	\N	\N	\N	\N	\N
476	en	Condition	ir.trigger,condition	-1		field	ir	f	\N	\N	\N	\N	\N
477	en	A PYSON statement evaluated with record represented by "self"\nIt triggers the action if true.	ir.trigger,condition	-1		help	ir	f	\N	\N	\N	\N	\N
478	en	Limit Number	ir.trigger,limit_number	-1		field	ir	f	\N	\N	\N	\N	\N
479	en	Limit the number of call to "Action Function" by records.\n0 for no limit.	ir.trigger,limit_number	-1		help	ir	f	\N	\N	\N	\N	\N
480	en	Minimum Delay	ir.trigger,minimum_time_delay	-1		field	ir	f	\N	\N	\N	\N	\N
481	en	Set a minimum time delay between call to "Action Function" for the same record.\nempty for no delay.	ir.trigger,minimum_time_delay	-1		help	ir	f	\N	\N	\N	\N	\N
482	en	Model	ir.trigger,model	-1		field	ir	f	\N	\N	\N	\N	\N
483	en	Name	ir.trigger,name	-1		field	ir	f	\N	\N	\N	\N	\N
484	en	On Create	ir.trigger,on_create	-1		field	ir	f	\N	\N	\N	\N	\N
485	en	On Delete	ir.trigger,on_delete	-1		field	ir	f	\N	\N	\N	\N	\N
486	en	On Time	ir.trigger,on_time	-1		field	ir	f	\N	\N	\N	\N	\N
487	en	On Write	ir.trigger,on_write	-1		field	ir	f	\N	\N	\N	\N	\N
488	en	Trigger Log	ir.trigger.log,name	-1		model	ir	f	\N	\N	\N	\N	\N
489	en	Record ID	ir.trigger.log,record_id	-1		field	ir	f	\N	\N	\N	\N	\N
490	en	Trigger	ir.trigger.log,trigger	-1		field	ir	f	\N	\N	\N	\N	\N
491	en	Session	ir.session,name	-1		model	ir	f	\N	\N	\N	\N	\N
492	en	Key	ir.session,key	-1		field	ir	f	\N	\N	\N	\N	\N
493	en	Session Wizard	ir.session.wizard,name	-1		model	ir	f	\N	\N	\N	\N	\N
494	en	Data	ir.session.wizard,data	-1		field	ir	f	\N	\N	\N	\N	\N
495	en	Queue	ir.queue,name	-1		model	ir	f	\N	\N	\N	\N	\N
496	en	Data	ir.queue,data	-1		field	ir	f	\N	\N	\N	\N	\N
497	en	Dequeued at	ir.queue,dequeued_at	-1		field	ir	f	\N	\N	\N	\N	\N
498	en	Enqueued at	ir.queue,enqueued_at	-1		field	ir	f	\N	\N	\N	\N	\N
499	en	Expected at	ir.queue,expected_at	-1		field	ir	f	\N	\N	\N	\N	\N
500	en	When the task should be done.	ir.queue,expected_at	-1		help	ir	f	\N	\N	\N	\N	\N
501	en	Finished at	ir.queue,finished_at	-1		field	ir	f	\N	\N	\N	\N	\N
502	en	Name	ir.queue,name	-1		field	ir	f	\N	\N	\N	\N	\N
503	en	Scheduled at	ir.queue,scheduled_at	-1		field	ir	f	\N	\N	\N	\N	\N
504	en	When the task can start.	ir.queue,scheduled_at	-1		help	ir	f	\N	\N	\N	\N	\N
505	en	Month	ir.calendar.month,name	-1		model	ir	f	\N	\N	\N	\N	\N
506	en	Abbreviation	ir.calendar.month,abbreviation	-1		field	ir	f	\N	\N	\N	\N	\N
507	en	Index	ir.calendar.month,index	-1		field	ir	f	\N	\N	\N	\N	\N
508	en	Name	ir.calendar.month,name	-1		field	ir	f	\N	\N	\N	\N	\N
509	en	Day	ir.calendar.day,name	-1		model	ir	f	\N	\N	\N	\N	\N
510	en	Abbreviation	ir.calendar.day,abbreviation	-1		field	ir	f	\N	\N	\N	\N	\N
511	en	Index	ir.calendar.day,index	-1		field	ir	f	\N	\N	\N	\N	\N
512	en	Name	ir.calendar.day,name	-1		field	ir	f	\N	\N	\N	\N	\N
513	en	Message	ir.message,name	-1		model	ir	f	\N	\N	\N	\N	\N
514	en	Text	ir.message,text	-1		field	ir	f	\N	\N	\N	\N	\N
515	en	Email	ir.email,name	-1		model	ir	f	\N	\N	\N	\N	\N
516	en	Addresses	ir.email,addresses	-1		field	ir	f	\N	\N	\N	\N	\N
517	en	At	ir.email,at	-1		field	ir	f	\N	\N	\N	\N	\N
518	en	Body	ir.email,body	-1		field	ir	f	\N	\N	\N	\N	\N
519	en	Recipients	ir.email,recipients	-1		field	ir	f	\N	\N	\N	\N	\N
520	en	Hidden Recipients	ir.email,recipients_hidden	-1		field	ir	f	\N	\N	\N	\N	\N
521	en	Secondary Recipients	ir.email,recipients_secondary	-1		field	ir	f	\N	\N	\N	\N	\N
522	en	Resource	ir.email,resource	-1		field	ir	f	\N	\N	\N	\N	\N
523	en	Subject	ir.email,subject	-1		field	ir	f	\N	\N	\N	\N	\N
524	en	User	ir.email,user	-1		field	ir	f	\N	\N	\N	\N	\N
525	en	Email Address	ir.email.address,name	-1		model	ir	f	\N	\N	\N	\N	\N
526	en	Address	ir.email.address,address	-1		field	ir	f	\N	\N	\N	\N	\N
527	en	E-mail	ir.email.address,email	-1		field	ir	f	\N	\N	\N	\N	\N
528	en	Email Template	ir.email.template,name	-1		model	ir	f	\N	\N	\N	\N	\N
529	en	Body	ir.email.template,body	-1		field	ir	f	\N	\N	\N	\N	\N
530	en	Model	ir.email.template,model	-1		field	ir	f	\N	\N	\N	\N	\N
531	en	Model Name	ir.email.template,model_name	-1		field	ir	f	\N	\N	\N	\N	\N
532	en	Name	ir.email.template,name	-1		field	ir	f	\N	\N	\N	\N	\N
533	en	Recipients	ir.email.template,recipients	-1		field	ir	f	\N	\N	\N	\N	\N
534	en	The field that contains the recipient(s).	ir.email.template,recipients	-1		help	ir	f	\N	\N	\N	\N	\N
535	en	Hidden Recipients	ir.email.template,recipients_hidden	-1		field	ir	f	\N	\N	\N	\N	\N
536	en	The field that contains the secondary recipient(s).	ir.email.template,recipients_hidden	-1		help	ir	f	\N	\N	\N	\N	\N
537	en	Hidden Recipients	ir.email.template,recipients_hidden_pyson	-1		field	ir	f	\N	\N	\N	\N	\N
538	en	A PYSON expression that generates a list of hidden recipients with the record represented by "self".	ir.email.template,recipients_hidden_pyson	-1		help	ir	f	\N	\N	\N	\N	\N
539	en	Recipients	ir.email.template,recipients_pyson	-1		field	ir	f	\N	\N	\N	\N	\N
540	en	A PYSON expression that generates a list of recipients with the record represented by "self".	ir.email.template,recipients_pyson	-1		help	ir	f	\N	\N	\N	\N	\N
541	en	Secondary Recipients	ir.email.template,recipients_secondary	-1		field	ir	f	\N	\N	\N	\N	\N
542	en	The field that contains the secondary recipient(s).	ir.email.template,recipients_secondary	-1		help	ir	f	\N	\N	\N	\N	\N
543	en	Secondary Recipients	ir.email.template,recipients_secondary_pyson	-1		field	ir	f	\N	\N	\N	\N	\N
544	en	A PYSON expression that generates a list of secondary recipients with the record represented by "self".	ir.email.template,recipients_secondary_pyson	-1		help	ir	f	\N	\N	\N	\N	\N
545	en	Reports	ir.email.template,reports	-1		field	ir	f	\N	\N	\N	\N	\N
546	en	Subject	ir.email.template,subject	-1		field	ir	f	\N	\N	\N	\N	\N
547	en	Email Template - Report	ir.email.template-ir.action.report,name	-1		model	ir	f	\N	\N	\N	\N	\N
548	en	Report	ir.email.template-ir.action.report,report	-1		field	ir	f	\N	\N	\N	\N	\N
549	en	Template	ir.email.template-ir.action.report,template	-1		field	ir	f	\N	\N	\N	\N	\N
550	en	Error	ir.error,name	-1		model	ir	f	\N	\N	\N	\N	\N
551	en	Description	ir.error,description	-1		field	ir	f	\N	\N	\N	\N	\N
552	en	Message	ir.error,message	-1		field	ir	f	\N	\N	\N	\N	\N
553	en	Origin	ir.error,origin	-1		field	ir	f	\N	\N	\N	\N	\N
554	en	Action	ir.error,origin	-1		selection	ir	f	\N	\N	\N	\N	\N
555	en	Task	ir.error,origin	-1		selection	ir	f	\N	\N	\N	\N	\N
556	en	Processed by	ir.error,processed_by	-1		field	ir	f	\N	\N	\N	\N	\N
557	en	Solved by	ir.error,solved_by	-1		field	ir	f	\N	\N	\N	\N	\N
558	en	State	ir.error,state	-1		field	ir	f	\N	\N	\N	\N	\N
559	en	Open	ir.error,state	-1		selection	ir	f	\N	\N	\N	\N	\N
560	en	Processing	ir.error,state	-1		selection	ir	f	\N	\N	\N	\N	\N
561	en	Solved	ir.error,state	-1		selection	ir	f	\N	\N	\N	\N	\N
562	en	Summary	ir.error,summary	-1		field	ir	f	\N	\N	\N	\N	\N
563	en	Cancel	ir.translation.set,start,end	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
564	en	Set	ir.translation.set,start,set_	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
565	en	OK	ir.translation.set,succeed,end	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
566	en	Cancel	ir.translation.clean,start,end	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
567	en	Clean	ir.translation.clean,start,clean	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
568	en	OK	ir.translation.clean,succeed,end	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
569	en	Cancel	ir.translation.update,start,end	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
570	en	Update	ir.translation.update,start,update	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
571	en	Close	ir.translation.export,result,end	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
572	en	Cancel	ir.translation.export,start,end	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
573	en	Export	ir.translation.export,start,export	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
574	en	Close	ir.ui.view.show,start,end	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
575	en	Cancel	ir.model.print_model_graph,start,end	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
576	en	Print	ir.model.print_model_graph,start,print_	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
577	en	OK	ir.module.config_wizard,done,end	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
578	en	Cancel	ir.module.config_wizard,first,end	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
579	en	OK	ir.module.config_wizard,first,action	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
580	en	Cancel	ir.module.config_wizard,other,end	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
581	en	Next	ir.module.config_wizard,other,action	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
582	en	OK	ir.module.activate_upgrade,done,next_	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
583	en	Cancel	ir.module.activate_upgrade,start,end	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
584	en	Start Upgrade	ir.module.activate_upgrade,start,upgrade	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
585	en	Cancel	ir.module.config,start,end	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
586	en	Activate	ir.module.config,start,activate	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
587	en	Cancel	ir.lang.config,start,end	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
588	en	Load	ir.lang.config,start,load	-1		wizard_button	ir	f	\N	\N	\N	\N	\N
589	en	English	ir.lang,name	1	English	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
590	en	Administration	ir.ui.menu,name	1	Administration	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
591	en	User Interface	ir.ui.menu,name	2	User Interface	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
592	en	Icons	ir.action,name	1	Icons	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
593	en	Icons	ir.ui.menu,name	3	Icons	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
594	en	Menu	ir.action,name	2	Menu	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
595	en	Menu	ir.action,name	3	Menu	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
596	en	Menu	ir.ui.menu,name	4	Menu	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
1014	en	User in groups	ir.rule.group,name	8	User in groups	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1015	en	User in groups	ir.rule.group,name	9	User in groups	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1016	en	User in groups	ir.rule.group,name	10	User in groups	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
597	en	Show View	ir.action,name	4	Show View	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
598	en	Views	ir.action,name	5	Views	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
599	en	Views	ir.ui.menu,name	5	Views	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
600	en	Show	ir.model.button,string	1	Show	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
601	en	View Tree Width	ir.action,name	6	View Tree Width	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
602	en	View Tree Width	ir.ui.menu,name	6	View Tree Width	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
603	en	View Tree Optional	ir.action,name	7	View Tree Optional	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
604	en	View Tree Optional	ir.ui.menu,name	7	View Tree Optional	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
605	en	Tree State	ir.action,name	8	Tree State	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
606	en	Tree State	ir.ui.menu,name	8	Tree State	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
607	en	View Search	ir.action,name	9	View Search	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
608	en	View Search	ir.ui.menu,name	9	View Search	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
609	en	Actions	ir.ui.menu,name	10	Actions	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
610	en	Actions	ir.action,name	10	Actions	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
611	en	Actions	ir.ui.menu,name	11	Actions	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
612	en	Reports	ir.action,name	11	Reports	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
613	en	Reports	ir.ui.menu,name	12	Reports	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
614	en	Window Actions	ir.action,name	12	Window Actions	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
615	en	Window Actions	ir.ui.menu,name	13	Window Actions	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
616	en	Wizards	ir.action,name	13	Wizards	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
617	en	Wizards	ir.ui.menu,name	14	Wizards	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
618	en	URLs	ir.action,name	14	URLs	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
619	en	URLs	ir.ui.menu,name	15	URLs	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
620	en	Models	ir.ui.menu,name	16	Models	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
621	en	Models	ir.action,name	15	Models	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
622	en	Models	ir.ui.menu,name	17	Models	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
623	en	Fields	ir.action,name	16	Fields	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
624	en	Fields	ir.ui.menu,name	18	Fields	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
625	en	Models Access	ir.action,name	17	Models Access	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
626	en	Models Access	ir.ui.menu,name	19	Models Access	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
627	en	Access	ir.action,name	18	Access	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
628	en	Fields Access	ir.action,name	19	Fields Access	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
629	en	Fields Access	ir.ui.menu,name	20	Fields Access	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
630	en	Access	ir.action,name	20	Access	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
631	en	Graph	ir.action,name	21	Graph	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
632	en	Graph	ir.action,name	22	Graph	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
633	en	Workflow Graph	ir.action,name	23	Workflow Graph	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
634	en	Buttons	ir.action,name	24	Buttons	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
635	en	Buttons	ir.ui.menu,name	21	Buttons	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
636	en	Clicks	ir.action,name	25	Clicks	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
637	en	Data	ir.action,name	26	Data	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
638	en	Out of Sync	ir.action.act_window.domain,name	1	Out of Sync	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
639	en	All	ir.action.act_window.domain,name	2	All	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
640	en	Data	ir.ui.menu,name	22	Data	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
641	en	Sync	ir.model.button,string	2	Sync	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
642	en	Sequences	ir.ui.menu,name	23	Sequences	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
1017	en	User in groups	ir.rule.group,name	11	User in groups	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1018	en	User in groups	ir.rule.group,name	12	User in groups	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1019	en	Own view search	ir.rule.group,name	13	Own view search	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1020	en	Common view search	ir.rule.group,name	14	Common view search	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1021	en	Any view search	ir.rule.group,name	15	Any view search	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1022	en	Own session	ir.rule.group,name	16	Own session	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1023	en	Own session	ir.rule.group,name	17	Own session	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1024	en	Own favorite	ir.rule.group,name	18	Own favorite	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1025	en	User in groups	ir.rule.group,name	19	User in groups	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1026	en	User in modification groups	ir.rule.group,name	20	User in modification groups	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1027	en	Any export	ir.rule.group,name	21	Any export	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1028	en	User in groups	ir.rule.group,name	22	User in groups	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1029	en	User in modification groups	ir.rule.group,name	23	User in modification groups	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1030	en	Any export	ir.rule.group,name	24	Any export	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1031	en	The password must have at least %(length)i characters.	ir.message,text	119	The password must have at least %(length)i characters.	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1032	en	The password is forbidden.	ir.message,text	120	The password is forbidden.	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1033	en	The password cannot be the same as user's name.	ir.message,text	121	The password cannot be the same as user's name.	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
643	en	Sequences	ir.action,name	27	Sequences	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
644	en	Sequences	ir.ui.menu,name	24	Sequences	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
645	en	Sequences Strict	ir.action,name	28	Sequences Strict	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
646	en	Sequences Strict	ir.ui.menu,name	25	Sequences Strict	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
647	en	Types	ir.action,name	29	Types	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
648	en	Types	ir.ui.menu,name	26	Types	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
649	en	Attachments	ir.action,name	30	Attachments	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
650	en	Attachments	ir.ui.menu,name	27	Attachments	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
651	en	Notes	ir.action,name	31	Notes	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
652	en	Notes	ir.ui.menu,name	28	Notes	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
653	en	Scheduler	ir.ui.menu,name	29	Scheduler	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
654	en	Actions	ir.action,name	32	Actions	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
655	en	Actions	ir.ui.menu,name	30	Actions	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
656	en	Run Once	ir.model.button,string	3	Run Once	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
657	en	Localization	ir.ui.menu,name	31	Localization	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
658	en	Bulgarian	ir.lang,name	2	Bulgarian	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
659	en	Català	ir.lang,name	3	Català	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
660	en	Czech	ir.lang,name	4	Czech	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
661	en	German	ir.lang,name	5	German	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
662	en	Spanish	ir.lang,name	6	Spanish	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
663	en	Spanish (Latin American)	ir.lang,name	7	Spanish (Latin American)	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
664	en	Estonian	ir.lang,name	8	Estonian	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
665	en	Persian	ir.lang,name	9	Persian	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
666	en	Finnish	ir.lang,name	10	Finnish	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
667	en	French	ir.lang,name	11	French	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
668	en	Hungarian	ir.lang,name	12	Hungarian	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
669	en	Indonesian	ir.lang,name	13	Indonesian	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
670	en	Italian	ir.lang,name	14	Italian	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
671	en	Lao	ir.lang,name	15	Lao	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
672	en	Lithuanian	ir.lang,name	16	Lithuanian	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
673	en	Dutch	ir.lang,name	17	Dutch	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
674	en	Polish	ir.lang,name	18	Polish	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
675	en	Portuguese	ir.lang,name	19	Portuguese	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
676	en	Romanian	ir.lang,name	20	Romanian	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
677	en	Russian	ir.lang,name	21	Russian	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
678	en	Slovenian	ir.lang,name	22	Slovenian	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
679	en	Turkish	ir.lang,name	23	Turkish	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
680	en	Ukrainian	ir.lang,name	24	Ukrainian	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
681	en	Chinese Simplified	ir.lang,name	25	Chinese Simplified	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
682	en	Languages	ir.action,name	33	Languages	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
683	en	Languages	ir.ui.menu,name	32	Languages	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
684	en	Load translations	ir.model.button,string	4	Load translations	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
685	en	Are you sure you want to load languages' translations?	ir.model.button,confirm	4	Are you sure you want to load languages' translations?	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
686	en	Unload translations	ir.model.button,string	5	Unload translations	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
687	en	Are you sure you want to remove languages' translations?	ir.model.button,confirm	5	Are you sure you want to remove languages' translations?	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
688	en	Configure Languages	ir.action,name	34	Configure Languages	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
689	en	Translations	ir.action,name	35	Translations	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
690	en	Modules	ir.action.act_window.domain,name	3	Modules	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
691	en	Local	ir.action.act_window.domain,name	4	Local	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
692	en	Translations	ir.ui.menu,name	33	Translations	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
693	en	Translations	ir.action,name	36	Translations	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
694	en	Translations	ir.action,name	37	Translations	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
695	en	Set Translations	ir.action,name	38	Set Translations	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
696	en	Set Translations	ir.ui.menu,name	34	Set Translations	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
697	en	Clean Translations	ir.action,name	39	Clean Translations	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
1034	en	The password cannot be the same as user's login.	ir.message,text	122	The password cannot be the same as user's login.	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1035	en	The password cannot be the same as user's email address.	ir.message,text	123	The password cannot be the same as user's email address.	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1036	en	For logging purposes users cannot be deleted, instead they should be deactivated.	ir.message,text	124	For logging purposes users cannot be deleted, instead they should be deactivated.	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
1037	en	Password for %(login)s	ir.message,text	125	Password for %(login)s	model	res	f	2023-01-18 22:27:08.693829	0	\N	\N	\N
698	en	Clean Translations	ir.ui.menu,name	35	Clean Translations	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
699	en	Synchronize Translations	ir.action,name	40	Synchronize Translations	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
700	en	Synchronize Translations	ir.ui.menu,name	36	Synchronize Translations	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
701	en	Export Translations	ir.action,name	41	Export Translations	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
702	en	Export Translations	ir.ui.menu,name	37	Export Translations	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
703	en	Exports	ir.action,name	42	Exports	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
704	en	Exports	ir.ui.menu,name	38	Exports	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
705	en	Record Rules	ir.action,name	43	Record Rules	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
706	en	Record Rules	ir.ui.menu,name	39	Record Rules	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
707	en	Modules	ir.ui.menu,name	40	Modules	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
708	en	Modules	ir.action,name	44	Modules	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
709	en	Modules	ir.ui.menu,name	41	Modules	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
710	en	Mark for Activation	ir.model.button,string	6	Mark for Activation	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
711	en	Cancel Activation	ir.model.button,string	7	Cancel Activation	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
712	en	Mark for Deactivation (beta)	ir.model.button,string	8	Mark for Deactivation (beta)	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
713	en	Cancel Deactivation	ir.model.button,string	9	Cancel Deactivation	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
714	en	Mark for Upgrade	ir.model.button,string	10	Mark for Upgrade	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
715	en	Cancel Upgrade	ir.model.button,string	11	Cancel Upgrade	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
716	en	Config Wizard Items	ir.action,name	45	Config Wizard Items	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
717	en	Config Wizard Items	ir.ui.menu,name	42	Config Wizard Items	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
718	en	Module Configuration	ir.action,name	46	Module Configuration	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
719	en	Perform Pending Activation/Upgrade	ir.action,name	47	Perform Pending Activation/Upgrade	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
720	en	Perform Pending Activation/Upgrade	ir.ui.menu,name	43	Perform Pending Activation/Upgrade	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
721	en	Configure Modules	ir.action,name	48	Configure Modules	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
722	en	Triggers	ir.action,name	49	Triggers	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
723	en	Triggers	ir.ui.menu,name	44	Triggers	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
724	en	January	ir.calendar.month,name	1	January	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
725	en	February	ir.calendar.month,name	2	February	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
726	en	March	ir.calendar.month,name	3	March	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
727	en	April	ir.calendar.month,name	4	April	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
728	en	May	ir.calendar.month,name	5	May	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
729	en	June	ir.calendar.month,name	6	June	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
730	en	July	ir.calendar.month,name	7	July	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
731	en	August	ir.calendar.month,name	8	August	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
732	en	September	ir.calendar.month,name	9	September	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
733	en	October	ir.calendar.month,name	10	October	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
734	en	November	ir.calendar.month,name	11	November	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
735	en	December	ir.calendar.month,name	12	December	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
736	en	Jan	ir.calendar.month,abbreviation	1	Jan	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
737	en	Feb	ir.calendar.month,abbreviation	2	Feb	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
738	en	Mar	ir.calendar.month,abbreviation	3	Mar	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
739	en	Apr	ir.calendar.month,abbreviation	4	Apr	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
740	en	May	ir.calendar.month,abbreviation	5	May	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
741	en	Jun	ir.calendar.month,abbreviation	6	Jun	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
742	en	Jul	ir.calendar.month,abbreviation	7	Jul	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
743	en	Aug	ir.calendar.month,abbreviation	8	Aug	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
744	en	Sep	ir.calendar.month,abbreviation	9	Sep	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
745	en	Oct	ir.calendar.month,abbreviation	10	Oct	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
746	en	Nov	ir.calendar.month,abbreviation	11	Nov	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
747	en	Dec	ir.calendar.month,abbreviation	12	Dec	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
748	en	Monday	ir.calendar.day,name	1	Monday	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
749	en	Tuesday	ir.calendar.day,name	2	Tuesday	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
750	en	Wednesday	ir.calendar.day,name	3	Wednesday	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
751	en	Thursday	ir.calendar.day,name	4	Thursday	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
752	en	Friday	ir.calendar.day,name	5	Friday	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
753	en	Saturday	ir.calendar.day,name	6	Saturday	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
754	en	Sunday	ir.calendar.day,name	7	Sunday	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
755	en	Mon	ir.calendar.day,abbreviation	1	Mon	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
756	en	Tue	ir.calendar.day,abbreviation	2	Tue	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
757	en	Wed	ir.calendar.day,abbreviation	3	Wed	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
758	en	Thu	ir.calendar.day,abbreviation	4	Thu	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
759	en	Fri	ir.calendar.day,abbreviation	5	Fri	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
760	en	Sat	ir.calendar.day,abbreviation	6	Sat	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
761	en	Sun	ir.calendar.day,abbreviation	7	Sun	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
762	en	Message	ir.action,name	50	Message	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
763	en	Message	ir.ui.menu,name	45	Message	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
764	en	ID	ir.message,text	1	ID	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
765	en	Created by	ir.message,text	2	Created by	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
766	en	Created at	ir.message,text	3	Created at	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
767	en	Edited by	ir.message,text	4	Edited by	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
768	en	Edited at	ir.message,text	5	Edited at	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
769	en	Record Name	ir.message,text	6	Record Name	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
770	en	Active	ir.message,text	7	Active	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
771	en	Uncheck to exclude from future use.	ir.message,text	8	Uncheck to exclude from future use.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
772	en	Name	ir.message,text	9	Name	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
773	en	String	ir.message,text	10	String	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
774	en	Help	ir.message,text	11	Help	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
775	en	Type	ir.message,text	12	Type	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
776	en	Boolean	ir.message,text	13	Boolean	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
777	en	Integer	ir.message,text	14	Integer	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
778	en	Char	ir.message,text	15	Char	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
779	en	Float	ir.message,text	16	Float	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
780	en	Numeric	ir.message,text	17	Numeric	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
781	en	Date	ir.message,text	18	Date	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
782	en	DateTime	ir.message,text	19	DateTime	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
783	en	Selection	ir.message,text	20	Selection	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
784	en	MultiSelection	ir.message,text	21	MultiSelection	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
785	en	Digits	ir.message,text	22	Digits	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
786	en	Domain	ir.message,text	23	Domain	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
787	en	A couple of key and label separated by ":" per line.	ir.message,text	24	A couple of key and label separated by ":" per line.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
788	en	Selection Sorted	ir.message,text	25	Selection Sorted	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
789	en	If the selection must be sorted on label.	ir.message,text	26	If the selection must be sorted on label.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
790	en	Help Selection	ir.message,text	27	Help Selection	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
791	en	The key followed by the help text separated by a ":", one per line.	ir.message,text	28	The key followed by the help text separated by a ":", one per line.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
792	en	Selection JSON	ir.message,text	29	Selection JSON	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
793	en	Help Selection JSON	ir.message,text	30	Help Selection JSON	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
794	en	Yes	ir.message,text	31	Yes	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
795	en	No	ir.message,text	32	No	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
796	en	Sequence	ir.message,text	33	Sequence	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
797	en	ID must be positive.	ir.message,text	34	ID must be positive.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
798	en	You are not allowed to modify this record.	ir.message,text	35	You are not allowed to modify this record.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
799	en	You are not allowed to delete this record.	ir.message,text	36	You are not allowed to delete this record.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
800	en	This record is part of the base configuration.	ir.message,text	37	This record is part of the base configuration.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
801	en	Relation not found: %(value)r in "%(model)s" (%(column)s).	ir.message,text	38	Relation not found: %(value)r in "%(model)s" (%(column)s).	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
802	en	Too many relations found: %(value)r in "%(model)s" (%(column)s).	ir.message,text	39	Too many relations found: %(value)r in "%(model)s" (%(column)s).	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
803	en	Syntax error for value: %(value)r in "%(field)s" of "%(model)s" (%(column)s).	ir.message,text	40	Syntax error for value: %(value)r in "%(field)s" of "%(model)s" (%(column)s).	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
804	en	Syntax error for reference: %(value)r in "%(field)s" of "%(model)s" (%(column)s).	ir.message,text	41	Syntax error for reference: %(value)r in "%(field)s" of "%(model)s" (%(column)s).	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
805	en	Syntax error for XML id: %(value)r in "%(field)s" of "%(model)s" (%(column)s).	ir.message,text	42	Syntax error for XML id: %(value)r in "%(field)s" of "%(model)s" (%(column)s).	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
806	en	The value "%(value)s" for field "%(field)s" in "%(record)s" of "%(model)s" is not valid according to its domain.	ir.message,text	43	The value "%(value)s" for field "%(field)s" in "%(record)s" of "%(model)s" is not valid according to its domain.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
807	en	A value is required for field "%(field)s" in "%(model)s".	ir.message,text	44	A value is required for field "%(field)s" in "%(model)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
808	en	A value is required for field "%(field)s" in "%(record)s" of "%(model)s".	ir.message,text	45	A value is required for field "%(field)s" in "%(record)s" of "%(model)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
885	en	E-mail Templates	ir.action,name	53	E-mail Templates	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
809	en	The value "%(value)s" for field "%(field)s" in "%(model)s" is too long (%(size)i > %(max_size)i).	ir.message,text	46	The value "%(value)s" for field "%(field)s" in "%(model)s" is too long (%(size)i > %(max_size)i).	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
810	en	The value "%(value)s" for field "%(field)s" in "%(record)s" of "%(model)s" is too long (%(size)i > %(max_size)i).	ir.message,text	47	The value "%(value)s" for field "%(field)s" in "%(record)s" of "%(model)s" is too long (%(size)i > %(max_size)i).	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
811	en	The number of digits in the value "%(value)r" for field "%(field)s" in "%(record)s" of "%(model)s" exceeds the limit of "%(digits)i".	ir.message,text	48	The number of digits in the value "%(value)r" for field "%(field)s" in "%(record)s" of "%(model)s" exceeds the limit of "%(digits)i".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
812	en	The value "%(value)s" for field "%(field)s" in "%(record)s" of "%(model)s" contains some invalid chars "%(chars)s".	ir.message,text	49	The value "%(value)s" for field "%(field)s" in "%(record)s" of "%(model)s" contains some invalid chars "%(chars)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
813	en	The value "%(value)s" for field "%(field)s" in "%(record)s" of "%(model)s" is not one of the allowed options.	ir.message,text	50	The value "%(value)s" for field "%(field)s" in "%(record)s" of "%(model)s" is not one of the allowed options.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
814	en	The time value "%(value)s" for field "%(field)s" in "%(record)s" of "%(model)s" is not valid.	ir.message,text	51	The time value "%(value)s" for field "%(field)s" in "%(record)s" of "%(model)s" is not valid.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
815	en	The value "%(value)s" for field "%(field)s" in "%(model)s" does not exist.	ir.message,text	52	The value "%(value)s" for field "%(field)s" in "%(model)s" does not exist.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
816	en	The records could not be deleted because they are used by field "%(field)s" of "%(model)s".	ir.message,text	53	The records could not be deleted because they are used by field "%(field)s" of "%(model)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
817	en	You are not allowed to access "%(model)s".	ir.message,text	54	You are not allowed to access "%(model)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
818	en	You are not allowed to access "%(model)s.%(field)s".	ir.message,text	55	You are not allowed to access "%(model)s.%(field)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
819	en	You are not allowed to create records of "%(model)s" because they fail on at least one of these rules:\n%(rules)s	ir.message,text	56	You are not allowed to create records of "%(model)s" because they fail on at least one of these rules:\n%(rules)s	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
820	en	You are not allowed to read records "%(ids)s" of "%(model)s" because of at least one of these rules:\n%(rules)s	ir.message,text	57	You are not allowed to read records "%(ids)s" of "%(model)s" because of at least one of these rules:\n%(rules)s	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
821	en	You are trying to read records "%(ids)s" of "%(model)s" that don't exist anymore.	ir.message,text	58	You are trying to read records "%(ids)s" of "%(model)s" that don't exist anymore.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
822	en	You are not allowed to write to records "%(ids)s" of "%(model)s" because of at least one of these rules:\n%(rules)s	ir.message,text	59	You are not allowed to write to records "%(ids)s" of "%(model)s" because of at least one of these rules:\n%(rules)s	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
823	en	You are trying to write to records "%(ids)s" of "%(model)s" that don't exist anymore.	ir.message,text	60	You are trying to write to records "%(ids)s" of "%(model)s" that don't exist anymore.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
824	en	You are not allowed to delete records "%(ids)s" of "%(model)s" because of at lease one of those rules:\n%(rules)s	ir.message,text	61	You are not allowed to delete records "%(ids)s" of "%(model)s" because of at lease one of those rules:\n%(rules)s	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
825	en	Invalid domain in schema "%(schema)s".	ir.message,text	62	Invalid domain in schema "%(schema)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
826	en	Invalid selection in schema "%(schema)s".	ir.message,text	63	Invalid selection in schema "%(schema)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
827	en	Invalid help selection in schema "%(schema)s".	ir.message,text	64	Invalid help selection in schema "%(schema)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
828	en	Recursion error: Record "%(rec_name)s" with parent "%(parent_rec_name)s" was configured as ancestor of itself.	ir.message,text	65	Recursion error: Record "%(rec_name)s" with parent "%(parent_rec_name)s" was configured as ancestor of itself.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
829	en	Missing search function for field "%(field)s" in "%(model)s".	ir.message,text	66	Missing search function for field "%(field)s" in "%(model)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
830	en	Missing setter function for field "%(field)s" in "%(model)s".	ir.message,text	67	Missing setter function for field "%(field)s" in "%(model)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
831	en	Calling button "%(button)s on "%(model)s" is not allowed.	ir.message,text	68	Calling button "%(button)s on "%(model)s" is not allowed.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
832	en	Invalid XML for view "%(name)s".	ir.message,text	69	Invalid XML for view "%(name)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
833	en	Wrong wizard model in keyword action "%(name)s".	ir.message,text	70	Wrong wizard model in keyword action "%(name)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
834	en	Invalid email definition for report "%(name)s".	ir.message,text	71	Invalid email definition for report "%(name)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
835	en	Invalid record name definition for report "%(report)s" with exception "%(exception)s".	ir.message,text	72	Invalid record name definition for report "%(report)s" with exception "%(exception)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
836	en	Invalid view "%(view)s" for action "%(action)s".	ir.message,text	73	Invalid view "%(view)s" for action "%(action)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
837	en	Invalid domain or search criteria "%(domain)s" for action "%(action)s".	ir.message,text	74	Invalid domain or search criteria "%(domain)s" for action "%(action)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
838	en	Invalid context "%(context)s" for action "%(action)s".	ir.message,text	75	Invalid context "%(context)s" for action "%(action)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
839	en	The condition "%(condition)s" is not a valid PYSON expression for button rule "%(rule)s".	ir.message,text	76	The condition "%(condition)s" is not a valid PYSON expression for button rule "%(rule)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
840	en	Missing sequence.	ir.message,text	77	Missing sequence.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
841	en	Invalid prefix "%(affix)s" for sequence "%(sequence)s".	ir.message,text	78	Invalid prefix "%(affix)s" for sequence "%(sequence)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
842	en	Invalid suffix "%(affix)s" for sequence "%(sequence)s".	ir.message,text	79	Invalid suffix "%(affix)s" for sequence "%(sequence)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
843	en	The "Last Timestamp" cannot be in the future for sequence "%s".	ir.message,text	80	The "Last Timestamp" cannot be in the future for sequence "%s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
844	en	You cannot change the sequence type of a sequence instead create a new sequence.	ir.message,text	81	You cannot change the sequence type of a sequence instead create a new sequence.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
845	en	Invalid "Increment Number" (%(number_increment)s) or "Next Number" (%(number_next)s) with exception "%(exception)s".	ir.message,text	82	Invalid "Increment Number" (%(number_increment)s) or "Next Number" (%(number_next)s) with exception "%(exception)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
846	en	Invalid grouping "%(grouping)s" for language "%(language)s".	ir.message,text	83	Invalid grouping "%(grouping)s" for language "%(language)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
847	en	Invalid date format "%(format)s" for language "%(language)s".	ir.message,text	84	Invalid date format "%(format)s" for language "%(language)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
848	en	The default language "%(language)s" must be translatable.	ir.message,text	85	The default language "%(language)s" must be translatable.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
849	en	The default language "%(language)s" can not be deleted.	ir.message,text	86	The default language "%(language)s" can not be deleted.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
850	en	Invalid domain in rule "%(name)s".	ir.message,text	87	Invalid domain in rule "%(name)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
851	en	You can not export translation "%(name)s" because it has been overridden by module "%(overriding_module)s".	ir.message,text	88	You can not export translation "%(name)s" because it has been overridden by module "%(overriding_module)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
852	en	You can not remove a module that is activated or that is about to be activated.	ir.message,text	89	You can not remove a module that is activated or that is about to be activated.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
853	en	Some activated modules depend on the ones you are trying to deactivate:	ir.message,text	90	Some activated modules depend on the ones you are trying to deactivate:	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
854	en	Condition "%(condition)s" is not a valid PYSON expression for trigger "%(trigger)s".	ir.message,text	91	Condition "%(condition)s" is not a valid PYSON expression for trigger "%(trigger)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
855	en	Failed to save, please retry.	ir.message,text	92	Failed to save, please retry.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
856	en	Y	ir.message,text	93	Y	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
857	en	M	ir.message,text	94	M	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
858	en	w	ir.message,text	95	w	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
859	en	d	ir.message,text	96	d	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
860	en	h	ir.message,text	97	h	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
861	en	m	ir.message,text	98	m	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
862	en	s	ir.message,text	99	s	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
863	en	The resources to which this record must be copied.	ir.message,text	100	The resources to which this record must be copied.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
864	en	Attachments	ir.message,text	101	Attachments	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
865	en	Notes	ir.message,text	102	Notes	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
866	en	You are not allowed to execute wizard "%(wizard)s".	ir.message,text	103	You are not allowed to execute wizard "%(wizard)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
867	en	You are not allowed to execute wizard "%(wizard)s" on "%(model)s".	ir.message,text	104	You are not allowed to execute wizard "%(wizard)s" on "%(model)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
868	en	Invalid subject in e-mail template "%(template)s" with exception "%(exception)s".	ir.message,text	105	Invalid subject in e-mail template "%(template)s" with exception "%(exception)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
869	en	Invalid body in e-mail template "%(template)s" with exception "%(exception)s".	ir.message,text	106	Invalid body in e-mail template "%(template)s" with exception "%(exception)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
870	en	Invalid PYSON %(field)s in e-mail template "%(template)s" with exception "%(exception)s".	ir.message,text	107	Invalid PYSON %(field)s in e-mail template "%(template)s" with exception "%(exception)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
871	en	The PYSON %(field)s in e-mail template "%(template)s" must generate a list.	ir.message,text	108	The PYSON %(field)s in e-mail template "%(template)s" must generate a list.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
872	en	Only one avatar is allowed per resource.	ir.message,text	109	Only one avatar is allowed per resource.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
873	en	The size of an avatar must be unique.	ir.message,text	110	The size of an avatar must be unique.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
874	en	Avatar	ir.message,text	111	Avatar	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
875	en	Avatars	ir.message,text	112	Avatars	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
876	en	Avatar URL	ir.message,text	113	Avatar URL	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
877	en	The code on language must be unique.	ir.message,text	114	The code on language must be unique.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
878	en	The name of the button must be unique per model.	ir.message,text	115	The name of the button must be unique per model.	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
879	en	Invalid domain or search criteria "%(domain)s" for search "%(search)s".	ir.message,text	116	Invalid domain or search criteria "%(domain)s" for search "%(search)s".	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
880	en	%(field)s (string)	ir.message,text	117	%(field)s (string)	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
881	en	%(field)s (model name)	ir.message,text	118	%(field)s (model name)	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
882	en	E-mails	ir.action,name	51	E-mails	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
883	en	E-mails	ir.ui.menu,name	46	E-mails	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
884	en	E-mail Archives	ir.action,name	52	E-mail Archives	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
968	en	Button	ir.model.button-res.group,button	-1		field	res	f	\N	\N	\N	\N	\N
969	en	Group	ir.model.button-res.group,group	-1		field	res	f	\N	\N	\N	\N	\N
970	en	Group	ir.model.button.rule,group	-1		field	res	f	\N	\N	\N	\N	\N
971	en	User	ir.model.button.click,user	-1		field	res	f	\N	\N	\N	\N	\N
886	en	E-mail Templates	ir.ui.menu,name	47	E-mail Templates	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
887	en	Errors	ir.action,name	54	Errors	model	ir	f	2023-01-18 22:26:47.309666	0	\N	2023-01-18 22:26:47.309666	0
888	en	Open	ir.action.act_window.domain,name	5	Open	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
889	en	Processing	ir.action.act_window.domain,name	6	Processing	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
890	en	All	ir.action.act_window.domain,name	7	All	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
891	en	Errors	ir.ui.menu,name	48	Errors	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
892	en	Open	ir.model.button,string	12	Open	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
893	en	Process	ir.model.button,string	13	Process	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
894	en	Solve	ir.model.button,string	14	Solve	model	ir	f	2023-01-18 22:26:47.309666	0	\N	\N	\N
895	en	Group	res.group,name	-1		model	res	f	\N	\N	\N	\N	\N
896	en	Buttons	res.group,buttons	-1		field	res	f	\N	\N	\N	\N	\N
897	en	Access Field	res.group,field_access	-1		field	res	f	\N	\N	\N	\N	\N
898	en	Access Menu	res.group,menu_access	-1		field	res	f	\N	\N	\N	\N	\N
899	en	Access Model	res.group,model_access	-1		field	res	f	\N	\N	\N	\N	\N
900	en	Name	res.group,name	-1		field	res	f	\N	\N	\N	\N	\N
901	en	Parent	res.group,parent	-1		field	res	f	\N	\N	\N	\N	\N
902	en	The group to inherit accesses from.	res.group,parent	-1		help	res	f	\N	\N	\N	\N	\N
903	en	Rules	res.group,rule_groups	-1		field	res	f	\N	\N	\N	\N	\N
904	en	Users	res.group,users	-1		field	res	f	\N	\N	\N	\N	\N
905	en	User	res.user,name	-1		model	res	f	\N	\N	\N	\N	\N
906	en	Actions	res.user,actions	-1		field	res	f	\N	\N	\N	\N	\N
907	en	Actions that will be run at login.	res.user,actions	-1		help	res	f	\N	\N	\N	\N	\N
908	en	Applications	res.user,applications	-1		field	res	f	\N	\N	\N	\N	\N
909	en	Avatar Badge URL	res.user,avatar_badge_url	-1		field	res	f	\N	\N	\N	\N	\N
910	en	Email	res.user,email	-1		field	res	f	\N	\N	\N	\N	\N
911	en	Groups	res.user,groups	-1		field	res	f	\N	\N	\N	\N	\N
912	en	Language	res.user,language	-1		field	res	f	\N	\N	\N	\N	\N
913	en	Language Direction	res.user,language_direction	-1		field	res	f	\N	\N	\N	\N	\N
914	en	Login	res.user,login	-1		field	res	f	\N	\N	\N	\N	\N
915	en	Menu Action	res.user,menu	-1		field	res	f	\N	\N	\N	\N	\N
916	en	Name	res.user,name	-1		field	res	f	\N	\N	\N	\N	\N
917	en	Password	res.user,password	-1		field	res	f	\N	\N	\N	\N	\N
918	en	Password Hash	res.user,password_hash	-1		field	res	f	\N	\N	\N	\N	\N
919	en	Reset Password	res.user,password_reset	-1		field	res	f	\N	\N	\N	\N	\N
920	en	Reset Password Expire	res.user,password_reset_expire	-1		field	res	f	\N	\N	\N	\N	\N
921	en	PySON Menu	res.user,pyson_menu	-1		field	res	f	\N	\N	\N	\N	\N
922	en	Sessions	res.user,sessions	-1		field	res	f	\N	\N	\N	\N	\N
923	en	Signature	res.user,signature	-1		field	res	f	\N	\N	\N	\N	\N
924	en	Status Bar	res.user,status_bar	-1		field	res	f	\N	\N	\N	\N	\N
925	en	Warnings	res.user,warnings	-1		field	res	f	\N	\N	\N	\N	\N
926	en	Login Attempt	res.user.login.attempt,name	-1		model	res	f	\N	\N	\N	\N	\N
927	en	Device Cookie	res.user.login.attempt,device_cookie	-1		field	res	f	\N	\N	\N	\N	\N
928	en	IP Address	res.user.login.attempt,ip_address	-1		field	res	f	\N	\N	\N	\N	\N
929	en	IP Network	res.user.login.attempt,ip_network	-1		field	res	f	\N	\N	\N	\N	\N
930	en	Login	res.user.login.attempt,login	-1		field	res	f	\N	\N	\N	\N	\N
931	en	User Device	res.user.device,name	-1		model	res	f	\N	\N	\N	\N	\N
932	en	Cookie	res.user.device,cookie	-1		field	res	f	\N	\N	\N	\N	\N
933	en	Login	res.user.device,login	-1		field	res	f	\N	\N	\N	\N	\N
934	en	User - Action	res.user-ir.action,name	-1		model	res	f	\N	\N	\N	\N	\N
935	en	Action	res.user-ir.action,action	-1		field	res	f	\N	\N	\N	\N	\N
936	en	User	res.user-ir.action,user	-1		field	res	f	\N	\N	\N	\N	\N
937	en	User - Group	res.user-res.group,name	-1		model	res	f	\N	\N	\N	\N	\N
938	en	Group	res.user-res.group,group	-1		field	res	f	\N	\N	\N	\N	\N
939	en	User	res.user-res.group,user	-1		field	res	f	\N	\N	\N	\N	\N
940	en	User Warning	res.user.warning,name	-1		model	res	f	\N	\N	\N	\N	\N
941	en	Always	res.user.warning,always	-1		field	res	f	\N	\N	\N	\N	\N
942	en	Name	res.user.warning,name	-1		field	res	f	\N	\N	\N	\N	\N
943	en	User	res.user.warning,user	-1		field	res	f	\N	\N	\N	\N	\N
944	en	User Application	res.user.application,name	-1		model	res	f	\N	\N	\N	\N	\N
945	en	Application	res.user.application,application	-1		field	res	f	\N	\N	\N	\N	\N
946	en	Key	res.user.application,key	-1		field	res	f	\N	\N	\N	\N	\N
947	en	State	res.user.application,state	-1		field	res	f	\N	\N	\N	\N	\N
948	en	Requested	res.user.application,state	-1		selection	res	f	\N	\N	\N	\N	\N
949	en	Validated	res.user.application,state	-1		selection	res	f	\N	\N	\N	\N	\N
950	en	Cancelled	res.user.application,state	-1		selection	res	f	\N	\N	\N	\N	\N
951	en	User	res.user.application,user	-1		field	res	f	\N	\N	\N	\N	\N
952	en	User Config Init	res.user.config.start,name	-1		model	res	f	\N	\N	\N	\N	\N
953	en	Groups	ir.ui.menu,groups	-1		field	res	f	\N	\N	\N	\N	\N
954	en	UI Menu - Group	ir.ui.menu-res.group,name	-1		model	res	f	\N	\N	\N	\N	\N
955	en	Group	ir.ui.menu-res.group,group	-1		field	res	f	\N	\N	\N	\N	\N
956	en	Menu	ir.ui.menu-res.group,menu	-1		field	res	f	\N	\N	\N	\N	\N
957	en	Action - Group	ir.action-res.group,name	-1		model	res	f	\N	\N	\N	\N	\N
958	en	Action	ir.action-res.group,action	-1		field	res	f	\N	\N	\N	\N	\N
959	en	Group	ir.action-res.group,group	-1		field	res	f	\N	\N	\N	\N	\N
960	en	Groups	ir.action,groups	-1		field	res	f	\N	\N	\N	\N	\N
961	en	Groups	ir.action.report,groups	-1		field	res	f	\N	\N	\N	\N	\N
962	en	Groups	ir.action.act_window,groups	-1		field	res	f	\N	\N	\N	\N	\N
963	en	Groups	ir.action.wizard,groups	-1		field	res	f	\N	\N	\N	\N	\N
964	en	Groups	ir.action.url,groups	-1		field	res	f	\N	\N	\N	\N	\N
965	en	Groups	ir.action.keyword,groups	-1		field	res	f	\N	\N	\N	\N	\N
966	en	Groups	ir.model.button,groups	-1		field	res	f	\N	\N	\N	\N	\N
967	en	Model Button - Group	ir.model.button-res.group,name	-1		model	res	f	\N	\N	\N	\N	\N
972	en	Groups	ir.rule.group,groups	-1		field	res	f	\N	\N	\N	\N	\N
973	en	Rule Group - Group	ir.rule.group-res.group,name	-1		model	res	f	\N	\N	\N	\N	\N
974	en	Group	ir.rule.group-res.group,group	-1		field	res	f	\N	\N	\N	\N	\N
975	en	Rule Group	ir.rule.group-res.group,rule_group	-1		field	res	f	\N	\N	\N	\N	\N
976	en	User Groups	ir.sequence.type,groups	-1		field	res	f	\N	\N	\N	\N	\N
977	en	Groups allowed to edit the sequences of this type.	ir.sequence.type,groups	-1		help	res	f	\N	\N	\N	\N	\N
978	en	Sequence Type - Group	ir.sequence.type-res.group,name	-1		model	res	f	\N	\N	\N	\N	\N
979	en	User Groups	ir.sequence.type-res.group,group	-1		field	res	f	\N	\N	\N	\N	\N
980	en	Sequence Type	ir.sequence.type-res.group,sequence_type	-1		field	res	f	\N	\N	\N	\N	\N
981	en	Groups	ir.export,groups	-1		field	res	f	\N	\N	\N	\N	\N
982	en	The user groups that can use the export.	ir.export,groups	-1		help	res	f	\N	\N	\N	\N	\N
983	en	Modification Groups	ir.export,write_groups	-1		field	res	f	\N	\N	\N	\N	\N
984	en	The user groups that can modify the export.	ir.export,write_groups	-1		help	res	f	\N	\N	\N	\N	\N
985	en	Export Group	ir.export-res.group,name	-1		model	res	f	\N	\N	\N	\N	\N
986	en	Export	ir.export-res.group,export	-1		field	res	f	\N	\N	\N	\N	\N
987	en	Group	ir.export-res.group,group	-1		field	res	f	\N	\N	\N	\N	\N
\.


--
-- Data for Name: ir_trigger; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_trigger (id, action, active, condition, create_date, create_uid, limit_number, minimum_time_delay, model, name, on_create, on_delete, on_time, on_write, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_trigger__history; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_trigger__history (id, __id) FROM stdin;
\.


--
-- Data for Name: ir_trigger_log; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_trigger_log (id, create_date, create_uid, record_id, trigger, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_ui_icon; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_ui_icon (id, create_date, create_uid, module, name, path, sequence, write_date, write_uid) FROM stdin;
1	2023-01-18 22:26:47.309666	0	ir	tryton-board	ui/icons/tryton-board.svg	10	\N	\N
2	2023-01-18 22:26:47.309666	0	ir	tryton-calendar	ui/icons/tryton-calendar.svg	10	\N	\N
3	2023-01-18 22:26:47.309666	0	ir	tryton-folder	ui/icons/tryton-folder.svg	10	\N	\N
4	2023-01-18 22:26:47.309666	0	ir	tryton-form	ui/icons/tryton-form.svg	10	\N	\N
5	2023-01-18 22:26:47.309666	0	ir	tryton-graph	ui/icons/tryton-graph.svg	10	\N	\N
6	2023-01-18 22:26:47.309666	0	ir	tryton-list	ui/icons/tryton-list.svg	10	\N	\N
7	2023-01-18 22:26:47.309666	0	ir	tryton-settings	ui/icons/tryton-settings.svg	10	\N	\N
8	2023-01-18 22:26:47.309666	0	ir	tryton-tree	ui/icons/tryton-tree.svg	10	\N	\N
\.


--
-- Data for Name: ir_ui_menu; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_ui_menu (id, parent, name, icon, active, create_date, create_uid, sequence, write_date, write_uid) FROM stdin;
1	\N	Administration	tryton-settings	t	2023-01-18 22:26:47.309666	0	9999	\N	\N
2	1	User Interface	tryton-folder	t	2023-01-18 22:26:47.309666	0	50	\N	\N
3	2	Icons	tryton-list	t	2023-01-18 22:26:47.309666	0	20	\N	\N
4	2	Menu	tryton-list	t	2023-01-18 22:26:47.309666	0	10	\N	\N
5	2	Views	tryton-list	t	2023-01-18 22:26:47.309666	0	10	\N	\N
6	2	View Tree Width	tryton-list	t	2023-01-18 22:26:47.309666	0	50	\N	\N
7	2	View Tree Optional	tryton-list	t	2023-01-18 22:26:47.309666	0	50	\N	\N
8	2	Tree State	tryton-list	t	2023-01-18 22:26:47.309666	0	50	\N	\N
9	2	View Search	tryton-list	t	2023-01-18 22:26:47.309666	0	50	\N	\N
10	2	Actions	tryton-folder	t	2023-01-18 22:26:47.309666	0	50	\N	\N
11	10	Actions	tryton-list	t	2023-01-18 22:26:47.309666	0	10	\N	\N
12	10	Reports	tryton-list	t	2023-01-18 22:26:47.309666	0	20	\N	\N
13	10	Window Actions	tryton-list	t	2023-01-18 22:26:47.309666	0	20	\N	\N
14	10	Wizards	tryton-list	t	2023-01-18 22:26:47.309666	0	50	\N	\N
15	10	URLs	tryton-list	t	2023-01-18 22:26:47.309666	0	20	\N	\N
16	1	Models	tryton-folder	t	2023-01-18 22:26:47.309666	0	50	\N	\N
17	16	Models	tryton-list	t	2023-01-18 22:26:47.309666	0	10	\N	\N
18	17	Fields	tryton-list	t	2023-01-18 22:26:47.309666	0	20	\N	\N
19	16	Models Access	tryton-list	t	2023-01-18 22:26:47.309666	0	30	\N	\N
20	19	Fields Access	tryton-list	t	2023-01-18 22:26:47.309666	0	10	\N	\N
21	19	Buttons	tryton-list	t	2023-01-18 22:26:47.309666	0	20	\N	\N
22	17	Data	tryton-list	t	2023-01-18 22:26:47.309666	0	50	\N	\N
23	1	Sequences	tryton-folder	t	2023-01-18 22:26:47.309666	0	20	\N	\N
24	23	Sequences	tryton-list	t	2023-01-18 22:26:47.309666	0	10	\N	\N
25	23	Sequences Strict	tryton-list	t	2023-01-18 22:26:47.309666	0	10	\N	\N
26	23	Types	tryton-list	t	2023-01-18 22:26:47.309666	0	20	\N	\N
27	16	Attachments	tryton-list	t	2023-01-18 22:26:47.309666	0	50	\N	\N
28	16	Notes	tryton-list	t	2023-01-18 22:26:47.309666	0	50	\N	\N
29	1	Scheduler	tryton-folder	t	2023-01-18 22:26:47.309666	0	50	\N	\N
30	29	Actions	tryton-list	t	2023-01-18 22:26:47.309666	0	10	\N	\N
31	1	Localization	tryton-folder	t	2023-01-18 22:26:47.309666	0	30	\N	\N
32	31	Languages	tryton-list	t	2023-01-18 22:26:47.309666	0	10	\N	\N
33	31	Translations	tryton-list	t	2023-01-18 22:26:47.309666	0	20	\N	\N
34	31	Set Translations	tryton-launch	t	2023-01-18 22:26:47.309666	0	90	\N	\N
35	31	Clean Translations	tryton-launch	t	2023-01-18 22:26:47.309666	0	91	\N	\N
36	31	Synchronize Translations	tryton-launch	t	2023-01-18 22:26:47.309666	0	92	\N	\N
37	31	Export Translations	tryton-launch	t	2023-01-18 22:26:47.309666	0	93	\N	\N
38	16	Exports	tryton-list	t	2023-01-18 22:26:47.309666	0	50	\N	\N
39	16	Record Rules	tryton-list	t	2023-01-18 22:26:47.309666	0	30	\N	\N
40	1	Modules	tryton-folder	t	2023-01-18 22:26:47.309666	0	20	\N	\N
41	40	Modules	tryton-list	t	2023-01-18 22:26:47.309666	0	10	\N	\N
42	40	Config Wizard Items	tryton-list	t	2023-01-18 22:26:47.309666	0	50	\N	\N
43	40	Perform Pending Activation/Upgrade	tryton-launch	t	2023-01-18 22:26:47.309666	0	90	\N	\N
44	16	Triggers	tryton-list	t	2023-01-18 22:26:47.309666	0	50	\N	\N
45	31	Message	tryton-list	t	2023-01-18 22:26:47.309666	0	20	\N	\N
46	16	E-mails	tryton-list	t	2023-01-18 22:26:47.309666	0	50	\N	\N
47	10	E-mail Templates	tryton-list	t	2023-01-18 22:26:47.309666	0	50	\N	\N
48	29	Errors	tryton-list	t	2023-01-18 22:26:47.309666	0	50	\N	\N
49	1	Users	tryton-folder	t	2023-01-18 22:27:08.693829	0	10	\N	\N
50	49	Groups	tryton-list	t	2023-01-18 22:27:08.693829	0	20	\N	\N
51	49	Users	tryton-list	t	2023-01-18 22:27:08.693829	0	10	\N	\N
\.


--
-- Data for Name: ir_ui_menu-res_group; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public."ir_ui_menu-res_group" (id, create_date, create_uid, "group", menu, write_date, write_uid) FROM stdin;
1	2023-01-18 22:27:08.693829	0	1	50	\N	\N
2	2023-01-18 22:27:08.693829	0	1	51	\N	\N
3	2023-01-18 22:27:08.693829	0	1	1	\N	\N
4	2023-01-18 22:27:08.693829	0	1	2	\N	\N
5	2023-01-18 22:27:08.693829	0	1	3	\N	\N
6	2023-01-18 22:27:08.693829	0	1	4	\N	\N
7	2023-01-18 22:27:08.693829	0	1	5	\N	\N
8	2023-01-18 22:27:08.693829	0	1	6	\N	\N
9	2023-01-18 22:27:08.693829	0	1	7	\N	\N
10	2023-01-18 22:27:08.693829	0	1	10	\N	\N
11	2023-01-18 22:27:08.693829	0	1	11	\N	\N
12	2023-01-18 22:27:08.693829	0	1	12	\N	\N
13	2023-01-18 22:27:08.693829	0	1	13	\N	\N
14	2023-01-18 22:27:08.693829	0	1	14	\N	\N
15	2023-01-18 22:27:08.693829	0	1	15	\N	\N
16	2023-01-18 22:27:08.693829	0	1	16	\N	\N
17	2023-01-18 22:27:08.693829	0	1	17	\N	\N
18	2023-01-18 22:27:08.693829	0	1	18	\N	\N
19	2023-01-18 22:27:08.693829	0	1	19	\N	\N
20	2023-01-18 22:27:08.693829	0	1	20	\N	\N
21	2023-01-18 22:27:08.693829	0	1	23	\N	\N
22	2023-01-18 22:27:08.693829	0	1	24	\N	\N
23	2023-01-18 22:27:08.693829	0	1	25	\N	\N
24	2023-01-18 22:27:08.693829	0	1	26	\N	\N
25	2023-01-18 22:27:08.693829	0	1	27	\N	\N
26	2023-01-18 22:27:08.693829	0	1	29	\N	\N
27	2023-01-18 22:27:08.693829	0	1	30	\N	\N
28	2023-01-18 22:27:08.693829	0	1	31	\N	\N
29	2023-01-18 22:27:08.693829	0	1	32	\N	\N
30	2023-01-18 22:27:08.693829	0	1	33	\N	\N
31	2023-01-18 22:27:08.693829	0	1	34	\N	\N
32	2023-01-18 22:27:08.693829	0	1	35	\N	\N
33	2023-01-18 22:27:08.693829	0	1	36	\N	\N
34	2023-01-18 22:27:08.693829	0	1	37	\N	\N
35	2023-01-18 22:27:08.693829	0	1	38	\N	\N
36	2023-01-18 22:27:08.693829	0	1	39	\N	\N
37	2023-01-18 22:27:08.693829	0	1	40	\N	\N
38	2023-01-18 22:27:08.693829	0	1	41	\N	\N
39	2023-01-18 22:27:08.693829	0	1	42	\N	\N
40	2023-01-18 22:27:08.693829	0	1	43	\N	\N
41	2023-01-18 22:27:08.693829	0	1	44	\N	\N
\.


--
-- Data for Name: ir_ui_menu_favorite; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_ui_menu_favorite (id, create_date, create_uid, menu, sequence, "user", write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_ui_view; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_ui_view (id, model, type, data, field_childs, priority, create_date, create_uid, domain, inherit, module, name, write_date, write_uid) FROM stdin;
1	ir.ui.icon	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	icon_view_list	\N	\N
2	ir.ui.icon	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	icon_view_form	\N	\N
3	ir.ui.menu	tree	\N	childs	20	2023-01-18 22:26:47.309666	0	\N	\N	ir	ui_menu_tree	\N	\N
4	ir.ui.menu	tree	\N	\N	10	2023-01-18 22:26:47.309666	0	\N	\N	ir	ui_menu_list	\N	\N
5	ir.ui.menu	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	ui_menu_form	\N	\N
6	ir.ui.menu.favorite	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	ui_menu_favorite_list	\N	\N
7	ir.ui.menu.favorite	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	ui_menu_favorite_form	\N	\N
8	ir.ui.view	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	ui_view_form	\N	\N
9	ir.ui.view	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	ui_view_list	\N	\N
10	ir.ui.view_tree_width	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	ui_view_tree_width_form	\N	\N
11	ir.ui.view_tree_width	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	ui_view_tree_width_list	\N	\N
12	ir.ui.view_tree_optional	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	ui_view_tree_optional_form	\N	\N
13	ir.ui.view_tree_optional	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	ui_view_tree_optional_list	\N	\N
14	ir.ui.view_tree_state	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	ui_view_tree_state_form	\N	\N
15	ir.ui.view_tree_state	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	ui_view_tree_state_list	\N	\N
16	ir.ui.view_search	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	ui_view_search_form	\N	\N
17	ir.ui.view_search	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	ui_view_search_list	\N	\N
18	ir.action	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_form	\N	\N
19	ir.action	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_list	\N	\N
20	ir.action.keyword	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_keyword_list	\N	\N
21	ir.action.keyword	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_keyword_form	\N	\N
22	ir.action.report	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_report_form	\N	\N
23	ir.action.report	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_report_list	\N	\N
24	ir.action.act_window	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_act_window_form	\N	\N
25	ir.action.act_window	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_act_window_list	\N	\N
26	ir.action.act_window.view	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_act_window_view_form	\N	\N
27	ir.action.act_window.view	tree	\N	\N	10	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_act_window_view_list	\N	\N
28	ir.action.act_window.view	tree	\N	\N	20	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_act_window_view_list2	\N	\N
29	ir.action.act_window.domain	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_act_window_domain_form	\N	\N
30	ir.action.act_window.domain	tree	\N	\N	10	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_act_window_domain_list	\N	\N
31	ir.action.act_window.domain	tree	\N	\N	20	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_act_window_domain_list2	\N	\N
32	ir.action.wizard	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_wizard_form	\N	\N
33	ir.action.wizard	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_wizard_list	\N	\N
34	ir.action.url	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_url_form	\N	\N
35	ir.action.url	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	action_url_list	\N	\N
36	ir.model	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_form	\N	\N
37	ir.model	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_list	\N	\N
38	ir.model.field	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_field_form	\N	\N
39	ir.model.field	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_field_list	\N	\N
40	ir.model.access	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_access_list	\N	\N
41	ir.model.access	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_access_form	\N	\N
42	ir.model.field.access	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_field_access_list	\N	\N
43	ir.model.field.access	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_field_access_form	\N	\N
44	ir.model.print_model_graph.start	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_print_model_graph_start_form	\N	\N
45	ir.model.button	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_button_list	\N	\N
46	ir.model.button	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_button_form	\N	\N
47	ir.model.button.rule	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_button_rule_list	\N	\N
48	ir.model.button.rule	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_button_rule_form	\N	\N
49	ir.model.button.click	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_button_click_list	\N	\N
50	ir.model.button.click	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_button_click_form	\N	\N
51	ir.model.data	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_data_list	\N	\N
52	ir.model.data	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	model_data_form	\N	\N
53	ir.sequence	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	sequence_form	\N	\N
54	ir.sequence	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	sequence_list	\N	\N
55	ir.sequence.strict	\N	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	53	ir	\N	\N	\N
56	ir.sequence.strict	\N	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	54	ir	\N	\N	\N
57	ir.sequence.type	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	sequence_type_form	\N	\N
58	ir.sequence.type	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	sequence_type_list	\N	\N
59	ir.attachment	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	attachment_form	\N	\N
60	ir.attachment	form	\N	\N	50	2023-01-18 22:26:47.309666	0	\N	\N	ir	attachment_form_preview	\N	\N
61	ir.attachment	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	attachment_list	\N	\N
62	ir.note	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	note_form	\N	\N
63	ir.note	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	note_list	\N	\N
64	ir.cron	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	cron_list	\N	\N
65	ir.cron	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	cron_form	\N	\N
66	ir.lang	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	lang_list	\N	\N
67	ir.lang	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	lang_form	\N	\N
68	ir.lang.config.start	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	lang_config_start_form	\N	\N
69	ir.translation	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	translation_form	\N	\N
70	ir.translation	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	translation_list	\N	\N
71	ir.translation.set.start	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	translation_set_start_form	\N	\N
72	ir.translation.set.succeed	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	translation_set_succeed_form	\N	\N
73	ir.translation.clean.start	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	translation_clean_start_form	\N	\N
74	ir.translation.clean.succeed	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	translation_clean_succeed_form	\N	\N
75	ir.translation.update.start	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	translation_update_start_form	\N	\N
76	ir.translation.export.start	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	translation_export_start_form	\N	\N
77	ir.translation.export.result	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	translation_export_result_form	\N	\N
78	ir.export	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	export_form	\N	\N
79	ir.export	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	export_list	\N	\N
80	ir.export.line	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	export_line_form	\N	\N
81	ir.export.line	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	export_line_list	\N	\N
82	ir.rule.group	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	rule_group_form	\N	\N
83	ir.rule.group	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	rule_group_list	\N	\N
84	ir.rule	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	rule_form	\N	\N
85	ir.rule	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	rule_list	\N	\N
86	ir.module	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	module_form	\N	\N
87	ir.module	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	module_list	\N	\N
88	ir.module.dependency	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	module_dependency_form	\N	\N
89	ir.module.dependency	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	module_dependency_list	\N	\N
90	ir.module.config_wizard.item	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	module_config_wizard_item_list	\N	\N
91	ir.module.config_wizard.first	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	module_config_wizard_first_form	\N	\N
92	ir.module.config_wizard.other	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	module_config_wizard_other_form	\N	\N
93	ir.module.config_wizard.done	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	module_config_wizard_done_form	\N	\N
94	ir.module.activate_upgrade.start	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	module_activate_upgrade_start_form	\N	\N
95	ir.module.activate_upgrade.done	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	module_activate_upgrade_done_form	\N	\N
96	ir.module.config.start	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	module_config_start_form	\N	\N
97	ir.trigger	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	trigger_form	\N	\N
98	ir.trigger	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	trigger_list	\N	\N
99	ir.message	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	message_list	\N	\N
100	ir.message	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	message_form	\N	\N
101	ir.email	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	email_form	\N	\N
102	ir.email	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	email_list	\N	\N
103	ir.email.template	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	email_template_form	\N	\N
104	ir.email.template	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	email_template_list	\N	\N
105	ir.error	tree	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	error_list	\N	\N
106	ir.error	form	\N	\N	16	2023-01-18 22:26:47.309666	0	\N	\N	ir	error_form	\N	\N
107	res.group	form	\N	\N	16	2023-01-18 22:27:08.693829	0	\N	\N	res	group_form	\N	\N
108	res.group	tree	\N	\N	16	2023-01-18 22:27:08.693829	0	\N	\N	res	group_list	\N	\N
109	res.user	form	\N	\N	16	2023-01-18 22:27:08.693829	0	\N	\N	res	user_form	\N	\N
110	res.user	form	\N	\N	20	2023-01-18 22:27:08.693829	0	\N	\N	res	user_form_preferences	\N	\N
111	res.user	tree	\N	\N	16	2023-01-18 22:27:08.693829	0	\N	\N	res	user_list	\N	\N
112	res.user.config.start	form	\N	\N	16	2023-01-18 22:27:08.693829	0	\N	\N	res	user_config_start_form	\N	\N
113	res.user.warning	form	\N	\N	16	2023-01-18 22:27:08.693829	0	\N	\N	res	user_warning_form	\N	\N
114	res.user.warning	tree	\N	\N	16	2023-01-18 22:27:08.693829	0	\N	\N	res	user_warning_tree	\N	\N
115	res.user.application	form	\N	\N	16	2023-01-18 22:27:08.693829	0	\N	\N	res	user_application_form	\N	\N
116	res.user.application	tree	\N	\N	16	2023-01-18 22:27:08.693829	0	\N	\N	res	user_application_list	\N	\N
117	ir.sequence.type	\N	\N	\N	16	2023-01-18 22:27:08.693829	0	\N	57	res	sequence_type_form	\N	\N
118	ir.export	\N	\N	\N	16	2023-01-18 22:27:08.693829	0	\N	78	res	export_form	\N	\N
119	ir.export	\N	\N	\N	16	2023-01-18 22:27:08.693829	0	\N	79	res	export_list	\N	\N
\.


--
-- Data for Name: ir_ui_view_search; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_ui_view_search (id, create_date, create_uid, domain, model, name, "user", write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_ui_view_tree_optional; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_ui_view_tree_optional (id, create_date, create_uid, field, "user", value, view_id, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_ui_view_tree_state; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_ui_view_tree_state (id, child_name, create_date, create_uid, domain, model, nodes, selected_nodes, "user", write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: ir_ui_view_tree_width; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.ir_ui_view_tree_width (id, create_date, create_uid, field, model, "user", width, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: res_group; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.res_group (id, name, active, create_date, create_uid, parent, write_date, write_uid) FROM stdin;
1	Administration	t	2023-01-18 22:27:08.693829	0	\N	\N	\N
\.


--
-- Data for Name: res_user; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.res_user (id, name, active, login, password, create_date, create_uid, email, language, menu, password_hash, password_reset, password_reset_expire, signature, write_date, write_uid) FROM stdin;
0	Root	f	root	\N	2023-01-18 22:27:08.874403	0	\N	\N	2	\N	\N	\N	\N	\N	\N
1	Administrator	t	admin	\N	2023-01-18 22:27:08.693829	0	bambangpdp@gmail.com	\N	2	$scrypt$ln=16,r=8,p=1$wdibMwbAmFPKWWutda71Xg$rI8E1Zq00JBpHCvKsUvWwmz5Ae1OzmhJ01X+cZ8BP6k	\N	\N	\N	2023-01-18 22:27:23.443067	0
\.


--
-- Data for Name: res_user-ir_action; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public."res_user-ir_action" (id, action, create_date, create_uid, "user", write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: res_user-res_group; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public."res_user-res_group" (id, "user", "group", create_date, create_uid, write_date, write_uid) FROM stdin;
1	1	1	2023-01-18 22:27:08.693829	0	\N	\N
\.


--
-- Data for Name: res_user_application; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.res_user_application (id, application, create_date, create_uid, key, state, "user", write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: res_user_device; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.res_user_device (id, cookie, create_date, create_uid, login, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: res_user_login_attempt; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.res_user_login_attempt (id, create_date, create_uid, device_cookie, ip_address, ip_network, login, write_date, write_uid) FROM stdin;
\.


--
-- Data for Name: res_user_warning; Type: TABLE DATA; Schema: public; Owner: tryton
--

COPY public.res_user_warning (id, always, create_date, create_uid, name, "user", write_date, write_uid) FROM stdin;
\.


--
-- Name: ir_action-res_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public."ir_action-res_group_id_seq"', 4, true);


--
-- Name: ir_action_act_window_domain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_action_act_window_domain_id_seq', 7, true);


--
-- Name: ir_action_act_window_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_action_act_window_id_seq', 56, true);


--
-- Name: ir_action_act_window_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_action_act_window_view_id_seq', 76, true);


--
-- Name: ir_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_action_id_seq', 58, true);


--
-- Name: ir_action_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_action_keyword_id_seq', 55, true);


--
-- Name: ir_action_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_action_report_id_seq', 58, true);


--
-- Name: ir_action_url_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_action_url_id_seq', 1, false);


--
-- Name: ir_action_wizard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_action_wizard_id_seq', 57, true);


--
-- Name: ir_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_attachment_id_seq', 1, false);


--
-- Name: ir_avatar_cache_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_avatar_cache_id_seq', 1, false);


--
-- Name: ir_avatar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_avatar_id_seq', 1, true);


--
-- Name: ir_cache_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_cache_id_seq', 52, true);


--
-- Name: ir_calendar_day_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_calendar_day_id_seq', 7, true);


--
-- Name: ir_calendar_month_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_calendar_month_id_seq', 12, true);


--
-- Name: ir_configuration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_configuration_id_seq', 1, true);


--
-- Name: ir_cron_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_cron_id_seq', 3, true);


--
-- Name: ir_email_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_email_address_id_seq', 1, false);


--
-- Name: ir_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_email_id_seq', 1, false);


--
-- Name: ir_email_template-ir_action_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public."ir_email_template-ir_action_report_id_seq"', 1, false);


--
-- Name: ir_email_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_email_template_id_seq', 1, false);


--
-- Name: ir_error_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_error_id_seq', 1, false);


--
-- Name: ir_export-res_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public."ir_export-res_group_id_seq"', 1, false);


--
-- Name: ir_export-write-res_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public."ir_export-write-res_group_id_seq"', 1, false);


--
-- Name: ir_export_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_export_id_seq', 1, false);


--
-- Name: ir_export_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_export_line_id_seq', 1, false);


--
-- Name: ir_lang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_lang_id_seq', 25, true);


--
-- Name: ir_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_message_id_seq', 125, true);


--
-- Name: ir_model_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_model_access_id_seq', 70, true);


--
-- Name: ir_model_button-button_reset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public."ir_model_button-button_reset_id_seq"', 1, false);


--
-- Name: ir_model_button-res_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public."ir_model_button-res_group_id_seq"', 9, true);


--
-- Name: ir_model_button_click_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_model_button_click_id_seq', 1, false);


--
-- Name: ir_model_button_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_model_button_id_seq', 17, true);


--
-- Name: ir_model_button_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_model_button_rule_id_seq', 1, false);


--
-- Name: ir_model_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_model_data_id_seq', 713, true);


--
-- Name: ir_model_field_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_model_field_access_id_seq', 1, false);


--
-- Name: ir_model_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_model_field_id_seq', 938, true);


--
-- Name: ir_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_model_id_seq', 91, true);


--
-- Name: ir_module_config_wizard_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_module_config_wizard_item_id_seq', 3, true);


--
-- Name: ir_module_dependency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_module_dependency_id_seq', 821, true);


--
-- Name: ir_module_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_module_id_seq', 196, true);


--
-- Name: ir_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_note_id_seq', 1, false);


--
-- Name: ir_note_read_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_note_read_id_seq', 1, false);


--
-- Name: ir_queue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_queue_id_seq', 1, false);


--
-- Name: ir_rule_group-res_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public."ir_rule_group-res_group_id_seq"', 4, true);


--
-- Name: ir_rule_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_rule_group_id_seq', 24, true);


--
-- Name: ir_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_rule_id_seq', 34, true);


--
-- Name: ir_sequence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_sequence_id_seq', 1, false);


--
-- Name: ir_sequence_strict_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_sequence_strict_id_seq', 1, false);


--
-- Name: ir_sequence_type-res_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public."ir_sequence_type-res_group_id_seq"', 1, false);


--
-- Name: ir_sequence_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_sequence_type_id_seq', 1, false);


--
-- Name: ir_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_session_id_seq', 1, false);


--
-- Name: ir_session_wizard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_session_wizard_id_seq', 1, false);


--
-- Name: ir_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_translation_id_seq', 1037, true);


--
-- Name: ir_trigger__history___id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_trigger__history___id_seq', 1, false);


--
-- Name: ir_trigger_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_trigger_id_seq', 1, false);


--
-- Name: ir_trigger_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_trigger_log_id_seq', 1, false);


--
-- Name: ir_ui_icon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_ui_icon_id_seq', 8, true);


--
-- Name: ir_ui_menu-res_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public."ir_ui_menu-res_group_id_seq"', 41, true);


--
-- Name: ir_ui_menu_favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_ui_menu_favorite_id_seq', 1, false);


--
-- Name: ir_ui_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_ui_menu_id_seq', 51, true);


--
-- Name: ir_ui_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_ui_view_id_seq', 119, true);


--
-- Name: ir_ui_view_search_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_ui_view_search_id_seq', 1, false);


--
-- Name: ir_ui_view_tree_optional_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_ui_view_tree_optional_id_seq', 1, false);


--
-- Name: ir_ui_view_tree_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_ui_view_tree_state_id_seq', 1, false);


--
-- Name: ir_ui_view_tree_width_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.ir_ui_view_tree_width_id_seq', 1, false);


--
-- Name: res_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.res_group_id_seq', 1, true);


--
-- Name: res_user-ir_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public."res_user-ir_action_id_seq"', 1, false);


--
-- Name: res_user-res_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public."res_user-res_group_id_seq"', 1, true);


--
-- Name: res_user_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.res_user_application_id_seq', 1, false);


--
-- Name: res_user_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.res_user_device_id_seq', 1, false);


--
-- Name: res_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.res_user_id_seq', 1, true);


--
-- Name: res_user_login_attempt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.res_user_login_attempt_id_seq', 1, false);


--
-- Name: res_user_warning_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tryton
--

SELECT pg_catalog.setval('public.res_user_warning_id_seq', 1, false);


--
-- Name: ir_action-res_group ir_action-res_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_action-res_group"
    ADD CONSTRAINT "ir_action-res_group_pkey" PRIMARY KEY (id);


--
-- Name: ir_action_act_window_domain ir_action_act_window_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action_act_window_domain
    ADD CONSTRAINT ir_action_act_window_domain_pkey PRIMARY KEY (id);


--
-- Name: ir_action_act_window ir_action_act_window_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action_act_window
    ADD CONSTRAINT ir_action_act_window_pkey PRIMARY KEY (id);


--
-- Name: ir_action_act_window_view ir_action_act_window_view_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action_act_window_view
    ADD CONSTRAINT ir_action_act_window_view_pkey PRIMARY KEY (id);


--
-- Name: ir_action_keyword ir_action_keyword_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action_keyword
    ADD CONSTRAINT ir_action_keyword_pkey PRIMARY KEY (id);


--
-- Name: ir_action ir_action_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action
    ADD CONSTRAINT ir_action_pkey PRIMARY KEY (id);


--
-- Name: ir_action_report ir_action_report_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action_report
    ADD CONSTRAINT ir_action_report_pkey PRIMARY KEY (id);


--
-- Name: ir_action_url ir_action_url_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action_url
    ADD CONSTRAINT ir_action_url_pkey PRIMARY KEY (id);


--
-- Name: ir_action_wizard ir_action_wizard_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action_wizard
    ADD CONSTRAINT ir_action_wizard_pkey PRIMARY KEY (id);


--
-- Name: ir_attachment ir_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_attachment
    ADD CONSTRAINT ir_attachment_pkey PRIMARY KEY (id);


--
-- Name: ir_avatar_cache ir_avatar_cache_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_avatar_cache
    ADD CONSTRAINT ir_avatar_cache_pkey PRIMARY KEY (id);


--
-- Name: ir_avatar_cache ir_avatar_cache_size_unique; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_avatar_cache
    ADD CONSTRAINT ir_avatar_cache_size_unique UNIQUE (avatar, size);


--
-- Name: ir_avatar ir_avatar_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_avatar
    ADD CONSTRAINT ir_avatar_pkey PRIMARY KEY (id);


--
-- Name: ir_avatar ir_avatar_resource_unique; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_avatar
    ADD CONSTRAINT ir_avatar_resource_unique UNIQUE (resource);


--
-- Name: ir_calendar_day ir_calendar_day_index_unique; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_calendar_day
    ADD CONSTRAINT ir_calendar_day_index_unique UNIQUE (index);


--
-- Name: ir_calendar_day ir_calendar_day_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_calendar_day
    ADD CONSTRAINT ir_calendar_day_pkey PRIMARY KEY (id);


--
-- Name: ir_calendar_month ir_calendar_month_index_unique; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_calendar_month
    ADD CONSTRAINT ir_calendar_month_index_unique UNIQUE (index);


--
-- Name: ir_calendar_month ir_calendar_month_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_calendar_month
    ADD CONSTRAINT ir_calendar_month_pkey PRIMARY KEY (id);


--
-- Name: ir_configuration ir_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_configuration
    ADD CONSTRAINT ir_configuration_pkey PRIMARY KEY (id);


--
-- Name: ir_cron ir_cron_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_cron
    ADD CONSTRAINT ir_cron_pkey PRIMARY KEY (id);


--
-- Name: ir_email_address ir_email_address_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_email_address
    ADD CONSTRAINT ir_email_address_pkey PRIMARY KEY (id);


--
-- Name: ir_email ir_email_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_email
    ADD CONSTRAINT ir_email_pkey PRIMARY KEY (id);


--
-- Name: ir_email_template-ir_action_report ir_email_template-ir_action_report_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_email_template-ir_action_report"
    ADD CONSTRAINT "ir_email_template-ir_action_report_pkey" PRIMARY KEY (id);


--
-- Name: ir_email_template ir_email_template_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_email_template
    ADD CONSTRAINT ir_email_template_pkey PRIMARY KEY (id);


--
-- Name: ir_error ir_error_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_error
    ADD CONSTRAINT ir_error_pkey PRIMARY KEY (id);


--
-- Name: ir_export-res_group ir_export-res_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_export-res_group"
    ADD CONSTRAINT "ir_export-res_group_pkey" PRIMARY KEY (id);


--
-- Name: ir_export-write-res_group ir_export-write-res_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_export-write-res_group"
    ADD CONSTRAINT "ir_export-write-res_group_pkey" PRIMARY KEY (id);


--
-- Name: ir_export_line ir_export_line_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_export_line
    ADD CONSTRAINT ir_export_line_pkey PRIMARY KEY (id);


--
-- Name: ir_export ir_export_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_export
    ADD CONSTRAINT ir_export_pkey PRIMARY KEY (id);


--
-- Name: ir_lang ir_lang_code_unique; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_lang
    ADD CONSTRAINT ir_lang_code_unique UNIQUE (code);


--
-- Name: ir_lang ir_lang_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_lang
    ADD CONSTRAINT ir_lang_pkey PRIMARY KEY (id);


--
-- Name: ir_message ir_message_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_message
    ADD CONSTRAINT ir_message_pkey PRIMARY KEY (id);


--
-- Name: ir_model_access ir_model_access_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_access
    ADD CONSTRAINT ir_model_access_pkey PRIMARY KEY (id);


--
-- Name: ir_model_button-button_reset ir_model_button-button_reset_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_model_button-button_reset"
    ADD CONSTRAINT "ir_model_button-button_reset_pkey" PRIMARY KEY (id);


--
-- Name: ir_model_button-res_group ir_model_button-res_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_model_button-res_group"
    ADD CONSTRAINT "ir_model_button-res_group_pkey" PRIMARY KEY (id);


--
-- Name: ir_model_button_click ir_model_button_click_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_button_click
    ADD CONSTRAINT ir_model_button_click_pkey PRIMARY KEY (id);


--
-- Name: ir_model_button ir_model_button_name_model_exclude; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_button
    ADD CONSTRAINT ir_model_button_name_model_exclude EXCLUDE USING btree (name WITH =, model WITH =) WHERE ((active = true));


--
-- Name: ir_model_button ir_model_button_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_button
    ADD CONSTRAINT ir_model_button_pkey PRIMARY KEY (id);


--
-- Name: ir_model_button_rule ir_model_button_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_button_rule
    ADD CONSTRAINT ir_model_button_rule_pkey PRIMARY KEY (id);


--
-- Name: ir_model_data ir_model_data_fs_id_module_model_uniq; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_data
    ADD CONSTRAINT ir_model_data_fs_id_module_model_uniq UNIQUE (fs_id, module, model);


--
-- Name: ir_model_data ir_model_data_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_data
    ADD CONSTRAINT ir_model_data_pkey PRIMARY KEY (id);


--
-- Name: ir_model_field_access ir_model_field_access_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_field_access
    ADD CONSTRAINT ir_model_field_access_pkey PRIMARY KEY (id);


--
-- Name: ir_model_field ir_model_field_name_model_uniq; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_field
    ADD CONSTRAINT ir_model_field_name_model_uniq UNIQUE (name, model);


--
-- Name: ir_model_field ir_model_field_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_field
    ADD CONSTRAINT ir_model_field_pkey PRIMARY KEY (id);


--
-- Name: ir_model ir_model_model_uniq; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model
    ADD CONSTRAINT ir_model_model_uniq UNIQUE (model);


--
-- Name: ir_model ir_model_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model
    ADD CONSTRAINT ir_model_pkey PRIMARY KEY (id);


--
-- Name: ir_module_config_wizard_item ir_module_config_wizard_item_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_module_config_wizard_item
    ADD CONSTRAINT ir_module_config_wizard_item_pkey PRIMARY KEY (id);


--
-- Name: ir_module_dependency ir_module_dependency_name_module_uniq; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_module_dependency
    ADD CONSTRAINT ir_module_dependency_name_module_uniq UNIQUE (name, module);


--
-- Name: ir_module_dependency ir_module_dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_module_dependency
    ADD CONSTRAINT ir_module_dependency_pkey PRIMARY KEY (id);


--
-- Name: ir_module ir_module_name_uniq; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_module
    ADD CONSTRAINT ir_module_name_uniq UNIQUE (name);


--
-- Name: ir_module ir_module_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_module
    ADD CONSTRAINT ir_module_pkey PRIMARY KEY (id);


--
-- Name: ir_note ir_note_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_note
    ADD CONSTRAINT ir_note_pkey PRIMARY KEY (id);


--
-- Name: ir_note_read ir_note_read_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_note_read
    ADD CONSTRAINT ir_note_read_pkey PRIMARY KEY (id);


--
-- Name: ir_queue ir_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_queue
    ADD CONSTRAINT ir_queue_pkey PRIMARY KEY (id);


--
-- Name: ir_rule_group-res_group ir_rule_group-res_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_rule_group-res_group"
    ADD CONSTRAINT "ir_rule_group-res_group_pkey" PRIMARY KEY (id);


--
-- Name: ir_rule_group ir_rule_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_rule_group
    ADD CONSTRAINT ir_rule_group_pkey PRIMARY KEY (id);


--
-- Name: ir_rule ir_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_rule
    ADD CONSTRAINT ir_rule_pkey PRIMARY KEY (id);


--
-- Name: ir_sequence ir_sequence_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_sequence
    ADD CONSTRAINT ir_sequence_pkey PRIMARY KEY (id);


--
-- Name: ir_sequence_strict ir_sequence_strict_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_sequence_strict
    ADD CONSTRAINT ir_sequence_strict_pkey PRIMARY KEY (id);


--
-- Name: ir_sequence_type-res_group ir_sequence_type-res_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_sequence_type-res_group"
    ADD CONSTRAINT "ir_sequence_type-res_group_pkey" PRIMARY KEY (id);


--
-- Name: ir_sequence_type ir_sequence_type_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_sequence_type
    ADD CONSTRAINT ir_sequence_type_pkey PRIMARY KEY (id);


--
-- Name: ir_session ir_session_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_session
    ADD CONSTRAINT ir_session_pkey PRIMARY KEY (id);


--
-- Name: ir_session_wizard ir_session_wizard_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_session_wizard
    ADD CONSTRAINT ir_session_wizard_pkey PRIMARY KEY (id);


--
-- Name: ir_translation ir_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_translation
    ADD CONSTRAINT ir_translation_pkey PRIMARY KEY (id);


--
-- Name: ir_trigger__history ir_trigger__history_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_trigger__history
    ADD CONSTRAINT ir_trigger__history_pkey PRIMARY KEY (__id);


--
-- Name: ir_trigger_log ir_trigger_log_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_trigger_log
    ADD CONSTRAINT ir_trigger_log_pkey PRIMARY KEY (id);


--
-- Name: ir_trigger ir_trigger_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_trigger
    ADD CONSTRAINT ir_trigger_pkey PRIMARY KEY (id);


--
-- Name: ir_ui_icon ir_ui_icon_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_icon
    ADD CONSTRAINT ir_ui_icon_pkey PRIMARY KEY (id);


--
-- Name: ir_ui_menu-res_group ir_ui_menu-res_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_ui_menu-res_group"
    ADD CONSTRAINT "ir_ui_menu-res_group_pkey" PRIMARY KEY (id);


--
-- Name: ir_ui_menu_favorite ir_ui_menu_favorite_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_menu_favorite
    ADD CONSTRAINT ir_ui_menu_favorite_pkey PRIMARY KEY (id);


--
-- Name: ir_ui_menu ir_ui_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_menu
    ADD CONSTRAINT ir_ui_menu_pkey PRIMARY KEY (id);


--
-- Name: ir_ui_view ir_ui_view_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_view
    ADD CONSTRAINT ir_ui_view_pkey PRIMARY KEY (id);


--
-- Name: ir_ui_view_search ir_ui_view_search_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_view_search
    ADD CONSTRAINT ir_ui_view_search_pkey PRIMARY KEY (id);


--
-- Name: ir_ui_view_tree_optional ir_ui_view_tree_optional_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_view_tree_optional
    ADD CONSTRAINT ir_ui_view_tree_optional_pkey PRIMARY KEY (id);


--
-- Name: ir_ui_view_tree_state ir_ui_view_tree_state_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_view_tree_state
    ADD CONSTRAINT ir_ui_view_tree_state_pkey PRIMARY KEY (id);


--
-- Name: ir_ui_view_tree_width ir_ui_view_tree_width_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_view_tree_width
    ADD CONSTRAINT ir_ui_view_tree_width_pkey PRIMARY KEY (id);


--
-- Name: res_group res_group_name_uniq; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.res_group
    ADD CONSTRAINT res_group_name_uniq UNIQUE (name);


--
-- Name: res_group res_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.res_group
    ADD CONSTRAINT res_group_pkey PRIMARY KEY (id);


--
-- Name: res_user-ir_action res_user-ir_action_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."res_user-ir_action"
    ADD CONSTRAINT "res_user-ir_action_pkey" PRIMARY KEY (id);


--
-- Name: res_user-res_group res_user-res_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."res_user-res_group"
    ADD CONSTRAINT "res_user-res_group_pkey" PRIMARY KEY (id);


--
-- Name: res_user_application res_user_application_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.res_user_application
    ADD CONSTRAINT res_user_application_pkey PRIMARY KEY (id);


--
-- Name: res_user_device res_user_device_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.res_user_device
    ADD CONSTRAINT res_user_device_pkey PRIMARY KEY (id);


--
-- Name: res_user_login_attempt res_user_login_attempt_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.res_user_login_attempt
    ADD CONSTRAINT res_user_login_attempt_pkey PRIMARY KEY (id);


--
-- Name: res_user res_user_login_key; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.res_user
    ADD CONSTRAINT res_user_login_key UNIQUE (login);


--
-- Name: res_user res_user_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.res_user
    ADD CONSTRAINT res_user_pkey PRIMARY KEY (id);


--
-- Name: res_user_warning res_user_warning_pkey; Type: CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.res_user_warning
    ADD CONSTRAINT res_user_warning_pkey PRIMARY KEY (id);


--
-- Name: idx_2e747d478906e503fd41537ce713d0b8aafb3cb366c61d16823980a07d8; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_2e747d478906e503fd41537ce713d0b8aafb3cb366c61d16823980a07d8 ON public.ir_avatar USING btree (resource varchar_pattern_ops, ((SUBSTRING(resource FROM (POSITION((','::text) IN (resource)) + 1)))::integer));


--
-- Name: idx_4f00b2dcb483156ec7333c52bafcb83e44046c0b04c2664166cf971674d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_4f00b2dcb483156ec7333c52bafcb83e44046c0b04c2664166cf971674d ON public.ir_module_config_wizard_item USING btree (sequence NULLS FIRST, id NULLS FIRST);


--
-- Name: idx_624b4eb6d39a462c6db0e0e143f17ec0ddbe19de930b79883011f2029f0; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_624b4eb6d39a462c6db0e0e143f17ec0ddbe19de930b79883011f2029f0 ON public."ir_email_template-ir_action_report" USING btree (template);


--
-- Name: idx_66041a30b3eb13dba501b7fa3a5646df6294bad0c8c2c9b2a712d02be91; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_66041a30b3eb13dba501b7fa3a5646df6294bad0c8c2c9b2a712d02be91 ON public.ir_action_keyword USING btree (model varchar_pattern_ops, ((SUBSTRING(model FROM (POSITION((','::text) IN (model)) + 1)))::integer)) WHERE (model IS NOT NULL);


--
-- Name: idx_8e152d7ce92fbb76cb949de6655ae4d7336c240e8d17c2e82975b3ae3d0; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_8e152d7ce92fbb76cb949de6655ae4d7336c240e8d17c2e82975b3ae3d0 ON public."ir_model_button-button_reset" USING btree (button);


--
-- Name: idx_9cbdad2571aa81b4597a6c45e83a3c8abd5a5bb88ce47c66801c435628e; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_9cbdad2571aa81b4597a6c45e83a3c8abd5a5bb88ce47c66801c435628e ON public."ir_model_button-button_reset" USING btree (button_ruled);


--
-- Name: idx_b95d8e3ff36aaf3768c6a25958be7c742ce7e988f7b156213ebac85c5ce; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_b95d8e3ff36aaf3768c6a25958be7c742ce7e988f7b156213ebac85c5ce ON public.ir_action_act_window_domain USING btree (sequence NULLS FIRST, id NULLS FIRST);


--
-- Name: idx_c79f95493b6bff9a1189b9afd72df0f4139fb326d3a6e76138957f20d15; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_c79f95493b6bff9a1189b9afd72df0f4139fb326d3a6e76138957f20d15 ON public.ir_action_act_window_domain USING btree (name varchar_pattern_ops);


--
-- Name: idx_dfcc64b054cf997698d460a64f9a60885f2b5ee79dfadeb1633b59eb1de; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_dfcc64b054cf997698d460a64f9a60885f2b5ee79dfadeb1633b59eb1de ON public."ir_email_template-ir_action_report" USING btree (report);


--
-- Name: idx_e2e352bdb168722ee5e251732c930273880a0c4cfb4dddc41bf6460ae3b; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_e2e352bdb168722ee5e251732c930273880a0c4cfb4dddc41bf6460ae3b ON public.ir_action_act_window_domain USING btree (act_window);


--
-- Name: idx_f3d1eb5db2b1745f906b5c9976fa776e4a983443a4d4979a0119ac23034; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_f3d1eb5db2b1745f906b5c9976fa776e4a983443a4d4979a0119ac23034 ON public.ir_error USING hash (state) WHERE ((state)::text = ANY ((ARRAY['open'::character varying, 'processing'::character varying])::text[]));


--
-- Name: idx_ir_action-res_group_378958288fb22e1c369289310230a07a; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_ir_action-res_group_378958288fb22e1c369289310230a07a" ON public."ir_action-res_group" USING btree ("group");


--
-- Name: idx_ir_action-res_group_b3e46abd464f2ac1955ceeb0f47ea6cf; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_ir_action-res_group_b3e46abd464f2ac1955ceeb0f47ea6cf" ON public."ir_action-res_group" USING btree (action);


--
-- Name: idx_ir_action_act_window_view_4635af06f24aa52c27a68b68f3a14681; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_action_act_window_view_4635af06f24aa52c27a68b68f3a14681 ON public.ir_action_act_window_view USING btree (act_window) WHERE (act_window IS NOT NULL);


--
-- Name: idx_ir_action_act_window_view_6c19ea0bd65983713b156b49cf9c2cc9; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_action_act_window_view_6c19ea0bd65983713b156b49cf9c2cc9 ON public.ir_action_act_window_view USING btree (sequence NULLS FIRST, id NULLS FIRST);


--
-- Name: idx_ir_action_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_action_d884bc69b0c18974fe282eea226f070d ON public.ir_action USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_action_keyword_2265577b37e81dbfa907f45a3252a05a; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_action_keyword_2265577b37e81dbfa907f45a3252a05a ON public.ir_action_keyword USING btree (action) WHERE (action IS NOT NULL);


--
-- Name: idx_ir_action_keyword_69c9711bc85b4d7f4593189f57762718; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_action_keyword_69c9711bc85b4d7f4593189f57762718 ON public.ir_action_keyword USING btree (keyword, model);


--
-- Name: idx_ir_action_keyword_f69ae7f615f5236539f858ee9607bb3d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_action_keyword_f69ae7f615f5236539f858ee9607bb3d ON public.ir_action_keyword USING hash (model) WHERE (model IS NOT NULL);


--
-- Name: idx_ir_attachment_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_attachment_d884bc69b0c18974fe282eea226f070d ON public.ir_attachment USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_attachment_e610abf0052b09718d80156228c6ff5e; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_attachment_e610abf0052b09718d80156228c6ff5e ON public.ir_attachment USING btree (resource varchar_pattern_ops);


--
-- Name: idx_ir_avatar_9afa8eacf74322ca4ca42f7ae244d4e2; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_avatar_9afa8eacf74322ca4ca42f7ae244d4e2 ON public.ir_avatar USING hash (resource);


--
-- Name: idx_ir_avatar_cache_362c0440f3157fd18d1c4d6d0209bef1; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_avatar_cache_362c0440f3157fd18d1c4d6d0209bef1 ON public.ir_avatar_cache USING btree (avatar);


--
-- Name: idx_ir_avatar_e610abf0052b09718d80156228c6ff5e; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_avatar_e610abf0052b09718d80156228c6ff5e ON public.ir_avatar USING btree (resource varchar_pattern_ops);


--
-- Name: idx_ir_cache_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_cache_d884bc69b0c18974fe282eea226f070d ON public.ir_cache USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_calendar_day_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_calendar_day_d884bc69b0c18974fe282eea226f070d ON public.ir_calendar_day USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_calendar_month_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_calendar_month_d884bc69b0c18974fe282eea226f070d ON public.ir_calendar_month USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_cron_158bf18574127f52dd672369bfd6c307; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_cron_158bf18574127f52dd672369bfd6c307 ON public.ir_cron USING btree (next_call);


--
-- Name: idx_ir_email_address_1c2ed617c392ca0f2c485f4231d7920a; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_email_address_1c2ed617c392ca0f2c485f4231d7920a ON public.ir_email_address USING btree (email);


--
-- Name: idx_ir_email_e610abf0052b09718d80156228c6ff5e; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_email_e610abf0052b09718d80156228c6ff5e ON public.ir_email USING btree (resource varchar_pattern_ops);


--
-- Name: idx_ir_email_template_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_email_template_d884bc69b0c18974fe282eea226f070d ON public.ir_email_template USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_export-res_group_2afd4ada31e01c85e280638375a5f42e; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_ir_export-res_group_2afd4ada31e01c85e280638375a5f42e" ON public."ir_export-res_group" USING btree (export);


--
-- Name: idx_ir_export-res_group_378958288fb22e1c369289310230a07a; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_ir_export-res_group_378958288fb22e1c369289310230a07a" ON public."ir_export-res_group" USING btree ("group");


--
-- Name: idx_ir_export-write-res_group_2afd4ada31e01c85e280638375a5f42e; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_ir_export-write-res_group_2afd4ada31e01c85e280638375a5f42e" ON public."ir_export-write-res_group" USING btree (export);


--
-- Name: idx_ir_export-write-res_group_378958288fb22e1c369289310230a07a; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_ir_export-write-res_group_378958288fb22e1c369289310230a07a" ON public."ir_export-write-res_group" USING btree ("group");


--
-- Name: idx_ir_export_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_export_d884bc69b0c18974fe282eea226f070d ON public.ir_export USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_export_line_2afd4ada31e01c85e280638375a5f42e; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_export_line_2afd4ada31e01c85e280638375a5f42e ON public.ir_export_line USING btree (export);


--
-- Name: idx_ir_export_line_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_export_line_d884bc69b0c18974fe282eea226f070d ON public.ir_export_line USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_lang_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_lang_d884bc69b0c18974fe282eea226f070d ON public.ir_lang USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_model_access_8fb996dbbf6c8700a713be23683edf7a; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_model_access_8fb996dbbf6c8700a713be23683edf7a ON public.ir_model_access USING btree ("group") WHERE ("group" IS NOT NULL);


--
-- Name: idx_ir_model_button-res_group_378958288fb22e1c369289310230a07a; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_ir_model_button-res_group_378958288fb22e1c369289310230a07a" ON public."ir_model_button-res_group" USING btree ("group");


--
-- Name: idx_ir_model_button-res_group_cf6eeb7b4a4f06a4335a4b6ec7ace163; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_ir_model_button-res_group_cf6eeb7b4a4f06a4335a4b6ec7ace163" ON public."ir_model_button-res_group" USING btree (button);


--
-- Name: idx_ir_model_button_click_cf6eeb7b4a4f06a4335a4b6ec7ace163; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_model_button_click_cf6eeb7b4a4f06a4335a4b6ec7ace163 ON public.ir_model_button_click USING btree (button);


--
-- Name: idx_ir_model_button_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_model_button_d884bc69b0c18974fe282eea226f070d ON public.ir_model_button USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_model_button_rule_cf6eeb7b4a4f06a4335a4b6ec7ace163; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_model_button_rule_cf6eeb7b4a4f06a4335a4b6ec7ace163 ON public.ir_model_button_rule USING btree (button);


--
-- Name: idx_ir_model_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_model_d884bc69b0c18974fe282eea226f070d ON public.ir_model USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_model_data_38ebf93cecf5de8075e9cef707640354; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_model_data_38ebf93cecf5de8075e9cef707640354 ON public.ir_model_data USING hash (module);


--
-- Name: idx_ir_model_data_45bf20ec06f6b07061b37aa2d0a2a282; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_model_data_45bf20ec06f6b07061b37aa2d0a2a282 ON public.ir_model_data USING btree (fs_id, module, model);


--
-- Name: idx_ir_model_field_a8ade1d4ca7836d0d78918cc7850c201; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_model_field_a8ade1d4ca7836d0d78918cc7850c201 ON public.ir_model_field USING btree (model);


--
-- Name: idx_ir_model_field_access_8fb996dbbf6c8700a713be23683edf7a; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_model_field_access_8fb996dbbf6c8700a713be23683edf7a ON public.ir_model_field_access USING btree ("group") WHERE ("group" IS NOT NULL);


--
-- Name: idx_ir_model_field_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_model_field_d884bc69b0c18974fe282eea226f070d ON public.ir_model_field USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_module_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_module_d884bc69b0c18974fe282eea226f070d ON public.ir_module USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_module_dependency_1e2e60344731773a0b609246211ecea1; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_module_dependency_1e2e60344731773a0b609246211ecea1 ON public.ir_module_dependency USING btree (module);


--
-- Name: idx_ir_module_dependency_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_module_dependency_d884bc69b0c18974fe282eea226f070d ON public.ir_module_dependency USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_note_e610abf0052b09718d80156228c6ff5e; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_note_e610abf0052b09718d80156228c6ff5e ON public.ir_note USING btree (resource varchar_pattern_ops);


--
-- Name: idx_ir_queue_27afbe251854e7670e897f1a8d124652; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_queue_27afbe251854e7670e897f1a8d124652 ON public.ir_queue USING btree (scheduled_at, expected_at, dequeued_at, name);


--
-- Name: idx_ir_queue_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_queue_d884bc69b0c18974fe282eea226f070d ON public.ir_queue USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_rule_9464bb4eaf5cdda0236997a121b8cd0c; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_rule_9464bb4eaf5cdda0236997a121b8cd0c ON public.ir_rule USING hash (rule_group);


--
-- Name: idx_ir_rule_b7b14dfeb1382c96494497535d1dc676; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_rule_b7b14dfeb1382c96494497535d1dc676 ON public.ir_rule USING btree (rule_group);


--
-- Name: idx_ir_rule_group-res_group_378958288fb22e1c369289310230a07a; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_ir_rule_group-res_group_378958288fb22e1c369289310230a07a" ON public."ir_rule_group-res_group" USING btree ("group");


--
-- Name: idx_ir_rule_group-res_group_b7b14dfeb1382c96494497535d1dc676; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_ir_rule_group-res_group_b7b14dfeb1382c96494497535d1dc676" ON public."ir_rule_group-res_group" USING btree (rule_group);


--
-- Name: idx_ir_rule_group_7f68600ff949b9684afe458df9e33bd5; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_rule_group_7f68600ff949b9684afe458df9e33bd5 ON public.ir_rule_group USING hash (model);


--
-- Name: idx_ir_rule_group_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_rule_group_d884bc69b0c18974fe282eea226f070d ON public.ir_rule_group USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_sequence_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_sequence_d884bc69b0c18974fe282eea226f070d ON public.ir_sequence USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_sequence_strict_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_sequence_strict_d884bc69b0c18974fe282eea226f070d ON public.ir_sequence_strict USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_sequence_type-res_group_378958288fb22e1c369289310230a07a; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_ir_sequence_type-res_group_378958288fb22e1c369289310230a07a" ON public."ir_sequence_type-res_group" USING btree ("group");


--
-- Name: idx_ir_sequence_type-res_group_c5b575c945cb888fca85f38690d215dc; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_ir_sequence_type-res_group_c5b575c945cb888fca85f38690d215dc" ON public."ir_sequence_type-res_group" USING btree (sequence_type);


--
-- Name: idx_ir_sequence_type_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_sequence_type_d884bc69b0c18974fe282eea226f070d ON public.ir_sequence_type USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_session_247e526a8246a90d68d280cc611545c9; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_session_247e526a8246a90d68d280cc611545c9 ON public.ir_session USING btree (key, create_uid);


--
-- Name: idx_ir_session_54cc978ef84e98830833f7809d650dcf; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_session_54cc978ef84e98830833f7809d650dcf ON public.ir_session USING btree (key, write_date);


--
-- Name: idx_ir_session_a8d224f4f736135a784f3542f2908b7c; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_session_a8d224f4f736135a784f3542f2908b7c ON public.ir_session USING btree (key varchar_pattern_ops);


--
-- Name: idx_ir_session_dcaa912348cff6e9e72b1a3f94807f36; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_session_dcaa912348cff6e9e72b1a3f94807f36 ON public.ir_session USING btree (key, create_date);


--
-- Name: idx_ir_translation_17959a6671e3a3c93dfdf2fc3640d645; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_translation_17959a6671e3a3c93dfdf2fc3640d645 ON public.ir_translation USING btree (value varchar_pattern_ops);


--
-- Name: idx_ir_translation_1cc5e61cbdd0a93e472113ec94c550f8; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_translation_1cc5e61cbdd0a93e472113ec94c550f8 ON public.ir_translation USING btree (type, name);


--
-- Name: idx_ir_translation_568bba27202a433e89d8342072032e49; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_translation_568bba27202a433e89d8342072032e49 ON public.ir_translation USING btree (type, name, lang, res_id, fuzzy, value varchar_pattern_ops);


--
-- Name: idx_ir_translation_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_translation_d884bc69b0c18974fe282eea226f070d ON public.ir_translation USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_translation_ea012a27ce068b95c9870200bf2efeaf; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_translation_ea012a27ce068b95c9870200bf2efeaf ON public.ir_translation USING btree (src varchar_pattern_ops);


--
-- Name: idx_ir_translation_f2a4fcb9b6c0b66206ab35733fcdb6e4; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_translation_f2a4fcb9b6c0b66206ab35733fcdb6e4 ON public.ir_translation USING btree (res_id, name, lang, type);


--
-- Name: idx_ir_trigger_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_trigger_d884bc69b0c18974fe282eea226f070d ON public.ir_trigger USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_trigger_log_b9043ededb2474e2213ae2f0398bb5ae; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_trigger_log_b9043ededb2474e2213ae2f0398bb5ae ON public.ir_trigger_log USING btree (trigger, record_id);


--
-- Name: idx_ir_ui_icon_6c19ea0bd65983713b156b49cf9c2cc9; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_ui_icon_6c19ea0bd65983713b156b49cf9c2cc9 ON public.ir_ui_icon USING btree (sequence NULLS FIRST, id NULLS FIRST);


--
-- Name: idx_ir_ui_icon_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_ui_icon_d884bc69b0c18974fe282eea226f070d ON public.ir_ui_icon USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_ui_menu-res_group_378958288fb22e1c369289310230a07a; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_ir_ui_menu-res_group_378958288fb22e1c369289310230a07a" ON public."ir_ui_menu-res_group" USING btree ("group");


--
-- Name: idx_ir_ui_menu-res_group_c2bd4fd9910532be322f341c5192b0f1; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_ir_ui_menu-res_group_c2bd4fd9910532be322f341c5192b0f1" ON public."ir_ui_menu-res_group" USING btree (menu);


--
-- Name: idx_ir_ui_menu_0ae03d1b7c72f8659c054520bebbef07; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_ui_menu_0ae03d1b7c72f8659c054520bebbef07 ON public.ir_ui_menu USING btree (sequence, id);


--
-- Name: idx_ir_ui_menu_6acf76edbc377218609e58df40d82127; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_ui_menu_6acf76edbc377218609e58df40d82127 ON public.ir_ui_menu USING btree (parent);


--
-- Name: idx_ir_ui_menu_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_ui_menu_d884bc69b0c18974fe282eea226f070d ON public.ir_ui_menu USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_ui_menu_favorite_6c19ea0bd65983713b156b49cf9c2cc9; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_ui_menu_favorite_6c19ea0bd65983713b156b49cf9c2cc9 ON public.ir_ui_menu_favorite USING btree (sequence NULLS FIRST, id NULLS FIRST);


--
-- Name: idx_ir_ui_view_047376b12a12744182fea9bc458974d2; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_ui_view_047376b12a12744182fea9bc458974d2 ON public.ir_ui_view USING btree (model varchar_pattern_ops);


--
-- Name: idx_ir_ui_view_1b15904986e79839d7f13bc79e1a4024; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_ui_view_1b15904986e79839d7f13bc79e1a4024 ON public.ir_ui_view USING btree (id, inherit);


--
-- Name: idx_ir_ui_view_9ecdcf8fa5cd3d1f7be30262af71adc4; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_ui_view_9ecdcf8fa5cd3d1f7be30262af71adc4 ON public.ir_ui_view USING btree (model, inherit);


--
-- Name: idx_ir_ui_view_search_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_ui_view_search_d884bc69b0c18974fe282eea226f070d ON public.ir_ui_view_search USING btree (name varchar_pattern_ops);


--
-- Name: idx_ir_ui_view_tree_optional_c5a47eae5cb8ebd415430b4756c0cd31; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_ui_view_tree_optional_c5a47eae5cb8ebd415430b4756c0cd31 ON public.ir_ui_view_tree_optional USING btree ("user", view_id);


--
-- Name: idx_ir_ui_view_tree_state_047376b12a12744182fea9bc458974d2; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_ui_view_tree_state_047376b12a12744182fea9bc458974d2 ON public.ir_ui_view_tree_state USING btree (model varchar_pattern_ops);


--
-- Name: idx_ir_ui_view_tree_state_c16c6e7836f7535e6d4185d88d0cb414; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_ui_view_tree_state_c16c6e7836f7535e6d4185d88d0cb414 ON public.ir_ui_view_tree_state USING btree ("user", model, child_name, domain);


--
-- Name: idx_ir_ui_view_tree_width_047376b12a12744182fea9bc458974d2; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_ui_view_tree_width_047376b12a12744182fea9bc458974d2 ON public.ir_ui_view_tree_width USING btree (model varchar_pattern_ops);


--
-- Name: idx_ir_ui_view_tree_width_d221d98ddcad8d7ed502138109c4998c; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_ir_ui_view_tree_width_d221d98ddcad8d7ed502138109c4998c ON public.ir_ui_view_tree_width USING btree ("user", model, field);


--
-- Name: idx_res_group_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_res_group_d884bc69b0c18974fe282eea226f070d ON public.res_group USING btree (name varchar_pattern_ops);


--
-- Name: idx_res_user-ir_action_3a3ad7b3fa511ca5dabc4f43d9d57489; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_res_user-ir_action_3a3ad7b3fa511ca5dabc4f43d9d57489" ON public."res_user-ir_action" USING btree ("user");


--
-- Name: idx_res_user-ir_action_b3e46abd464f2ac1955ceeb0f47ea6cf; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_res_user-ir_action_b3e46abd464f2ac1955ceeb0f47ea6cf" ON public."res_user-ir_action" USING btree (action);


--
-- Name: idx_res_user-res_group_378958288fb22e1c369289310230a07a; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_res_user-res_group_378958288fb22e1c369289310230a07a" ON public."res_user-res_group" USING btree ("group");


--
-- Name: idx_res_user-res_group_3a3ad7b3fa511ca5dabc4f43d9d57489; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX "idx_res_user-res_group_3a3ad7b3fa511ca5dabc4f43d9d57489" ON public."res_user-res_group" USING btree ("user");


--
-- Name: idx_res_user_application_2fa250eededfb203c0a94742ea621f2b; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_res_user_application_2fa250eededfb203c0a94742ea621f2b ON public.res_user_application USING btree (key, application, state);


--
-- Name: idx_res_user_application_3f27e31cd085754da2333c49110b262e; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_res_user_application_3f27e31cd085754da2333c49110b262e ON public.res_user_application USING hash (key);


--
-- Name: idx_res_user_application_7d85bec6dae4caa02a3a6428f0edd16a; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_res_user_application_7d85bec6dae4caa02a3a6428f0edd16a ON public.res_user_application USING btree ("user") WHERE ("user" IS NOT NULL);


--
-- Name: idx_res_user_application_a8d224f4f736135a784f3542f2908b7c; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_res_user_application_a8d224f4f736135a784f3542f2908b7c ON public.res_user_application USING btree (key varchar_pattern_ops);


--
-- Name: idx_res_user_application_ad0b70b4fd13362db475d5968d7dcb31; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_res_user_application_ad0b70b4fd13362db475d5968d7dcb31 ON public.res_user_application USING btree ("user", state);


--
-- Name: idx_res_user_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_res_user_d884bc69b0c18974fe282eea226f070d ON public.res_user USING btree (name varchar_pattern_ops);


--
-- Name: idx_res_user_warning_3a3ad7b3fa511ca5dabc4f43d9d57489; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_res_user_warning_3a3ad7b3fa511ca5dabc4f43d9d57489 ON public.res_user_warning USING btree ("user");


--
-- Name: idx_res_user_warning_d884bc69b0c18974fe282eea226f070d; Type: INDEX; Schema: public; Owner: tryton
--

CREATE INDEX idx_res_user_warning_d884bc69b0c18974fe282eea226f070d ON public.res_user_warning USING btree (name varchar_pattern_ops);


--
-- Name: ir_action-res_group ir_action-res_group_action_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_action-res_group"
    ADD CONSTRAINT "ir_action-res_group_action_fkey" FOREIGN KEY (action) REFERENCES public.ir_action(id) ON DELETE CASCADE;


--
-- Name: ir_action-res_group ir_action-res_group_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_action-res_group"
    ADD CONSTRAINT "ir_action-res_group_group_fkey" FOREIGN KEY ("group") REFERENCES public.res_group(id) ON DELETE CASCADE;


--
-- Name: ir_action_act_window ir_action_act_window_action_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action_act_window
    ADD CONSTRAINT ir_action_act_window_action_fkey FOREIGN KEY (action) REFERENCES public.ir_action(id) ON DELETE CASCADE;


--
-- Name: ir_action_act_window_domain ir_action_act_window_domain_act_window_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action_act_window_domain
    ADD CONSTRAINT ir_action_act_window_domain_act_window_fkey FOREIGN KEY (act_window) REFERENCES public.ir_action_act_window(id) ON DELETE CASCADE;


--
-- Name: ir_action_act_window_view ir_action_act_window_view_act_window_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action_act_window_view
    ADD CONSTRAINT ir_action_act_window_view_act_window_fkey FOREIGN KEY (act_window) REFERENCES public.ir_action_act_window(id) ON DELETE CASCADE;


--
-- Name: ir_action_act_window_view ir_action_act_window_view_view_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action_act_window_view
    ADD CONSTRAINT ir_action_act_window_view_view_fkey FOREIGN KEY (view) REFERENCES public.ir_ui_view(id) ON DELETE CASCADE;


--
-- Name: ir_action ir_action_icon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action
    ADD CONSTRAINT ir_action_icon_fkey FOREIGN KEY (icon) REFERENCES public.ir_ui_icon(id) ON DELETE SET NULL;


--
-- Name: ir_action_keyword ir_action_keyword_action_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action_keyword
    ADD CONSTRAINT ir_action_keyword_action_fkey FOREIGN KEY (action) REFERENCES public.ir_action(id) ON DELETE CASCADE;


--
-- Name: ir_action_report ir_action_report_action_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action_report
    ADD CONSTRAINT ir_action_report_action_fkey FOREIGN KEY (action) REFERENCES public.ir_action(id) ON DELETE CASCADE;


--
-- Name: ir_action_url ir_action_url_action_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action_url
    ADD CONSTRAINT ir_action_url_action_fkey FOREIGN KEY (action) REFERENCES public.ir_action(id) ON DELETE CASCADE;


--
-- Name: ir_action_wizard ir_action_wizard_action_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_action_wizard
    ADD CONSTRAINT ir_action_wizard_action_fkey FOREIGN KEY (action) REFERENCES public.ir_action(id) ON DELETE CASCADE;


--
-- Name: ir_avatar_cache ir_avatar_cache_avatar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_avatar_cache
    ADD CONSTRAINT ir_avatar_cache_avatar_fkey FOREIGN KEY (avatar) REFERENCES public.ir_avatar(id) ON DELETE CASCADE;


--
-- Name: ir_cron ir_cron_weekday_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_cron
    ADD CONSTRAINT ir_cron_weekday_fkey FOREIGN KEY (weekday) REFERENCES public.ir_calendar_day(id) ON DELETE SET NULL;


--
-- Name: ir_email_address ir_email_address_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_email_address
    ADD CONSTRAINT ir_email_address_email_fkey FOREIGN KEY (email) REFERENCES public.ir_email(id) ON DELETE CASCADE;


--
-- Name: ir_email_template-ir_action_report ir_email_template-ir_action_report_report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_email_template-ir_action_report"
    ADD CONSTRAINT "ir_email_template-ir_action_report_report_fkey" FOREIGN KEY (report) REFERENCES public.ir_action_report(id) ON DELETE CASCADE;


--
-- Name: ir_email_template-ir_action_report ir_email_template-ir_action_report_template_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_email_template-ir_action_report"
    ADD CONSTRAINT "ir_email_template-ir_action_report_template_fkey" FOREIGN KEY (template) REFERENCES public.ir_email_template(id) ON DELETE CASCADE;


--
-- Name: ir_email_template ir_email_template_model_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_email_template
    ADD CONSTRAINT ir_email_template_model_fkey FOREIGN KEY (model) REFERENCES public.ir_model(id) ON DELETE RESTRICT;


--
-- Name: ir_email_template ir_email_template_recipients_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_email_template
    ADD CONSTRAINT ir_email_template_recipients_fkey FOREIGN KEY (recipients) REFERENCES public.ir_model_field(id) ON DELETE SET NULL;


--
-- Name: ir_email_template ir_email_template_recipients_hidden_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_email_template
    ADD CONSTRAINT ir_email_template_recipients_hidden_fkey FOREIGN KEY (recipients_hidden) REFERENCES public.ir_model_field(id) ON DELETE SET NULL;


--
-- Name: ir_email_template ir_email_template_recipients_secondary_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_email_template
    ADD CONSTRAINT ir_email_template_recipients_secondary_fkey FOREIGN KEY (recipients_secondary) REFERENCES public.ir_model_field(id) ON DELETE SET NULL;


--
-- Name: ir_error ir_error_processed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_error
    ADD CONSTRAINT ir_error_processed_by_fkey FOREIGN KEY (processed_by) REFERENCES public.res_user(id) ON DELETE SET NULL;


--
-- Name: ir_error ir_error_solved_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_error
    ADD CONSTRAINT ir_error_solved_by_fkey FOREIGN KEY (solved_by) REFERENCES public.res_user(id) ON DELETE SET NULL;


--
-- Name: ir_export-res_group ir_export-res_group_export_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_export-res_group"
    ADD CONSTRAINT "ir_export-res_group_export_fkey" FOREIGN KEY (export) REFERENCES public.ir_export(id) ON DELETE CASCADE;


--
-- Name: ir_export-res_group ir_export-res_group_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_export-res_group"
    ADD CONSTRAINT "ir_export-res_group_group_fkey" FOREIGN KEY ("group") REFERENCES public.res_group(id) ON DELETE CASCADE;


--
-- Name: ir_export-write-res_group ir_export-write-res_group_export_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_export-write-res_group"
    ADD CONSTRAINT "ir_export-write-res_group_export_fkey" FOREIGN KEY (export) REFERENCES public.ir_export(id) ON DELETE CASCADE;


--
-- Name: ir_export-write-res_group ir_export-write-res_group_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_export-write-res_group"
    ADD CONSTRAINT "ir_export-write-res_group_group_fkey" FOREIGN KEY ("group") REFERENCES public.res_group(id) ON DELETE CASCADE;


--
-- Name: ir_export_line ir_export_line_export_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_export_line
    ADD CONSTRAINT ir_export_line_export_fkey FOREIGN KEY (export) REFERENCES public.ir_export(id) ON DELETE CASCADE;


--
-- Name: ir_model_access ir_model_access_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_access
    ADD CONSTRAINT ir_model_access_group_fkey FOREIGN KEY ("group") REFERENCES public.res_group(id) ON DELETE CASCADE;


--
-- Name: ir_model_access ir_model_access_model_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_access
    ADD CONSTRAINT ir_model_access_model_fkey FOREIGN KEY (model) REFERENCES public.ir_model(id) ON DELETE CASCADE;


--
-- Name: ir_model_button-button_reset ir_model_button-button_reset_button_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_model_button-button_reset"
    ADD CONSTRAINT "ir_model_button-button_reset_button_fkey" FOREIGN KEY (button) REFERENCES public.ir_model_button(id) ON DELETE CASCADE;


--
-- Name: ir_model_button-button_reset ir_model_button-button_reset_button_ruled_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_model_button-button_reset"
    ADD CONSTRAINT "ir_model_button-button_reset_button_ruled_fkey" FOREIGN KEY (button_ruled) REFERENCES public.ir_model_button(id) ON DELETE CASCADE;


--
-- Name: ir_model_button-res_group ir_model_button-res_group_button_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_model_button-res_group"
    ADD CONSTRAINT "ir_model_button-res_group_button_fkey" FOREIGN KEY (button) REFERENCES public.ir_model_button(id) ON DELETE CASCADE;


--
-- Name: ir_model_button-res_group ir_model_button-res_group_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_model_button-res_group"
    ADD CONSTRAINT "ir_model_button-res_group_group_fkey" FOREIGN KEY ("group") REFERENCES public.res_group(id) ON DELETE CASCADE;


--
-- Name: ir_model_button_click ir_model_button_click_button_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_button_click
    ADD CONSTRAINT ir_model_button_click_button_fkey FOREIGN KEY (button) REFERENCES public.ir_model_button(id) ON DELETE CASCADE;


--
-- Name: ir_model_button_click ir_model_button_click_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_button_click
    ADD CONSTRAINT ir_model_button_click_user_fkey FOREIGN KEY ("user") REFERENCES public.res_user(id) ON DELETE CASCADE;


--
-- Name: ir_model_button ir_model_button_model_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_button
    ADD CONSTRAINT ir_model_button_model_fkey FOREIGN KEY (model) REFERENCES public.ir_model(id) ON DELETE CASCADE;


--
-- Name: ir_model_button_rule ir_model_button_rule_button_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_button_rule
    ADD CONSTRAINT ir_model_button_rule_button_fkey FOREIGN KEY (button) REFERENCES public.ir_model_button(id) ON DELETE CASCADE;


--
-- Name: ir_model_button_rule ir_model_button_rule_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_button_rule
    ADD CONSTRAINT ir_model_button_rule_group_fkey FOREIGN KEY ("group") REFERENCES public.res_group(id) ON DELETE CASCADE;


--
-- Name: ir_model_field_access ir_model_field_access_field_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_field_access
    ADD CONSTRAINT ir_model_field_access_field_fkey FOREIGN KEY (field) REFERENCES public.ir_model_field(id) ON DELETE CASCADE;


--
-- Name: ir_model_field_access ir_model_field_access_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_field_access
    ADD CONSTRAINT ir_model_field_access_group_fkey FOREIGN KEY ("group") REFERENCES public.res_group(id) ON DELETE CASCADE;


--
-- Name: ir_model_field ir_model_field_model_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_model_field
    ADD CONSTRAINT ir_model_field_model_fkey FOREIGN KEY (model) REFERENCES public.ir_model(id) ON DELETE CASCADE;


--
-- Name: ir_module_config_wizard_item ir_module_config_wizard_item_action_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_module_config_wizard_item
    ADD CONSTRAINT ir_module_config_wizard_item_action_fkey FOREIGN KEY (action) REFERENCES public.ir_action(id) ON DELETE RESTRICT;


--
-- Name: ir_module_dependency ir_module_dependency_module_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_module_dependency
    ADD CONSTRAINT ir_module_dependency_module_fkey FOREIGN KEY (module) REFERENCES public.ir_module(id) ON DELETE CASCADE;


--
-- Name: ir_note_read ir_note_read_note_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_note_read
    ADD CONSTRAINT ir_note_read_note_fkey FOREIGN KEY (note) REFERENCES public.ir_note(id) ON DELETE CASCADE;


--
-- Name: ir_note_read ir_note_read_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_note_read
    ADD CONSTRAINT ir_note_read_user_fkey FOREIGN KEY ("user") REFERENCES public.res_user(id) ON DELETE CASCADE;


--
-- Name: ir_rule_group-res_group ir_rule_group-res_group_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_rule_group-res_group"
    ADD CONSTRAINT "ir_rule_group-res_group_group_fkey" FOREIGN KEY ("group") REFERENCES public.res_group(id) ON DELETE CASCADE;


--
-- Name: ir_rule_group-res_group ir_rule_group-res_group_rule_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_rule_group-res_group"
    ADD CONSTRAINT "ir_rule_group-res_group_rule_group_fkey" FOREIGN KEY (rule_group) REFERENCES public.ir_rule_group(id) ON DELETE CASCADE;


--
-- Name: ir_rule_group ir_rule_group_model_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_rule_group
    ADD CONSTRAINT ir_rule_group_model_fkey FOREIGN KEY (model) REFERENCES public.ir_model(id) ON DELETE CASCADE;


--
-- Name: ir_rule ir_rule_rule_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_rule
    ADD CONSTRAINT ir_rule_rule_group_fkey FOREIGN KEY (rule_group) REFERENCES public.ir_rule_group(id) ON DELETE CASCADE;


--
-- Name: ir_sequence ir_sequence_sequence_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_sequence
    ADD CONSTRAINT ir_sequence_sequence_type_fkey FOREIGN KEY (sequence_type) REFERENCES public.ir_sequence_type(id) ON DELETE RESTRICT;


--
-- Name: ir_sequence_strict ir_sequence_strict_sequence_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_sequence_strict
    ADD CONSTRAINT ir_sequence_strict_sequence_type_fkey FOREIGN KEY (sequence_type) REFERENCES public.ir_sequence_type(id) ON DELETE RESTRICT;


--
-- Name: ir_sequence_type-res_group ir_sequence_type-res_group_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_sequence_type-res_group"
    ADD CONSTRAINT "ir_sequence_type-res_group_group_fkey" FOREIGN KEY ("group") REFERENCES public.res_group(id) ON DELETE CASCADE;


--
-- Name: ir_sequence_type-res_group ir_sequence_type-res_group_sequence_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_sequence_type-res_group"
    ADD CONSTRAINT "ir_sequence_type-res_group_sequence_type_fkey" FOREIGN KEY (sequence_type) REFERENCES public.ir_sequence_type(id) ON DELETE CASCADE;


--
-- Name: ir_trigger_log ir_trigger_log_trigger_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_trigger_log
    ADD CONSTRAINT ir_trigger_log_trigger_fkey FOREIGN KEY (trigger) REFERENCES public.ir_trigger(id) ON DELETE CASCADE;


--
-- Name: ir_trigger ir_trigger_model_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_trigger
    ADD CONSTRAINT ir_trigger_model_fkey FOREIGN KEY (model) REFERENCES public.ir_model(id) ON DELETE RESTRICT;


--
-- Name: ir_ui_menu-res_group ir_ui_menu-res_group_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_ui_menu-res_group"
    ADD CONSTRAINT "ir_ui_menu-res_group_group_fkey" FOREIGN KEY ("group") REFERENCES public.res_group(id) ON DELETE CASCADE;


--
-- Name: ir_ui_menu-res_group ir_ui_menu-res_group_menu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."ir_ui_menu-res_group"
    ADD CONSTRAINT "ir_ui_menu-res_group_menu_fkey" FOREIGN KEY (menu) REFERENCES public.ir_ui_menu(id) ON DELETE CASCADE;


--
-- Name: ir_ui_menu_favorite ir_ui_menu_favorite_menu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_menu_favorite
    ADD CONSTRAINT ir_ui_menu_favorite_menu_fkey FOREIGN KEY (menu) REFERENCES public.ir_ui_menu(id) ON DELETE CASCADE;


--
-- Name: ir_ui_menu_favorite ir_ui_menu_favorite_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_menu_favorite
    ADD CONSTRAINT ir_ui_menu_favorite_user_fkey FOREIGN KEY ("user") REFERENCES public.res_user(id) ON DELETE CASCADE;


--
-- Name: ir_ui_menu ir_ui_menu_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_menu
    ADD CONSTRAINT ir_ui_menu_parent_fkey FOREIGN KEY (parent) REFERENCES public.ir_ui_menu(id) ON DELETE CASCADE;


--
-- Name: ir_ui_view ir_ui_view_inherit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_view
    ADD CONSTRAINT ir_ui_view_inherit_fkey FOREIGN KEY (inherit) REFERENCES public.ir_ui_view(id) ON DELETE CASCADE;


--
-- Name: ir_ui_view_search ir_ui_view_search_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_view_search
    ADD CONSTRAINT ir_ui_view_search_user_fkey FOREIGN KEY ("user") REFERENCES public.res_user(id) ON DELETE CASCADE;


--
-- Name: ir_ui_view_tree_optional ir_ui_view_tree_optional_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_view_tree_optional
    ADD CONSTRAINT ir_ui_view_tree_optional_user_fkey FOREIGN KEY ("user") REFERENCES public.res_user(id) ON DELETE CASCADE;


--
-- Name: ir_ui_view_tree_optional ir_ui_view_tree_optional_view_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_view_tree_optional
    ADD CONSTRAINT ir_ui_view_tree_optional_view_id_fkey FOREIGN KEY (view_id) REFERENCES public.ir_ui_view(id) ON DELETE CASCADE;


--
-- Name: ir_ui_view_tree_state ir_ui_view_tree_state_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_view_tree_state
    ADD CONSTRAINT ir_ui_view_tree_state_user_fkey FOREIGN KEY ("user") REFERENCES public.res_user(id) ON DELETE CASCADE;


--
-- Name: ir_ui_view_tree_width ir_ui_view_tree_width_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.ir_ui_view_tree_width
    ADD CONSTRAINT ir_ui_view_tree_width_user_fkey FOREIGN KEY ("user") REFERENCES public.res_user(id) ON DELETE CASCADE;


--
-- Name: res_group res_group_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.res_group
    ADD CONSTRAINT res_group_parent_fkey FOREIGN KEY (parent) REFERENCES public.res_group(id) ON DELETE SET NULL;


--
-- Name: res_user-ir_action res_user-ir_action_action_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."res_user-ir_action"
    ADD CONSTRAINT "res_user-ir_action_action_fkey" FOREIGN KEY (action) REFERENCES public.ir_action(id) ON DELETE CASCADE;


--
-- Name: res_user-ir_action res_user-ir_action_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."res_user-ir_action"
    ADD CONSTRAINT "res_user-ir_action_user_fkey" FOREIGN KEY ("user") REFERENCES public.res_user(id) ON DELETE CASCADE;


--
-- Name: res_user-res_group res_user-res_group_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."res_user-res_group"
    ADD CONSTRAINT "res_user-res_group_group_fkey" FOREIGN KEY ("group") REFERENCES public.res_group(id) ON DELETE CASCADE;


--
-- Name: res_user-res_group res_user-res_group_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public."res_user-res_group"
    ADD CONSTRAINT "res_user-res_group_user_fkey" FOREIGN KEY ("user") REFERENCES public.res_user(id) ON DELETE CASCADE;


--
-- Name: res_user_application res_user_application_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.res_user_application
    ADD CONSTRAINT res_user_application_user_fkey FOREIGN KEY ("user") REFERENCES public.res_user(id) ON DELETE SET NULL;


--
-- Name: res_user res_user_language_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.res_user
    ADD CONSTRAINT res_user_language_fkey FOREIGN KEY (language) REFERENCES public.ir_lang(id) ON DELETE SET NULL;


--
-- Name: res_user res_user_menu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.res_user
    ADD CONSTRAINT res_user_menu_fkey FOREIGN KEY (menu) REFERENCES public.ir_action(id) ON DELETE RESTRICT;


--
-- Name: res_user_warning res_user_warning_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tryton
--

ALTER TABLE ONLY public.res_user_warning
    ADD CONSTRAINT res_user_warning_user_fkey FOREIGN KEY ("user") REFERENCES public.res_user(id) ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

