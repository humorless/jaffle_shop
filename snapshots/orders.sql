{% snapshot orders_snapshot %}

{{
    config(
      target_database='jaffle_shop',
      target_schema='snapshots',
      unique_key='order_id',

      strategy='timestamp',
      updated_at='order_date',
    )
}}


select * from {{ source('raw', 'orders') }}

{% endsnapshot %}
