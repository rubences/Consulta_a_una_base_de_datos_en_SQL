-- Alternativa compatible para Q11 si se usa MySQL anterior a 8.0.31.
USE `mydb`;

SELECT DISTINCT a.`Vehículo_Matricula_V` AS `Matricula_V`
FROM `Alquila` AS a
INNER JOIN `Mantenimiento` AS m
  ON m.`Vehículo_Matricula_V` = a.`Vehículo_Matricula_V`
ORDER BY `Matricula_V`;
