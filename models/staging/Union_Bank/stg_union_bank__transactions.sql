with raw_transactions as (
    select * from {{ source('union_bank', 'transactions_ATM_Account') }}
),

staged as (
    select
        -- 1. Identifiers (Casting to standard integers/strings)
        cast(TransactionId as int) as transaction_id,
        cast(TransactionTypeId as int) as transaction_type_id,
        cast([Account Number] as varchar(50)) as account_number,
        cast([ATM ID] as int) as atm_id,

        -- 2. Financial Metrics (Explicit decimal precision)
        cast(Amount as decimal(18, 2)) as transaction_amount,

        -- 3. Datetime Casting
        cast(TransactionDate as datetime) as transacted_at

    from raw_transactions
)

select * from staged