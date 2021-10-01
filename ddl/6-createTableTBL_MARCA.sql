DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_MARCA';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_MARCA';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_MARCA
(
  Id_Marca     NUMBER not null,
  Desc_Marca   VARCHAR2(50),
  Estado_Marca   NUMBER(1),
  CONSTRAINT check_Estado_Marca  
  CHECK (Estado_Marca BETWEEN 0 and 1)
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_MARCA
  is ''Tabla de marcas''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_MARCA.Id_Marca
  is ''Identificador de la marca''';
EXECUTE IMMEDIATE   
'comment on column TBL_MARCA.Desc_Marca
  is ''Nombre de la marca''';
EXECUTE IMMEDIATE   
'comment on column TBL_MARCA.Estado_Marca
  is ''Estado de la marca 1-activo / 0-inactivo''';

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_MARCA
  add constraint TBL_MARCA_PK primary key (Id_Marca)';

EXECUTE IMMEDIATE
'alter table TBL_MARCA
  add constraint TBL_MARCA_UK unique (Desc_Marca)';
  
 
END;
/