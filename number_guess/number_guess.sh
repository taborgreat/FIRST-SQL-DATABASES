#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


#database contains: username, games_played, best_game
#local variables: number of guesses, currentGuess, random number
GUESS_TOTAL=0;
#randomly generate number 1-1000
RANDOM_NUMBER=$((RANDOM % 1000 + 1))


#get username  max 22 characters
echo "Enter your username:"
read USERNAME

QUERY_NAME=$($PSQL "SELECT name FROM users WHERE name='$USERNAME'")
#if not in database welcome
if [[ -z $QUERY_NAME ]]
then
  #Welcome, <username>! It looks like this is your first time here.
  echo -e "-\nWelcome, $USERNAME! It looks like this is your first time here.\n"
  INSERT_USER=$($PSQL "INSERT INTO users(name, games_played, best_game) VALUES('$USERNAME', 0, 0)")


else
#else (in database)
#Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses.
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE name='$USERNAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE name='$USERNAME'")
echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.\n"
fi


#UPDATE THE games played
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE name='$USERNAME'")
INSERT_GAME_PLAYED=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED+1 WHERE name='$USERNAME'")


#guess() 

guess(){



  #handle return message
  echo $1

  #get guess Guess the secret number between 1 and 1000: 
  read CURRENT_GUESS

  #if not integer guess again () That is not an integer, guess again:
  if [[ ! $CURRENT_GUESS =~ ^[0-9]+$ ]]
  then
    ((GUESS_TOTAL+=1))
    guess "That is not an integer, guess again:"
  fi

  #if number lower It's lower than that, guess again:
  if [[ $CURRENT_GUESS -lt $RANDOM_NUMBER ]]
  then
    ((GUESS_TOTAL+=1))
    guess "It's higher than that, guess again:"
  #if higher It's higher than that, guess again:
  elif [[ $CURRENT_GUESS -gt $RANDOM_NUMBER ]]
  then
    ((GUESS_TOTAL+=1))
    guess "It's lower than that, guess again:"
  else
     #if number, You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!
    ((GUESS_TOTAL+=1))

    echo You guessed it in $GUESS_TOTAL tries. The secret number was $RANDOM_NUMBER. Nice job!
    INSERT_GAME_DATA=$($PSQL "UPDATE users SET best_game=$GUESS_TOTAL WHERE name='$USERNAME'")
  fi
}


guess "Guess the secret number between 1 and 1000: "