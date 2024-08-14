WITH confusion_matrix AS (
  SELECT
    COUNTIF(flag_pagador = 0 AND default_flag = 0) AS true_positive,
    COUNTIF(flag_pagador = 0 AND default_flag = 1) AS false_positive,
    COUNTIF(flag_pagador = 1 AND default_flag = 0) AS false_negative,
    COUNTIF(flag_pagador = 1 AND default_flag = 1) AS true_negative
  FROM
    `proyecto3-riesgo-re.riesgo_relativo.consolidado_final_entrega`
)

SELECT
  true_positive,
  false_positive,
  false_negative,
  true_negative,
  (true_positive + true_negative) / (true_positive + false_positive + false_negative + true_negative) AS accuracy,
  true_positive / (true_positive + false_positive) AS precision,
  true_positive / (true_positive + false_negative) AS recall,
  2 * ((true_positive / (true_positive + false_positive)) * (true_positive / (true_positive + false_negative))) /
  ((true_positive / (true_positive + false_positive)) + (true_positive / (true_positive + false_negative))) AS f1_score
FROM
  confusion_matrix;
