select 
	"_airbyte_ab_id" as airbyte_ab_id,
	"ID" as company_id,
	"NAME" as company_name
	
	
from {{  source('pharmacy', 'companies') }} 