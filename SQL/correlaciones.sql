-- Correlacion number times 30-59/60-89
SELECT
  CORR(number_times_delayed_payment_loan_30_59_days, number_times_delayed_payment_loan_60_89_days) AS corr_number_times
FROM
  `proyecto3-riesgo-re.riesgo_relativo.loans_detail`;
--Correlacion more 90 / number times 30-59
SELECT
  CORR(more_90_days_overdue, number_times_delayed_payment_loan_30_59_days) AS corr_more90_3059
FROM
  `proyecto3-riesgo-re.riesgo_relativo.loans_detail`;
--Correlacion more 90 / number times 60-89
SELECT
  CORR(more_90_days_overdue, number_times_delayed_payment_loan_60_89_days) AS corr_more90_6089
FROM
  `proyecto3-riesgo-re.riesgo_relativo.loans_detail`;