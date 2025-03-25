act 1
SELECT * FROM crime_scene_report
WHERE date = 20180115 AND  type = "murder"  AND	city = "SQL City"           
act 2
select * from person 
where name like "Annabel%" and address_street_name like "Franklin Ave"  
act 3
select * from person 
where address_street_name like "Northwestern Dr" /*filtro */
ORDER BY address_number DESC limit 1;   
/*id	name	license_id	address_number	address_street_name	ssn
14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949*/
act 4
select * from interview i 
inner join person p ON p.id = i.person_id   
act 5
select * from interview i 
inner join person p ON p.id = i.person_id             
where name like "annabel miller" or name like "Morty schapiro"
/*join te trae otra lista*//*i guarda lista*/