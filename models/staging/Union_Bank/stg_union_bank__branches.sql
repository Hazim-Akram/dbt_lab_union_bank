with raw_branches as (
    select * from {{ source('union_bank', 'Branch') }}
),

staged as (
    select
        BranchId as branch_id,
        BranchName as branch_name,
        Branch_Location as branch_location
    from raw_branches
)

select * from staged