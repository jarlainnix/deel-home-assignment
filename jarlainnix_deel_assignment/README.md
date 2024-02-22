Welcome to your new dbt project!

### Using the starter project

Try running the following commands:

- dbt run
- dbt test

### Resources:

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

## Notes

I have setup a bigquery account, installed dbt-core locally and connected it via service-account.
Then I uploaded the CSV files into automatic schema finding tables in a `deel_data` dataset in Bigquery.

In dbt, after creating the initial base models, I started doing some exploration. I transposed the rates JSON column into their own columns for easier rate calculations. I renamed the columns for better understanding and visibility prefixing the appropriate source table with some column names that were repeated among other sources.

## Preliminary data exploration

We have two source tables w
