with addresses as (

    select * from {{ ref('stg_addresses')}}

),
pharmacies as (

    select * from {{ ref('stg_pharmacies')}}

),
final as (

    select
		ROW_NUMBER() OVER (ORDER BY pharmacies.pharmacy_id) AS pharmacy_dim_id,
        pharmacies.pharmacy_key_scd,
		pharmacies.pharmacy_id,
		pharmacies.name,
		pharmacies.phone_number,
		pharmacies.address_id,
		pharmacies.valid_from,
		pharmacies.valid_to,
		pharmacies.active_row,
		addresses.country,
		addresses.city,
		addresses.street,
		addresses.zip_code,
		addresses.num



    from pharmacies

    left join addresses using (address_id)

)

select * from final