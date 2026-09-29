create database aml_analysis;
use aml_analysis;
show tables;
describe aml_transactions;
select* from
aml_transactions
limit 10;
select count(*) as total_rows
from aml_transactions;
show columns from aml_transactions;
select count(*) as total_records from aml_transactions;
select
 'Is_laundering',
 count(*) as transaction_count
 from aml_transactions
 group by 'Is_laundering';
 select distinct 'Is_laundering'
 from aml_transactions;
 select Is_laundering
 from aml_transactions
 limit 10;
 describe aml_transactions;
 select 'Is_laundering' , count(*) as total from aml_transactions
 group by 'Is_laundering';
 use aml_analysis;
 describe aml_transactions;
 select 
    'Is_laundering',
    count(*) as transaction_count
    from aml_transactions
    group by Is_laundering;
    # LAUNDERING RATE
    select 
      count(*) as total_transactions,
       sum(Is_laundering) as laundering_transactions,
         round(sum(Is_laundering)* 100.0/count(*),2) as laundering_rate
         from aml_transactions;
         #PAYMENT TYPE ANALYSIS
         select
           payment_type, count(*)  as total_transactions,
           sum(Is_laundering) as laundering_transactions
           from aml_transactions
           group by payment_type
           order by laundering_transactions desc;
           # LAUNDERING TRANSACTIONS
           select * from aml_transactions
           where Is_laundering = 1;
           #LAUNDERING TYPE ANALYSIS
           select 
             laundering_type,
             count(*) as transaction_count
             from aml_transactions
             where Is_laundering = 1
             group by laundering_type;
             #SENDER BANK LOCATION ANALYSIS
             select sender_bank_location,
              count(*) as total_transactions,
              sum(Is_laundering) as laudering_transactions
              from aml_transactions
              group by sender_bank_location
              order by total_transactions desc;
              #RECEIVER BANK LOCATION ANALYSIS
              select receiver_bank_location,
              count(*) as total_transactions,
              sum(Is_laundering) as laundering_transactions
              from aml_transactions
              group by receiver_bank_location
              order by total_transactions desc;
              #DATE ANALYSIS
    select date,
    count(*) as total_transactions,
    sum(Is_laundering) as laundering_transactions
    from aml_transactions
    group by date
    order by total_transactions desc;
    # TIME ANALYSIS
    select time,
     count(*) as total_transactions,
     sum(Is_laundering) as laundering_transactions
     from aml_transactions
     group by time
     order by total_transactions desc;
     # PAYMENT TYPE LAUNDERING RATE
     select payment_type,
     count(*) as total_transactions,
     sum(Is_laundering) as laundering_transactions,
     round(sum(Is_laundering)*100.0/count(*),2) as laundering_rate
     from aml_transactions
     group by payment_type
     order by laundering_rate desc;
      # SENDER RECEIVER LOCATION PAIRS
      select sender_bank_location,
      receiver_bank_location,
      count(*) as total_transactions,
      sum(Is_laundering) as laundering_transactions
      from aml_transactions
      group by sender_bank_location, receiver_bank_location
      order by total_transactions desc;
      # MOST FREQUENT TRANSACTION ROUTES
      select sender_bank_location,receiver_bank_location,
      count(*) as total_transactions from aml_transactions
      group by sender_bank_location, receiver_bank_location
      order by total_transactions desc limit 10;
      # PAYMENT TYPE + LAUNDERING TYPE
      select payment_type, laundering_type,
      count(*) as transaction_count
      from aml_transactions
      where Is_laundering = 1
      group by payment_type, laundering_type
      order by transaction_count desc;
      # HIGH VOLUME SENDER LOCATIONS
      select sender_bank_location,
      count(*) as total_transactions
      from aml_transactions
      group by sender_bank_location
      having count(*) > 50
      order by total_transactions desc;
      #RANK SENDER LOCATIONS
      select sender_bank_location,
      count(*) as total_transactions,
      dense_rank() over( order by count(*) desc) as location_rank
      from aml_transactions
      group by sender_bank_location;
      #RANK PAYMENT TYPES BY TRANSACTION VOLUME
      select payment_type,
      count(*) as total_transactions,
      dense_rank() over ( order by count(*) desc ) as payment_rank
      from aml_transactions
      group by payment_type;
      # FINAL AML SUMMARY
      select 
      count(*) as totall_transactions,
      sum(Is_laundering) as laundering_transactions,
      count(*)- sum(Is_laundering) as non_laundering_transactions,
      round(sum(Is_laundering) * 100.0 / count(*),2) as laundering_rate 
      from aml_transactions;
              
             
    
 
 
 
 
