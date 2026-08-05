with raw_accounts as (
    select * from {{ source('union_bank', 'Account') }}
),

staged as (
    select
        [Account Number] as account_number,
        [Customer ID] as customer_id,
        [Branch ID] as branch_id,
        [Account Type] as account_type,
        Balance as balance,
        Status as status
    from raw_accounts
)

select * from staged