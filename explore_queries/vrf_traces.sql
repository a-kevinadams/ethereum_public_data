--what other info do we have in traces table?
SELECT *
FROM `bigquery-public-data.crypto_ethereum.traces` 
WHERE DATE(block_timestamp) >= "2022-03-26"
   and (from_address = '0xf0d54349addcf704f77ae15b96510dea15cb7952' or 
         from_address = '0x271682deb8c4e0901d1a1550ad2e64d568e69909')
-- sample trans for deep diving into an example
   -- AND transaction_hash = '0x8d02f8b40a7fdede01ddb2f1621654c73fe1eb59517b1ea057a102046423d9f3'


--time series to compare against transactions data
SELECT DATE(block_timestamp) as block_date, count(distinct transaction_hash)
FROM `bigquery-public-data.crypto_ethereum.traces` 
WHERE DATE(block_timestamp) >= "2022-03-26"
   and (from_address = '0xf0d54349addcf704f77ae15b96510dea15cb7952' or 
         from_address = '0x271682deb8c4e0901d1a1550ad2e64d568e69909') 
group by block_date
order by block_date
