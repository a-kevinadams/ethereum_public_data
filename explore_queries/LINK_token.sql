--LINK token held by VRF contract addresses '0x514910771af9ca656af840dff83e8264ecf986ca'

SELECT * 
FROM `bigquery-public-data.crypto_ethereum.tokens`
WHERE symbol  = 'LINK'
ORDER BY address
