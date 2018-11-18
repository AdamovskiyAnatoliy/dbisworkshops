CREATE TABLE card (
    card_number   INTEGER NOT NULL,
    user_login    VARCHAR2(30) NOT NULL
);

ALTER TABLE card ADD CONSTRAINT card_pk PRIMARY KEY ( card_number );

CREATE TABLE desease (
    dis_name   VARCHAR2(30) NOT NULL,
    dis_desc   CLOB
);

ALTER TABLE desease ADD CONSTRAINT desease_pk PRIMARY KEY ( dis_name );

CREATE TABLE mds (
    mds_date            DATE NOT NULL,
    desease_dis_name    VARCHAR2(30) NOT NULL,
    symptom_sym_name    VARCHAR2(30) NOT NULL,
    medicine_med_name   VARCHAR2(30) NOT NULL
);

ALTER TABLE mds ADD CONSTRAINT mds_pk PRIMARY KEY ( mds_date );

CREATE TABLE medicine (
    med_name   VARCHAR2(30) NOT NULL,
    med_desc   CLOB
);

ALTER TABLE medicine ADD CONSTRAINT medicine_pk PRIMARY KEY ( med_name );

CREATE TABLE symptom (
    sym_name   VARCHAR2(30) NOT NULL,
    sym_desc   CLOB
);

ALTER TABLE symptom ADD CONSTRAINT symptom_pk PRIMARY KEY ( sym_name );

CREATE TABLE "user" (
    login        VARCHAR2(30) NOT NULL,
    first_name   VARCHAR2(30),
    last_name    VARCHAR2(30),
    birthday     DATE,
    sex          CHAR(1)
);

ALTER TABLE "user" ADD CONSTRAINT user_pk PRIMARY KEY ( login );

CREATE TABLE user_mds (
    user_login     VARCHAR2(30) NOT NULL,
    mds_mds_date   DATE NOT NULL
);

ALTER TABLE user_mds ADD CONSTRAINT user_mds_pk PRIMARY KEY ( user_login,
                                                              mds_mds_date );

ALTER TABLE card
    ADD CONSTRAINT card_user_fk FOREIGN KEY ( user_login )
        REFERENCES "user" ( login );

ALTER TABLE mds
    ADD CONSTRAINT mds_desease_fk FOREIGN KEY ( desease_dis_name )
        REFERENCES desease ( dis_name );

ALTER TABLE mds
    ADD CONSTRAINT mds_medicine_fk FOREIGN KEY ( medicine_med_name )
        REFERENCES medicine ( med_name );

ALTER TABLE mds
    ADD CONSTRAINT mds_symptom_fk FOREIGN KEY ( symptom_sym_name )
        REFERENCES symptom ( sym_name );

ALTER TABLE user_mds
    ADD CONSTRAINT user_mds_mds_fk FOREIGN KEY ( mds_mds_date )
        REFERENCES mds ( mds_date );

ALTER TABLE user_mds
    ADD CONSTRAINT user_mds_user_fk FOREIGN KEY ( user_login )
        REFERENCES "user" ( login );

--
-- DROP TABLE user_mds;
-- DROP TABLE mds;
-- DROP TABLE card;
-- DROP TABLE symptom;
-- DROP TABLE desease;
-- DROP TABLE medicine;
-- DROP TABLE "user";
