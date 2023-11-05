select 
	"_airbyte_unique_key_scd" as patient_key_scd,
	"ID" as patient_id,
	"first_name" as first_name,
	"last_name" as last_name,
	"gender" as gender,
	"date_of_birth" as date_of_birth,
	"phone_number" as phone_number,
	"address_id" as address_id,
	"_airbyte_start_at" as valid_from,
	"_airbyte_end_at" as valid_to,
	"_airbyte_active_row" as active_row
	
	
	
from {{  source('pharmacy', 'patients_scd') }} 