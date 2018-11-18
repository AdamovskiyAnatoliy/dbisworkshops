CREATE OR REPLACE PACKAGE desease_package IS
    PROCEDURE add_desease (
        dis_name   IN         desease.dis_name%TYPE,
        dis_desc   IN         desease.dis_desc%TYPE
    );

    PROCEDURE del_desease (
        dis_name   IN         desease.dis_name%TYPE
    );

    PROCEDURE update_desease (
        dis_name   IN         desease.dis_name%TYPE,
        dis_desc   IN         desease.dis_desc%TYPE
    );

END desease_package;
/

CREATE OR REPLACE PACKAGE BODY desease_package IS

    PROCEDURE add_desease (
        dis_name   IN         desease.dis_name%TYPE,
        dis_desc   IN         desease.dis_desc%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        INSERT INTO desease (
            dis_name,
            dis_desc
        ) VALUES (
            dis_name,
            dis_desc
        );

        COMMIT;
    END add_desease;

    PROCEDURE del_desease (
        dis_name   IN         desease.dis_name%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        DELETE FROM desease
        WHERE
            desease.dis_name = dis_name;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE value_error;
    END del_desease;

    PROCEDURE update_desease (
        dis_name   IN         desease.dis_name%TYPE,
        dis_desc   IN         desease.dis_desc%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        UPDATE desease
        SET
            desease.dis_desc = dis_desc
        WHERE
            desease.dis_name = dis_name;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE value_error;
    END update_desease;

END desease_package;
