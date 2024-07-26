select distinct(wostatus)
from dim_workorders

with

--All workorders count
all_wos_count as (
    select
    --count(workorderid)
    min(wodatecreated)
    from dim_workorders
),

--Only PM related
pm_wos_count as (
    select
    count(workorderid)
    
    from dim_workorders
    where wocategory in ('PM', 'PM CODE', 'PM CONTRACT', 'PM UTILITY') 
),

--Created after 2014
pm_wo_after_2014 as (
    select
    count(workorderid)
    
    from dim_workorders
    where wocategory in ('PM', 'PM CODE', 'PM CONTRACT', 'PM UTILITY') 
    and wodatecreated >= '2014-01-01'
),

--Have a txn associated with it
pm_wo_after_2014_with_txn as (
    select
    count(workorderid)

    from pm_wo_facts_having_txns
),

--Have a txn associated with it AND over $0
pm_wo_after_2014_with_txn as (
    select
    count(workorderid)

    from pm_wo_facts_having_txns
    where amount_spent_material > 0
),

--Between 11 and 5000 in material amount spent
pm_wo_after_2014_with_txn as (
    select
    count(workorderid)

    from pm_wo_facts_having_txns
    where amount_spent_material > 11 and amount_spent_material < 5000
),

--How many txns map to those PMs between 11 and 5000
pm_wo_after_2014_with_txn_count as (
    select
    count(distinct sourcetransactionid)

    from pm_txn_filt
)



select count(workorderid)
from pm_wo_facts_having_txns
where cnt_inv_releases = 1