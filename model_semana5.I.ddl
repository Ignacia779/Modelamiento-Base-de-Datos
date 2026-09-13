-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2026-09-13 19:38:53 CLST
--   sitio:      Oracle Database 12cR2
--   tipo:      Oracle Database 12cR2



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE BOLETA 
    ( 
     numero_boleta      NUMBER  NOT NULL , 
     fecha_venta        DATE  NOT NULL , 
     monto_total        NUMBER  NOT NULL , 
     CLIENTE_id_cliente NUMBER  NOT NULL , 
     numero_boleta1     NUMBER  NOT NULL 
    ) 
;

ALTER TABLE BOLETA 
    ADD CONSTRAINT BOLETA_PK PRIMARY KEY ( numero_boleta, numero_boleta1 ) ;

CREATE TABLE CATEGORIA 
    ( 
     id_categoria     NUMBER  NOT NULL , 
     nombre_categoria VARCHAR2 (50 CHAR)  NOT NULL 
    ) 
;

ALTER TABLE CATEGORIA 
    ADD CONSTRAINT CATEGORIA_PK PRIMARY KEY ( id_categoria ) ;

CREATE TABLE CLIENTE 
    ( 
     id_cliente        NUMBER  NOT NULL , 
     nombre_completo   VARCHAR2 (50 CHAR)  NOT NULL , 
     telefono          NUMBER  NOT NULL , 
     COMUNA_cod_comuna NUMBER  NOT NULL 
    ) 
;

ALTER TABLE CLIENTE 
    ADD CONSTRAINT CLIENTE_PK PRIMARY KEY ( id_cliente ) ;

CREATE TABLE COMUNA 
    ( 
     cod_comuna NUMBER  NOT NULL , 
     nombre     VARCHAR2 (50 CHAR)  NOT NULL , 
     cod_region NUMBER  NOT NULL 
    ) 
;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_PK PRIMARY KEY ( cod_comuna ) ;

CREATE TABLE DETALLE_VENTA 
    ( 
     cantidad      NUMBER  NOT NULL , 
     precio        NUMBER  NOT NULL , 
     numero_boleta NUMBER  NOT NULL , 
     id_venta      NUMBER  NOT NULL , 
     id_producto   NUMBER  NOT NULL 
    ) 
;

ALTER TABLE DETALLE_VENTA 
    ADD CONSTRAINT DETALLE_VENTA_PK PRIMARY KEY ( numero_boleta, id_venta, id_producto ) ;

CREATE TABLE EMPRESA 
    ( 
     rut           VARCHAR2 (20 CHAR)  NOT NULL , 
     rut1          VARCHAR2 (20 CHAR)  NOT NULL , 
     nombre        VARCHAR2 (50 CHAR)  NOT NULL , 
     website       VARCHAR2 (20 CHAR) , 
     numero_boleta NUMBER  NOT NULL , 
     id_venta      NUMBER  NOT NULL , 
     id_sucursal   NUMBER  NOT NULL , 
     id_producto1  NUMBER  NOT NULL 
    ) 
;

ALTER TABLE EMPRESA 
    ADD CONSTRAINT EMPRESA_PK PRIMARY KEY ( rut, numero_boleta, id_venta, id_producto1, id_sucursal ) ;

ALTER TABLE EMPRESA 
    ADD CONSTRAINT EMPRESA_PKv1 UNIQUE ( rut1 ) ;

CREATE TABLE MARCA 
    ( 
     id_marca  NUMBER  NOT NULL , 
     id_modelo NUMBER  NOT NULL 
    ) 
;

ALTER TABLE MARCA 
    ADD CONSTRAINT MARCA_PK PRIMARY KEY ( id_marca ) ;

CREATE TABLE MODELO 
    ( 
     id_modelo      NUMBER  NOT NULL , 
     descripcion    VARCHAR2 (2 CHAR)  NOT NULL , 
     MARCA_id_marca NUMBER  NOT NULL 
    ) 
;

ALTER TABLE MODELO 
    ADD CONSTRAINT MODELO_PK PRIMARY KEY ( id_modelo, MARCA_id_marca ) ;

CREATE TABLE PERSONA_NATURAL 
    ( 
     rut           VARCHAR2 (20 CHAR)  NOT NULL , 
     rut1          VARCHAR2 (20 CHAR)  NOT NULL , 
     nombre        VARCHAR2 (50 CHAR)  NOT NULL , 
     apellido      VARCHAR2 (20 CHAR)  NOT NULL , 
     numero_boleta NUMBER  NOT NULL , 
     id_venta      NUMBER  NOT NULL , 
     id_sucursal   NUMBER  NOT NULL , 
     id_producto1  NUMBER  NOT NULL 
    ) 
;

ALTER TABLE PERSONA_NATURAL 
    ADD CONSTRAINT PERSONA_NATURAL_PK PRIMARY KEY ( rut, numero_boleta, id_venta, id_producto1, id_sucursal ) ;

ALTER TABLE PERSONA_NATURAL 
    ADD CONSTRAINT PERSONA_NATURAL_PKv1 UNIQUE ( rut1 ) ;

CREATE TABLE PRODUCTO 
    ( 
     id_producto                 MDSYS.SDO_GEOMETRY  NOT NULL , 
     nombre_producto             VARCHAR2 (50 CHAR)  NOT NULL , 
     precio                      NUMBER (8)  NOT NULL , 
     fecha_vencimineto           DATE , 
     SUCURSAL_sigla              VARCHAR2 (10 CHAR)  NOT NULL , 
     MODELO_id_modelo            NUMBER  NOT NULL , 
     DETALLE_VENTA_numero_boleta NUMBER  NOT NULL , 
     MODELO_MARCA_id_marca       NUMBER  NOT NULL , 
     CATEGORIA_id_categoria      NUMBER  NOT NULL , 
     DETALLE_VENTA_id_venta      NUMBER  NOT NULL , 
     DETALLE_VENTA_id_producto   NUMBER  NOT NULL , 
     id_sucursal                 NUMBER  NOT NULL 
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_PK PRIMARY KEY ( DETALLE_VENTA_numero_boleta, DETALLE_VENTA_id_venta, DETALLE_VENTA_id_producto, id_sucursal ) ;

CREATE TABLE PROVEEDOR 
    ( 
     rut                                             VARCHAR2 (20 CHAR)  NOT NULL , 
     id_proveedor                                    VARCHAR2 (20 CHAR)  NOT NULL , 
     email                                           VARCHAR2 (20 CHAR)  NOT NULL , 
     telefono                                        NUMBER  NOT NULL , 
     tipo_proveedor                                  VARCHAR2 (20 CHAR)  NOT NULL , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     SUMINISTRO_PRODUCTO_DETALLE_VENTA_numero_boleta NUMBER  NOT NULL , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     SUMINISTRO_PRODUCTO_DETALLE_VENTA_id_venta      NUMBER  NOT NULL , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     SUMINISTRO_PRODUCTO_DETALLE_VENTA_id_producto   NUMBER  NOT NULL , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     SUMINISTRO_PRODUCTO_id_sucursal                 NUMBER  NOT NULL 
    ) 
;

ALTER TABLE PROVEEDOR 
    ADD CONSTRAINT PROVEEDOR_PK PRIMARY KEY ( rut, SUMINISTRO_PRODUCTO_DETALLE_VENTA_numero_boleta, SUMINISTRO_PRODUCTO_DETALLE_VENTA_id_venta, SUMINISTRO_PRODUCTO_DETALLE_VENTA_id_producto, SUMINISTRO_PRODUCTO_id_sucursal ) ;

CREATE TABLE SUCURSAL 
    ( 
     sigla             VARCHAR2 (10 CHAR)  NOT NULL , 
     nombre            VARCHAR2 (50 CHAR)  NOT NULL , 
     cod_comuna        NUMBER  NOT NULL , 
     COMUNA_cod_comuna NUMBER  NOT NULL 
    ) 
;

ALTER TABLE SUCURSAL 
    ADD CONSTRAINT SUCURSAL_PK PRIMARY KEY ( sigla ) ;

CREATE TABLE SUMINISTRO 
    ( 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     PRODUCTO_DETALLE_VENTA_numero_boleta NUMBER  NOT NULL , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     PRODUCTO_DETALLE_VENTA_id_venta      NUMBER  NOT NULL , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     PRODUCTO_DETALLE_VENTA_id_producto   NUMBER  NOT NULL , 
     PRODUCTO_id_sucursal                 NUMBER  NOT NULL 
    ) 
;

ALTER TABLE SUMINISTRO 
    ADD CONSTRAINT SUMINISTRO_PK PRIMARY KEY ( PRODUCTO_DETALLE_VENTA_numero_boleta, PRODUCTO_DETALLE_VENTA_id_venta, PRODUCTO_DETALLE_VENTA_id_producto, PRODUCTO_id_sucursal ) ;

ALTER TABLE BOLETA 
    ADD CONSTRAINT BOLETA_CLIENTE_FK FOREIGN KEY 
    ( 
     CLIENTE_id_cliente
    ) 
    REFERENCES CLIENTE 
    ( 
     id_cliente
    ) 
;

-- Error - Foreign Key BOLETA_DETALLE_VENTA_FK has no columns

ALTER TABLE CLIENTE 
    ADD CONSTRAINT CLIENTE_COMUNA_FK FOREIGN KEY 
    ( 
     COMUNA_cod_comuna
    ) 
    REFERENCES COMUNA 
    ( 
     cod_comuna
    ) 
;

ALTER TABLE EMPRESA 
    ADD CONSTRAINT EMPRESA_PROVEEDOR_FK FOREIGN KEY 
    ( 
     rut,
     numero_boleta,
     id_venta,
     id_producto1,
     id_sucursal
    ) 
    REFERENCES PROVEEDOR 
    ( 
     rut,
     SUMINISTRO_PRODUCTO_DETALLE_VENTA_numero_boleta,
     SUMINISTRO_PRODUCTO_DETALLE_VENTA_id_venta,
     SUMINISTRO_PRODUCTO_DETALLE_VENTA_id_producto,
     SUMINISTRO_PRODUCTO_id_sucursal
    ) 
;

ALTER TABLE MODELO 
    ADD CONSTRAINT MODELO_MARCA_FK FOREIGN KEY 
    ( 
     MARCA_id_marca
    ) 
    REFERENCES MARCA 
    ( 
     id_marca
    ) 
;

ALTER TABLE PERSONA_NATURAL 
    ADD CONSTRAINT PERSONA_NATURAL_PROVEEDOR_FK FOREIGN KEY 
    ( 
     rut,
     numero_boleta,
     id_venta,
     id_producto1,
     id_sucursal
    ) 
    REFERENCES PROVEEDOR 
    ( 
     rut,
     SUMINISTRO_PRODUCTO_DETALLE_VENTA_numero_boleta,
     SUMINISTRO_PRODUCTO_DETALLE_VENTA_id_venta,
     SUMINISTRO_PRODUCTO_DETALLE_VENTA_id_producto,
     SUMINISTRO_PRODUCTO_id_sucursal
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_CATEGORIA_FK FOREIGN KEY 
    ( 
     CATEGORIA_id_categoria
    ) 
    REFERENCES CATEGORIA 
    ( 
     id_categoria
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_DETALLE_VENTA_FK FOREIGN KEY 
    ( 
     DETALLE_VENTA_numero_boleta,
     DETALLE_VENTA_id_venta,
     DETALLE_VENTA_id_producto
    ) 
    REFERENCES DETALLE_VENTA 
    ( 
     numero_boleta,
     id_venta,
     id_producto
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_MODELO_FK FOREIGN KEY 
    ( 
     MODELO_id_modelo,
     MODELO_MARCA_id_marca
    ) 
    REFERENCES MODELO 
    ( 
     id_modelo,
     MARCA_id_marca
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_SUCURSAL_FK FOREIGN KEY 
    ( 
     SUCURSAL_sigla
    ) 
    REFERENCES SUCURSAL 
    ( 
     sigla
    ) 
;

ALTER TABLE PROVEEDOR 
    ADD CONSTRAINT PROVEEDOR_SUMINISTRO_FK FOREIGN KEY 
    ( 
     SUMINISTRO_PRODUCTO_DETALLE_VENTA_numero_boleta,
     SUMINISTRO_PRODUCTO_DETALLE_VENTA_id_venta,
     SUMINISTRO_PRODUCTO_DETALLE_VENTA_id_producto,
     SUMINISTRO_PRODUCTO_id_sucursal
    ) 
    REFERENCES SUMINISTRO 
    ( 
     PRODUCTO_DETALLE_VENTA_numero_boleta,
     PRODUCTO_DETALLE_VENTA_id_venta,
     PRODUCTO_DETALLE_VENTA_id_producto,
     PRODUCTO_id_sucursal
    ) 
;

ALTER TABLE SUCURSAL 
    ADD CONSTRAINT SUCURSAL_COMUNA_FK FOREIGN KEY 
    ( 
     COMUNA_cod_comuna
    ) 
    REFERENCES COMUNA 
    ( 
     cod_comuna
    ) 
;

ALTER TABLE SUMINISTRO 
    ADD CONSTRAINT SUMINISTRO_PRODUCTO_FK FOREIGN KEY 
    ( 
     PRODUCTO_DETALLE_VENTA_numero_boleta,
     PRODUCTO_DETALLE_VENTA_id_venta,
     PRODUCTO_DETALLE_VENTA_id_producto,
     PRODUCTO_id_sucursal
    ) 
    REFERENCES PRODUCTO 
    ( 
     DETALLE_VENTA_numero_boleta,
     DETALLE_VENTA_id_venta,
     DETALLE_VENTA_id_producto,
     id_sucursal
    ) 
;

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             0
-- ALTER TABLE                             27
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                  10
-- WARNINGS                                 0
