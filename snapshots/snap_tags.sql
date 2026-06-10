{% snapshot snap_tags %}

{{
    config(
        target_schema='DEV_DEV',
        unique_key='row_key',
        strategy='check',
        check_cols=['tag']
    )
}}

SELECT 
    {{ dbt_utils.generate_surrogate_key(['user_id','movie_id','tag']) }} AS row_key,
    user_id,
    movie_id,
    tag,
    CAST(tag_timestamp AS TIMESTAMP_NTZ) AS tag_timestamp
FROM {{ ref('src_tags') }}

{% endsnapshot %}