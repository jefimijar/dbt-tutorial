with addresses as (

    select * from {{ ref('stg_addresses')}}

),
patients as (

    select * from {{ ref('stg_patients') }}

),
final as (

    select
		ROW_NUMBER() OVER (ORDER BY patients.patient_id) AS patient_dim_id,
        patients.patient_key_scd,
		patients.patient_id,
		patients.first_name,
		patients.last_name,
		patients.gender,
		patients.date_of_birth,
		patients.phone_number,
		patients.address_id,
		patients.valid_from,
		patients.valid_to,
		patients.active_row,
		addresses.country,
		addresses.city,
		addresses.street,
		addresses.zip_code,
		addresses.num



    from patients

    left join addresses using (address_id)

)

select * from final