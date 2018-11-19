-- User have symptom 
DECLARE
    user_login        user_info.login%TYPE;
    user_first_name   user_info.first_name%TYPE;
    user_last_name    user_info.last_name%TYPE;
    user_birthday     user_info.birthday%TYPE;
    sym_name          symptom.sym_name%TYPE;
    sym_desc          symptom.sym_desc%TYPE;
BEGIN
    user_login := 'user_login';
    user_first_name := 'user_first_name';
    user_last_name := 'user_last_name';
    user_birthday := TO_DATE('2018-11-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS');
    sym_name := 'sym_name';
    sym_desc := 'sym_desc';
    user_package.add_user(user_login, user_first_name, user_last_name, user_birthday);
    symptom_package.add_user(sym_name, sym_desc);
    mds_package.add_mds(user_login, sym_name);
END;

-- Add card for user
DECLARE
    user_login    user_info.login%TYPE;
    card_number   card%card_number%TYPE;
BEGIN
    user_login := 'user_login';
    user_card := '1234';
    card_package.add_card(user_login, user_card);
END;

-- Delate card
DECLARE
    user_login    user_info.login%TYPE;
BEGIN
    user_card := '1234';
    card_package.del_card(user_login, user_card);
END;

-- Add medicine
DECLARE
    med_name    medicine.med_name%TYPE;
BEGIN
    med_name := 'med_name';
    medicine_package.add_med(med_name);
END;

-- Get medicine
DECLARE
    user_login    user_info.login%TYPE;
BEGIN
    user_login := 'user_login';
    DBMS_OUTPUT.PUT_LINE(mds_package.get_medicine(user_login));
END;

-- Delate medicine
DECLARE
    med_name    medicine.med_name%TYPE;
BEGIN
    med_name := 'med_name';
    medicine_package.del_med(med_name);
END;

-- Get desease
DECLARE
    user_login    user_info.login%TYPE;
BEGIN
    user_login := 'user_login';
    DBMS_OUTPUT.PUT_LINE(mds_package.get_desease(user_login));
END;

-- Add medicine
DECLARE
    des_name    desease.des_name%TYPE;
BEGIN
    des_name := 'des_name';
    desease_package.add_dis(des_name);
END;

-- Delate desease
DECLARE
    des_name    desease.des_name%TYPE;
BEGIN
    des_name := 'des_name';
    desease_package.del_des(des_name);
END;
