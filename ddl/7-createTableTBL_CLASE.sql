DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_CLASE';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_CLASE';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_CLASE
(
  Id_Clase     NUMBER not null,
  Desc_Clase   VARCHAR2(50),
  Estado_Clase   NUMBER(1),
  CONSTRAINT check_Estado_Clase  
  CHECK (Estado_Clase BETWEEN 0 and 1)
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_CLASE
  is ''Tabla de Clases''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_CLASE.Id_Clase
  is ''Identificador de la Clase''';
EXECUTE IMMEDIATE   
'comment on column TBL_CLASE.Desc_Clase
  is ''Nombre de la Clase''';
EXECUTE IMMEDIATE   
'comment on column TBL_CLASE.Estado_Clase
  is ''Estado de la Clase 1-activo / 0-inactivo''';

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_CLASE
  add constraint TBL_CLASE_PK primary key (Id_Clase)';

EXECUTE IMMEDIATE
'alter table TBL_CLASE
  add constraint TBL_CLASE_UK unique (Desc_Clase)';
  
 
END;
/