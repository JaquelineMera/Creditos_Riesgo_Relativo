-- Paso 1: Crear una tabla temporal
WITH
  tabla_temporal AS (
  SELECT
    last_month_salary,
    default_flag
  FROM
    proyecto3-riesgo-re.riesgo_relativo.consolidado
),

-- Paso 2: Calcula los cuartiles por variable 
quartiles AS (
SELECT
  last_month_salary,
  default_flag,
  NTILE(4) OVER (ORDER BY last_month_salary) AS num_quartile
FROM
  tabla_temporal
),

-- Paso 3: Calcula total de malos y buenos pagadores por cuartil 
quartile_risk AS (
SELECT
  num_quartile,
  COUNT(*) AS total_count,
  SUM(default_flag) AS total_malos_pagadores,
  COUNT(*) - SUM(default_flag) AS total_buenos_pagadores
FROM
  quartiles
GROUP BY
  num_quartile
),

-- Paso 4: Obtiene el rango mínimo y máximo por cuartil 
quartile_ranges AS (
SELECT
  num_quartile,
  MIN(last_month_salary) AS range_min,
  MAX(last_month_salary) AS range_max
FROM
  quartiles
GROUP BY
  num_quartile
),

-- Paso 5: Calcula el riesgo relativo 
risk_relative AS (
SELECT
  q.num_quartile,
  q.total_count,
  q.total_malos_pagadores,
  q.total_buenos_pagadores,
  r.range_min,
  r.range_max,
  CASE
    WHEN q.num_quartile = 1 THEN (q1.total_malos_pagadores/q1.total_count)/((q2.total_malos_pagadores+q3.total_malos_pagadores+q4.total_malos_pagadores)/(q2.total_count+q3.total_count+q4.total_count))
    WHEN q.num_quartile = 2 THEN (q2.total_malos_pagadores / q2.total_count) / ((q1.total_malos_pagadores + q3.total_malos_pagadores + q4.total_malos_pagadores) / (q1.total_count + q3.total_count +q4.total_count))
    WHEN q.num_quartile = 3 THEN (q3.total_malos_pagadores / q3.total_count) / ((q1.total_malos_pagadores + q2.total_malos_pagadores + q4.total_malos_pagadores) / (q1.total_count + q2.total_count +q4.total_count))
    WHEN q.num_quartile = 4 THEN (q4.total_malos_pagadores / q4.total_count) / ((q1.total_malos_pagadores + q2.total_malos_pagadores + q3.total_malos_pagadores) / (q1.total_count + q2.total_count +q3.total_count))
END
  AS riesgo_relativo
FROM
  quartile_risk q
JOIN
  quartile_ranges r
ON
  q.num_quartile = r.num_quartile
LEFT JOIN
  quartile_risk q1
ON
  q1.num_quartile = 1
LEFT JOIN
  quartile_risk q2
ON
  q2.num_quartile = 2
LEFT JOIN
  quartile_risk q3
ON
  q3.num_quartile = 3
LEFT JOIN
  quartile_risk q4
ON
  q4.num_quartile = 4
)

-- Paso 6: Seleccionar los resultados finales
SELECT
  'last month salary' AS variable,
  num_quartile,
  total_count,
  total_malos_pagadores,
  total_buenos_pagadores,
  riesgo_relativo,
  range_min,
  range_max
FROM
  risk_relative
ORDER BY
  num_quartile ASC;
