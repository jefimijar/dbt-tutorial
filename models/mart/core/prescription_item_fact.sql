with drugs as (

    select * from {{ ref('stg_drugs')}}

),
prescriptions as (

    select * from {{ ref('stg_prescriptions')}}

),
prescription_items as (

    select * from {{ ref('stg_prescription_items')}}

),
final as (

    select
		prescription_items.prescription_id,
		prescription_items.drug_id,
		prescription_items.quantity,
		drugs.price as unit_price,
		prescriptions.patient_id,
		prescriptions.physician_id,
		prescriptions.pharmacy_id,
		prescriptions.payment_method_id,
		prescriptions.code as prescription_code,
		prescriptions.transaction_date,
		quantity * price as total_price 



    from prescription_items

    left join prescriptions using (prescription_id)
	left join drugs using (drug_id)

)

select * from final