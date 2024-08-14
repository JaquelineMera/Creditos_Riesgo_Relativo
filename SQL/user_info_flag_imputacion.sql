SELECT
  user_id,
  age,
  IFNULL(last_month_salary,
    CASE
      WHEN default_flag = 1 THEN 2500
      WHEN default_flag = 0 THEN 5000
      ELSE last_month_salary
  END
    ) AS last_month_salary,
  IFNULL(number_dependents,
    CASE
      WHEN default_flag = 1 THEN 0
      WHEN default_flag = 0 THEN 0
      ELSE number_dependents
  END
    ) AS number_dependents,
  default_flag
FROM
  `proyecto3-riesgo-re.riesgo_relativo.user_info_flag`
ORDER BY user_id