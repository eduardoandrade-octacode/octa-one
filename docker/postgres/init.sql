-- Create extensions if needed
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";
CREATE EXTENSION IF NOT EXISTS "unaccent";

-- Set timezone
SET timezone = 'UTC';

-- Create schemas for multi-tenancy
CREATE SCHEMA IF NOT EXISTS shared;
CREATE SCHEMA IF NOT EXISTS audit;

-- Create audit function
CREATE OR REPLACE FUNCTION audit.audit_table() RETURNS trigger AS $body$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO audit.logged_actions VALUES (
            nextval('audit.logged_actions_event_id_seq'),
            TG_TABLE_SCHEMA::text,
            TG_TABLE_NAME::text,
            TG_RELID,
            session_user::text,
            current_timestamp,
            'D',
            OLD.*,
            NULL
        );
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO audit.logged_actions VALUES (
            nextval('audit.logged_actions_event_id_seq'),
            TG_TABLE_SCHEMA::text,
            TG_TABLE_NAME::text,
            TG_RELID,
            session_user::text,
            current_timestamp,
            'U',
            OLD.*,
            NEW.*
        );
        RETURN NEW;
    ELSIF (TG_OP = 'INSERT') THEN
        INSERT INTO audit.logged_actions VALUES (
            nextval('audit.logged_actions_event_id_seq'),
            TG_TABLE_SCHEMA::text,
            TG_TABLE_NAME::text,
            TG_RELID,
            session_user::text,
            current_timestamp,
            'I',
            NULL,
            NEW.*
        );
        RETURN NEW;
    END IF;
END;
$body$ LANGUAGE plpgsql;