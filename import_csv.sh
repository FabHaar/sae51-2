#!/bin/bash

tail -n +2 "csv/example_export.csv" | while IFS="," read -r _ Name Alias_Name _ Status Customer Vendor Creation_date Latest_modification_date Customer_Code _ _ _ Address Zip_Code City State_Province Region Country Country_code Phone Fax Url Email _ _ Professional_ID_1 Professional_ID_2 Professional_ID_3 Professional_ID_4 Professional_ID_5 _ VAT_ID Capital _ _ Third_party_type _ Business_entity_type _ Prospect_status _;
do
	mysql -u root -p'foo' -h 127.0.0.1 --port=3306 dolibarr < sql/third_parts.sql
done
