-- Consulta para obtener las columnas derivadas
WITH segmentaciones AS (
  SELECT
    user_id,
    default_flag,
    age,
    last_month_salary,
    number_dependents,
    total_loans,
    more_90_days_overdue,
    debt_ratio,
    using_lines_not_secured_personal_assets,

    -- Segmentación personalizada
    CASE
      WHEN more_90_days_overdue = 0 THEN 0
      WHEN more_90_days_overdue >= 1 AND more_90_days_overdue <= 5 THEN 1
      WHEN more_90_days_overdue >= 5 AND more_90_days_overdue <= 10 THEN 2
      ELSE 3
    END AS se_more_90_day,

    CASE
      WHEN debt_ratio = 0.00 THEN 0
      WHEN debt_ratio < 0.40 THEN 1
      WHEN debt_ratio >= 0.40 AND debt_ratio <= 0.60 THEN 2
      WHEN debt_ratio >= 0.60 AND debt_ratio <= 1 THEN 3
      ELSE 4
    END AS se_debt_ratio,

    CASE
      WHEN using_lines_not_secured_personal_assets = 0.00 THEN 0
      WHEN using_lines_not_secured_personal_assets < 0.40 THEN 1
      WHEN using_lines_not_secured_personal_assets >= 0.40 AND using_lines_not_secured_personal_assets <= 0.60 THEN 2
      WHEN using_lines_not_secured_personal_assets >= 0.60 AND using_lines_not_secured_personal_assets <= 1 THEN 3
      ELSE 4
    END AS se_using_lines
  FROM
    `proyecto3-riesgo-re.riesgo_relativo.consolidado`
),

cuartiles AS (
  SELECT
    user_id,
    default_flag,
    age,
    last_month_salary,
    number_dependents,
    total_loans,
    more_90_days_overdue,
    debt_ratio,
    using_lines_not_secured_personal_assets,
    se_more_90_day,
    se_debt_ratio,
    se_using_lines,

    -- Cálculo de cuartiles
    NTILE(4) OVER (ORDER BY age) AS q_age,
    NTILE(4) OVER (ORDER BY last_month_salary) AS q_last_month_salary,
    NTILE(4) OVER (ORDER BY number_dependents) AS q_number_dependents,
    NTILE(4) OVER (ORDER BY total_loans) AS q_total_loans
  FROM
    segmentaciones
)

-- Selección final
SELECT
  user_id,
  default_flag,
  q_age,
  q_last_month_salary,
  q_number_dependents,
  q_total_loans,
  se_more_90_day,
  se_debt_ratio,
  se_using_lines
FROM
  cuartiles
ORDER BY
  user_id;
