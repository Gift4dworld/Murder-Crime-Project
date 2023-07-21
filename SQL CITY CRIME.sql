/* Objective: I vaguely remember that the crime was a murder that occured sometime 
on January 15th,2018 and it took place in SQL city*/

select * from crime_scene_report

select * from crime_scene_report
where date= 20180115 And city= 'SQL City'

/*Security footage shows that there were 2 witnesses. 
The first witness lives at the last house on "Northwestern Dr".
The second witness, named Annabel, lives somewhere on "Franklin Ave".*/

/*Withness one -lives at the last house*/

select * from person
where address_street_name= 'Northwestern Dr'
order by address_number desc

/*witness one name is Morty Schapiro, with id 14887, owns a car with license id 118009, 
lives at address number 4919 on Northwestern drive and has ssn number 111564949*/

Select address_street_name, 
Max(address_number)
from person
group by address_street_name
having address_street_name = 'Northwestern Dr'

select *from person 
Where address_number = 4919

select * from person
where name like '%Annabel%' and address_street_name = 'Franklin Ave'

/* The second witness is Annabel Miller with ID 16371, 
and License ID 490173 who live at 103 on Franklin Ave with SSN 318771143*/

select * from Interview
where person_id= 14887
/* Morty SchapiroI (witness 1) said:I heard a gunshot and then saw a man run out. 
He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". 
Only gold members have those bags. 
The man got into a car with a plate that included "H42W". */

select * from Interview
where person_id= 16371

/*Annabel Miller (witness 2) said: I saw the murder happen, and I recognized the killer from my gym 
when I was working out last week on January the 9th.*/

select * from get_fit_now_member
where ID like '48Z%'
And membership_status = 'gold'

/*suspect 0ne- Joe Germuska, has ID 48Z7A, 
has person_id 28819, membership_start_date 20160305 and has a gold membership_status

suspect two- Jeremy Bowers has id 48Z55, 
person_id 67318, member_start date 20160101 and membership_status gold*/

select * from get_fit_now_check_in
where check_in_date = '20180109' and membership_id IN ('48Z7A' , '48Z55')

SELECT dl.age, dl.height, dl.hair_color, dl.gender, dl.plate_number, 
dl.car_make, dl.car_model, p.name, p.ssn, p.address_street_name,p.id
from drivers_license as dl
left join person as p 
on dl.id = p.license_id

where Plate_number like '%H42W%' or plate_number like 'H42W%' Or Plate_number like '%H42W'

/*Muderer is suspect 2- Jeremy Bowers*/

/*Congrats, you found the murderer! But wait, there's more. 
If you think you're up for a challenge, try querying the interview transcript of 
the murderer to find the real villain behind this crime. If you feel especially confident
in your SQL skills, try to complete this final step with no more than 2 queries.
Use this same INSERT statement with your new suspect to check your answer*/

select * from person
where name = 'Jeremy Bowers'

/*The Murder's id is 67318*/

Select * from interview
where person_id= 67318

/*I was hired by a woman with a lot of money. I don't know her name but 
I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives 
a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in 
December 2017.*/

SELECT * FROM drivers_license
where height between 65 and 67
and hair_color= 'red'
and gender= 'female'
and car_make= 'Tesla'
and car_model= 'Model S'

create table suspect as (SELECT * FROM drivers_license
where height between 65 and 67
and hair_color= 'red'
and gender= 'female'
and car_make= 'Tesla'
and car_model= 'Model S')

select * from suspect
/*202298, 291182, 918773*/

select * from facebook_event_checkin
where event_name= 'SQL Symphony Concert'
AND date between 20171201 and 20171231

select *from person

select s.id,s.age,s.height,
p.id as person_id, p.name, p.address_street_name, p.ssn
from suspect as s
right join person as p
on s.id = p.license_id

/*person id of the 3 killers 99716, 90700, 78881*/

select * from facebook_event_checkin
where event_name= 'SQL Symphony Concert'
AND date between 20171201 and 20171231
and person_id in (99716, 90700, 78881)

/*The Abetter has person id 99716*/

select * from person
where id= 99716

/*The real villian behind the murder is Miranda Priestly*/