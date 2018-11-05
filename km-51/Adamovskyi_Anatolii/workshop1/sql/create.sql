CREATE TABLE card (
    card_number   INTEGER
);

ALTER TABLE card ADD CONSTRAINT card_pk PRIMARY KEY ( card_number );

CREATE TABLE desease_symptoms (
    disease_disease_name   VARCHAR2(30) NOT NULL,
    symptom_symptom_name   VARCHAR2(30) NOT NULL
);

ALTER TABLE desease_symptoms ADD CONSTRAINT desease_symptoms_pk PRIMARY KEY ( disease_disease_name,
                                                                              symptom_symptom_name );

CREATE TABLE disease (
    disease_name   VARCHAR2(30) NOT NULL,
    "DESC"         CLOB
);

CREATE TABLE medicine (
    medicine_name   VARCHAR2(30),
    "DESC"          CLOB
);

CREATE TABLE medicine_disease (
    disease_disease_name     VARCHAR2(30) NOT NULL,
    medicine_medicine_name   VARCHAR2(30) NOT NULL
);

ALTER TABLE medicine_disease ADD CONSTRAINT medicine_disease_pk PRIMARY KEY ( disease_disease_name,
                                                                              medicine_medicine_name );

CREATE TABLE medicine_symptoms (
    symptom_symptom_name     VARCHAR2(30) NOT NULL,
    medicine_medicine_name   VARCHAR2(30) NOT NULL
);

ALTER TABLE medicine_symptoms ADD CONSTRAINT medicine_symptoms_pk PRIMARY KEY ( symptom_symptom_name,
                                                                                medicine_medicine_name );

CREATE TABLE patient_card (
    card_card_number     INTEGER NOT NULL,
    user_patient_login   VARCHAR2(30) NOT NULL
);

ALTER TABLE patient_card ADD CONSTRAINT patient_card_pk PRIMARY KEY ( card_card_number,
                                                                      user_patient_login );

CREATE TABLE patient_desease (
    user_patient_login     VARCHAR2(30) NOT NULL,
    disease_disease_name   VARCHAR2(30) NOT NULL
);

ALTER TABLE patient_desease ADD CONSTRAINT patient_desease_pk PRIMARY KEY ( user_patient_login,
                                                                            disease_disease_name );

CREATE TABLE patient_symptom (
    user_patient_login     VARCHAR2(30) NOT NULL,
    symptom_symptom_name   VARCHAR2(30) NOT NULL
);

ALTER TABLE patient_symptom ADD CONSTRAINT patient_symptom_pk PRIMARY KEY ( user_patient_login,
                                                                            symptom_symptom_name );

CREATE TABLE symptom (
    symptom_name   VARCHAR2(30) NOT NULL,
    "DESC"         CLOB
);

CREATE TABLE user_patient (
    login        VARCHAR2(30),
    first_name   VARCHAR2(30),
    last_name    VARCHAR2(30),
    birthday     DATE,
    sex          CHAR(1)
);

ALTER TABLE user_patient ADD CONSTRAINT user_patient_pk PRIMARY KEY ( login );

ALTER TABLE desease_symptoms
    ADD CONSTRAINT desease_symptoms_disease_fk FOREIGN KEY ( disease_disease_name )
        REFERENCES disease ( disease_name );

ALTER TABLE desease_symptoms
    ADD CONSTRAINT desease_symptoms_symptom_fk FOREIGN KEY ( symptom_symptom_name )
        REFERENCES symptom ( symptom_name );

ALTER TABLE medicine_disease
    ADD CONSTRAINT medicine_disease_disease_fk FOREIGN KEY ( disease_disease_name )
        REFERENCES disease ( disease_name );

ALTER TABLE medicine_disease
    ADD CONSTRAINT medicine_disease_medicine_fk FOREIGN KEY ( medicine_medicine_name )
        REFERENCES medicine ( medicine_name );

ALTER TABLE medicine_symptoms
    ADD CONSTRAINT medicine_symptoms_medicine_fk FOREIGN KEY ( medicine_medicine_name )
        REFERENCES medicine ( medicine_name );

ALTER TABLE medicine_symptoms
    ADD CONSTRAINT medicine_symptoms_symptom_fk FOREIGN KEY ( symptom_symptom_name )
        REFERENCES symptom ( symptom_name );

ALTER TABLE patient_card
    ADD CONSTRAINT patient_card_card_fk FOREIGN KEY ( card_card_number )
        REFERENCES card ( card_number );

ALTER TABLE patient_card
    ADD CONSTRAINT patient_card_user_patient_fk FOREIGN KEY ( user_patient_login )
        REFERENCES user_patient ( login );

ALTER TABLE patient_desease
    ADD CONSTRAINT patient_desease_disease_fk FOREIGN KEY ( disease_disease_name )
        REFERENCES disease ( disease_name );

ALTER TABLE patient_desease
    ADD CONSTRAINT patient_desease_patient_fk FOREIGN KEY ( user_patient_login )
        REFERENCES user_patient ( login );

ALTER TABLE patient_symptom
    ADD CONSTRAINT patient_symptom_patient_fk FOREIGN KEY ( user_patient_login )
        REFERENCES user_patient ( login );

ALTER TABLE patient_symptom
    ADD CONSTRAINT patient_symptom_symptom_fk FOREIGN KEY ( symptom_symptom_name )
        REFERENCES symptom ( symptom_name );

ALTER TABLE desease_symptoms
    ADD CONSTRAINT desease_symptoms_disease_fk FOREIGN KEY ( disease_disease_name )
        REFERENCES disease ( disease_name );

ALTER TABLE desease_symptoms
    ADD CONSTRAINT desease_symptoms_symptom_fk FOREIGN KEY ( symptom_symptom_name )
        REFERENCES symptom ( symptom_name );

ALTER TABLE medicine_disease
    ADD CONSTRAINT medicine_disease_disease_fk FOREIGN KEY ( disease_disease_name )
        REFERENCES disease ( disease_name );

ALTER TABLE medicine_disease
    ADD CONSTRAINT medicine_disease_medicine_fk FOREIGN KEY ( medicine_medicine_name )
        REFERENCES medicine ( medicine_name );

ALTER TABLE medicine_symptoms
    ADD CONSTRAINT medicine_symptoms_medicine_fk FOREIGN KEY ( medicine_medicine_name )
        REFERENCES medicine ( medicine_name );

ALTER TABLE medicine_symptoms
    ADD CONSTRAINT medicine_symptoms_symptom_fk FOREIGN KEY ( symptom_symptom_name )
        REFERENCES symptom ( symptom_name );

ALTER TABLE patient_card
    ADD CONSTRAINT patient_card_card_fk FOREIGN KEY ( card_card_number )
        REFERENCES card ( card_number );

ALTER TABLE patient_card
    ADD CONSTRAINT patient_card_user_patient_fk FOREIGN KEY ( user_patient_login )
        REFERENCES user_patient ( login );

ALTER TABLE patient_desease
    ADD CONSTRAINT patient_desease_disease_fk FOREIGN KEY ( disease_disease_name )
        REFERENCES disease ( disease_name );

ALTER TABLE patient_desease
    ADD CONSTRAINT patient_desease_patient_fk FOREIGN KEY ( user_patient_login )
        REFERENCES user_patient ( login );

ALTER TABLE patient_symptom
    ADD CONSTRAINT patient_symptom_symptom_fk FOREIGN KEY ( symptom_symptom_name )
        REFERENCES symptom ( symptom_name );

ALTER TABLE patient_symptom
    ADD CONSTRAINT patient_symptom_patient_fk FOREIGN KEY ( user_patient_login )
        REFERENCES user_patient ( login );
