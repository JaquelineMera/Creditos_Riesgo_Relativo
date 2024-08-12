# Procesos en Google Colab (Jupyter Notebook)
# Índice

1. [Exploración de datos](#exploración-de-datos)
2. [Matriz de correlación](#matriz-de-correlación)
3. [Matriz de confusión](#matriz-de-confusión)
4. [Regresión logística](#regresión-logística)

# Exploración de datos
Exploración de datos crudos paralela a BigQuery con el fin de tomar decisiones para procesar y preparar base de datos. Se utilizó la librería Plotly de Python para crear gráficos dinámicos, aquí se deja la evidencia de dichos gráficos. El proceso completo se aloja en Jupyter_Notebook (exploracion_rr).
## Base de datos: Información de usuario (user_info)
### Edad (Histograma y Boxplot)
![01_Histograma_Edad](https://github.com/user-attachments/assets/60025863-a875-41c2-a575-a2e2b4c53626)
![01_Boxplot_Edad](https://github.com/user-attachments/assets/2cb02042-cca0-4c86-9b7f-5416cd05b557)
### Último salario mensual (Histograma y Boxplot)
![02_Histograma_Ultimosalario](https://github.com/user-attachments/assets/0cd19099-e924-4aae-90ab-d3de74be3099)
![02_Boxplot_Ultimosalario](https://github.com/user-attachments/assets/7fc4bd25-6d9d-4f36-a296-e6b1447109bf)
### Número de dependientes (Histograma y Boxplot)
![03_Histograma_NumeroD](https://github.com/user-attachments/assets/98d6db84-88d5-4f4c-9723-b2053bd86a8b)
![03_Boxplot_NumeroD](https://github.com/user-attachments/assets/bd0c6f65-81c7-4627-b4dd-76b837410101)
## Base de datos: Préstamos pendientes (loans outstanding)
### Tipos de préstamo (Discrepancias)
![04_Grafico_Tipoprestamos](https://github.com/user-attachments/assets/807a8173-ab2b-46e3-a700-c4b33194a0d7)
## Base de datos: Detalle del préstamo (loans detail)
### Más de 90 días de retraso (Histograma y Boxplot)
![05_Histograma_more90](https://github.com/user-attachments/assets/93e9bebb-6ca6-4365-a106-e2a98c9c1846)
![05_Boxplot_more90](https://github.com/user-attachments/assets/22eceab3-91f6-46da-99ea-a91fdc17fe69)
### Número de veces que se retrasó el pago del préstamo: 30 días y 59 días (Histograma y Boxplot)
![06_Histograma_30days](https://github.com/user-attachments/assets/2561b667-83b6-4965-b848-f703c5f3dd77)
![06_Boxplot_30days](https://github.com/user-attachments/assets/8e65e77e-1b81-40ca-8801-377194130653)
### Número de veces que se retrasó el pago del préstamo: 60 días y 89 días (Histograma y Boxplot)
![07_Histograma_60days](https://github.com/user-attachments/assets/6cd56ec4-66b9-4e5f-9695-855784953a37)
![07_Boxplot_60days](https://github.com/user-attachments/assets/9675a3e3-cc21-468c-9057-3652c5603e57)
### Uso de línea de crédito no asegurada (Histograma y Boxplot)
![08_Histograma_usinglines](https://github.com/user-attachments/assets/e8a67df7-79e2-4675-96a1-0f3368f5ae75)
![08_Boxplot_usinglines](https://github.com/user-attachments/assets/0d3b9b67-d625-455d-ae98-495a45c7dbcc)
### Ratio de deuda (Histograma y Boxplot)
![09_Histograma_ratio](https://github.com/user-attachments/assets/b0ac6361-ea38-486d-b602-6eb8236f9166)
![09_Boxplot_ratio](https://github.com/user-attachments/assets/255263ee-9725-4e7a-9bca-da21810775c1)
## Base de datos: Default / Exploración por Flags (Buenos y malos pagadores pagadores)
### Recuento de Buenos y Malos pagadores
![10_Grafico_flags](https://github.com/user-attachments/assets/e5a4f029-3d73-4612-a634-b5e549535da8)
### Salario de Malos pagadores (Histograma y Boxplot)
![11_Histograma_Bad](https://github.com/user-attachments/assets/7fb56977-1a78-4d8a-99dd-cde505a52b56)
![11_Boxplot_Bad](https://github.com/user-attachments/assets/8417966e-ad15-4017-89c2-37830e56fcb4)
### Número de dependientes de Malos pagadores (Histograma y Boxplot)
![12_Histograma_Badhijos](https://github.com/user-attachments/assets/e1bbeab0-f81a-4a93-a19e-0686470f2139)
![12_Boxplot_Badhijos](https://github.com/user-attachments/assets/37032815-cfc0-4829-8cb0-ea173a6ea572)
### Salario de Buenos pagadores (Histograma y Boxplot)
![13_Histograma_Good](https://github.com/user-attachments/assets/ea8f9517-18d6-4e47-b227-db1e6c772dae)
![13_Boxplot_Good](https://github.com/user-attachments/assets/79ba3007-a28a-4594-924a-82c80c72c36c)
### Número de dependientes de Buenos pagadores (Histograma y Boxplot)
![14_Histograma_Goodhijos](https://github.com/user-attachments/assets/88b2a165-4b79-4385-bc71-ddd7972bf4ff)
![14_Bloxplot_Goodhijos](https://github.com/user-attachments/assets/b1207829-5c37-4105-8fdd-b3477b40b263)

# Matriz de correlación
Se exploró la correlación de las variables del consolidado. El consolidado une las 4 bases de datos limpias, es decir, ya integran los procesos de preparación (limpieza e imputación de datos).
![15_Matrizcorrelacion](https://github.com/user-attachments/assets/7d51a41a-506d-4d48-b92b-51614b284f44)

# Matriz de confusión
La matriz de confusión proporciona un medio para evaluar el éxito de un problema de clasificación, dónde se cometen errores (y se vuelve "confuso"). Es decir, visualiza la distribución de los registros en términos de clases reales y clases pronosticadas.

+ Componentes de una Matriz de Confusión:
  + Verdaderos Positivos (TP): Observaciones correctamente clasificadas como positivas.
  + Falsos Positivos (FP): Observaciones incorrectamente clasificadas como positivas.
  + Verdaderos Negativos (TN): Observaciones correctamente clasificadas como negativas.
  + Falsos Negativos (FN): Observaciones incorrectamente clasificadas como negativas.

![16_Matriz00](https://github.com/user-attachments/assets/5369f5f4-439a-42e8-9c5f-8b60d8f7104e)

## Resultados Matriz de Confusión
Se realizaron 2 matrices de confusión, a partir de dos modelos. 
+ Matriz 1/Modelo 1: 
  + 7 variables a considerar, valor de dummies 0 y 1, rango de score 0 - 7, malos pagadores >3.

+ Matriz 2/Modelo 2: 
  + 7 variables a considerar, valor de dummies 0 y 1, peso de las dummies 1 y 2, rango de score 0 - 9, malos pagadores >4.
  + Dummies con peso de 2, more_90_days_overdue y using_ lines_ not_ secured_ personal_ assets, debido a que su riesgo relativo incrementa considerablemente respecto a las otras 5 variables evaluadas. 

En conclusión, el modelo mejor calibrado fue el segundo. Cuenta con un mejor recall para la clase "Malos Pagadores", además, su precisión aumenta respecto al primer modelo. La diferencia entre modelos, radica en que se dio un peso a las 2 variables, con mayor riesgo relativo. 

El proceso para realizar una matriz de confusión en Google Colab se encuentra Jupyter_Notebook (matriz_confusión).

![16_Matriz01](https://github.com/user-attachments/assets/88dcade6-1ebc-4ea7-ad45-06aadd509da5)
![16_Matriz02](https://github.com/user-attachments/assets/591a6b77-5c00-4c71-8bb5-8bc82c17ca0a)




# Regresión logística

