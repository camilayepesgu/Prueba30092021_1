DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_FOTOSMANTENIMIENTO';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_FOTOSMANTENIMIENTO';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_FOTOSMANTENIMIENTO
(
  Id_Foto NUMBER not null,
  Id_Mantenimiento NUMBER not null,
  FechaCargue_Foto  DATE,
  Foto  BLOB not null
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_FOTOSMANTENIMIENTO
  is ''Tabla de informacion de Fotos''';

EXECUTE IMMEDIATE
-- Add comments to the columns 
'comment on column TBL_FOTOSMANTENIMIENTO.Id_Foto
  is ''Identificador de Vehiculo'''; 
EXECUTE IMMEDIATE 

'comment on column TBL_FOTOSMANTENIMIENTO.Id_Mantenimiento
  is ''Identificador del Mantenimiento''';
EXECUTE IMMEDIATE 
'comment on column TBL_FOTOSMANTENIMIENTO.FechaCargue_Foto
  is ''Identificador de Vehiculo''';  
EXECUTE IMMEDIATE 
'comment on column TBL_FOTOSMANTENIMIENTO.Foto
  is ''Identificador del empleado encargado''';    

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_FOTOSMANTENIMIENTO
  add constraint TBL_FOTOSMANTENIMIENTO_PK primary key (Id_Foto)';
  
EXECUTE IMMEDIATE ' ALTER TABLE TBL_FOTOSMANTENIMIENTO
            ADD CONSTRAINT FK1_TBL_FOTOSMANTENIMIENTO FOREIGN KEY (Id_Mantenimiento)
            REFERENCES TBL_MANTENIMIENTO (Id_Mantenimiento)';  
            
 END;
/