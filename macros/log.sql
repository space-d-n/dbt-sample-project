{% macro log2(msg) -%}
     {{ log("period - " ~ msg, info=True) }}
{%- endmacro %}