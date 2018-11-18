CREATE OR REPLACE PACKAGE card_package IS
    PROCEDURE add_card (
        card_num     IN           card.card_number%TYPE,
        user_login   IN           card.user_login%TYPE
    );

    PROCEDURE del_card (
        card_num   IN         card.card_number%TYPE
    );

END card_package;
/

CREATE OR REPLACE PACKAGE BODY card_package IS

    PROCEDURE add_card (
        card_num     IN           card.card_number%TYPE,
        user_login   IN           card.user_login%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        INSERT INTO card (
            card_number,
            user_login
        ) VALUES (
            card_num,
            user_login
        );

        COMMIT;
    END add_card;

    PROCEDURE del_card (
        card_num   IN         card.card_number%TYPE
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        DELETE FROM card
        WHERE
            card.card_number = card_num;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE value_error;
    END del_card;

END card_package;
