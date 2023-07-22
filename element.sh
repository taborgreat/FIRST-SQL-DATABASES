#!/usr/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

#check if number
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else

 if [[ $1 =~ ^-?[0-9]+$ ]]
then
  QUERY_ELEMENT=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
elif [[ $1 =~ ^[a-zA-Z]{1,2}$ ]]
then
  QUERY_ELEMENT=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1'")
elif [[ $1 =~ ^[a-zA-Z]+$ ]]
then
  QUERY_ELEMENT=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1'")
fi


  if [[ -z $QUERY_ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
  echo "$QUERY_ELEMENT" | while IFS='|' read TYPE_ID ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELT_C BOIL_C POOP
    do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_C celsius and a boiling point of $BOIL_C celsius."
    done

  fi

fi