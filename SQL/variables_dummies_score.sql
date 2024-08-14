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
  IF(se_more_90_day IN (1, 2, 3), 1, 0) AS d_more_90_day,
  IF(q_last_month_salary = 1, 1, 0) AS d_last_month_salary,
  IF(se_debt_ratio = 3, 1, 0) AS d_debt_ratio,
  IF(q_number_dependents = 4, 1, 0) AS d_number_dependents,
  IF(se_using_lines IN (3, 4), 1, 0) AS d_using_lines,

  -- Sumar las variables dummy
  (IF(q_age = 1, 1, 0) +
   IF(q_total_loans = 1, 1, 0) +
   IF(se_more_90_day IN (1, 2, 3), 1, 0) +
   IF(q_last_month_salary = 1, 1, 0) +
   IF(se_debt_ratio = 3, 1, 0) +
   IF(q_number_dependents = 4, 1, 0) +
   IF(se_using_lines IN (3, 4), 1, 0)) AS suma_dummies,

  -- Determinar el tipo de pagador
  CASE
    WHEN (IF(q_age = 1, 1, 0) +
          IF(q_total_loans = 1, 1, 0) +
          IF(se_more_90_day IN (1, 2, 3), 1, 0) +
          IF(q_last_month_salary = 1, 1, 0) +
          IF(se_debt_ratio = 3, 1, 0) +
          IF(q_number_dependents = 4, 1, 0) +
          IF(se_using_lines IN (3, 4), 1, 0)) > 3 THEN 'mal pagador'
    ELSE 'buen pagador'
  END AS tipo_pagador,

  -- Crear flag de pagador
  CASE
    WHEN (IF(q_age = 1, 1, 0) +
          IF(q_total_loans = 1, 1, 0) +
          IF(se_more_90_day IN (1, 2, 3), 1, 0) +
          IF(q_last_month_salary = 1, 1, 0) +
          IF(se_debt_ratio = 3, 1, 0) +
          IF(q_number_dependents = 4, 1, 0) +
          IF(se_using_lines IN (3, 4), 1, 0)) > 3 THEN 1
    ELSE 0
  END AS flag_pagador

FROM 
  `proyecto3-riesgo-re.riesgo_relativo.rr_segmentacion_final`;