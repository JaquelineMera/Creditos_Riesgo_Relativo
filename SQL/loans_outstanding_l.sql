SELECT
  loan_id,
  user_id,
  CASE
    WHEN LOWER(loan_type) = 'other' THEN 'others'
    WHEN LOWER(loan_type) = 'others' THEN 'others'
    WHEN LOWER(loan_type) = 'real estate' THEN 'real estate'
    ELSE loan_type
  END AS standardized_loan_type
FROM
  `proyecto3-riesgo-re.riesgo_relativo.loans_outstanding`;