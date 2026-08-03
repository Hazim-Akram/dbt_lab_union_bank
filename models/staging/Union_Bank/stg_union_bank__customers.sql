with raw_customers as (
    select * from {{ source('union_bank', 'Customer') }}
),

staged as (
    select
        Customer_ID as customer_id,
        [First Name] as first_name,
        [Last Name] as last_name,
        Email as email,
        State as state,
        Age as age,
        Gender as gender,
        BD as birth_date
    from raw_customers
)

select * from staged