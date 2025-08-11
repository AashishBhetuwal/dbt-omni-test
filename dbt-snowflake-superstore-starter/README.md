# dbt project for Snowflake — SUPERSTORE_DATA.SUPERSTORE

This starter is tailored to your Snowflake schema. It:
- Declares sources for `SUPERSTORE_DATA.SUPERSTORE`
- Builds an enriched model `FCT_ORDERS_ENRICHED` joining ORDERS to CUSTOMERS (and adds PRODUCT fields if needed later)
- Tags `CUSTOMER` as PII for future governance demos

## Use in dbt Cloud
1) Create/connect a dbt Cloud project to this Git repo.
2) In **Deploy → Environments → Credentials**, set:
   - Account: your Snowflake account locator (from URL)
   - Role: role with SELECT on `SUPERSTORE_DATA.SUPERSTORE` and CREATE on the build schema
   - Warehouse: e.g. COMPUTE_WH
   - Database: `SUPERSTORE_DATA`
   - Schema: `ANALYTICS` (or another build schema; dbt will create it)
3) Open the IDE and run **Build** (or `dbt run`).
4) You should see `SUPERSTORE_DATA.ANALYTICS.FCT_ORDERS_ENRICHED`.

## Files
- `dbt_project.yml` — base config
- `models/sources.yml` — declares SUPERSTORE sources
- `models/fct_orders_enriched.sql` — sample join model
- `models/schema.yml` — docs and `meta.contains_pii: true` on CUSTOMER
