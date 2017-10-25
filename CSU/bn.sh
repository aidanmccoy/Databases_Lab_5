#!/bin/bash

echo cleanup
mysql -h csc365fall2017.webredirect.org aimccoy < CSU-cleanup.sql

echo setup
mysql -h csc365fall2017.webredirect.org aimccoy < CSU-setup.sql

echo build campuses
mysql -h csc365fall2017.webredirect.org aimccoy < CSU-build-Campuses.sql

echo build fees
mysql -h csc365fall2017.webredirect.org aimccoy < CSU-build-fees.sql

echo build degrees
mysql -h csc365fall2017.webredirect.org aimccoy < CSU-build-degrees.sql

echo build dixcliplines
mysql -h csc365fall2017.webredirect.org aimccoy < CSU-build-disciplines.sql

echo build discEnroll
mysql -h csc365fall2017.webredirect.org aimccoy < CSU-build-discipline-enrollments.sql

echo build Enrollments
mysql -h csc365fall2017.webredirect.org aimccoy < CSU-build-enrollments.sql

echo build faculty
mysql -h csc365fall2017.webredirect.org aimccoy < CSU-build-faculty.sql
