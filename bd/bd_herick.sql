CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_mostrar_productos_compras`()
    NO SQL
BEGIN
SELECT idproductos, nombreProducto, costoProduccion, precioVenta, foto FROM producto
WHERE estatus=1;
END


CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insert_pedido`(IN `idCliente` INT(50), IN `fechaPedido` DATE, IN `fechaEntrega` DATE, IN `codigo` INT(50), IN `estatus` INT(50))
    NO SQL
BEGIN
    DECLARE var_salida LONGTEXT;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
        ROLLBACK;
    END;

  

    INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
    VALUES (idCliente, 'InsertarPedido', 'compras', 'Pedido Insertado', NOW());

  INSERT INTO pedido (idCliente, fechaPedido, fechaEntrega, codigo, estatus) 
    VALUES (idCliente, fechaPedido, fechaEntrega, codigo, estatus);

    SET var_salida = 'exito';
END

BEGIN
    DECLARE var_salida LONGTEXT;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
        ROLLBACK;
    END;

    INSERT INTO pedido_producto (cantidad, unidad,idProducto,idPedidos) 
    VALUES (cantidad, unidad,idProducto,idPedido);

    SET var_salida = 'exito';
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insert_pedido_producto`(IN `cantidad` INT(50), IN `unidad` VARCHAR(50), IN `idProducto` INT(50), IN `idPedido` INT(50))
    NO SQL
BEGIN
    DECLARE var_salida LONGTEXT;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
        ROLLBACK;
    END;

    INSERT INTO pedido_producto (cantidad, unidad,idProducto,idPedidos) 
    VALUES (cantidad, unidad,idProducto,idPedido);

    SET var_salida = 'exito';
END







CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_mostrar_pedidos`(IN `id_` INT(50))
    NO SQL
SELECT * FROM bdtlachicuates.pedido where idCliente=id_

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insert_pedido`(IN `idCliente` INT(50), IN `fechaPedido` DATE, IN `fechaEntrega` DATE, IN `codigo` INT(50), IN `estatus` INT(50))
    NO SQL
BEGIN
    DECLARE var_salida LONGTEXT;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
        ROLLBACK;
    END;

  

    INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
    VALUES (idCliente, 'InsertarPedido', 'compras', 'Pedido Insertado', NOW());

  INSERT INTO pedido (idCliente, fechaPedido, fechaEntrega, codigo, estatus) 
    VALUES (idCliente, fechaPedido, fechaEntrega, codigo, estatus);

    SET var_salida = 'exito';
END
