SELECT * FROM tbl_habitat;

SELECT species_name FROM tbl_species WHERE species_order = 3;

SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600;

SELECT species_name FROM tbl_species 
	INNER JOIN tbl_nutrition ON nutrition_id = species_nutrition
	WHERE nutrition_id >= 2202 AND nutrition_id <= 2206
;

SELECT species_name AS 'Species Name:', nutrition_type AS 'Nutrition Type:' FROM tbl_species 
	INNER JOIN tbl_nutrition ON nutrition_id = species_nutrition
;

SELECT specialist_fname, specialist_lname, specialist_contact FROM tbl_specialist
	INNER JOIN tbl_care ON care_specialist = specialist_id
	INNER JOIN tbl_species ON species_care = care_id
	WHERE species_care = 'care_6'
; 

