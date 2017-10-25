#!/bin/bash

echo cleanup
mysql -h csc365fall2017.webredirect.org aimccoy < AIRLINES-cleanup.sql

echo setup
mysql -h csc365fall2017.webredirect.org aimccoy < AIRLINES-setup.sql

echo build airlines
mysql -h csc365fall2017.webredirect.org aimccoy < AIRLINES-build-airlines.sql

echo build airports
mysql -h csc365fall2017.webredirect.org aimccoy < AIRLINES-build-airports100.sql

echo build flights
mysql -h csc365fall2017.webredirect.org aimccoy < AIRLINES-build-flights.sql
