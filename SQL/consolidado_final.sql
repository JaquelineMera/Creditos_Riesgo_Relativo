SELECT
  r.user_id,
  r.age,
  r.last_month_salary,
  r.number_dependents,
  r.default_flag,
  r.birth_year,
  r.generational_group,
  r.total_loans,
  r.total_others,
  r.total_real_estate,
  r.more_90_days_overdue,
  r.using_lines_not_secured_personal_assets,
  r.number_times_delayed_payment_loan_30_59_days,
  r.debt_ratio,
  r.number_times_delayed_payment_loan_60_89_days,
  r.total_overdue_days,
  r.debt_ratio_s,
  r.using_lines_s,
  r.more_90_days_s,
  r.total_overdue_days_s,
  d.suma_dummies,
  d.flag_pagador
FROM
  `proyecto3-riesgo-re.riesgo_relativo.consolidado` AS r
LEFT JOIN
  `proyecto3-riesgo-re.riesgo_relativo.dummies_03` AS d
ON
  r.user_id = d.user_id