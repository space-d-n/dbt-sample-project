{% macro limit_in_dev(limit_col, day_num = 3) -%}

{% if target.name == 'dev' %}
    where {{limit_col}} >= dateadd('day', -{{day_num}}, current_timestamp)
{% endif %}

{% endmacro %}