SELECT
  user_id,
  more_90_days_overdue,
  using_lines_not_secured_personal_assets,
  number_times_delayed_payment_loan_30_59_days,
  debt_ratio,
  number_times_delayed_payment_loan_60_89_days,
  (more_90_days_overdue + number_times_delayed_payment_loan_30_59_days + number_times_delayed_payment_loan_60_89_days) AS total_overdue_days
FROM
  `proyecto3-riesgo-re.riesgo_relativo.loans_detail`
WHERE
  more_90_days_overdue <= 20
  AND number_times_delayed_payment_loan_30_59_days <= 20
  AND number_times_delayed_payment_loan_60_89_days <= 20
ORDER BY total_overdue_days DESC;