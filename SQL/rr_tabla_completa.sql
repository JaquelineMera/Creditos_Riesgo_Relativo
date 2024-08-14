-- Consulta para sumar todas las filas de las vistas
SELECT * FROM proyecto3-riesgo-re.riesgo_relativo.rr_age
UNION ALL
SELECT * FROM proyecto3-riesgo-re.riesgo_relativo.rr_debt_ratio
UNION ALL
SELECT * FROM proyecto3-riesgo-re.riesgo_relativo.rr_last_msalary
UNION ALL
SELECT * FROM proyecto3-riesgo-re.riesgo_relativo.rr_m90d_overdue
UNION ALL
SELECT * FROM proyecto3-riesgo-re.riesgo_relativo.rr_number_dependents
UNION ALL
SELECT * FROM proyecto3-riesgo-re.riesgo_relativo.rr_total_loans
UNION ALL
SELECT * FROM proyecto3-riesgo-re.riesgo_relativo.rr_using_lnots
ORDER BY variable ASC, num_quartile ASC;
