--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: a1; Type: SCHEMA; Schema: -; Owner: ama
--

CREATE SCHEMA a1;


ALTER SCHEMA a1 OWNER TO ama;

--
-- Name: a2; Type: SCHEMA; Schema: -; Owner: ama
--

CREATE SCHEMA a2;


ALTER SCHEMA a2 OWNER TO ama;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = a1, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO ama;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO ama;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO ama;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO ama;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO ama;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO ama;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO ama;

--
-- Name: auth_user_groups; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO ama;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO ama;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO ama;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO ama;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO ama;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: crm_customer; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE crm_customer (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL,
    phone_number character varying(20) NOT NULL,
    mobile_number character varying(20) NOT NULL,
    avatar character varying(100) NOT NULL,
    company character varying(50) NOT NULL,
    "position" character varying(50) NOT NULL,
    email_address character varying(80) NOT NULL,
    brith_data date,
    status character varying(1) NOT NULL,
    comment text NOT NULL,
    sales_person_id integer NOT NULL
);


ALTER TABLE crm_customer OWNER TO ama;

--
-- Name: crm_customer_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE crm_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_customer_id_seq OWNER TO ama;

--
-- Name: crm_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE crm_customer_id_seq OWNED BY crm_customer.id;


--
-- Name: crm_deal; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE crm_deal (
    id integer NOT NULL,
    price numeric(12,2) NOT NULL,
    ident integer NOT NULL,
    description text NOT NULL,
    customer_id integer,
    sales_person_id integer NOT NULL,
    CONSTRAINT crm_deal_ident_check CHECK ((ident >= 0))
);


ALTER TABLE crm_deal OWNER TO ama;

--
-- Name: crm_deal_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE crm_deal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_deal_id_seq OWNER TO ama;

--
-- Name: crm_deal_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE crm_deal_id_seq OWNED BY crm_deal.id;


--
-- Name: crm_dealproducts; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE crm_dealproducts (
    id integer NOT NULL,
    qty integer,
    item_price integer,
    total_price integer,
    deal_id integer,
    product_id integer,
    CONSTRAINT crm_dealproducts_item_price_check CHECK ((item_price >= 0)),
    CONSTRAINT crm_dealproducts_qty_check CHECK ((qty >= 0)),
    CONSTRAINT crm_dealproducts_total_price_check CHECK ((total_price >= 0))
);


ALTER TABLE crm_dealproducts OWNER TO ama;

--
-- Name: crm_dealproducts_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE crm_dealproducts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_dealproducts_id_seq OWNER TO ama;

--
-- Name: crm_dealproducts_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE crm_dealproducts_id_seq OWNED BY crm_dealproducts.id;


--
-- Name: crm_dealstatus; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE crm_dealstatus (
    id integer NOT NULL,
    status character varying(1) NOT NULL,
    deal_data date NOT NULL,
    deal_time time without time zone NOT NULL,
    remark character varying(100) NOT NULL,
    deal_id integer
);


ALTER TABLE crm_dealstatus OWNER TO ama;

--
-- Name: crm_dealstatus_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE crm_dealstatus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_dealstatus_id_seq OWNER TO ama;

--
-- Name: crm_dealstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE crm_dealstatus_id_seq OWNED BY crm_dealstatus.id;


--
-- Name: crm_product; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE crm_product (
    id integer NOT NULL,
    sku integer NOT NULL,
    description text NOT NULL,
    price integer NOT NULL,
    CONSTRAINT crm_product_price_check CHECK ((price >= 0))
);


ALTER TABLE crm_product OWNER TO ama;

--
-- Name: crm_product_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE crm_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_product_id_seq OWNER TO ama;

--
-- Name: crm_product_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE crm_product_id_seq OWNED BY crm_product.id;


--
-- Name: crm_salesperson; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE crm_salesperson (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL,
    phone_number character varying(20) NOT NULL,
    mobile_number character varying(20) NOT NULL,
    avatar character varying(100) NOT NULL,
    division character varying(50) NOT NULL,
    role character varying(1) NOT NULL,
    user_id integer NOT NULL,
    lang character varying(2) NOT NULL
);


ALTER TABLE crm_salesperson OWNER TO ama;

--
-- Name: crm_salesperson_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE crm_salesperson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_salesperson_id_seq OWNER TO ama;

--
-- Name: crm_salesperson_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE crm_salesperson_id_seq OWNED BY crm_salesperson.id;


--
-- Name: crm_todo; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE crm_todo (
    id integer NOT NULL,
    action character varying(1) NOT NULL,
    action_description text NOT NULL,
    todo_data date NOT NULL,
    todo_time time without time zone NOT NULL,
    sales_person_id integer NOT NULL
);


ALTER TABLE crm_todo OWNER TO ama;

--
-- Name: crm_todo_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE crm_todo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_todo_id_seq OWNER TO ama;

--
-- Name: crm_todo_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE crm_todo_id_seq OWNED BY crm_todo.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO ama;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO ama;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO ama;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO ama;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO ama;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO ama;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO ama;

--
-- Name: django_site; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE django_site OWNER TO ama;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_site_id_seq OWNER TO ama;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: guardian_groupobjectpermission; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE guardian_groupobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE guardian_groupobjectpermission OWNER TO ama;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE guardian_groupobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE guardian_groupobjectpermission_id_seq OWNER TO ama;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE guardian_groupobjectpermission_id_seq OWNED BY guardian_groupobjectpermission.id;


--
-- Name: guardian_userobjectpermission; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE guardian_userobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    permission_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE guardian_userobjectpermission OWNER TO ama;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE guardian_userobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE guardian_userobjectpermission_id_seq OWNER TO ama;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE guardian_userobjectpermission_id_seq OWNED BY guardian_userobjectpermission.id;


--
-- Name: registration_registrationprofile; Type: TABLE; Schema: a1; Owner: ama
--

CREATE TABLE registration_registrationprofile (
    id integer NOT NULL,
    activation_key character varying(40) NOT NULL,
    user_id integer NOT NULL,
    activated boolean NOT NULL
);


ALTER TABLE registration_registrationprofile OWNER TO ama;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE; Schema: a1; Owner: ama
--

CREATE SEQUENCE registration_registrationprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registration_registrationprofile_id_seq OWNER TO ama;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: a1; Owner: ama
--

ALTER SEQUENCE registration_registrationprofile_id_seq OWNED BY registration_registrationprofile.id;


SET search_path = a2, pg_catalog;

--
-- Name: auth_group; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO ama;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO ama;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO ama;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO ama;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO ama;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO ama;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO ama;

--
-- Name: auth_user_groups; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO ama;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO ama;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO ama;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO ama;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO ama;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: crm_customer; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE crm_customer (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL,
    phone_number character varying(20) NOT NULL,
    mobile_number character varying(20) NOT NULL,
    avatar character varying(100) NOT NULL,
    company character varying(50) NOT NULL,
    "position" character varying(50) NOT NULL,
    email_address character varying(80) NOT NULL,
    brith_data date,
    status character varying(1) NOT NULL,
    comment text NOT NULL,
    sales_person_id integer NOT NULL
);


ALTER TABLE crm_customer OWNER TO ama;

--
-- Name: crm_customer_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE crm_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_customer_id_seq OWNER TO ama;

--
-- Name: crm_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE crm_customer_id_seq OWNED BY crm_customer.id;


--
-- Name: crm_deal; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE crm_deal (
    id integer NOT NULL,
    price numeric(12,2) NOT NULL,
    ident integer NOT NULL,
    description text NOT NULL,
    customer_id integer,
    sales_person_id integer NOT NULL,
    CONSTRAINT crm_deal_ident_check CHECK ((ident >= 0))
);


ALTER TABLE crm_deal OWNER TO ama;

--
-- Name: crm_deal_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE crm_deal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_deal_id_seq OWNER TO ama;

--
-- Name: crm_deal_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE crm_deal_id_seq OWNED BY crm_deal.id;


--
-- Name: crm_dealproducts; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE crm_dealproducts (
    id integer NOT NULL,
    qty integer,
    item_price integer,
    total_price integer,
    deal_id integer,
    product_id integer,
    CONSTRAINT crm_dealproducts_item_price_check CHECK ((item_price >= 0)),
    CONSTRAINT crm_dealproducts_qty_check CHECK ((qty >= 0)),
    CONSTRAINT crm_dealproducts_total_price_check CHECK ((total_price >= 0))
);


ALTER TABLE crm_dealproducts OWNER TO ama;

--
-- Name: crm_dealproducts_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE crm_dealproducts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_dealproducts_id_seq OWNER TO ama;

--
-- Name: crm_dealproducts_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE crm_dealproducts_id_seq OWNED BY crm_dealproducts.id;


--
-- Name: crm_dealstatus; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE crm_dealstatus (
    id integer NOT NULL,
    status character varying(1) NOT NULL,
    deal_data date NOT NULL,
    deal_time time without time zone NOT NULL,
    remark character varying(100) NOT NULL,
    deal_id integer
);


ALTER TABLE crm_dealstatus OWNER TO ama;

--
-- Name: crm_dealstatus_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE crm_dealstatus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_dealstatus_id_seq OWNER TO ama;

--
-- Name: crm_dealstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE crm_dealstatus_id_seq OWNED BY crm_dealstatus.id;


--
-- Name: crm_product; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE crm_product (
    id integer NOT NULL,
    sku integer NOT NULL,
    description text NOT NULL,
    price integer NOT NULL,
    CONSTRAINT crm_product_price_check CHECK ((price >= 0))
);


ALTER TABLE crm_product OWNER TO ama;

--
-- Name: crm_product_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE crm_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_product_id_seq OWNER TO ama;

--
-- Name: crm_product_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE crm_product_id_seq OWNED BY crm_product.id;


--
-- Name: crm_salesperson; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE crm_salesperson (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL,
    phone_number character varying(20) NOT NULL,
    mobile_number character varying(20) NOT NULL,
    avatar character varying(100) NOT NULL,
    division character varying(50) NOT NULL,
    role character varying(1) NOT NULL,
    user_id integer NOT NULL,
    lang character varying(2) NOT NULL
);


ALTER TABLE crm_salesperson OWNER TO ama;

--
-- Name: crm_salesperson_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE crm_salesperson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_salesperson_id_seq OWNER TO ama;

--
-- Name: crm_salesperson_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE crm_salesperson_id_seq OWNED BY crm_salesperson.id;


--
-- Name: crm_todo; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE crm_todo (
    id integer NOT NULL,
    action character varying(1) NOT NULL,
    action_description text NOT NULL,
    todo_data date NOT NULL,
    todo_time time without time zone NOT NULL,
    sales_person_id integer NOT NULL
);


ALTER TABLE crm_todo OWNER TO ama;

--
-- Name: crm_todo_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE crm_todo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_todo_id_seq OWNER TO ama;

--
-- Name: crm_todo_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE crm_todo_id_seq OWNED BY crm_todo.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO ama;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO ama;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO ama;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO ama;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO ama;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO ama;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO ama;

--
-- Name: django_site; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE django_site OWNER TO ama;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_site_id_seq OWNER TO ama;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: guardian_groupobjectpermission; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE guardian_groupobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE guardian_groupobjectpermission OWNER TO ama;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE guardian_groupobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE guardian_groupobjectpermission_id_seq OWNER TO ama;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE guardian_groupobjectpermission_id_seq OWNED BY guardian_groupobjectpermission.id;


--
-- Name: guardian_userobjectpermission; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE guardian_userobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    permission_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE guardian_userobjectpermission OWNER TO ama;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE guardian_userobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE guardian_userobjectpermission_id_seq OWNER TO ama;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE guardian_userobjectpermission_id_seq OWNED BY guardian_userobjectpermission.id;


--
-- Name: registration_registrationprofile; Type: TABLE; Schema: a2; Owner: ama
--

CREATE TABLE registration_registrationprofile (
    id integer NOT NULL,
    activation_key character varying(40) NOT NULL,
    user_id integer NOT NULL,
    activated boolean NOT NULL
);


ALTER TABLE registration_registrationprofile OWNER TO ama;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE; Schema: a2; Owner: ama
--

CREATE SEQUENCE registration_registrationprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registration_registrationprofile_id_seq OWNER TO ama;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: a2; Owner: ama
--

ALTER SEQUENCE registration_registrationprofile_id_seq OWNED BY registration_registrationprofile.id;


SET search_path = public, pg_catalog;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ama
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO ama;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ama
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO ama;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ama
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ama
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO ama;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ama
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO ama;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ama
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ama
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO ama;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ama
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO ama;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ama
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ama
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO ama;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ama
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO ama;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ama
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO ama;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ama
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ama
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO ama;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ama
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ama
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO ama;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ama
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO ama;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ama
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ama
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO ama;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ama
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO ama;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ama
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ama
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO ama;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ama
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO ama;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ama
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ama
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO ama;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ama
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO ama;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ama
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ama
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO ama;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: ama
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE django_site OWNER TO ama;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: ama
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_site_id_seq OWNER TO ama;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ama
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: globalcustomer_client; Type: TABLE; Schema: public; Owner: ama
--

CREATE TABLE globalcustomer_client (
    id integer NOT NULL,
    domain_url character varying(128) NOT NULL,
    schema_name character varying(63) NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    created_on date NOT NULL,
    lang character varying(2) NOT NULL
);


ALTER TABLE globalcustomer_client OWNER TO ama;

--
-- Name: globalcustomer_client_id_seq; Type: SEQUENCE; Schema: public; Owner: ama
--

CREATE SEQUENCE globalcustomer_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE globalcustomer_client_id_seq OWNER TO ama;

--
-- Name: globalcustomer_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ama
--

ALTER SEQUENCE globalcustomer_client_id_seq OWNED BY globalcustomer_client.id;


--
-- Name: guardian_groupobjectpermission; Type: TABLE; Schema: public; Owner: ama
--

CREATE TABLE guardian_groupobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE guardian_groupobjectpermission OWNER TO ama;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: ama
--

CREATE SEQUENCE guardian_groupobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE guardian_groupobjectpermission_id_seq OWNER TO ama;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ama
--

ALTER SEQUENCE guardian_groupobjectpermission_id_seq OWNED BY guardian_groupobjectpermission.id;


--
-- Name: guardian_userobjectpermission; Type: TABLE; Schema: public; Owner: ama
--

CREATE TABLE guardian_userobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    permission_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE guardian_userobjectpermission OWNER TO ama;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: ama
--

CREATE SEQUENCE guardian_userobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE guardian_userobjectpermission_id_seq OWNER TO ama;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ama
--

ALTER SEQUENCE guardian_userobjectpermission_id_seq OWNED BY guardian_userobjectpermission.id;


SET search_path = a1, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_customer ALTER COLUMN id SET DEFAULT nextval('crm_customer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_deal ALTER COLUMN id SET DEFAULT nextval('crm_deal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_dealproducts ALTER COLUMN id SET DEFAULT nextval('crm_dealproducts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_dealstatus ALTER COLUMN id SET DEFAULT nextval('crm_dealstatus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_product ALTER COLUMN id SET DEFAULT nextval('crm_product_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_salesperson ALTER COLUMN id SET DEFAULT nextval('crm_salesperson_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_todo ALTER COLUMN id SET DEFAULT nextval('crm_todo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_groupobjectpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_userobjectpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY registration_registrationprofile ALTER COLUMN id SET DEFAULT nextval('registration_registrationprofile_id_seq'::regclass);


SET search_path = a2, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_customer ALTER COLUMN id SET DEFAULT nextval('crm_customer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_deal ALTER COLUMN id SET DEFAULT nextval('crm_deal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_dealproducts ALTER COLUMN id SET DEFAULT nextval('crm_dealproducts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_dealstatus ALTER COLUMN id SET DEFAULT nextval('crm_dealstatus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_product ALTER COLUMN id SET DEFAULT nextval('crm_product_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_salesperson ALTER COLUMN id SET DEFAULT nextval('crm_salesperson_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_todo ALTER COLUMN id SET DEFAULT nextval('crm_todo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_groupobjectpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_userobjectpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY registration_registrationprofile ALTER COLUMN id SET DEFAULT nextval('registration_registrationprofile_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ama
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ama
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ama
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ama
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ama
--

ALTER TABLE ONLY globalcustomer_client ALTER COLUMN id SET DEFAULT nextval('globalcustomer_client_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_groupobjectpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_userobjectpermission_id_seq'::regclass);


SET search_path = a1, pg_catalog;

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY auth_group (id, name) FROM stdin;
1	admin
2	boss
3	manager
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('auth_group_id_seq', 3, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	48
2	1	49
3	1	4
4	1	5
5	1	6
6	1	7
7	1	47
8	2	7
9	2	8
10	2	9
11	2	10
12	2	11
13	2	12
14	2	13
15	2	14
16	2	15
17	2	16
18	2	17
19	2	18
20	2	19
21	2	20
22	2	21
23	2	22
24	2	23
25	3	7
26	3	8
27	3	9
28	3	10
29	3	11
30	3	12
31	3	13
32	3	14
33	3	15
34	3	19
35	3	20
36	3	21
37	3	22
38	3	23
39	3	16
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 39, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add site	1	add_site
2	Can change site	1	change_site
3	Can delete site	1	delete_site
4	Can add Sales manager	2	add_salesperson
5	Can change Sales manager	2	change_salesperson
6	Can delete Sales manager	2	delete_salesperson
7	View sales manager	2	read_salesperson
8	Can add ToDo list	3	add_todo
9	Can change ToDo list	3	change_todo
10	Can delete ToDo list	3	delete_todo
11	ToDos view	3	read_todo
12	Can add Customer	4	add_customer
13	Can change Customer	4	change_customer
14	Can delete Customer	4	delete_customer
15	User list	4	read_customer
16	Can add Deal	5	add_deal
17	Can change Deal	5	change_deal
18	Can delete Deal	5	delete_deal
19	Contracts view	5	read_deal
20	Can add Product	6	add_product
21	Can change Product	6	change_product
22	Can delete Product	6	delete_product
23	Products view	6	read_product
24	Can add Product in contract	7	add_dealproducts
25	Can change Product in contract	7	change_dealproducts
26	Can delete Product in contract	7	delete_dealproducts
27	View products in contract	7	read_salesperson
28	Can add Contract status	8	add_dealstatus
29	Can change Contract status	8	change_dealstatus
30	Can delete Contract status	8	delete_dealstatus
31	Просмотр статуса контракта	8	read_salesperson
32	Can add registration profile	9	add_registrationprofile
33	Can change registration profile	9	change_registrationprofile
34	Can delete registration profile	9	delete_registrationprofile
35	Can add user object permission	10	add_userobjectpermission
36	Can change user object permission	10	change_userobjectpermission
37	Can delete user object permission	10	delete_userobjectpermission
38	Can add group object permission	11	add_groupobjectpermission
39	Can change group object permission	11	change_groupobjectpermission
40	Can delete group object permission	11	delete_groupobjectpermission
41	Can add permission	12	add_permission
42	Can change permission	12	change_permission
43	Can delete permission	12	delete_permission
44	Can add group	13	add_group
45	Can change group	13	change_group
46	Can delete group	13	delete_group
47	Can add user	14	add_user
48	Can change user	14	change_user
49	Can delete user	14	delete_user
50	Can add log entry	15	add_logentry
51	Can change log entry	15	change_logentry
52	Can delete log entry	15	delete_logentry
53	Can add Company	16	add_client
54	Can change Company	16	change_client
55	Can delete Company	16	delete_client
56	Can add session	17	add_session
57	Can change session	17	change_session
58	Can delete session	17	delete_session
59	Can add content type	18	add_contenttype
60	Can change content type	18	change_contenttype
61	Can delete content type	18	delete_contenttype
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('auth_permission_id_seq', 61, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	!5K1utliluouDBBXbT6eDUDMZKSAkLHLd0a5oV7zN	\N	f	AnonymousUser				f	t	2016-12-05 05:45:08.205398+03
5	pbkdf2_sha256$24000$68xPvrk9vqOe$6C+bXvntvuNPz1qgq/lWShrnIxTkYGlG5FS5K3bkYdw=	\N	f	new_boss				f	t	2016-12-05 06:23:05+03
4	pbkdf2_sha256$24000$QgX1OnZxmExS$9YJ1ZZYPsunQt0PUoqL45n0VwKJ+L0KUyMf41QSUjtU=	\N	f	new_manager				f	t	2016-12-05 06:14:29+03
2	pbkdf2_sha256$24000$qeKvou4qfxYw$ErE9MSDvMI9885VPwEMFkPt2ArimsHU+3lmfmJwww94=	2016-12-15 20:48:39.809936+03	t	admin			alex-abakumov@yandex.ru	t	t	2016-12-05 05:45:53+03
3	pbkdf2_sha256$24000$u58vBnGtZS12$hFQsuDcU2gMLh+7tzwYvbbsbmwQbMt+fZL220ST8WH8=	2016-12-15 20:48:46.28854+03	f	new_admin			new_admin@example.com	f	t	2016-12-05 05:57:24+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
1	4	3
2	3	1
3	5	2
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 3, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('auth_user_id_seq', 5, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: crm_customer; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY crm_customer (id, first_name, second_name, phone_number, mobile_number, avatar, company, "position", email_address, brith_data, status, comment, sales_person_id) FROM stdin;
\.


--
-- Name: crm_customer_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('crm_customer_id_seq', 1, false);


--
-- Data for Name: crm_deal; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY crm_deal (id, price, ident, description, customer_id, sales_person_id) FROM stdin;
\.


--
-- Name: crm_deal_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('crm_deal_id_seq', 1, false);


--
-- Data for Name: crm_dealproducts; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY crm_dealproducts (id, qty, item_price, total_price, deal_id, product_id) FROM stdin;
\.


--
-- Name: crm_dealproducts_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('crm_dealproducts_id_seq', 1, false);


--
-- Data for Name: crm_dealstatus; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY crm_dealstatus (id, status, deal_data, deal_time, remark, deal_id) FROM stdin;
\.


--
-- Name: crm_dealstatus_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('crm_dealstatus_id_seq', 1, false);


--
-- Data for Name: crm_product; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY crm_product (id, sku, description, price) FROM stdin;
\.


--
-- Name: crm_product_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('crm_product_id_seq', 1, false);


--
-- Data for Name: crm_salesperson; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY crm_salesperson (id, first_name, second_name, phone_number, mobile_number, avatar, division, role, user_id, lang) FROM stdin;
1	Djon	Smith	(123) 456 7899	(173) 456 7899		ID dept	A	3	en
2	Ivan	Candid	(123) 456 7899	(123) 456 7899	crm/556b6be8d8cc8693ce58d77196299e90.jpeg	Sales dept	M	4	en
3	Peter	Bastew	123 456 7899	998 765 4322	crm/556b6be8d8cc8693ce58d77196299e90_QsCm0km.jpeg	Top mng	B	5	en
\.


--
-- Name: crm_salesperson_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('crm_salesperson_id_seq', 3, true);


--
-- Data for Name: crm_todo; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY crm_todo (id, action, action_description, todo_data, todo_time, sales_person_id) FROM stdin;
\.


--
-- Name: crm_todo_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('crm_todo_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-12-05 05:47:09.424611+03	1	admin	1	Добавлено.	13	2
2	2016-12-05 05:48:46.893013+03	2	boss	1	Добавлено.	13	2
3	2016-12-05 05:50:47.588643+03	3	manager	1	Добавлено.	13	2
4	2016-12-05 05:57:24.403106+03	3	new_admin	1	Добавлено. Добавлен Sales manager "Djon Smith".	14	2
5	2016-12-05 06:10:43.388267+03	3	new_admin	2	Изменены phone_number, mobile_number и division для Sales manager "Djon Smith".	14	2
6	2016-12-05 06:11:28.778073+03	3	new_admin	2	Изменен email.	14	2
7	2016-12-05 06:14:29.10197+03	4	new_manager	1	Добавлено. Добавлен Sales manager "Ivan Candid".	14	2
8	2016-12-05 06:15:21.505391+03	3	new_admin	2	Изменен password.	14	2
9	2016-12-05 06:15:41.522953+03	4	new_manager	2	Изменен password.	14	2
10	2016-12-05 06:15:59.338376+03	4	new_manager	2	Изменен groups.	14	2
11	2016-12-05 06:16:11.867003+03	3	new_admin	2	Изменен groups.	14	2
12	2016-12-05 06:23:05.364038+03	5	new_boss	1	Добавлено. Добавлен Sales manager "Peter Bastew".	14	2
13	2016-12-05 06:23:33.893907+03	5	new_boss	2	Изменен groups.	14	2
14	2016-12-05 06:24:21.920607+03	4	new_manager	2	Изменены avatar для Sales manager "Ivan Candid".	14	2
15	2016-12-05 06:25:13.313545+03	5	new_boss	2	Изменены avatar для Sales manager "Peter Bastew".	14	2
16	2016-12-08 18:15:54.790354+03	3	manager	2	Изменен permissions.	13	2
17	2016-12-08 18:16:19.590281+03	2	ama	2	Изменен password.	14	2
18	2016-12-08 18:16:48.557499+03	3	new_admin	2	Изменен password.	14	2
19	2016-12-08 18:17:11.973595+03	5	new_boss	2	Изменен password.	14	2
20	2016-12-08 18:17:37.305768+03	4	new_manager	2	Изменен password.	14	2
21	2016-12-13 18:15:11.897085+03	2	admin	2	Изменен username.	14	2
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 21, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	sites	site
2	crm	salesperson
3	crm	todo
4	crm	customer
5	crm	deal
6	crm	product
7	crm	dealproducts
8	crm	dealstatus
9	registration	registrationprofile
10	guardian	userobjectpermission
11	guardian	groupobjectpermission
12	auth	permission
13	auth	group
14	auth	user
15	admin	logentry
16	globalcustomer	client
17	sessions	session
18	contenttypes	contenttype
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('django_content_type_id_seq', 18, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-12-05 05:45:03.643901+03
2	auth	0001_initial	2016-12-05 05:45:04.757974+03
3	admin	0001_initial	2016-12-05 05:45:04.989034+03
4	admin	0002_logentry_remove_auto_add	2016-12-05 05:45:05.011174+03
5	contenttypes	0002_remove_content_type_name	2016-12-05 05:45:05.055675+03
6	auth	0002_alter_permission_name_max_length	2016-12-05 05:45:05.088945+03
7	auth	0003_alter_user_email_max_length	2016-12-05 05:45:05.110974+03
8	auth	0004_alter_user_username_opts	2016-12-05 05:45:05.130488+03
9	auth	0005_alter_user_last_login_null	2016-12-05 05:45:05.155711+03
10	auth	0006_require_contenttypes_0002	2016-12-05 05:45:05.166549+03
11	auth	0007_alter_validators_add_error_messages	2016-12-05 05:45:05.184822+03
12	crm	0001_initial	2016-12-05 05:45:06.535234+03
13	globalcustomer	0001_initial	2016-12-05 05:45:06.548603+03
14	globalcustomer	0002_auto_20161107_2158	2016-12-05 05:45:06.564657+03
15	globalcustomer	0003_auto_20161204_1706	2016-12-05 05:45:06.586021+03
16	guardian	0001_initial	2016-12-05 05:45:07.204777+03
17	registration	0001_initial	2016-12-05 05:45:07.338356+03
18	registration	0002_registrationprofile_activated	2016-12-05 05:45:07.526928+03
19	registration	0003_migrate_activatedstatus	2016-12-05 05:45:07.54069+03
20	sessions	0001_initial	2016-12-05 05:45:07.781813+03
21	sites	0001_initial	2016-12-05 05:45:07.870595+03
22	sites	0002_alter_domain_unique	2016-12-05 05:45:08.003812+03
23	crm	0002_auto_20161205_0602	2016-12-05 06:02:30.990229+03
24	crm	0003_auto_20161205_0610	2016-12-05 06:10:22.263561+03
25	crm	0004_auto_20161205_0621	2016-12-05 06:21:58.141474+03
26	crm	0002_auto_20161210_2008	2016-12-13 18:13:28.294469+03
27	crm	0003_salesperson_lang	2016-12-13 18:13:28.483863+03
28	crm	0004_auto_20161212_1542	2016-12-13 18:13:28.511167+03
29	globalcustomer	0002_client_lang	2016-12-13 18:13:28.521978+03
30	globalcustomer	0003_auto_20161211_1523	2016-12-13 18:13:28.530742+03
31	globalcustomer	0004_auto_20161211_2213	2016-12-13 18:13:28.544492+03
32	globalcustomer	0005_auto_20161212_1542	2016-12-13 18:13:28.553727+03
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('django_migrations_id_seq', 32, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
1mnj3omjwk5derym617leuvmwecat1x5	OTVhYzY2ZTc5ZTBkOWY1MTY3MmUzMjA1NzI0ODkzMzNjN2FhM2E4Zjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYjliMjNhYWVjZGJjNDA0ZGM0ZDkwZGZmMzRiNmU0YzM1NWIzNmRlIn0=	2016-12-19 06:26:31.917221+03
cdth8vdpg4vni93ksv7m72arp80yz55b	NTdhNDkzYTgyYzdlNDc4YzY4YTViOTJhMmZlNGRmZDE2YjNiNWQ2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiJmYzAyZWVmNWU3ODJjNzRkZWZjOWE4YjhmYmVjMTljN2FkMzIzMWNjIn0=	2016-12-22 18:16:19.637463+03
u1ieqv4strpluz61qo6wxcc41u242vks	OTI3ZmVhZGZkNTg3Yzk3ODAzMzE5ODE0ZDE5YjFiYjBlNTRiMmIwOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZjMDJlZWY1ZTc4MmM3NGRlZmM5YThiOGZiZWMxOWM3YWQzMjMxY2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-12-27 18:14:52.258378+03
ehja4phzqx1fuv91n0fxj302qpmtbijk	NzVkNGNmZDQ4MjM3MjA5Yjc3ZmE0Y2Y1MzU5Nzc5OWY0NjgzN2I0Yzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2OWQ0MTAwZjk5OTI0MjZmNzUyZDAzMGM0OTIxZjY2MDI3ZDU5MmM2In0=	2016-12-29 20:48:46.323898+03
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: guardian_groupobjectpermission; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY guardian_groupobjectpermission (id, object_pk, content_type_id, group_id, permission_id) FROM stdin;
\.


--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('guardian_groupobjectpermission_id_seq', 1, false);


--
-- Data for Name: guardian_userobjectpermission; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY guardian_userobjectpermission (id, object_pk, content_type_id, permission_id, user_id) FROM stdin;
\.


--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('guardian_userobjectpermission_id_seq', 1, false);


--
-- Data for Name: registration_registrationprofile; Type: TABLE DATA; Schema: a1; Owner: ama
--

COPY registration_registrationprofile (id, activation_key, user_id, activated) FROM stdin;
\.


--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE SET; Schema: a1; Owner: ama
--

SELECT pg_catalog.setval('registration_registrationprofile_id_seq', 1, false);


SET search_path = a2, pg_catalog;

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY auth_group (id, name) FROM stdin;
1	admin
2	boss
3	manager
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('auth_group_id_seq', 3, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	62
2	1	63
3	1	64
4	1	65
5	1	66
6	1	67
7	1	68
8	2	69
9	2	70
10	2	71
11	2	72
12	2	73
13	2	74
14	2	75
15	2	76
16	2	77
17	2	78
18	2	79
19	2	80
20	2	68
21	2	81
22	2	82
23	2	83
24	2	84
25	3	69
26	3	70
27	3	71
28	3	72
29	3	73
30	3	76
31	3	77
32	3	78
33	3	79
34	3	80
35	3	68
36	3	81
37	3	82
38	3	83
39	3	84
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 39, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
62	Can add user	16	add_user
63	Can change user	16	change_user
64	Can delete user	16	delete_user
65	Can add Sales manager	9	add_salesperson
66	Can change Sales manager	9	change_salesperson
67	Can delete Sales manager	9	delete_salesperson
68	View sales manager	9	read_salesperson
69	Can add Customer	10	add_customer
70	Can change Customer	10	change_customer
71	Can delete Customer	10	delete_customer
72	User list	10	read_customer
73	Can add Deal	8	add_deal
74	Can change Deal	8	change_deal
75	Can delete Deal	8	delete_deal
76	Contracts view	8	read_deal
77	Can add Product	7	add_product
78	Can change Product	7	change_product
79	Can delete Product	7	delete_product
80	Products view	7	read_product
81	Can add ToDo list	4	add_todo
82	Can change ToDo list	4	change_todo
83	Can delete ToDo list	4	delete_todo
84	ToDos view	4	read_todo
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('auth_permission_id_seq', 84, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	!Sjetct9jVpBUsYNDKDGGcULcFxlQgVhQ86PYvCjk	\N	f	AnonymousUser				f	t	2016-12-15 19:56:49.764138+03
2	pbkdf2_sha256$24000$YKFt9iP9SNuf$uutiwz4qsXz5aC5X1uq/EcGYYmX5VYC3TG8xXQS05CI=	2016-12-15 20:58:48.412227+03	t	admin				t	t	2016-12-15 19:56:53.120804+03
6	pbkdf2_sha256$24000$FZhA7WFnDB9M$F6aoPDOObZTQN9ALb65xO4Rr3gjJzt88neNYuB7LUbE=	2016-12-15 20:59:28.418275+03	f	sssssssss			alex.abakumov@gmail.com	f	t	2016-12-15 20:59:17.4458+03
3	pbkdf2_sha256$24000$eeh7JtSTPJQ1$b9OdnYvHHid8yzc+1jYmAZ/0MjTrAHW0uru3DgsTH8c=	2016-12-15 21:31:41.748969+03	f	new_admin				f	t	2016-12-15 19:56:53.209263+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
1	3	1
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('auth_user_id_seq', 6, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: crm_customer; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY crm_customer (id, first_name, second_name, phone_number, mobile_number, avatar, company, "position", email_address, brith_data, status, comment, sales_person_id) FROM stdin;
\.


--
-- Name: crm_customer_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('crm_customer_id_seq', 1, false);


--
-- Data for Name: crm_deal; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY crm_deal (id, price, ident, description, customer_id, sales_person_id) FROM stdin;
\.


--
-- Name: crm_deal_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('crm_deal_id_seq', 1, false);


--
-- Data for Name: crm_dealproducts; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY crm_dealproducts (id, qty, item_price, total_price, deal_id, product_id) FROM stdin;
\.


--
-- Name: crm_dealproducts_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('crm_dealproducts_id_seq', 1, false);


--
-- Data for Name: crm_dealstatus; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY crm_dealstatus (id, status, deal_data, deal_time, remark, deal_id) FROM stdin;
\.


--
-- Name: crm_dealstatus_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('crm_dealstatus_id_seq', 1, false);


--
-- Data for Name: crm_product; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY crm_product (id, sku, description, price) FROM stdin;
\.


--
-- Name: crm_product_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('crm_product_id_seq', 1, false);


--
-- Data for Name: crm_salesperson; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY crm_salesperson (id, first_name, second_name, phone_number, mobile_number, avatar, division, role, user_id, lang) FROM stdin;
\.


--
-- Name: crm_salesperson_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('crm_salesperson_id_seq', 1, false);


--
-- Data for Name: crm_todo; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY crm_todo (id, action, action_description, todo_data, todo_time, sales_person_id) FROM stdin;
\.


--
-- Name: crm_todo_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('crm_todo_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	sessions	session
2	globalcustomer	client
3	admin	logentry
4	crm	todo
5	crm	dealproducts
6	crm	dealstatus
7	crm	product
8	crm	deal
9	crm	salesperson
10	crm	customer
11	sites	site
12	registration	registrationprofile
13	contenttypes	contenttype
14	guardian	userobjectpermission
15	guardian	groupobjectpermission
16	auth	user
17	auth	group
18	auth	permission
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('django_content_type_id_seq', 18, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-12-15 19:56:38.029984+03
2	auth	0001_initial	2016-12-15 19:56:39.575773+03
3	admin	0001_initial	2016-12-15 19:56:39.943238+03
4	admin	0002_logentry_remove_auto_add	2016-12-15 19:56:40.115265+03
5	contenttypes	0002_remove_content_type_name	2016-12-15 19:56:40.277205+03
6	auth	0002_alter_permission_name_max_length	2016-12-15 19:56:40.354622+03
7	auth	0003_alter_user_email_max_length	2016-12-15 19:56:40.431107+03
8	auth	0004_alter_user_username_opts	2016-12-15 19:56:40.485616+03
9	auth	0005_alter_user_last_login_null	2016-12-15 19:56:40.563208+03
10	auth	0006_require_contenttypes_0002	2016-12-15 19:56:40.597212+03
11	auth	0007_alter_validators_add_error_messages	2016-12-15 19:56:40.652323+03
12	crm	0001_initial	2016-12-15 19:56:42.898671+03
13	crm	0002_auto_20161210_2008	2016-12-15 19:56:45.696248+03
14	crm	0003_salesperson_lang	2016-12-15 19:56:46.039317+03
15	crm	0004_auto_20161212_1542	2016-12-15 19:56:46.119706+03
16	globalcustomer	0001_initial	2016-12-15 19:56:46.202922+03
17	globalcustomer	0002_client_lang	2016-12-15 19:56:46.250747+03
18	globalcustomer	0003_auto_20161211_1523	2016-12-15 19:56:46.295319+03
19	globalcustomer	0004_auto_20161211_2213	2016-12-15 19:56:46.347947+03
20	globalcustomer	0005_auto_20161212_1542	2016-12-15 19:56:46.394027+03
21	guardian	0001_initial	2016-12-15 19:56:47.350709+03
22	registration	0001_initial	2016-12-15 19:56:47.571439+03
23	registration	0002_registrationprofile_activated	2016-12-15 19:56:47.793737+03
24	registration	0003_migrate_activatedstatus	2016-12-15 19:56:47.874828+03
25	sessions	0001_initial	2016-12-15 19:56:48.206008+03
26	sites	0001_initial	2016-12-15 19:56:48.338454+03
27	sites	0002_alter_domain_unique	2016-12-15 19:56:48.515176+03
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('django_migrations_id_seq', 27, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
r2q3mp8sq02rystvv5h5ryf3nemjquc7	MWY1MjJhYmEzOGU4MTM4Yzg1ZDZmY2Q3YzUzZTFmN2Y1MDJhOGY0NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTU5MmU3ODBiOWU0ZGE5MmQzNzIzYTk3ZGE5YTc2NDZjNzBhMGVkZSIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2016-12-29 21:31:41.801901+03
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: guardian_groupobjectpermission; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY guardian_groupobjectpermission (id, object_pk, content_type_id, group_id, permission_id) FROM stdin;
\.


--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('guardian_groupobjectpermission_id_seq', 1, false);


--
-- Data for Name: guardian_userobjectpermission; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY guardian_userobjectpermission (id, object_pk, content_type_id, permission_id, user_id) FROM stdin;
\.


--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('guardian_userobjectpermission_id_seq', 1, false);


--
-- Data for Name: registration_registrationprofile; Type: TABLE DATA; Schema: a2; Owner: ama
--

COPY registration_registrationprofile (id, activation_key, user_id, activated) FROM stdin;
3	9245d80f359321d86e3edcee2d8970fc72fedf62	6	t
\.


--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE SET; Schema: a2; Owner: ama
--

SELECT pg_catalog.setval('registration_registrationprofile_id_seq', 3, true);


SET search_path = public, pg_catalog;

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ama
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ama
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ama
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ama
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ama
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add user object permission	1	add_userobjectpermission
2	Can change user object permission	1	change_userobjectpermission
3	Can delete user object permission	1	delete_userobjectpermission
4	Can add group object permission	2	add_groupobjectpermission
5	Can change group object permission	2	change_groupobjectpermission
6	Can delete group object permission	2	delete_groupobjectpermission
7	Can add site	3	add_site
8	Can change site	3	change_site
9	Can delete site	3	delete_site
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add permission	5	add_permission
14	Can change permission	5	change_permission
15	Can delete permission	5	delete_permission
16	Can add group	7	add_group
17	Can change group	7	change_group
18	Can delete group	7	delete_group
19	Can add user	6	add_user
20	Can change user	6	change_user
21	Can delete user	6	delete_user
22	Can add registration profile	8	add_registrationprofile
23	Can change registration profile	8	change_registrationprofile
24	Can delete registration profile	8	delete_registrationprofile
25	Can add Company	9	add_client
26	Can change Company	9	change_client
27	Can delete Company	9	delete_client
28	Can add log entry	10	add_logentry
29	Can change log entry	10	change_logentry
30	Can delete log entry	10	delete_logentry
31	Can add Sales manager	15	add_salesperson
32	Can change Sales manager	15	change_salesperson
33	Can delete Sales manager	15	delete_salesperson
34	View sales manager	15	read_salesperson
35	Can add ToDo list	14	add_todo
36	Can change ToDo list	14	change_todo
37	Can delete ToDo list	14	delete_todo
38	ToDos view	14	read_todo
39	Can add Customer	11	add_customer
40	Can change Customer	11	change_customer
41	Can delete Customer	11	delete_customer
42	User list	11	read_customer
43	Can add Deal	17	add_deal
44	Can change Deal	17	change_deal
45	Can delete Deal	17	delete_deal
46	Contracts view	17	read_deal
47	Can add Product	16	add_product
48	Can change Product	16	change_product
49	Can delete Product	16	delete_product
50	Products view	16	read_product
51	Can add Product in contract	13	add_dealproducts
52	Can change Product in contract	13	change_dealproducts
53	Can delete Product in contract	13	delete_dealproducts
54	View products in contract	13	read_salesperson
55	Can add Contract status	12	add_dealstatus
56	Can change Contract status	12	change_dealstatus
57	Can delete Contract status	12	delete_dealstatus
58	Просмотр статуса контракта	12	read_salesperson
59	Can add session	18	add_session
60	Can change session	18	change_session
61	Can delete session	18	delete_session
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ama
--

SELECT pg_catalog.setval('auth_permission_id_seq', 61, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ama
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	!zox6fMNgmYHI8qJPgokYH6o4xP23c68kjn9narCH	\N	f	AnonymousUser				f	t	2016-12-05 05:45:01.512888+03
2	pbkdf2_sha256$24000$CiFuj2XaWQXe$NfQ7sdGsgdedXarSPi/qEd9MaLwT9s4IspOXuoA1U/s=	2016-12-16 20:57:00.811414+03	t	admin			alex-abakumov@yandex.ru	t	t	2016-12-05 05:45:24+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ama
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ama
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ama
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ama
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ama
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ama
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-12-13 18:14:05.746679+03	2	admin	2	Изменен username.	6	2
2	2016-12-13 19:54:42.610892+03	2	admin	2	Изменен password.	6	2
3	2016-12-16 20:57:32.343592+03	1	django.one	2	Изменен domain и name.	3	2
4	2016-12-16 20:57:45.119827+03	1	django.one	2	Ни одно поле не изменено.	3	2
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ama
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 4, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ama
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	guardian	userobjectpermission
2	guardian	groupobjectpermission
3	sites	site
4	contenttypes	contenttype
5	auth	permission
6	auth	user
7	auth	group
8	registration	registrationprofile
9	globalcustomer	client
10	admin	logentry
11	crm	customer
12	crm	dealstatus
13	crm	dealproducts
14	crm	todo
15	crm	salesperson
16	crm	product
17	crm	deal
18	sessions	session
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ama
--

SELECT pg_catalog.setval('django_content_type_id_seq', 18, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ama
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-12-05 05:44:58.075064+03
2	auth	0001_initial	2016-12-05 05:44:59.000313+03
3	admin	0001_initial	2016-12-05 05:44:59.243729+03
4	admin	0002_logentry_remove_auto_add	2016-12-05 05:44:59.265992+03
5	contenttypes	0002_remove_content_type_name	2016-12-05 05:44:59.310456+03
6	auth	0002_alter_permission_name_max_length	2016-12-05 05:44:59.33269+03
7	auth	0003_alter_user_email_max_length	2016-12-05 05:44:59.365748+03
8	auth	0004_alter_user_username_opts	2016-12-05 05:44:59.38737+03
9	auth	0005_alter_user_last_login_null	2016-12-05 05:44:59.410003+03
10	auth	0006_require_contenttypes_0002	2016-12-05 05:44:59.421232+03
11	auth	0007_alter_validators_add_error_messages	2016-12-05 05:44:59.439207+03
12	crm	0001_initial	2016-12-05 05:44:59.523445+03
13	globalcustomer	0001_initial	2016-12-05 05:44:59.901805+03
14	globalcustomer	0002_auto_20161107_2158	2016-12-05 05:44:59.923948+03
15	globalcustomer	0003_auto_20161204_1706	2016-12-05 05:44:59.943318+03
16	guardian	0001_initial	2016-12-05 05:45:00.957008+03
17	registration	0001_initial	2016-12-05 05:45:00.983478+03
18	registration	0002_registrationprofile_activated	2016-12-05 05:45:01.006958+03
19	registration	0003_migrate_activatedstatus	2016-12-05 05:45:01.013757+03
20	sessions	0001_initial	2016-12-05 05:45:01.268327+03
21	sites	0001_initial	2016-12-05 05:45:01.35754+03
22	sites	0002_alter_domain_unique	2016-12-05 05:45:01.479479+03
23	crm	0002_auto_20161205_0602	2016-12-05 06:02:30.812188+03
24	crm	0003_auto_20161205_0610	2016-12-05 06:10:22.069672+03
25	crm	0004_auto_20161205_0621	2016-12-05 06:21:57.937824+03
26	crm	0002_auto_20161210_2008	2016-12-13 18:13:26.923807+03
27	crm	0003_salesperson_lang	2016-12-13 18:13:26.964867+03
28	crm	0004_auto_20161212_1542	2016-12-13 18:13:26.98656+03
29	globalcustomer	0002_client_lang	2016-12-13 18:13:27.371706+03
30	globalcustomer	0003_auto_20161211_1523	2016-12-13 18:13:27.384982+03
31	globalcustomer	0004_auto_20161211_2213	2016-12-13 18:13:27.399716+03
32	globalcustomer	0005_auto_20161212_1542	2016-12-13 18:13:27.407889+03
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ama
--

SELECT pg_catalog.setval('django_migrations_id_seq', 32, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ama
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
s7xl4j6kae4cbk2378tkytdk4oqdl7wj	MGJkZWQ1NTc1OGQ3ZjcwNTFlMzhlZDg1NGI0MzIzYThmY2U1MDFhZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjEzNDQ2ZjNhZTYzYjFkYWQ2MjhhNzJiN2Y2ZmRlMTliMGIwZmRlYzYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-12-27 18:13:47.389844+03
47n6g6zmctxdsqruuv2t4o6q2hmrn4d4	Y2YzMThiN2ZmMzEzNTk2ODI0ZTRjNDk5ZmQ4NTAwOGI3MDI0Yzc3Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjViNjE3OWY1MWZlNTk4YTc0OWI2YjcwYTFkNWMyMzg2Nzk4ZTZhOTAiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2016-12-27 19:54:42.634439+03
4d0ynoc5lnk7ho4ehagzl2pg8wmh9ro7	OWRkMTY0NmVlM2YyODg3NTI5ZWE5NGI3ZTk2ODcxYTFjZmFkZTk2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWI2MTc5ZjUxZmU1OThhNzQ5YjZiNzBhMWQ1YzIzODY3OThlNmE5MCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-12-30 20:57:00.867444+03
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: ama
--

COPY django_site (id, domain, name) FROM stdin;
1	django.one	django.one
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ama
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: globalcustomer_client; Type: TABLE DATA; Schema: public; Owner: ama
--

COPY globalcustomer_client (id, domain_url, schema_name, name, description, created_on, lang) FROM stdin;
1	example.com	public	SaaS		2016-12-05	EN
2	a1.example.com	a1	aaa		2016-12-05	EN
3	a2.example.com	a2	www		2016-12-15	ru
\.


--
-- Name: globalcustomer_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ama
--

SELECT pg_catalog.setval('globalcustomer_client_id_seq', 3, true);


--
-- Data for Name: guardian_groupobjectpermission; Type: TABLE DATA; Schema: public; Owner: ama
--

COPY guardian_groupobjectpermission (id, object_pk, content_type_id, group_id, permission_id) FROM stdin;
\.


--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ama
--

SELECT pg_catalog.setval('guardian_groupobjectpermission_id_seq', 1, false);


--
-- Data for Name: guardian_userobjectpermission; Type: TABLE DATA; Schema: public; Owner: ama
--

COPY guardian_userobjectpermission (id, object_pk, content_type_id, permission_id, user_id) FROM stdin;
\.


--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ama
--

SELECT pg_catalog.setval('guardian_userobjectpermission_id_seq', 1, false);


SET search_path = a1, pg_catalog;

--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: crm_customer_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_customer
    ADD CONSTRAINT crm_customer_pkey PRIMARY KEY (id);


--
-- Name: crm_deal_ident_key; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_deal
    ADD CONSTRAINT crm_deal_ident_key UNIQUE (ident);


--
-- Name: crm_deal_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_deal
    ADD CONSTRAINT crm_deal_pkey PRIMARY KEY (id);


--
-- Name: crm_dealproducts_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_dealproducts
    ADD CONSTRAINT crm_dealproducts_pkey PRIMARY KEY (id);


--
-- Name: crm_dealstatus_deal_id_c879fa49_uniq; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_dealstatus
    ADD CONSTRAINT crm_dealstatus_deal_id_c879fa49_uniq UNIQUE (deal_id, deal_data, deal_time);


--
-- Name: crm_dealstatus_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_dealstatus
    ADD CONSTRAINT crm_dealstatus_pkey PRIMARY KEY (id);


--
-- Name: crm_product_description_key; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_product
    ADD CONSTRAINT crm_product_description_key UNIQUE (description);


--
-- Name: crm_product_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_product
    ADD CONSTRAINT crm_product_pkey PRIMARY KEY (id);


--
-- Name: crm_product_sku_key; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_product
    ADD CONSTRAINT crm_product_sku_key UNIQUE (sku);


--
-- Name: crm_salesperson_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_salesperson
    ADD CONSTRAINT crm_salesperson_pkey PRIMARY KEY (id);


--
-- Name: crm_salesperson_user_id_key; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_salesperson
    ADD CONSTRAINT crm_salesperson_user_id_key UNIQUE (user_id);


--
-- Name: crm_todo_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_todo
    ADD CONSTRAINT crm_todo_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: guardian_groupobjectpermission_group_id_3f189f7c_uniq; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_group_id_3f189f7c_uniq UNIQUE (group_id, permission_id, object_pk);


--
-- Name: guardian_groupobjectpermission_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission_user_id_b0b3d2fc_uniq; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_b0b3d2fc_uniq UNIQUE (user_id, permission_id, object_pk);


--
-- Name: registration_registrationprofile_pkey; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_pkey PRIMARY KEY (id);


--
-- Name: registration_registrationprofile_user_id_key; Type: CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_user_id_key UNIQUE (user_id);


SET search_path = a2, pg_catalog;

--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: crm_customer_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_customer
    ADD CONSTRAINT crm_customer_pkey PRIMARY KEY (id);


--
-- Name: crm_deal_ident_key; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_deal
    ADD CONSTRAINT crm_deal_ident_key UNIQUE (ident);


--
-- Name: crm_deal_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_deal
    ADD CONSTRAINT crm_deal_pkey PRIMARY KEY (id);


--
-- Name: crm_dealproducts_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_dealproducts
    ADD CONSTRAINT crm_dealproducts_pkey PRIMARY KEY (id);


--
-- Name: crm_dealstatus_deal_id_c879fa49_uniq; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_dealstatus
    ADD CONSTRAINT crm_dealstatus_deal_id_c879fa49_uniq UNIQUE (deal_id, deal_data, deal_time);


--
-- Name: crm_dealstatus_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_dealstatus
    ADD CONSTRAINT crm_dealstatus_pkey PRIMARY KEY (id);


--
-- Name: crm_product_description_key; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_product
    ADD CONSTRAINT crm_product_description_key UNIQUE (description);


--
-- Name: crm_product_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_product
    ADD CONSTRAINT crm_product_pkey PRIMARY KEY (id);


--
-- Name: crm_product_sku_key; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_product
    ADD CONSTRAINT crm_product_sku_key UNIQUE (sku);


--
-- Name: crm_salesperson_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_salesperson
    ADD CONSTRAINT crm_salesperson_pkey PRIMARY KEY (id);


--
-- Name: crm_salesperson_user_id_key; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_salesperson
    ADD CONSTRAINT crm_salesperson_user_id_key UNIQUE (user_id);


--
-- Name: crm_todo_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_todo
    ADD CONSTRAINT crm_todo_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: guardian_groupobjectpermission_group_id_3f189f7c_uniq; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_group_id_3f189f7c_uniq UNIQUE (group_id, permission_id, object_pk);


--
-- Name: guardian_groupobjectpermission_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission_user_id_b0b3d2fc_uniq; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_b0b3d2fc_uniq UNIQUE (user_id, permission_id, object_pk);


--
-- Name: registration_registrationprofile_pkey; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_pkey PRIMARY KEY (id);


--
-- Name: registration_registrationprofile_user_id_key; Type: CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_user_id_key UNIQUE (user_id);


SET search_path = public, pg_catalog;

--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: globalcustomer_client_domain_url_key; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY globalcustomer_client
    ADD CONSTRAINT globalcustomer_client_domain_url_key UNIQUE (domain_url);


--
-- Name: globalcustomer_client_pkey; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY globalcustomer_client
    ADD CONSTRAINT globalcustomer_client_pkey PRIMARY KEY (id);


--
-- Name: globalcustomer_client_schema_name_key; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY globalcustomer_client
    ADD CONSTRAINT globalcustomer_client_schema_name_key UNIQUE (schema_name);


--
-- Name: guardian_groupobjectpermission_group_id_3f189f7c_uniq; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_group_id_3f189f7c_uniq UNIQUE (group_id, permission_id, object_pk);


--
-- Name: guardian_groupobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission_user_id_b0b3d2fc_uniq; Type: CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_b0b3d2fc_uniq UNIQUE (user_id, permission_id, object_pk);


SET search_path = a1, pg_catalog;

--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: crm_customer_aedf05f7; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX crm_customer_aedf05f7 ON crm_customer USING btree (sales_person_id);


--
-- Name: crm_deal_aedf05f7; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX crm_deal_aedf05f7 ON crm_deal USING btree (sales_person_id);


--
-- Name: crm_deal_cb24373b; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX crm_deal_cb24373b ON crm_deal USING btree (customer_id);


--
-- Name: crm_dealproducts_2b3e9f9a; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX crm_dealproducts_2b3e9f9a ON crm_dealproducts USING btree (deal_id);


--
-- Name: crm_dealproducts_9bea82de; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX crm_dealproducts_9bea82de ON crm_dealproducts USING btree (product_id);


--
-- Name: crm_dealstatus_2b3e9f9a; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX crm_dealstatus_2b3e9f9a ON crm_dealstatus USING btree (deal_id);


--
-- Name: crm_product_description_882a72a2_like; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX crm_product_description_882a72a2_like ON crm_product USING btree (description text_pattern_ops);


--
-- Name: crm_todo_aedf05f7; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX crm_todo_aedf05f7 ON crm_todo USING btree (sales_person_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX django_site_domain_a2e37b91_like ON django_site USING btree (domain varchar_pattern_ops);


--
-- Name: guardian_groupobjectpermission_0e939a4f; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX guardian_groupobjectpermission_0e939a4f ON guardian_groupobjectpermission USING btree (group_id);


--
-- Name: guardian_groupobjectpermission_417f1b1c; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX guardian_groupobjectpermission_417f1b1c ON guardian_groupobjectpermission USING btree (content_type_id);


--
-- Name: guardian_groupobjectpermission_8373b171; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX guardian_groupobjectpermission_8373b171 ON guardian_groupobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_417f1b1c; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX guardian_userobjectpermission_417f1b1c ON guardian_userobjectpermission USING btree (content_type_id);


--
-- Name: guardian_userobjectpermission_8373b171; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX guardian_userobjectpermission_8373b171 ON guardian_userobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_e8701ad4; Type: INDEX; Schema: a1; Owner: ama
--

CREATE INDEX guardian_userobjectpermission_e8701ad4 ON guardian_userobjectpermission USING btree (user_id);


SET search_path = a2, pg_catalog;

--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: crm_customer_aedf05f7; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX crm_customer_aedf05f7 ON crm_customer USING btree (sales_person_id);


--
-- Name: crm_deal_aedf05f7; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX crm_deal_aedf05f7 ON crm_deal USING btree (sales_person_id);


--
-- Name: crm_deal_cb24373b; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX crm_deal_cb24373b ON crm_deal USING btree (customer_id);


--
-- Name: crm_dealproducts_2b3e9f9a; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX crm_dealproducts_2b3e9f9a ON crm_dealproducts USING btree (deal_id);


--
-- Name: crm_dealproducts_9bea82de; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX crm_dealproducts_9bea82de ON crm_dealproducts USING btree (product_id);


--
-- Name: crm_dealstatus_2b3e9f9a; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX crm_dealstatus_2b3e9f9a ON crm_dealstatus USING btree (deal_id);


--
-- Name: crm_product_description_882a72a2_like; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX crm_product_description_882a72a2_like ON crm_product USING btree (description text_pattern_ops);


--
-- Name: crm_todo_aedf05f7; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX crm_todo_aedf05f7 ON crm_todo USING btree (sales_person_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX django_site_domain_a2e37b91_like ON django_site USING btree (domain varchar_pattern_ops);


--
-- Name: guardian_groupobjectpermission_0e939a4f; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX guardian_groupobjectpermission_0e939a4f ON guardian_groupobjectpermission USING btree (group_id);


--
-- Name: guardian_groupobjectpermission_417f1b1c; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX guardian_groupobjectpermission_417f1b1c ON guardian_groupobjectpermission USING btree (content_type_id);


--
-- Name: guardian_groupobjectpermission_8373b171; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX guardian_groupobjectpermission_8373b171 ON guardian_groupobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_417f1b1c; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX guardian_userobjectpermission_417f1b1c ON guardian_userobjectpermission USING btree (content_type_id);


--
-- Name: guardian_userobjectpermission_8373b171; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX guardian_userobjectpermission_8373b171 ON guardian_userobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_e8701ad4; Type: INDEX; Schema: a2; Owner: ama
--

CREATE INDEX guardian_userobjectpermission_e8701ad4 ON guardian_userobjectpermission USING btree (user_id);


SET search_path = public, pg_catalog;

--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX django_site_domain_a2e37b91_like ON django_site USING btree (domain varchar_pattern_ops);


--
-- Name: globalcustomer_client_domain_url_feab5ae2_like; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX globalcustomer_client_domain_url_feab5ae2_like ON globalcustomer_client USING btree (domain_url varchar_pattern_ops);


--
-- Name: globalcustomer_client_schema_name_70aaa9ed_like; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX globalcustomer_client_schema_name_70aaa9ed_like ON globalcustomer_client USING btree (schema_name varchar_pattern_ops);


--
-- Name: guardian_groupobjectpermission_0e939a4f; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX guardian_groupobjectpermission_0e939a4f ON guardian_groupobjectpermission USING btree (group_id);


--
-- Name: guardian_groupobjectpermission_417f1b1c; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX guardian_groupobjectpermission_417f1b1c ON guardian_groupobjectpermission USING btree (content_type_id);


--
-- Name: guardian_groupobjectpermission_8373b171; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX guardian_groupobjectpermission_8373b171 ON guardian_groupobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_417f1b1c; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX guardian_userobjectpermission_417f1b1c ON guardian_userobjectpermission USING btree (content_type_id);


--
-- Name: guardian_userobjectpermission_8373b171; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX guardian_userobjectpermission_8373b171 ON guardian_userobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_e8701ad4; Type: INDEX; Schema: public; Owner: ama
--

CREATE INDEX guardian_userobjectpermission_e8701ad4 ON guardian_userobjectpermission USING btree (user_id);


SET search_path = a1, pg_catalog;

--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_customer_sales_person_id_50b6fabb_fk_crm_salesperson_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_customer
    ADD CONSTRAINT crm_customer_sales_person_id_50b6fabb_fk_crm_salesperson_id FOREIGN KEY (sales_person_id) REFERENCES crm_salesperson(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_deal_customer_id_c9a60a59_fk_crm_customer_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_deal
    ADD CONSTRAINT crm_deal_customer_id_c9a60a59_fk_crm_customer_id FOREIGN KEY (customer_id) REFERENCES crm_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_deal_sales_person_id_1096b32d_fk_crm_salesperson_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_deal
    ADD CONSTRAINT crm_deal_sales_person_id_1096b32d_fk_crm_salesperson_id FOREIGN KEY (sales_person_id) REFERENCES crm_salesperson(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_dealproducts_deal_id_a65ec884_fk_crm_deal_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_dealproducts
    ADD CONSTRAINT crm_dealproducts_deal_id_a65ec884_fk_crm_deal_id FOREIGN KEY (deal_id) REFERENCES crm_deal(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_dealproducts_product_id_5bdf2c5e_fk_crm_product_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_dealproducts
    ADD CONSTRAINT crm_dealproducts_product_id_5bdf2c5e_fk_crm_product_id FOREIGN KEY (product_id) REFERENCES crm_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_dealstatus_deal_id_ff587eac_fk_crm_deal_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_dealstatus
    ADD CONSTRAINT crm_dealstatus_deal_id_ff587eac_fk_crm_deal_id FOREIGN KEY (deal_id) REFERENCES crm_deal(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_salesperson_user_id_0fd4f97d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_salesperson
    ADD CONSTRAINT crm_salesperson_user_id_0fd4f97d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_todo_sales_person_id_43ab1c7b_fk_crm_salesperson_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY crm_todo
    ADD CONSTRAINT crm_todo_sales_person_id_43ab1c7b_fk_crm_salesperson_id FOREIGN KEY (sales_person_id) REFERENCES crm_salesperson(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_gro_content_type_id_7ade36b8_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_gro_content_type_id_7ade36b8_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobje_permission_id_36572738_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobje_permission_id_36572738_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermissi_group_id_4bbbfb62_fk_auth_group_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermissi_group_id_4bbbfb62_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_use_content_type_id_2e892405_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_use_content_type_id_2e892405_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjec_permission_id_71807bfc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjec_permission_id_71807bfc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_registrationprofi_user_id_5fcbf725_fk_auth_user_id; Type: FK CONSTRAINT; Schema: a1; Owner: ama
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofi_user_id_5fcbf725_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


SET search_path = a2, pg_catalog;

--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_customer_sales_person_id_50b6fabb_fk_crm_salesperson_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_customer
    ADD CONSTRAINT crm_customer_sales_person_id_50b6fabb_fk_crm_salesperson_id FOREIGN KEY (sales_person_id) REFERENCES crm_salesperson(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_deal_customer_id_c9a60a59_fk_crm_customer_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_deal
    ADD CONSTRAINT crm_deal_customer_id_c9a60a59_fk_crm_customer_id FOREIGN KEY (customer_id) REFERENCES crm_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_deal_sales_person_id_1096b32d_fk_crm_salesperson_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_deal
    ADD CONSTRAINT crm_deal_sales_person_id_1096b32d_fk_crm_salesperson_id FOREIGN KEY (sales_person_id) REFERENCES crm_salesperson(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_dealproducts_deal_id_a65ec884_fk_crm_deal_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_dealproducts
    ADD CONSTRAINT crm_dealproducts_deal_id_a65ec884_fk_crm_deal_id FOREIGN KEY (deal_id) REFERENCES crm_deal(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_dealproducts_product_id_5bdf2c5e_fk_crm_product_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_dealproducts
    ADD CONSTRAINT crm_dealproducts_product_id_5bdf2c5e_fk_crm_product_id FOREIGN KEY (product_id) REFERENCES crm_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_dealstatus_deal_id_ff587eac_fk_crm_deal_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_dealstatus
    ADD CONSTRAINT crm_dealstatus_deal_id_ff587eac_fk_crm_deal_id FOREIGN KEY (deal_id) REFERENCES crm_deal(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_salesperson_user_id_0fd4f97d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_salesperson
    ADD CONSTRAINT crm_salesperson_user_id_0fd4f97d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_todo_sales_person_id_43ab1c7b_fk_crm_salesperson_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY crm_todo
    ADD CONSTRAINT crm_todo_sales_person_id_43ab1c7b_fk_crm_salesperson_id FOREIGN KEY (sales_person_id) REFERENCES crm_salesperson(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_gro_content_type_id_7ade36b8_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_gro_content_type_id_7ade36b8_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobje_permission_id_36572738_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobje_permission_id_36572738_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermissi_group_id_4bbbfb62_fk_auth_group_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermissi_group_id_4bbbfb62_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_use_content_type_id_2e892405_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_use_content_type_id_2e892405_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjec_permission_id_71807bfc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjec_permission_id_71807bfc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_registrationprofi_user_id_5fcbf725_fk_auth_user_id; Type: FK CONSTRAINT; Schema: a2; Owner: ama
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofi_user_id_5fcbf725_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


SET search_path = public, pg_catalog;

--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_gro_content_type_id_7ade36b8_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_gro_content_type_id_7ade36b8_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobje_permission_id_36572738_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobje_permission_id_36572738_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermissi_group_id_4bbbfb62_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermissi_group_id_4bbbfb62_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_use_content_type_id_2e892405_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_use_content_type_id_2e892405_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjec_permission_id_71807bfc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjec_permission_id_71807bfc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ama
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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

