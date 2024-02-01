/* Using foorball databse */
use football;


/*Displaying the sum of red/yellowcard along with number of goals & no of assist count player wise*/
SELECT player_name,
	sum(yellow_cards) AS yellow_card_count,
    sum(red_cards) AS red_card_count,
    sum(goals) AS goals_count,
    sum(assists) AS assists_count
FROM appearances	
GROUP BY player_name limit 5;


/*Displaying Avg_minutes of player spent on field*/
SELECT appearances.player_name,avg(minute) as Avg_minute
FROM game_events
JOIN appearances on appearances.player_id = game_events.player_id
group by player_name order by Avg_minute desc limit 5;


/*Displaying No of players based on position*/
select position, count(player_id) AS No_players
FROM game_lineups group by position order by No_players desc;


/*Displaying year wise game_count*/
SELECT 
    YEAR(date) AS year,
    COUNT(game_id) AS game_count
FROM games
GROUP BY YEAR(date);


/*Calculating the age based on dob*/
SELECT 
    name,date_of_birth,
    YEAR(CURDATE()) - YEAR(date_of_birth) AS age
FROM players;