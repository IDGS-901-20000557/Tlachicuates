DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_mostrar_reservaciones`()
BEGIN
    SELECT *
    FROM reservacion;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_mostrar_reservacion`(
    IN idReservacion INT
)
BEGIN
    SELECT *
    FROM reservacion
    WHERE idReservacion = idReservacion;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE SP_Insert_Update_Reservacion(
IN var_idReservacion int,
IN var_idCliente int,
IN var_idMesa int,
IN var_idHorario int,
OUT var_salida longtext
)
BEGIN

DECLARE accion varchar(50);
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
ROLLBACK;
END;
if var_idReservacion<0 then
SET accion= 'Inserción';

INSERT INTO reservacion (idCliente, idMesa, idHorario)
VALUES( var_idCliente, var_idMesa, var_idHorario);
else
SET accion= 'Modificación';

UPDATE reservacion SET idCliente = var_idCliente,
idMesa = var_idMesa,
idHorario = var_idHorario
WHERE idReservacion = var_idReservacion;
end if;

INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha)
VALUES(var_idCliente, accion, 'Reservaciones', 'Registro de reservación', NOW());

SET var_salida = 'exito';

END ;;



