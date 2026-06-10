WITH src AS (
    SELECT *
    FROM MOVIELENS.RAW.RAW_GENOME_SCORES
)

SELECT
    movieid AS movie_id,
    tagid AS tag_id,
    relevance
FROM src