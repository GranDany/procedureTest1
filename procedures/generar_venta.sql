create or replace PROCEDURE generar_venta ( id_producto_in IN NUMBER, tipo_venta_in IN VARCHAR2, cantidad_in IN NUMBER, id_promocion_in IN number) AS 
       lastItem NUMBER;
       d_current_date DATE;
       precio_producto NUMBER;
       valor_descuento_promo NUMBER;
     BEGIN
     d_current_date := CURRENT_DATE;
        SELECT COUNT(*) 
        INTO lastItem 
        FROM venta ;

        SELECT valor
        INTO precio_producto
        FROM precio
        WHERE id_producto = id_producto_in;

        INSERT INTO venta (ID, TIPO_VENTA, FECHA) VALUES(lastItem+1, tipo_venta_in, d_current_date);

    IF tipo_venta_in = 'producto' THEN
        INSERT INTO venta_producto (ID, ID_PRODUCTO, CANTIDAD, TOTAL) VALUES(lastItem+1, id_producto_in, cantidad_in, precio_producto*cantidad_in);
    END IF;
        IF tipo_venta_in = 'promocion' THEN
            SELECT valor_descuento
                INTO valor_descuento_promo
                FROM promocion
                WHERE id = id_promocion_in;
            INSERT INTO venta_promocion (ID, ID_PROMOCION, CANTIDAD, TOTAL) VALUES(lastItem+1, id_promocion_in, cantidad_in, (precio_producto*((100-valor_descuento_promo)/100))*cantidad_in);
    END IF;

     END generar_venta;