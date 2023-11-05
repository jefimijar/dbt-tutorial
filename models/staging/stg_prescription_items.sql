select 
	"_airbyte_unique_key_scd" as prescription_items_key_scd,
	"prescription_id" as prescription_id,
	"drug_id" as drug_id,
	"quantity" as quantity,
	"_airbyte_start_at" as valid_from,
	"_airbyte_end_at" as valid_to,
	"_airbyte_active_row" as active_row
	
	
	
from {{  source('pharmacy', 'prescription_items_scd') }} 