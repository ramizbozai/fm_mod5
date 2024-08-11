### This readme serves as a guide for the scripts contained in this repo. ###

The SQL scripts helped prepare and shape data to be used in the 3 python notebooks that drove the value-add sections of our presentation to UVA Facilities Management.  At its core, the work presented here demonstrates the value that can be extracted from mining free-text data like workorder and transaction descriptions to "manufacturer" unique categories to predict spend and ultimately drive cost savings.

#### SQL/Feature engineering code: ####

**1. Create workorder facts having txns:** For creating the population of workorders with a 'PM' WO Category that were created on or after Jan 1, 2014. In addition, the "facts" are additional variables that we used in model training.  
**2. Create PM WO Filt Pop:** Creates a table with Workorder IDs that have material spend amounts between $11 and $5,000 (bounds we decided upon to trim outliers).  
**3. Create PM WO Phase Data:**  For creating the population of workorders and their phases with a 'PM' WO Category that were created on or after Jan 1, 2014. Items like the property description, start and end dates, the asset phase group, and labor vs. material transaction amounts.  
**4. Create PM TXN Filt:** To obtain the transaction data based on the filtered PM population.  This data was fed into the transaction (TRXN) NLP text classification and TRXN time series predictive models.  

#### Python/Predictive code: ####
**5. Filtered_ NLP Category model:** This python notebook reads in the data from the table identified in #1, trims to the dollar amount outliers (identified in #2), and creates "topics" based on the WO description. The LLM used for this is BERT, a popular language model. The value in this is taking free-text WO descriptions and assigning "buckets" to analyze the data in a different way.  
**6. TRXN _NLP Category model:** This python notebook uses the data identified in #4 above, subsets to only material-related transactions, and assigns "topics" based on the transaction description. The LLM used for this is also BERT.  
**7. TRXN_TimeSeries:** This python notebook is used to form the time series to predict material spend based on transaction categories which were formed in the notebook identified in #6.  An ETS time series model was built, specifically for batteries in this example.
