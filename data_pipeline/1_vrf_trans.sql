-- Trans with VRF coordinator (v1 & v2) as the to_address in transactions
select *
from `bigquery-public-data.crypto_ethereum.transactions` 
where 1=1
    --sample
    -- and block_timestamp >= timestamp("2022-03-25 00:00:00")
    --Historical backfill
    and block_timestamp >= timestamp("2020-08-26 00:00:00")
    and (to_address = '0x271682deb8c4e0901d1a1550ad2e64d568e69909' OR
         to_address = '0xf0d54349addcf704f77ae15b96510dea15cb7952')
