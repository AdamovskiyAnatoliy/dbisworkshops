-- TASK 2
UPDATE symptom
SET
   symptom_name = symptom_name || 'TEST'
WHERE
   symptom_name NOT IN (
       SELECT UNIQUE
           symptom_name
       FROM
           symptom
           JOIN medicine_symptoms ON symptom.symptom_name = medicine_symptoms.symptom_symptom_name
           JOIN medicine ON medicine.medicine_name = medicine_symptoms.medicine_medicine_name
   );
