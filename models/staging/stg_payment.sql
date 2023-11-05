select 
	"_airbyte_unique_key_scd" as payment_key_scd,
	"ID" as payment_method_id,
	"NAME" as name,
	"_airbyte_start_at" as valid_from,
	"_airbyte_end_at" as valid_to,
	"_airbyte_active_row" as active_row
	
	
	
from {{  source('pharmacy', 'payment_methods_scd') }} 