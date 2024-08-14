-- Paso 1: Crear una tabla temporal
WITH
  tabla_temporal AS (
  SELECT
    more_90_days_overdue,
    default_flag
  FROM
    proyecto3-riesgo-re.riesgo_relativo.consolidado
),

-- Paso 2: Segmentación personalizada
segmentos AS (
SELECT
  more_90_days_overdue,
  default_flag,
  CASE
    WHEN more_90_days_overdue = 0 THEN '00 Sin retrasos'
    WHEN more_90_days_overdue >= 1 AND more_90_days_overdue <= 5 THEN '01 Pocos'
    WHEN more_90_days_overdue >= 5 AND more_90_days_overdue <= 10 THEN '02 Moderados'
    ELSE '03 Muchos'
  END AS num_segmento
FROM
  tabla_temporal
),

-- Paso 3: Calcula total de malos y buenos pagadores por segmento
segment_risk AS (
SELECT
  num_segmento,
  COUNT(*) AS total_count,
  SUM(default_flag) AS total_malos_pagadores,
  COUNT(*) - SUM(default_flag) AS total_buenos_pagadores
FROM
  segmentos
GROUP BY
  num_segmento
),

-- Paso 4: Obtiene el rango mínimo y máximo por segmento
segment_ranges AS (
SELECT
  num_segmento,
  MIN(more_90_days_overdue) AS range_min,
  MAX(more_90_days_overdue) AS range_max
FROM
  segmentos
GROUP BY
  num_segmento
),

-- Paso 5: Calcula el riesgo relativo
risk_relative AS (
SELECT
  s.num_segmento,
  s.total_count,
  s.total_malos_pagadores,
  s.total_buenos_pagadores,
  r.range_min,
  r.range_max,
  CASE
    WHEN s.num_segmento = '00 Sin retrasos' THEN (s1.total_malos_pagadores/s1.total_count)/((s2.total_malos_pagadores+s3.total_malos_pagadores+s4.total_malos_pagadores)/(s2.total_count+s3.total_count+s4.total_count))
    WHEN s.num_segmento = '01 Pocos' THEN (s2.total_malos_pagadores / s2.total_count) / ((s1.total_malos_pagadores + s3.total_malos_pagadores + s4.total_malos_pagadores) / (s1.total_count + s3.total_count + s4.total_count))
    WHEN s.num_segmento = '02 Moderados' THEN (s3.total_malos_pagadores / s3.total_count) / ((s1.total_malos_pagadores + s2.total_malos_pagadores + s4.total_malos_pagadores) / (s1.total_count + s2.total_count + s4.total_count))
    WHEN s.num_segmento = '03 Muchos' THEN (s4.total_malos_pagadores / s4.total_count) / ((s1.total_malos_pagadores + s2.total_malos_pagadores + s3.total_malos_pagadores) / (s1.total_count + s2.total_count + s3.total_count))
  END
  AS riesgo_relativo
FROM
  segment_risk s
JOIN
  segment_ranges r
ON
  s.num_segmento = r.num_segmento
LEFT JOIN
  segment_risk s1
ON
  s1.num_segmento = '00 Sin retrasos'
LEFT JOIN
  segment_risk s2
ON
  s2.num_segmento = '01 Pocos'
LEFT JOIN
  segment_risk s3
ON
  s3.num_segmento = '02 Moderados'
LEFT JOIN
  segment_risk s4
ON
  s4.num_segmento = '03 Muchos'
)

-- Paso 6: Seleccionar los resultados finales
SELECT
  'more 90 days overdue' AS variable,
  num_segmento,
  total_count,
  total_malos_pagadores,
  total_buenos_pagadores,
  riesgo_relativo,
  range_min,
  range_max
FROM
  risk_relative
ORDER BY
  num_segmento ASC;