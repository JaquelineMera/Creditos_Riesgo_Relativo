-- Consulta valor máximo de 'riesgo_relativo' por 'variable'
WITH max_riesgo_relativo AS (
  SELECT
    variable,
    MAX(riesgo_relativo) AS max_riesgo_relativo
  FROM
    proyecto3-riesgo-re.riesgo_relativo.rr_tabla_completa
  GROUP BY
    variable
)

SELECT
  r.*
FROM
  proyecto3-riesgo-re.riesgo_relativo.rr_tabla_completa r
JOIN
  max_riesgo_relativo m
ON
  r.variable = m.variable
  AND r.riesgo_relativo = m.max_riesgo_relativo
ORDER BY
  r.variable ASC, r.riesgo_relativo DESC;
