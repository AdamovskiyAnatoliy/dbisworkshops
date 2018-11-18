CREATE OR REPLACE PACKAGE medicine_package IS
    PROCEDURE add_medicine (
        med_name   IN         medicine.med_name%TYPE,
        med_desc   IN         medicine.med_desc%TYPE
    );

    PROCEDURE del_medicine (
        med_name   IN         medicine.med_name%TYPE
    );

    PROCEDURE update_medicine (
        med_name   IN         medicine.med_name%TYPE,
        med_desc   IN         medicine.med_desc%TYPE
    );

END medicine_package;
/

CREATE OR REPLACE PACKAGE BODY medicine_package IS

    PROCEDURE add_medicine (
        med_name   IN         medicine.med_name%TYPE,
        med_desc   IN         medicine.med_desc%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        INSERT INTO medicine (
            med_name,
            med_desc
        ) VALUES (
            med_name,
            med_desc
        );

        COMMIT;
    END add_medicine;

    PROCEDURE del_medicine (
        med_name   IN         medicine.med_name%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        DELETE FROM medicine
        WHERE
            medicine.med_name = med_name;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE value_error;
    END del_medicine;

    PROCEDURE update_medicine (
        med_name   IN         medicine.med_name%TYPE,
        med_desc   IN         medicine.med_desc%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        UPDATE medicine
        SET
            medicine.med_desc = med_desc
        WHERE
            medicine.med_name = med_name;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE value_error;
    END update_medicine;

END medicine_package;
