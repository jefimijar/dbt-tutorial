with payment as (

    select * from {{ ref('stg_payment')}}

),

final as (

    select
		ROW_NUMBER() OVER (ORDER BY payment.payment_method_id) AS payment_method_dim_id,
		payment.payment_key_scd,
		payment.payment_method_id,
		payment.name,
		payment.valid_from,
		payment.valid_to,
		payment.active_row
		


    from payment


)

select * from final
