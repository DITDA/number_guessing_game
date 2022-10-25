#!/bin/bash

PSQL="psql --username=yellowflash2041 --dbname=users -t --no-align -c"

echo "Enter your username:"
read GET_USERNAME
let COUNT=0

USERNAME=$($PSQL "SELECT username FROM users WHERE username='$GET_USERNAME'")

if [[ -z $USERNAME ]]
then
  USERNAME=$GET_USERNAME
  echo "Welcome, $USERNAME! It looks like this is your first time here.\n"
  INSERT_USERNAME=$($PSQL "INSERT INTO users VALUES('$USERNAME',0,0)")
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

RANGE=$((1000))
SECRET_NUMBER=$(($(($RANDOM%$RANGE))+1))
echo "Guess the secret number between 1 and 1000:"
read GUESSING_NUMBER

NEW_GAMES_PLAYED=$(($GAMES_PLAYED+1))
UPATE_GAME_PLAYED=$($PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED WHERE username='$USERNAME'")

let COUNT++
while ! [[ "$GUESSING_NUMBER" =~ ^[0-9]+$ ]]
do
  echo "That is not an integer, guess again:"
  read GUESSING_NUMBER
done
while [ $GUESSING_NUMBER != $SECRET_NUMBER ]
do
  if ! [[ "$GUESSING_NUMBER" =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read GUESSING_NUMBER
  elif [[ $GUESSING_NUMBER > $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    read GUESSING_NUMBER
    let COUNT++
  elif [[ $GUESSING_NUMBER < $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    read GUESSING_NUMBER
    let COUNT++
  fi
done


if [[ $COUNT < $BEST_GAME ]] || [[ $BEST_GAME = 0 ]]
then
  UPATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$COUNT WHERE username='$USERNAME'")
fi

echo "You guessed it in $COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"