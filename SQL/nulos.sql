--Esta consulta cuenta el total de filas en la tabla y los valores nulos por columna
SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS null_user_id,
  SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS null_age,
  SUM(CASE WHEN sex IS NULL THEN 1 ELSE 0 END) AS null_sex,
  SUM(CASE WHEN last_month_salary IS NULL THEN 1 ELSE 0 END) AS null_last_month_salary,
  SUM(CASE WHEN number_dependents IS NULL THEN 1 ELSE 0 END) AS null_number_dependents
FROM
  `proyecto3-riesgo-re.riesgo_relativo.user_info`;

SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN loan_id IS NULL THEN 1 ELSE 0 END) AS null_loan_id,
  SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS null_user_id,
  SUM(CASE WHEN loan_type IS NULL THEN 1 ELSE 0 END) AS null_loan_type
FROM
  `proyecto3-riesgo-re.riesgo_relativo.loans_outstanding`;

SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS null_user_id,
  SUM(CASE WHEN more_90_days_overdue IS NULL THEN 1 ELSE 0 END) AS null_more_90_days_overdue,
  SUM(CASE WHEN using_lines_not_secured_personal_assets IS NULL THEN 1 ELSE 0 END) AS null_using_lines_not_secured_personal_assets,
  SUM(CASE WHEN number_times_delayed_payment_loan_30_59_days IS NULL THEN 1 ELSE 0 END) AS null_number_times_delayed_payment_loan_30_59_days,
  SUM(CASE WHEN debt_ratio IS NULL THEN 1 ELSE 0 END) AS null_debt_ratio,
  SUM(CASE WHEN number_times_delayed_payment_loan_60_89_days IS NULL THEN 1 ELSE 0 END) AS null_number_times_delayed_payment_loan_60_89_days
FROM
  `proyecto3-riesgo-re.riesgo_relativo.loans_detail`;

SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS null_user_id,
  SUM(CASE WHEN default_flag IS NULL THEN 1 ELSE 0 END) AS null_default_flag
FROM
  `proyecto3-riesgo-re.riesgo_relativo.default`;