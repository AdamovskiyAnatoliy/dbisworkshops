-- TASK 1
SELECT
   user_first_name
FROM
   (
       SELECT
           user_patient.first_name   user_first_name,
           COUNT(disease.disease_name) count_desease
       FROM
           user_patient
           JOIN patient_desease ON user_patient.login = patient_desease.user_patient_login
           JOIN disease ON patient_desease.disease_disease_name = disease.disease_name
       GROUP BY
           user_patient.first_name
   )
WHERE
   count_desease IN (
       SELECT
           MAX(COUNT(disease.disease_name)) max_count_desease
       FROM
           user_patient
           JOIN patient_desease ON user_patient.login = patient_desease.user_patient_login
           JOIN disease ON patient_desease.disease_disease_name = disease.disease_name
       GROUP BY
           user_patient.first_name
   );
