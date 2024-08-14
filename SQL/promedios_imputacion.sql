SELECT
  default_flag,
  AVG(last_month_salary) AS avg_last_month_salary,
  AVG(number_dependents) AS avg_number_dependents
FROM
  `proyecto3-riesgo-re.riesgo_relativo.01_left_join_flag`
GROUP BY
  default_flag;