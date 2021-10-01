--CONSULTA1
SELECT Q.NUMERODOC_CLIENTE,Q.PRIMERNOM_CLIENTE,Q.PRIMERAPE_CLIENTE,W.TOTAL_FACTURAS
FROM TBL_CLIENTE Q,
(SELECT S.ID_CLIENTE,SUM(VALORTOTAL_FACTURA) AS TOTAL_FACTURAS
FROM TBL_ENCFACTURA S
WHERE S.FECHAEMISION_FACTURA>=SYSDATE-60
GROUP BY S.ID_CLIENTE)W
WHERE W.ID_CLIENTE=Q.ID_CLIENTE
AND W.TOTAL_FACTURAS>=100000;

----------
--CONSULTA2
SELECT P.NOMBRE_PRODUCTO,Z.CANTIDAD_VENDIDA 
FROM TBL_PRODUCTO P,
(SELECT D.ID_PRODUCTO,SUM(D.CANTIDAD_PRODUCTO) CANTIDAD_VENDIDA
FROM TBL_ENCFACTURA S
INNER JOIN TBL_DETFACTURA D ON D.ID_FACTURA=S.ID_FACTURA
WHERE S.FECHAEMISION_FACTURA>=SYSDATE-30
GROUP BY D.ID_PRODUCTO)Z
WHERE P.ID_PRODUCTO=Z.ID_PRODUCTO
AND ROWNUM<=100
------------
--CONSULTA3
SELECT P.NOMBRE_SUCURSAL,Z.CANTIDAD_VENDIDA 
FROM TBL_SUCURSAL P,
(SELECT D.ID_PRODUCTO,S.ID_SUCURSAL,SUM(D.CANTIDAD_PRODUCTO) CANTIDAD_VENDIDA
FROM TBL_ENCFACTURA S
INNER JOIN TBL_DETFACTURA D ON D.ID_FACTURA=S.ID_FACTURA
WHERE S.FECHAEMISION_FACTURA>=SYSDATE-60
AND ID_PRODUCTO=100
GROUP BY D.ID_PRODUCTO,S.ID_SUCURSAL)Z
WHERE P.ID_SUCURSAL=Z.ID_SUCURSAL
AND CANTIDAD_VENDIDA>100
ORDER BY 2 DESC

--------------
--CONSULTA 4
SELECT Q.ID_CLIENTE,Q.NUMERODOC_CLIENTE,Q.PRIMERNOM_CLIENTE,Q.PRIMERAPE_CLIENTE, COUNT(M.ID_MANTENIMIENTO) MANTENIMIENTOS
FROM TBL_MANTENIMIENTO M
INNER JOIN TBL_VEHICULO W ON W.ID_VEHICULO=M.ID_VEHICULO
INNER JOIN TBL_CLIENTE Q ON W.ID_CLIENTE=Q.ID_CLIENTE
WHERE M.FECHAINGRESO_MANTENIMIENTO>=SYSDATE-30
GROUP BY Q.ID_CLIENTE,Q.NUMERODOC_CLIENTE,Q.PRIMERNOM_CLIENTE,Q.PRIMERAPE_CLIENTE
HAVING COUNT(M.ID_MANTENIMIENTO)  > 1