-- Duplicado user_info
SELECT
  user_id,
  COUNT(*) AS count
FROM
  `proyecto3-riesgo-re.riesgo_relativo.user_info`
GROUP BY
  user_id
HAVING
  COUNT(*) > 1;
-- Duplicado loans_outstanding - loan id
SELECT
  loan_id,
  COUNT(*) AS count
FROM
  `proyecto3-riesgo-re.riesgo_relativo.loans_outstanding`
GROUP BY
  loan_id
HAVING
  COUNT(*) > 1;
-- Duplicado loans_outstanding - user id
SELECT
  user_id,
  COUNT(*) AS count
FROM
  `proyecto3-riesgo-re.riesgo_relativo.loans_outstanding`
GROUP BY
  user_id
HAVING
  COUNT(*) > 1;
-- Duplicado loans_detail
SELECT
  user_id,
  COUNT(*) AS count
FROM
  `proyecto3-riesgo-re.riesgo_relativo.loans_detail`
GROUP BY
  user_id
HAVING
  COUNT(*) > 1;
-- Duplicado default
SELECT
  user_id,
  COUNT(*) AS count
FROM
  `proyecto3-riesgo-re.riesgo_relativo.default`
GROUP BY
  user_id
HAVING
  COUNT(*) > 1;