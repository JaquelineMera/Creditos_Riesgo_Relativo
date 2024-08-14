-- Crear Variables Dummies a partir de la tabla rr_segmentacion_final
SELECT 
  user_id,
  default_flag,
  q_age,
  q_last_month_salary,
  q_number_dependents,
  q_total_loans,
  se_more_90_day,
  se_debt_ratio,
  se_using_lines,

  -- Generar columnas dummy
  IF(q_age = 1, 1, 0) AS d_age,
  IF(q_total_loans = 1, 1, 0) AS d_total_loans,
  IF(se_more_90_day IN (1, 2, 3), 2, 0) AS d_more_90_day,
  IF(q_last_month_salary = 1, 1, 0) AS d_last_month_salary,
  IF(se_debt_ratio = 3, 1, 0) AS d_debt_ratio,
  IF(q_number_dependents = 4, 1, 0) AS d_number_dependents,
  IF(se_using_lines IN (3, 4), 2, 0) AS d_using_lines,
FROM 
  `proyecto3-riesgo-re.riesgo_relativo.rr_segmentacion_final`;