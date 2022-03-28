with txn as (
    SELECT `hash`, to_address, date(block_timestamp) as block_date
    FROM `astral-chassis-344516.eth_vrf.vrf_trans`
)
, lgs as (
    select transaction_hash, address as address_logs
    from `bigquery-public-data.crypto_ethereum.logs`
    where date(block_timestamp) >= date(2020, 8, 26)
)
, cnt as (
    select address as address_cntrct, is_erc20, is_erc721
    from `bigquery-public-data.crypto_ethereum.contracts`
)

select 
    transaction_hash, txn.to_address, address_logs, address_cntrct, is_erc20, is_erc721
from txn
inner join lgs
    on txn.`hash` = lgs.transaction_hash
inner join cnt
    on lgs.address_logs = cnt.address_cntrct 
