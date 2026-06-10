{{ config(materialized='ephemeral') }}

SELECT 
    m.movie_id,
    m.movie_title,
    m.genre_array,
    m.genres,
    t.tag_id,
    t.tag_name,
    s.relevance_score
FROM {{ ref('dim_movies') }} m
LEFT JOIN {{ ref('fct_genome_scores') }} s 
    ON m.movie_id = s.movie_id
LEFT JOIN {{ ref('dim_genome_tags') }} t 
    ON s.tag_id = t.tag_id

WITH movies AS (
    SELECT *
    FROM {{ ref('dim_movies') }}
),

tags AS (
    SELECT *
    FROM {{ ref('dim_genome_tags') }}
),

scores AS (
    SELECT *
    FROM {{ ref('fct_genome_scores') }}
)

SELECT 
    m.movie_id,
    m.movie_title,
    m.genre_array,
    m.genres,
    t.tag_id,
    t.tag_name,
    s.relevance_score
FROM movies m
LEFT JOIN scores s 
    ON m.movie_id = s.movie_id  
LEFT JOIN tags t 
    ON s.tag_id = t.tag_id

