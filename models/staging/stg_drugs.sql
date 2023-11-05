select 
	"_airbyte_unique_key_scd" as drug_key_scd,
	"ID" as drug_id,
	"NAME" as name,
	"description" as description,
	"price" as price,
	"category_id" as category_id,
	"company_id" as company_id,
	"_airbyte_start_at" as valid_from,
	"_airbyte_end_at" as valid_to,
	"_airbyte_active_row" as active_row
	
	
	
from {{  source('pharmacy', 'drugs_scd') }} 