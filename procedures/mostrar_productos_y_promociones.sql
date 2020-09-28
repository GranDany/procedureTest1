create or replace PROCEDURE mostrar_productos_y_promociones AS
    CURSOR c1 IS 
        select producto.ID, bebestible.cantidad_stock as stock_bebestible, bebestible.nombre as nombre_bebestible,
            plato.cantidad_stock as stock_plato, plato.nombre as plato_nombre, 
            precio.valor as valor_producto,
            promocion.nombre as nombre_promocion, promocion.valor_descuento as descuento_promocion, promocion.id as id_promocion
            from producto
                LEFT JOIN bebestible ON bebestible.id_producto = producto.id
                LEFT JOIN plato ON plato.id_producto = producto.id
                LEFT JOIN precio ON precio.id_producto = producto.id
                LEFT JOIN promocion ON promocion.id_producto_promocion = producto.id;
     BEGIN
      FOR item IN c1
      LOOP
        -- dbms_output.put_line( item.ID || ' - ' || item.stock_bebestible || ' - ' || item.nombre_bebestible || ' - ' || item.stock_plato || ' - ' || item.plato_nombre || ' - ' || item .valor_producto);
        IF item.stock_bebestible IS NOT NULL AND item.nombre_bebestible IS NOT NULL THEN
            dbms_output.put_line('ID: ' || item.ID || ' stock_bebestible: ' || item.stock_bebestible || ' nombre_bebestible: ' || item.nombre_bebestible || ' valor_producto: ' || item .valor_producto);
        END IF;
        IF item.stock_plato IS NOT NULL AND item.plato_nombre IS NOT NULL THEN
            dbms_output.put_line('ID: ' || item.ID || ' stock_plato: ' || item.stock_plato || ' plato_nombre: ' || item.plato_nombre || ' valor_producto: ' || item .valor_producto);
        END IF;
        IF item.nombre_promocion IS NOT NULL AND item.descuento_promocion IS NOT NULL THEN
            dbms_output.put_line('id_promocion: ' || item.id_promocion || ' nombre_promocion: ' || item.nombre_promocion || ' descuento_promocion: ' || item.descuento_promocion);
        END IF;
      END LOOP;
     END mostrar_productos_y_promociones;