with addresses as (

    select * from {{ ref('stg_addresses')}}

),
physicians as (

    select * from {{ ref('stg_physicians')}}

),
final as (

    select
		ROW_NUMBER() OVER (ORDER BY physicians.physician_id) AS physician_dim_id,
        physicians.physician_key_scd,
		physicians.physician_id,
		physicians.first_name,
		physicians.last_name,
		physicians.gender,
		physicians.date_of_birth,
		physicians.phone_number,
		physicians.salary,
		physicians.education_level,
		physicians.address_id,
		physicians.valid_from,
		physicians.valid_to,
		physicians.active_row,
		addresses.country,
		addresses.city,
		addresses.street,
		addresses.zip_code,
		addresses.num



    from physicians

    left join addresses using (address_id)

)

select * from final