DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_TIPOCOMBUSTIBLE';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_TIPOCOMBUSTIBLE';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_TIPOCOMBUSTIBLE
(
  Id_TipoCombustible     NUMBER not null,
  Desc_TipoCombustible   VARCHAR2(50),
  Estado_TipoCombustible   NUMBER(1),
  CONSTRAINT check_Estado_TipoCombustible  
  CHECK (Estado_TipoCombustible BETWEEN 0 and 1)
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_TIPOCOMBUSTIBLE
  is ''Tabla de TipoCombustibles''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_TIPOCOMBUSTIBLE.Id_TipoCombustible
  is ''Identificador del Tipo de Combustible''';
EXECUTE IMMEDIATE   
'comment on column TBL_TIPOCOMBUSTIBLE.Desc_TipoCombustible
  is ''Nombre del Tipo de Combustible''';
EXECUTE IMMEDIATE   
'comment on column TBL_TIPOCOMBUSTIBLE.Estado_TipoCombustible
  is ''Estado del Tipo de Combustible 1-activo / 0-inactivo''';

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_TIPOCOMBUSTIBLE
  add constraint TBL_TIPOCOMBUSTIBLE_PK primary key (Id_TipoCombustible)';

EXECUTE IMMEDIATE
'alter table TBL_TIPOCOMBUSTIBLE
  add constraint TBL_TIPOCOMBUSTIBLE_UK unique (Desc_TipoCombustible)';
  
 
END;
/