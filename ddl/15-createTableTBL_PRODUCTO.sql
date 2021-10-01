DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_PRODUCTO';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_PRODUCTO';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_PRODUCTO
(
  Id_Producto       NUMBER not null,
  Id_TipoProducto   NUMBER not null,
  Nombre_Producto   VARCHAR2(50),
  Costo_Producto    NUMBER not null,
  Precio_Producto   NUMBER not null,
  PorcIVA_Producto   NUMBER not null,
  Observaciones     VARCHAR2(1000),
  Estado_Producto   NUMBER(1),
  CONSTRAINT check_Estado_Producto  
  CHECK (Estado_Producto BETWEEN 0 and 1)
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_PRODUCTO
  is ''Tabla de Productos''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_PRODUCTO.Id_Producto
  is ''Identificador del Producto''';
EXECUTE IMMEDIATE 
'comment on column TBL_PRODUCTO.Id_Tipoproducto
  is ''Identificador del tipo de producto''';  
EXECUTE IMMEDIATE   
'comment on column TBL_PRODUCTO.Nombre_Producto
  is ''Nombre del Producto''';
EXECUTE IMMEDIATE   
'comment on column TBL_PRODUCTO.Costo_Producto
  is ''Costo del Producto''';  
EXECUTE IMMEDIATE   
'comment on column TBL_PRODUCTO.Precio_Producto
  is ''Precio del Producto'''; 
  EXECUTE IMMEDIATE   
'comment on column TBL_PRODUCTO.PorcIVA_Producto
  is ''Porcentaje de IVA del Producto'''; 
EXECUTE IMMEDIATE   
'comment on column TBL_PRODUCTO.Estado_Producto
  is ''Estado del Producto 1-activo / 0-inactivo''';

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_PRODUCTO
  add constraint TBL_PRODUCTO_PK primary key (Id_Producto)';

 
EXECUTE IMMEDIATE ' ALTER TABLE TBL_PRODUCTO
            ADD CONSTRAINT FK1_TBL_PRODUCTO FOREIGN KEY (Id_TipoProducto)
            REFERENCES TBL_TIPOPRODUCTO (Id_TipoProducto)'; 

        
 END;
/