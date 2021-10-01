DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_ESTADOMANTENIMIENTO';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_ESTADOMANTENIMIENTO';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_ESTADOMANTENIMIENTO
(
  Id_EstadoMantenimiento     NUMBER not null,
  Desc_EstadoMantenimiento   VARCHAR2(50),
  Estado_EstadoMantenimiento   NUMBER(1),
  CONSTRAINT check_Estado_EstadoMantenimiento  
  CHECK (Estado_EstadoMantenimiento BETWEEN 0 and 1)
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_ESTADOMANTENIMIENTO
  is ''Tabla de EstadoMantenimientos''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_ESTADOMANTENIMIENTO.Id_EstadoMantenimiento
  is ''Identificador del Estado de Mantenimiento''';
EXECUTE IMMEDIATE   
'comment on column TBL_ESTADOMANTENIMIENTO.Desc_EstadoMantenimiento
  is ''Nombre del Estado de Mantenimiento''';
EXECUTE IMMEDIATE   
'comment on column TBL_ESTADOMANTENIMIENTO.Estado_EstadoMantenimiento
  is ''Estado del Estado de Mantenimiento 1-activo / 0-inactivo''';

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_ESTADOMANTENIMIENTO
  add constraint TBL_ESTADOMANTENIMIENTO_PK primary key (Id_EstadoMantenimiento)';

EXECUTE IMMEDIATE
'alter table TBL_ESTADOMANTENIMIENTO
  add constraint TBL_ESTADOMANTENIMIENTO_UK unique (Desc_EstadoMantenimiento)';
  
 
END;
/