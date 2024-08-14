SELECT
  *
FROM
  `proyecto3-riesgo-re.riesgo_relativo.user_info_flag_imputacion`
WHERE
  last_month_salary < 400000
  AND age < 97
ORDER BY
  user_id