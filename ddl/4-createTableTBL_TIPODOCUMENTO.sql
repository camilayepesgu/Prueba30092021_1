DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_TIPODOCUMENTO';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_TIPODOCUMENTO';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_TIPODOCUMENTO
(
  Id_TipoDocumento     NUMBER not null,
  nombre_TipoDocumento VARCHAR2(40),
  Estado_TipoDocumento   NUMBER(1),
  CONSTRAINT check_Estado_TipoDocumento 
  CHECK (Estado_TipoDocumento BETWEEN 0 and 1)
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_TIPODOCUMENTO
  is ''Tabla de Tipos de documentos''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_TIPODOCUMENTO.Id_TipoDocumento
  is ''Identificador del tipo de documento''';
EXECUTE IMMEDIATE   
'comment on column TBL_TIPODOCUMENTO.nombre_TipoDocumento
  is ''Nombre del tipo de documento''';
EXECUTE IMMEDIATE   
'comment on column TBL_TIPODOCUMENTO.Estado_TipoDocumento
  is ''Estado del tipo de documento 1-activo / 0-inactivo''';

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_TIPODOCUMENTO
  add constraint TBL_TIPODOCUMENTO_PK primary key (Id_TipoDocumento)';

EXECUTE IMMEDIATE
'alter table TBL_TIPODOCUMENTO
  add constraint TBL_TIPODOCUMENTO_UK unique (nombre_TipoDocumento)';
  
 
END;
/