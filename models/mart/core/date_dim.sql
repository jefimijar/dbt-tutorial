with prescriptions as (

    select * from {{ ref('stg_prescriptions')}}

),

final as (

    select
		ROW_NUMBER() OVER (ORDER BY prescriptions.prescription_id) AS date_dim_id,
		prescriptions.prescription_key_scd,
        prescriptions.transaction_date,
		EXTRACT(YEAR FROM prescriptions.transaction_date) AS year,
		EXTRACT(MONTH FROM prescriptions.transaction_date) AS month,
		EXTRACT(DAY FROM prescriptions.transaction_date) AS day,
		CASE
			WHEN EXTRACT(MONTH FROM prescriptions.transaction_date) BETWEEN 1 AND 3 THEN 1
			WHEN EXTRACT(MONTH FROM prescriptions.transaction_date) BETWEEN 4 AND 6 THEN 2
			WHEN EXTRACT(MONTH FROM prescriptions.transaction_date) BETWEEN 7 AND 9 THEN 3
			WHEN EXTRACT(MONTH FROM prescriptions.transaction_date) BETWEEN 10 AND 12 THEN 4
		END AS quarter
		


    from prescriptions


)

select * from final

