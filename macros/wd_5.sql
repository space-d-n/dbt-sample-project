{% macro wd_5(period) %}

{% set query %}
    select WD5 from raw.test.calendar
    where period = {{period}}
{% endset %}

{% if execute %}
    {% set results=run_query(query).columns[0].values()[0] %}
    {{ log('SQL results ' ~ results, info=True) }}
    where current_date = {{results}}
{% else %}
    where false
{% endif %}
    
{% endmacro %}