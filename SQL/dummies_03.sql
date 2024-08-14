SELECT 
user_id,
suma_dummies,
IF (suma_dummies >=5, 1, 0) AS flag_pagador
FROM `proyecto3-riesgo-re.riesgo_relativo.dummies_02` 