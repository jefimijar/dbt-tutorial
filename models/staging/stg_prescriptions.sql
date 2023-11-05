select 
	"_airbyte_unique_key_scd" as prescription_key_scd,
	"ID" as prescription_id,
	"patient_id" as patient_id,
	"physician_id" as physician_id,
	"pharmacy_id" as pharmacy_id,
	"payment_method_id" as payment_method_id,
	"code" as code,
	"transaction_date" as transaction_date,
	"_airbyte_start_at" as valid_from,
	"_airbyte_end_at" as valid_to,
	"_airbyte_active_row" as active_row
	
	
	
from {{  source('pharmacy', 'prescriptions_scd') }} 