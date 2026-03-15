#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
  echo -e "\n$1"
  fi
    $PSQL "SELECT service_id, name FROM services"| while IFS="|" read SERVICE_ID SERVICE_NAME
    do
      echo "$SERVICE_ID) $SERVICE_NAME"
    done
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
     MAIN_MENU "I could not find that service. What would you like today?"
  else
    SERVICE=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
    if [[ -z $SERVICE ]]
    then
    MAIN_MENU "I could not find that service. What would you like today?"
    else
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      CUSTOMER=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      if [[ -z $CUSTOMER ]]
      then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
        CUSTOMER=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      else
        echo -e ""
      fi
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
        echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
        read SERVICE_TIME
        INSERT_APPOINTMENTS_RESULT=$($PSQL "INSERT INTO appointments (service_id, time, customer_id) VALUES('$SERVICE_ID_SELECTED','$SERVICE_TIME', '$CUSTOMER')")
        echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}


# echo -e "\nWhat time would you like your color, Fabio?"
# read USER_TIME


MAIN_MENU