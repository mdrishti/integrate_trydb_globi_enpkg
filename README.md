This repository contains scripts for integrating species and subsequent traits data from trydb with taxonomic ids from gbif, otol, ncbi and wikidata. At the moment, data for only 25 traits was downloaded from TRY-db. Subsequently, the traits metadata was retrieved from TRY-db website and a subset of enpkg was also retrieved. The csv files retrieved were converted to duckdb (adavnatge: on-disk approach for sql queries). 

NOTE: the trydbAll table containing the datasets from the TRY-db is a subset of the actual data.

**I. Prerequisites:**

1. For smooth running of the scripts (R,shell), install R (version 4.1.2) and the following R-packages :

a) For accessing taxonomic ids from wikidata, with mappings from gbif and ncbi (taxizedb) and from open treel of life (rotl)
`install.packages(c("taxizedb", "rotl"))`

b) For data manipulation, install dplyr and dbplyr (backend wrapper to convert dplyr code into SQL)
`install.packages(c("dplyr", "dbplyr"))`

c) For the on-disk approach of accessing and querying databases, duckdb's API client for R
`install.packages("duckdb")`

and [duckdb](https://duckdb.org/docs/installation/?version=stable&environment=cli&platform=linux&download_method=package_manager)

d) For building a Virtual Knowledge Graph (VKG), download [Ontop-cli/Ontop-protege bundle (version 5.1.2)](https://github.com/ontop/ontop/releases/tag/ontop-5.1.2)

2. For converting ontology files (e.g.: owl to ttl), install [robot](https://github.com/ontodev/robot/releases/tag/v1.9.5).

3. If you are not working on linux, then also install sqlite3 package (comes by default with ubuntu).

**II.Script to map the TRY plant species name to the gbif, ncbi, wikidata and otol ids**

`Rscript matchTaxonomy.R`

**III.Script to build a duckdb database for Ontop and build the knowledge graph**

`duckdb data/Ontop_input.db -c "IMPORT DATABASE 'data/trydbtemp_Ontop'"` or 

`sh run_duckdb.sh`

**IV.Script to build the knowledge graph in Ontop**   
`#Set the path in data/Ontop_config/duckdb.properties` 

`sh run_ontop.sh`

**Disclaimer**

Tha mappings in the ontop virtual knowledge graph are faulty at the moment. Therefore, the SPARQL query does not result in correct results. Work in progress...
