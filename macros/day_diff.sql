{% macro day_diff(order_date, period = 'current_date') -%}
    {% if period == 'current_date' %}
        datediff(day, {{order_date}}, last_day(dateadd(month, -1, current_date)))
    {% else %}
        datediff(day, {{order_date}}, last_day(dateadd(month, -1, '{{period}}')))
    {% endif %}
{%- endmacro %}