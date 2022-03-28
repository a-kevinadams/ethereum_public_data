-- VRF Coordinator addresses in contracts table (defines start date for trans table query)
SELECT *
FROM `bigquery-public-data.crypto_ethereum.contracts` 
WHERE 
    -- VRF v1 addy
    block_timestamp between timestamp("2020-08-26 01:00:00") and timestamp("2020-08-28 01:00:00")
    and address = '0xf0d54349addcf704f77ae15b96510dea15cb7952'
    -- VRF v2 addy
    -- block_timestamp between timestamp("2022-01-06 01:00:00") and timestamp("2022-01-08 01:00:00")
    -- and address = '0x271682deb8c4e0901d1a1550ad2e64d568e69909'
