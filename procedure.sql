CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_jugadores`(nombre varchar(45))
BEGIN
	SELECT	* 
    FROM jugadores j 
    where j.nombre like nombre
    order by nombre asc;
END