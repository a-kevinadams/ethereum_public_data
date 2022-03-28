--Can we get tokens associated with contracts in the logs table? 
   --we have all the MonsterBlocks, but I'm not seeing tokens for other NFT collections that used VRF...
SELECT ctct.to_address, tkn.address, symbol, name, trans_cnt
 FROM (
   SELECT DISTINCT to_address, address_cntrct, count(*) as trans_cnt
   FROM `astral-chassis-344516.eth_vrf.vrf_transLogsContracts` 
   GROUP BY to_address, address_cntrct
 ) ctct
 JOIN (select * from `bigquery-public-data.crypto_ethereum.tokens`) tkn
    ON ctct.address_cntrct = tkn.address
 ORDER BY trans_cnt desc --ctct.to_address, symbol
