#!/bin/bash
# Number guess game
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(shuf -i 1-1000 -n 1)
echo Enter your username:

read USER

RESULT=$($PSQL "SELECT user_id, username FROM users WHERE username = '$USER'")
if [[ -z $RESULT ]]
then
echo Welcome, $USER! It looks like this is your first time here.
INSERT_USER_RESULT=$($PSQL "INSERT INTO users (username) VALUES ('$USER')")
RESULT=$($PSQL "SELECT user_id, username FROM users WHERE username = '$USER'")
 IFS='|' read USER_ID USERNAME <<< "$RESULT"
else
 IFS='|' read USER_ID USERNAME <<< "$RESULT"
GAMES=$($PSQL "SELECT COUNT(*) AS games_played, MIN(guesses) AS best_game 
FROM games 
WHERE user_id = '$USER_ID';")
IFS='|' read GAMES_PLAYED BEST_GAME <<< "$GAMES"
echo Welcome back, $USER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi


echo Guess the secret number between 1 and 1000:
NUMBER_GUESSES=0
while true
do
  read USER_NUMBER
  NUMBER_GUESSES=$(($NUMBER_GUESSES + 1))
  if [[ ! $USER_NUMBER =~ ^[0-9]+$ ]]
  then
  echo That is not an integer, guess again:
  continue
  fi
  if [[ $USER_NUMBER -gt $RANDOM_NUMBER ]]
  then
  echo "It's higher than that, guess again:"
  elif [[ $USER_NUMBER -lt $RANDOM_NUMBER ]]
  then
  echo "It's lower than that, guess again:"
  else
  echo "You guessed it in $NUMBER_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
  break
  fi
done

INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guesses) VALUES('$USER_ID', '$NUMBER_GUESSES')")