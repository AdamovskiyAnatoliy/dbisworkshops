CREATE OR REPLACE PACKAGE symptom_package IS
    PROCEDURE add_symptom (
        sym_name   IN         symptom.sym_name%TYPE,
        sym_desc   IN         symptom.sym_desc%TYPE
    );

    PROCEDURE del_symptom (
        sym_name   IN         symptom.sym_name%TYPE
    );

    PROCEDURE update_symptom (
        sym_name   IN         symptom.sym_name%TYPE,
        sym_desc   IN         symptom.sym_desc%TYPE
    );

END symptom_package;
/

CREATE OR REPLACE PACKAGE BODY symptom_package IS

    PROCEDURE add_symptom (
        sym_name   IN         symptom.sym_name%TYPE,
        sym_desc   IN         symptom.sym_desc%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        INSERT INTO symptom (
            sym_name,
            sym_desc
        ) VALUES (
            sym_name,
            sym_desc
        );

        COMMIT;
    END add_symptom;

    PROCEDURE del_symptom (
        sym_name   IN         symptom.sym_name%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        DELETE FROM symptom
        WHERE
            symptom.sym_name = sym_name;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE value_error;
    END del_symptom;

    PROCEDURE update_symptom (
        sym_name   IN         symptom.sym_name%TYPE,
        sym_desc   IN         symptom.sym_desc%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        UPDATE symptom
        SET
            symptom.sym_desc = sym_desc
        WHERE
            symptom.sym_name = sym_name;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE value_error;
    END update_symptom;

END symptom_package;
