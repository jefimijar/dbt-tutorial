select 
	"_airbyte_ab_id" as airbyte_ab_id,
	"ID" as address_id,
	"country" as country,
	"city" as city,
	"street" as street,
	"zip_code" as zip_code,
	"num" as num
	
	
	
from {{  source('pharmacy', 'addresses') }} 