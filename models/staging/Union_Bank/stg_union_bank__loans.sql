with raw_loans as (
    select * from {{ source('union_bank', 'Loan') }}
),

staged as (
    select
        -- Identifiers
        cast(LoanID as int) as loan_id,
        cast([Customer ID] as int) as customer_id,
        cast([Branch ID] as int) as branch_id,

        -- Loan Attributes
        cast([Loan Type] as varchar(50)) as loan_type,
        cast([Loan Months Terms] as int) as loan_term_months,
        cast([Interest Rate] as decimal(5, 4)) as interest_rate,

        -- Financial Metrics
        cast(Amount as decimal(18, 2)) as loan_amount,

        -- Dates
        cast([Start Date] as date) as started_at,
        cast([End Date] as date) as ended_at

    from raw_loans
)

select * from staged