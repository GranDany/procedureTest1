CREATE TABLE PRODUCTO 
(
  ID NUMBER GENERATED BY DEFAULT AS IDENTITY INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20 NOT NULL 
, TIPO_PRODUCTO VARCHAR2(50 BYTE) NOT NULL 
, PRIMARY KEY 
  (
    ID 
  )