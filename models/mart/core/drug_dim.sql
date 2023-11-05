with drugs as (

    select * from {{ ref('stg_drugs')}}

),
companies as (

    select * from {{ ref('stg_companies')}}

),
categories as (

    select * from {{ ref('stg_categories')}}

),
final as (

    select
		ROW_NUMBER() OVER (ORDER BY drugs.drug_id) AS drug_dim_id,
        drugs.drug_key_scd,
		drugs.drug_id,
		drugs.name,
		drugs.description,
		drugs.price,
		drugs.category_id,
		drugs.company_id,
		drugs.valid_from,
		drugs.valid_to,
		drugs.active_row,
		companies.company_name,
		categories.category_name,
		categories.category_description



    from drugs

    left join companies using (company_id)
	left join categories using (category_id)

)

select * from final