create or replace PROCEDURE insert_promocion ( id_producto IN NUMBER, nombre_promocion IN VARCHAR2, descuento IN NUMBER) AS 
       lastItem NUMBER;
     BEGIN
        SELECT COUNT(*) 
        INTO lastItem 
        FROM promocion ;

        INSERT INTO promocion (id, id_producto_promocion, nombre, valor_descuento) VALUES(lastItem+1, id_producto, nombre_promocion, descuento);

     END insert_promocion;