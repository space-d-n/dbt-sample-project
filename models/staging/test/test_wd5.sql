{{config(materialized='incremental')}}

select * from {{source('jaffle_shop', 'orders')}}

{% if execute %}

    {% if var('period', 'current_date') != 'current_date' %}
    
        {% set period = var('period', 'current_date') %}
        {{ log("1. period - " ~ period, info=True) }}

        where
    
        {#{% if execute %}{%- set day_diff =  'datediff(day, order_date, last_day(dateadd(month, -1, "{{period}}"' %}{% endif %}#}

    {% else %}

        {% set period = 'current_date' %}
        {{ log("2. period - " ~ period, info=True) }}

        {%- set wd5 = dbt_utils.get_column_values(table=source('test', 'calendar'), column='wd5', where = 'period = to_varchar(current_date, '"'"'yyyyMM'"'"')') -%}
        where {{period}} = to_date({{wd5}}[0]) and

    {% endif %}

{% endif %}

{{day_diff('order_date', period)}} <= 7
and {{day_diff('order_date', period)}} >= 0
