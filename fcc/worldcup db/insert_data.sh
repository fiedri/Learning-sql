#!/bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENTS_GOALS
do
  if [[ $YEAR != year ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $WINNER_ID ]]
    then

      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES('$WINNER')")

      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $WINNER (winner)"
      fi

      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    if [[ -z $OPPONENT_ID ]]
    then

      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES('$OPPONENT')")

      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $OPPONENT (opponent)"
      fi

      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    INSERT_GAME=$($PSQL "INSERT INTO games (year, round,winner_id, opponent_id, winner_goals, opponent_goals)
    VALUES($YEAR, '$ROUND', '$WINNER_ID', '$OPPONENT_ID', $WINNER_GOALS, $OPPONENTS_GOALS)")
    
  fi
done
"""
SELECT 
    g.game_id,
    t1.name AS winner_name,
    t2.name AS opponent_name
FROM games g
INNER JOIN teams t1 ON g.winner_id = t1.team_id
INNER JOIN teams t2 ON g.opponent_id = t2.team_id;
"""