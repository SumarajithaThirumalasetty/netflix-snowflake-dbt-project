WITH raw_movies AS (
    SELECT * 
    FROM MOVIELENS.RAW.RAW_MOVIES
)

SELECT 
    movieid AS movie_id,
    title,
    genres
FROM raw_movies