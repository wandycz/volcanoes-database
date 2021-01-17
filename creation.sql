-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- PostgreSQL version: 9.2
-- Project Site: pgmodeler.com.br
-- Model Author: ---

SET check_function_bodies = false;
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: new_database | type: DATABASE --
-- CREATE DATABASE new_database
-- ;
-- -- ddl-end --
-- 

-- object: public.size | type: TABLE --
CREATE TABLE public.size(
	id varchar(10) NOT NULL,
	name varchar(20),
	relative_h varchar(20),
	CONSTRAINT id_size_pk PRIMARY KEY (id)

);
-- ddl-end --
-- object: public.country | type: TABLE --
CREATE TABLE public.country(
	id varchar(10) NOT NULL,
	name varchar(50),
	area_km2 float,
	continent varchar(50),
	id_capital integer,
	CONSTRAINT id_country_pk PRIMARY KEY (id)

);
-- ddl-end --
-- object: public.volcano | type: TABLE --
CREATE TABLE public.volcano(
	id serial NOT NULL,
	name varchar(50),
	type varchar(50),
	activity varchar(50),
	id_size varchar(10) NOT NULL,
	id_country varchar(10),
	CONSTRAINT id_volcano_pk PRIMARY KEY (id)

);
-- ddl-end --
-- object: public.pyroclast | type: TABLE --
CREATE TABLE public.pyroclast(
	id serial NOT NULL,
	size varchar(50),
	name varchar(50),
	CONSTRAINT id_pyroclast_pk PRIMARY KEY (id)

);
-- ddl-end --
-- object: public.vei | type: TABLE --
CREATE TABLE public.vei(
	id integer NOT NULL,
	class varchar(50),
	description varchar(50),
	plume varchar(50),
	ejecta_vol varchar(50),
	CONSTRAINT id_vei_pk PRIMARY KEY (id)

);
-- ddl-end --
-- object: public.eruption | type: TABLE --
CREATE TABLE public.eruption(
	id serial NOT NULL,
	date date,
	casualties float,
	economic_dmg_dollars float,
	id_volcano integer NOT NULL,
	id_pyroclast integer NOT NULL,
	id_vei integer NOT NULL,
	CONSTRAINT id_eruption_pk PRIMARY KEY (id)

);
-- ddl-end --
-- object: size_fk | type: CONSTRAINT --
ALTER TABLE public.volcano ADD CONSTRAINT size_fk FOREIGN KEY (id_size)
REFERENCES public.size (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: public.capital | type: TABLE --
CREATE TABLE public.capital(
	id integer NOT NULL,
	name varchar(50),
	CONSTRAINT id_capital_pk PRIMARY KEY (id)

);
-- ddl-end --
-- object: capital_fk | type: CONSTRAINT --
ALTER TABLE public.country ADD CONSTRAINT capital_fk FOREIGN KEY (id_capital)
REFERENCES public.capital (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: country_uq | type: CONSTRAINT --
ALTER TABLE public.country ADD CONSTRAINT country_uq UNIQUE (id_capital);
-- ddl-end --


-- object: country_fk | type: CONSTRAINT --
ALTER TABLE public.volcano ADD CONSTRAINT country_fk FOREIGN KEY (id_country)
REFERENCES public.country (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: volcano_fk | type: CONSTRAINT --
ALTER TABLE public.eruption ADD CONSTRAINT volcano_fk FOREIGN KEY (id_volcano)
REFERENCES public.volcano (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: pyroclast_fk | type: CONSTRAINT --
ALTER TABLE public.eruption ADD CONSTRAINT pyroclast_fk FOREIGN KEY (id_pyroclast)
REFERENCES public.pyroclast (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: vei_fk | type: CONSTRAINT --
ALTER TABLE public.eruption ADD CONSTRAINT vei_fk FOREIGN KEY (id_vei)
REFERENCES public.vei (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --

--add checks--
alter table public.eruption add constraint chk_date check (date < NOW()::date);
alter table public.eruption add constraint chk_casualties check (casualties >= 0);
alter table public.country add constraint chk_continent check (continent in ('Asia', 'Europe', 'Africa', 'North America', 'South America', 'Oceania', 'Antarctica'));
alter table public.volcano add constraint  chk_activity check (activity in ('active', 'dormant', 'extinct'));
--add checks--
