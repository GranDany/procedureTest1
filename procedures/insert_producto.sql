create or replace PROCEDURE insert_producto ( tipo_producto IN VARCHAR2, nombre_producto IN VARCHAR2, cantidad_stock_producto IN NUMBER) AS 
   lastProduct NUMBER;
 BEGIN
    SELECT COUNT(*) 
    INTO lastProduct 
    FROM PRODUCTO ;

    INSERT INTO PRODUCTO (id, tipo_producto) VALUES(lastProduct+1, tipo_producto);

    IF tipo_producto = 'bebestible' THEN
        INSERT INTO bebestible (ID_PRODUCTO, NOMBRE, CANTIDAD_STOCK) VALUES(lastProduct+1, nombre_producto, cantidad_stock_producto);
    END IF;
        IF tipo_producto = 'plato' THEN
        INSERT INTO plato (ID_PRODUCTO, NOMBRE, CANTIDAD_STOCK) VALUES(lastProduct+1, nombre_producto, cantidad_stock_producto);
    END IF;
 END insert_producto;