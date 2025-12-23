SELECT * FROM Country;
PRAGMA table_info(Match);
-- List all leagues
SELECT DISTINCT l.name FROM League l JOIN Country c ON l.country_id = c.id;
-- Sample matches
SELECT * FROM Match LIMIT 5;
-- Count nulls in key columns
SELECT 
    SUM(CASE WHEN home_team_goal IS NULL THEN 1 ELSE 0 END) AS null_home_goals
FROM Match;
-- date 
SELECT date, STRFTIME('%Y-%m-%d', date) AS formatted_date FROM Match LIMIT 1;
-- handeling duplicates
SELECT match_api_id, COUNT(*) FROM Match GROUP BY match_api_id HAVING COUNT(*) > 1;
-- Total wins, losses, draws per team (use CASE for outcomes)
WITH team_results AS (
    SELECT 
        home_team_api_id AS team_id,
        CASE 
            WHEN home_team_goal > away_team_goal THEN 'Win'
            WHEN home_team_goal < away_team_goal THEN 'Loss'
            ELSE 'Draw' 
        END AS result
    FROM Match
    UNION ALL
    SELECT 
        away_team_api_id AS team_id,
        CASE 
            WHEN away_team_goal > home_team_goal THEN 'Win'
            WHEN away_team_goal < home_team_goal THEN 'Loss'
            ELSE 'Draw' 
        END AS result
    FROM Match
)
SELECT 
    t.team_long_name,
    SUM(CASE WHEN result = 'Win' THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN result = 'Loss' THEN 1 ELSE 0 END) AS losses,
    SUM(CASE WHEN result = 'Draw' THEN 1 ELSE 0 END) AS draws,
    (SUM(CASE WHEN result = 'Win' THEN 3 ELSE 0 END) + SUM(CASE WHEN result = 'Draw' THEN 1 ELSE 0 END)) AS points
FROM team_results tr
JOIN Team t ON tr.team_id = t.team_api_id
GROUP BY t.team_long_name
ORDER BY points DESC
LIMIT 10;  -- Top 10 teams

-- Top players by average overall rating
SELECT 
    p.player_name,
    AVG(pa.overall_rating) AS avg_rating,
    AVG(pa.potential) AS avg_potential,
    COUNT(pa.id) AS attribute_updates
FROM Player p
JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id
GROUP BY p.player_name
HAVING AVG(pa.overall_rating) > 80
ORDER BY avg_rating DESC
LIMIT 10;

-- Average goals per season, with trends
SELECT 
    season,
    AVG(home_team_goal + away_team_goal) AS avg_goals_per_match,
    SUM(home_team_goal + away_team_goal) AS total_goals
FROM Match
GROUP BY season
ORDER BY season;
-- Home win percentage
SELECT 
    (SUM(CASE WHEN home_team_goal > away_team_goal THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS home_win_pct,
    (SUM(CASE WHEN home_team_goal < away_team_goal THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS away_win_pct,
    (SUM(CASE WHEN home_team_goal = away_team_goal THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS draw_pct
FROM Match;
-- Win rate by team attributes (using window functions for ranking)
SELECT 
    t.team_long_name,
    ta.buildUpPlaySpeed,
    ta.defencePressure,
    AVG(CASE WHEN m.home_team_api_id = ta.team_api_id AND m.home_team_goal > m.away_team_goal THEN 1
             WHEN m.away_team_api_id = ta.team_api_id AND m.away_team_goal > m.home_team_goal THEN 1
             ELSE 0 END) AS win_rate
FROM Team_Attributes ta
JOIN Team t ON ta.team_api_id = t.team_api_id
JOIN Match m ON (m.home_team_api_id = ta.team_api_id OR m.away_team_api_id = ta.team_api_id)
             AND m.date BETWEEN ta.date AND DATE(ta.date, '+1 year')  -- Approximate attribute period
GROUP BY t.team_long_name, ta.buildUpPlaySpeed, ta.defencePressure
ORDER BY win_rate DESC;
-- Team defensive pressure vs goals conceded
SELECT
    t.team_long_name,
    AVG(ta.defencePressure) AS avg_defence_pressure,

    AVG(
        CASE
            WHEN m.home_team_api_id = t.team_api_id THEN m.away_team_goal
            WHEN m.away_team_api_id = t.team_api_id THEN m.home_team_goal
        END
    ) AS avg_goals_conceded

FROM Team t
JOIN Team_Attributes ta 
    ON t.team_api_id = ta.team_api_id
JOIN Match m 
    ON (m.home_team_api_id = t.team_api_id 
     OR m.away_team_api_id = t.team_api_id)
 AND m.date BETWEEN ta.date AND DATE(ta.date, '+1 year')

GROUP BY t.team_long_name;
