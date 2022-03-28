-- Daily time series with VRF coordinator transactions
select 
    date(block_timestamp) as block_date, 
    count(distinct from_address) as distinct_from_addy_vrf_calls,
    count(case when to_address = '0xf0d54349addcf704f77ae15b96510dea15cb7952' then from_address else null end) as vrf_v1_calls,
    count(case when to_address = '0x271682deb8c4e0901d1a1550ad2e64d568e69909' then from_address else null end) as vrf_v2_calls
from `astral-chassis-344516.eth_vrf.vrf_trans` 
group by block_date
order by block_date
