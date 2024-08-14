SELECT
  user_id,
  --- Segmentación Debt Ratio
  CASE
    WHEN debt_ratio = 0.00 THEN '00 Sin uso'
    WHEN debt_ratio < 0.40 THEN '01 Bajo'
    WHEN debt_ratio >= 0.40 AND debt_ratio <= 0.60 THEN '02 Medio'
    WHEN debt_ratio >= 0.60
  AND debt_ratio <= 1 THEN '03 Alto'
    ELSE '04 Extraordinario'
END
  AS debt_ratio_s,
  --- Segmentación Uso de Líneas de Crédito NO Aseguradas
  CASE
    WHEN using_lines_not_secured_personal_assets = 0.00 THEN '00 Sin uso'
    WHEN using_lines_not_secured_personal_assets < 0.40 THEN '01 Bajo'
    WHEN using_lines_not_secured_personal_assets >= 0.40 AND using_lines_not_secured_personal_assets <= 0.60 THEN '02 Medio'
    WHEN using_lines_not_secured_personal_assets >= 0.60
  AND using_lines_not_secured_personal_assets <= 1 THEN '03 Alto'
    ELSE '04 Extraordinario'
END
  AS using_lines_s,
  --- Segmentación Retraso de Pagos (90 dÍAS)
  CASE
    WHEN more_90_days_overdue = 0 THEN '00 Sin retrasos'
    WHEN more_90_days_overdue >= 1 AND more_90_days_overdue <= 5 THEN '01 Pocos'
    WHEN more_90_days_overdue >= 5 AND more_90_days_overdue <= 10 THEN '02 Moderados'
    ELSE '03 Muchos'
END
  AS more_90_days_s, 
--- Segmentación Total de Retrasos (suma)
  CASE
    WHEN total_overdue_days = 0 THEN '00 Sin retrasos'
    WHEN total_overdue_days >= 1
  AND total_overdue_days <= 5 THEN '01 Pocos'
    WHEN total_overdue_days >= 5 AND total_overdue_days <= 10 THEN '02 Moderados'
    WHEN total_overdue_days >= 10
  AND total_overdue_days <= 15 THEN '03 Muchos'
    ELSE '04 Críticos'
END
  AS total_overdue_days_s
FROM
  proyecto3-riesgo-re.riesgo_relativo.loans_detail_l
ORDER BY
  user_id;