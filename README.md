This readme serves as a guide for the scripts contained in this repo. 
1. Create workorder facts having txns: A SQL CTAS script for creating the population of workorders with a 'PM' WO Category that were created on or after Jan 1, 2014. In addition, the   The "facts" are additional variables that we used in model training.
2. Create PM WO Filt Pop: This CTAS script creates a table with Workorder IDs that have material spend amounts between $11 and $5,000 (bounds we decided upon to trim outliers).
