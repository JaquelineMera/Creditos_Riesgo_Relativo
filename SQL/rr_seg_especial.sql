-- Unir las tres tablas y ordenar por variable y num_segmento
SELECT * FROM proyecto3-riesgo-re.riesgo_relativo.rr_debt_segmentacion_especial
UNION ALL
SELECT * FROM proyecto3-riesgo-re.riesgo_relativo.rr_more90_segmentacion_especial
UNION ALL
SELECT * FROM proyecto3-riesgo-re.riesgo_relativo.rr_usingl_segmentacion_especial
ORDER BY variable ASC, num_segmento ASC;