DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_TIPOPRODUCTO';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_TIPOPRODUCTO';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_TIPOPRODUCTO
(
  Id_TipoProducto     NUMBER not null,
  Desc_TipoProducto   VARCHAR2(50),
  Estado_TipoProducto   NUMBER(1),
  CONSTRAINT check_Estado_TipoProducto  
  CHECK (Estado_TipoProducto BETWEEN 0 and 1)
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_TIPOPRODUCTO
  is ''Tabla de Tipos de productos''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_TIPOPRODUCTO.Id_TipoProducto
  is ''Identificador del tipo de producto''';
EXECUTE IMMEDIATE   
'comment on column TBL_TIPOPRODUCTO.Desc_TipoProducto
  is ''Nombre del tipo de producto''';
EXECUTE IMMEDIATE   
'comment on column TBL_TIPOPRODUCTO.Estado_TipoProducto
  is ''Estado del tipo de producto 1-activo / 0-inactivo''';

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_TIPOPRODUCTO
  add constraint TBL_TIPOPRODUCTO_PK primary key (Id_TipoProducto)';

EXECUTE IMMEDIATE
'alter table TBL_TIPOPRODUCTO
  add constraint TBL_TIPOPRODUCTO_UK unique (Desc_TipoProducto)';
  
 
END;
/