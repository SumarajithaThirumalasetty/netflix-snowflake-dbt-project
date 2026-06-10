WITH src AS (
    SELECT *
    FROM MOVIELENS.RAW.RAW_GENOME_TAGS
)

SELECT
    tagid AS tag_id,
    tag
FROM src