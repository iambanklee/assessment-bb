## Bookingbug assessment

This is the sample project which implements [Sample TV SMS voting campaigns](https://github.com/iambanklee/sample_tv_sms_voting_campaigns)

## Structure
### 1. Parsing votes
1. Create a Vote class under /lib to encapsulate how the data (votes.txt) are parsed and validated based on the [parsing rules](https://github.com/iambanklee/sample_tv_sms_voting_campaigns#parsing-rules)

### 2. Importing votes
1. Create a VoteImportService to import votes.txt to database which encapsulates how the scores are counted
2. It imports votes if the vote is a valid record and pre-calculates the scores of the campaigns and save them into the campaigns table as a cache.
3. The main reason to have campaigns table is it improves the page loading speed to provide better user experience as there are many records so if it calculates the scores on the fly then may cause slower page loading speed if there are many user are checking the results. (I think it is quite common that users check the voting result, for example, the BGT live show)

#### The command line to import votes
```ruby
# Import votes and pre-calculate the scores
rake import_votes:import

# Reset votes and campaigns
rake import_votes:reset

# Reload all votes (will reset all votes and campaigns then import votes again)
rake import_votes:reload
```
### 3. Campaigns summary
Click [here](http://bookingbug.banklee.co.uk/)  to view all campaigns 

### 4. Campaign details
Click [here](http://bookingbug.banklee.co.uk/campaigns/ssss_uk_02A/details) to view the details of one of these campaigns
