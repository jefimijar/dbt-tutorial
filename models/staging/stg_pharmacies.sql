select 
	"_airbyte_unique_key_scd" as pharmacy_key_scd,
	"ID" as pharmacy_id,
	"NAME" as name,
	"phone_number" as phone_number,
	"address_id" as address_id,
	"_airbyte_start_at" as valid_from,
	"_airbyte_end_at" as valid_to,
	"_airbyte_active_row" as active_row
	
	
	
from {{  source('pharmacy', 'pharmacies_scd') }} 