-- Paso 1: Crear una tabla temporal
WITH
  tabla_temporal AS (
  SELECT
    debt_ratio,
    default_flag
  FROM
    proyecto3-riesgo-re.riesgo_relativo.consolidado
),

-- Paso 2: Segmentación personalizada
segmentos AS (
SELECT
  debt_ratio,
  default_flag,
  CASE
    WHEN debt_ratio = 0.00 THEN '00 Sin uso'
    WHEN debt_ratio < 0.40 THEN '01 Bajo'
    WHEN debt_ratio >= 0.40 AND debt_ratio <= 0.60 THEN '02 Medio'
    WHEN debt_ratio >= 0.60 AND debt_ratio <= 1 THEN '03 Alto'
    ELSE '04 Extraordinario'
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
  MIN(debt_ratio) AS range_min,
  MAX(debt_ratio) AS range_max
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
    WHEN s.num_segmento = '00 Sin uso' THEN (s1.total_malos_pagadores/s1.total_count)/((s2.total_malos_pagadores+s3.total_malos_pagadores+s4.total_malos_pagadores+s5.total_malos_pagadores)/(s2.total_count+s3.total_count+s4.total_count+s5.total_count))
    WHEN s.num_segmento = '01 Bajo' THEN (s2.total_malos_pagadores / s2.total_count) / ((s1.total_malos_pagadores + s3.total_malos_pagadores + s4.total_malos_pagadores + s5.total_malos_pagadores) / (s1.total_count + s3.total_count + s4.total_count + s5.total_count))
    WHEN s.num_segmento = '02 Medio' THEN (s3.total_malos_pagadores / s3.total_count) / ((s1.total_malos_pagadores + s2.total_malos_pagadores + s4.total_malos_pagadores + s5.total_malos_pagadores) / (s1.total_count + s2.total_count + s4.total_count + s5.total_count))
    WHEN s.num_segmento = '03 Alto' THEN (s4.total_malos_pagadores / s4.total_count) / ((s1.total_malos_pagadores + s2.total_malos_pagadores + s3.total_malos_pagadores + s5.total_malos_pagadores) / (s1.total_count + s2.total_count + s3.total_count + s5.total_count))
    WHEN s.num_segmento = '04 Extraordinario' THEN (s5.total_malos_pagadores / s5.total_count) / ((s1.total_malos_pagadores + s2.total_malos_pagadores + s3.total_malos_pagadores + s4.total_malos_pagadores) / (s1.total_count + s2.total_count + s3.total_count + s4.total_count))
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
  s1.num_segmento = '00 Sin uso'
LEFT JOIN
  segment_risk s2
ON
  s2.num_segmento = '01 Bajo'
LEFT JOIN
  segment_risk s3
ON
  s3.num_segmento = '02 Medio'
LEFT JOIN
  segment_risk s4
ON
  s4.num_segmento = '03 Alto'
LEFT JOIN
  segment_risk s5
ON
  s5.num_segmento = '04 Extraordinario'
)

-- Paso 6: Seleccionar los resultados finales
SELECT
  'debt ratio' AS variable,
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
