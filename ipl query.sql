create database IPL_MATCHES

create table ipl(
	id int not null primary key,
	city varchar(50),
	date date not null,
	player_of_match char(50),
	venue char(100),
	neutral_venue int,
	team1 char(50),
	team2 char(50),
	toss_winner char(50),
	toss_decision char(20),
	winner char(50),
	result char(50),
	result_margin int,
	eliminato char(5),
	method char(10),
	umpire1 char(50),
	umpire2 char(50)
	)
copy data from database by the help of ipmort tada in csv file.	
	
/*Question: How many records are there in the dataset?*/
select count(*)
from ipl

/*Question:What is the earliest date and the latest date in the dataset?*/
select * from ipl
order by date desc
limit 5

/*Question:How many matches were played in each city?*/
select count(*)as totalcount, city
from ipl
group by city
order by totalcount desc

/*Question: Which team hasthe highest win percentage in the history of the IPL?*/
select count(*) as winner_team, winner
from ipl
group by winner
order by winner_team desc

/*#Question: Which player has won the most "Player of the Match" awards?(top 5)*/
select count(*)as  pom, player_of_match
from ipl
group by player_of_match
order by pom desc
limit 5

/*Question: How many matches were won by the team batting first,
			and how many by the team batting second?*/
SELECT
    COUNT(CASE WHEN winner = team1 THEN 1 ELSE NULL END) AS matches_won_by_batting_first1,
    COUNT(CASE WHEN winner = team2 THEN 1 ELSE NULL END) AS matches_won_by_secound_batting
FROM ipl;

/*Question: How many matches had a "Super Over"?*/
SELECT COUNT(*) AS super_over_matches
FROM ipl
WHERE result = 'tie';

/*Question: Did the team that won the toss choose to bat or field more often?*/
SELECT 
    toss_decision,
    COUNT(*) AS frequency
FROM ipl
GROUP BY toss_decision;

/*Question: How many matches were decided by a narrow margin of less than 10 runs?*/
select * from ipl
where result = 'run' and result_margin < 10 --(this query show error becouse result_margion is vering char not int)

/*Question: Who were the top 5 umpires who officiated the most matches?*/
select count(*)as total, umpire1
from ipl
group by umpire1
order by total desc
limit 5
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
