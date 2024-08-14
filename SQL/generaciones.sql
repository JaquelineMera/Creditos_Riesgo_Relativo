SELECT
  user_id,
  EXTRACT(YEAR
  FROM
    CURRENT_DATE()) - age AS birth_year,
  CASE
    WHEN EXTRACT(YEAR FROM CURRENT_DATE()) - age >= 2011 THEN 'Generacion Alpha'
    WHEN EXTRACT(YEAR
  FROM
    CURRENT_DATE()) - age BETWEEN 1994
  AND 2010 THEN 'Generacion Z'
    WHEN EXTRACT(YEAR FROM CURRENT_DATE()) - age BETWEEN 1981 AND 1993 THEN 'Millenials'
    WHEN EXTRACT(YEAR
  FROM
    CURRENT_DATE()) - age BETWEEN 1969
  AND 1980 THEN 'Generacion X'
    ELSE 'Baby Boomers'
END
  AS generational_group
FROM
  `proyecto3-riesgo-re.riesgo_relativo.user_info_flag_l`
ORDER BY
  user_id