{% set database = target.database %}
{% set schema = target.schema %}

select table_type,
    table_schema,
    table_name,
    last_altered,
    case when table_type = 'VIEW' then 'VIEW' else 'TABLE' end as object_type,
    'DROP ' || object_type || ' ' || '{{database | upper}}' || '.' || table_schema || '.' || table_name || ';' as drop_statement 
from {{database}}.information_schema.tables
where table_schema = upper('{{schema}}')
 and date(last_altered) <= date(dateadd('day', -5, current_date()))
order by 4 desc


