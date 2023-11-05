select 
	"_airbyte_ab_id" as airbyte_ab_id,
	"ID" as category_id,
	"NAME" as category_name,
	"description" as category_description
	
	
from {{  source('pharmacy', 'categories') }} 