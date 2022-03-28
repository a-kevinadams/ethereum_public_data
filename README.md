### ethereum_public_data
*Exploration of ethereum public data available from Google*

1. data_pipeline folder contains queries used to produce datasets used for analysis
2. explore_queries folder contains queries used to familiarize w/ schema and tables in [bigquery-public-data:crypto_ethereum](https://console.cloud.google.com/bigquery?project=bigquery-public-data&page=dataset&d=crypto_ethereum&p=bigquery-public-data&redirect_from_classic=true)

##### Data Pipeline aggregates as follows:
1. Identify VRF v1 and v2 addresses from [Chainlink VRF docs](https://docs.chain.link/docs/chainlink-vrf/v1/)
2. Look up VRF address on [Etherscan](https://etherscan.io/address/0xf0d54349aDdcf704F77AE15b96510dEA15cb7952) and navigate to transaction which published VRF v1 to Ethereum on [Etherscan](https://etherscan.io/tx/0xc6e4f518b6d86d2cd1944e42e88e2db40fc2f59dd78d87264d7d5b7354625952)
3. Query ethereum transactions tables since VRF v1 launched and filter to transactions involving VRF v1 or v2 addresses, output to BigQuery table
4. Select from output of prior step, inner join to logs on transaction hash, inner join logs to contracts on address
