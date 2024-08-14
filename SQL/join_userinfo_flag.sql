SELECT
  ui.user_id,
  ui.age,
  ui.last_month_salary,
  ui.number_dependents,
  d.default_flag
FROM
  `proyecto3-riesgo-re.riesgo_relativo.user_info` AS ui
LEFT JOIN
  `proyecto3-riesgo-re.riesgo_relativo.default` AS d
ON
  ui.user_id = d.user_id;