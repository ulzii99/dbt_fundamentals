{#
    -- let's develop a macro that
    1. queries the information schema of a database 
    2. finds objects that are > 1 week old (no londer maintained)
    3. generateas automated drop statements 
    4. has the ability to execute those drop statements
#}

{%  macro clean_stale_models(database = target.database, schema=target.schema) %}

    {% set variable %}
        select table_type,
            table_schema,
            table_name,
            last_altered
        from {{database}}.information_schema.tables
        where table_schema = upper('{{schema}}')
        {% endset %}

{% endmacro %}