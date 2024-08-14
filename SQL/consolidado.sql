SELECT
  ui.user_id,
  ui.age,
  ui.last_month_salary,
  ui.number_dependents,
  ui.default_flag,
  g.birth_year,
  g.generational_group,
  tlo.total_loans,
  tlo.total_others,
  tlo.total_real_estate,
  ld.more_90_days_overdue,
  ld.using_lines_not_secured_personal_assets,
  ld.number_times_delayed_payment_loan_30_59_days,
  ld.debt_ratio,
  ld.number_times_delayed_payment_loan_60_89_days,
  ld.total_overdue_days,
  nv.debt_ratio_s,
  nv.using_lines_s,
  nv.more_90_days_s,
  nv.total_overdue_days_s
FROM
  proyecto3-riesgo-re.riesgo_relativo.user_info_flag_l AS ui
INNER JOIN
  proyecto3-riesgo-re.riesgo_relativo.generaciones AS g
ON
  ui.user_id = g.user_id
INNER JOIN
  proyecto3-riesgo-re.riesgo_relativo.total_loan_outstanding AS tlo
ON
  ui.user_id = tlo.user_id
INNER JOIN
  proyecto3-riesgo-re.riesgo_relativo.loans_detail_l AS ld
ON
  ui.user_id = ld.user_id
INNER JOIN
  proyecto3-riesgo-re.riesgo_relativo.nuevas_variables AS nv
ON
  ui.user_id = nv.user_id
ORDER BY user_id;