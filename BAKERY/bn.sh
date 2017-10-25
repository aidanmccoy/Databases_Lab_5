#!/bin/bash

echo cleanup
mysql -h csc365fall2017.webredirect.org aimccoy < BAKERY-cleanup.sql

echo setup
mysql -h csc365fall2017.webredirect.org aimccoy < BAKERY-setup.sql

echo build customers
mysql -h csc365fall2017.webredirect.org aimccoy < BAKERY-build-customers.sql

echo build goods
mysql -h csc365fall2017.webredirect.org aimccoy < BAKERY-build-goods.sql

echo build receipts
mysql -h csc365fall2017.webredirect.org aimccoy < BAKERY-build-receipts.sql

echo build items
mysql -h csc365fall2017.webredirect.org aimccoy < BAKERY-build-items.sql
