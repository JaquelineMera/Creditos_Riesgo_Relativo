SELECT 
  user_id,
  (d_age + 
   d_total_loans + 
   d_more_90_day + 
   d_last_month_salary + 
   d_debt_ratio +
   d_number_dependents +
   d_using_lines) AS suma_dummies
FROM 
  `proyecto3-riesgo-re.riesgo_relativo.dummies_01`;
