--- Query para crear tablas por flag
SELECT
  *
FROM
  `proyecto3-riesgo-re.riesgo_relativo.01_left_join_flag`
WHERE
  default_flag = 1;

SELECT
  *
FROM
  `proyecto3-riesgo-re.riesgo_relativo.01_left_join_flag`
WHERE
  default_flag = 0;