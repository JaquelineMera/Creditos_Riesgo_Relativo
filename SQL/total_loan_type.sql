SELECT
  user_id,

  COUNT(loan_id) AS total_loans,
  SUM(CASE WHEN standardized_loan_type = 'others' THEN 1 ELSE 0 END) AS total_others,
  SUM(CASE WHEN standardized_loan_type = 'real estate' THEN 1 ELSE 0 END) AS total_real_estate
FROM
  `proyecto3-riesgo-re.riesgo_relativo.loans_outstanding_limpio`
GROUP BY
  user_id
ORDER BY
  user_id;