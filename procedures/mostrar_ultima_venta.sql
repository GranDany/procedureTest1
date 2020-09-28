    create or replace PROCEDURE mostrar_ultima_venta AS 
    CURSOR c1 IS
        select venta.ID, venta.tipo_venta, venta.fecha,
                venta_producto.cantidad as cantidad_productos, venta_producto.total as total_venta_producto,
                venta_promocion.cantidad as cantidad_promos, venta_promocion.total as total_venta_promos
                from venta
                    LEFT JOIN venta_producto ON venta_producto.id = venta.id
                    LEFT JOIN venta_promocion ON venta_promocion.id = venta.id
                where venta.fecha=(select max(venta.fecha) from venta);
     BEGIN
      FOR item IN c1
      LOOP
        IF item.cantidad_productos IS NOT NULL AND item.total_venta_producto IS NOT NULL THEN
            dbms_output.put_line('ID: ' || item.ID || ' tipo_venta: ' || item.tipo_venta || ' fecha: ' || item.fecha || ' valor_total_venta_producto: ' || item .total_venta_producto || ' cantidad_productos: ' || item .cantidad_productos);
        END IF;
        IF item.cantidad_promos IS NOT NULL AND item.total_venta_promos IS NOT NULL THEN
            dbms_output.put_line('ID: ' || item.ID || ' tipo_venta: ' || item.tipo_venta || ' fecha: ' || item.fecha || ' valor_total_venta_promos: ' || item .total_venta_promos || ' cantidad_promos: ' || item .cantidad_promos);
        END IF;
      END LOOP;
     END mostrar_ultima_venta;