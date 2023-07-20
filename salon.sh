#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"


echo -e "\n\n~~Welcome To Our Salon!~~\nTo create an appointment, start by selecting a service:"
MENU_SERVICES(){


  echo -e "\n"$1"\n"

  SERVICES_RAW=$($PSQL "SELECT * FROM services")
  echo "$SERVICES_RAW" | sed 's/ | / /g' | while read ID SERVICE
  do
    echo -e "$ID) $SERVICE" 
  done


  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[1-6]$ ]]
  then
    MENU_SERVICES "Please choose a correct value."
  else
    echo -e "\nFormatting must be the same for relogin!\nWhat is your phone number (ex 5049320344): "
    read CUSTOMER_PHONE

    QUERY_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

    if [[ -z $QUERY_CUSTOMER_NAME ]]
    then
      echo It appears you are new customer. What is your name?
      read CUSTOMER_NAME
      ADD_CUSTOMER=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      echo -e "\nWelcome to our salon, $CUSTOMER_NAME!"
    else
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      echo -e "\nWelcome back, $CUSTOMER_NAME."
    fi

    CUSTOMER_ID=$($PSQL"SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo -e "\nWe are open from 8:00-5:00"
    echo "Please insert a service time (ex 10:30)"
    read SERVICE_TIME

    INSERT_INTO_APPOINTMENTS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    CUSTOMER_NAME_VIEW=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    SERVICE_TYPE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

    echo I have put you down for a $SERVICE_TYPE at $SERVICE_TIME, $CUSTOMER_NAME_VIEW.
  fi


}



MENU_SERVICES