SELECT
  STDDEV(number_times_delayed_payment_loan_30_59_days) AS stddev_number_times_30_59_days,
  STDDEV(number_times_delayed_payment_loan_60_89_days) AS stddev_number_times_60_89_days,
  STDDEV(more_90_days_overdue) AS stddev_more_90_days_overdue
FROM
  `proyecto3-riesgo-re.riesgo_relativo.loans_detail`;
