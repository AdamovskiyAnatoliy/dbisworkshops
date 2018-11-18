CREATE OR REPLACE PACKAGE user_package IS
    PROCEDURE add_user (
        login        IN           user_info.login%TYPE,
        first_name   IN           user_info.first_name%TYPE,
        last_name    IN           user_info.last_name%TYPE,
        birthday     IN           user_info.birthday%TYPE,
        sex          IN           user_info.sex%TYPE
    );

    PROCEDURE del_user (
        login   IN      user_info.login%TYPE
    );

    PROCEDURE update_user_first_name (
        login        IN           user_info.login%TYPE,
        first_name   IN           user_info.first_name%TYPE
    );

    PROCEDURE update_user_last_name (
        login       IN          user_info.login%TYPE,
        last_name   IN          user_info.last_name%TYPE
    );

    PROCEDURE update_user_birthday (
        login      IN         user_info.login%TYPE,
        birthday   IN         user_info.birthday%TYPE
    );

    PROCEDURE update_user_sex (
        login   IN      user_info.login%TYPE,
        sex     IN      user_info.sex%TYPE
    );

END user_package;
/

CREATE OR REPLACE PACKAGE BODY user_package IS

    PROCEDURE add_user (
        login        IN           user_info.login%TYPE,
        first_name   IN           user_info.first_name%TYPE,
        last_name    IN           user_info.last_name%TYPE,
        birthday     IN           user_info.birthday%TYPE,
        sex          IN           user_info.sex%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        INSERT INTO user_info (
            login,
            first_name,
            last_name,
            birthday,
            sex
        ) VALUES (
            login,
            first_name,
            last_name,
            birthday,
            sex
        );

        COMMIT;
    END add_user;

    PROCEDURE del_user (
        login   IN      user_info.login%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        DELETE FROM user_info
        WHERE
            user_info.login = login;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE value_error;
    END del_user;

    PROCEDURE update_user_first_name (
        login        IN           user_info.login%TYPE,
        first_name   IN           user_info.first_name%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        UPDATE user_info
        SET
            user_info.first_name = first_name
        WHERE
            user_info.login = login;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE value_error;
    END update_user_first_name;

    PROCEDURE update_user_last_name (
        login       IN          user_info.login%TYPE,
        last_name   IN          user_info.last_name%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        UPDATE user_info
        SET
            user_info.last_name = last_name
        WHERE
            user_info.login = login;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE value_error;
    END update_user_last_name;

    PROCEDURE update_user_birthday (
        login      IN         user_info.login%TYPE,
        birthday   IN         user_info.birthday%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        UPDATE user_info
        SET
            user_info.birthday = birthday
        WHERE
            user_info.login = login;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE value_error;
    END update_user_birthday;

    PROCEDURE update_user_sex (
        login   IN      user_info.login%TYPE,
        sex     IN      user_info.sex%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        UPDATE user_info
        SET
            user_info.sex = sex
        WHERE
            user_info.login = login;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE value_error;
    END update_user_sex;

END user_package;
