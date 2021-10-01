DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_DETMANTENIMIENTO';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_DETMANTENIMIENTO';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_DETMANTENIMIENTO
(
  Id_DetMantenimiento NUMBER not null,
  Id_Mantenimiento NUMBER not null,
  Id_Producto  NUMBER not null,
  Cantidad_Producto NUMBER not null
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_DETMANTENIMIENTO
  is ''Tabla de informacion de Fotos''';

EXECUTE IMMEDIATE
-- Add comments to the columns 
'comment on column TBL_DETMANTENIMIENTO.Id_DetMantenimiento
  is ''Identificador de Detalle Mantenimiento'''; 
EXECUTE IMMEDIATE 

'comment on column TBL_DETMANTENIMIENTO.Id_Mantenimiento
  is ''Identificador del Mantenimiento''';
EXECUTE IMMEDIATE 
'comment on column TBL_DETMANTENIMIENTO.Id_Producto
  is ''Identificador de producto''';  
EXECUTE IMMEDIATE 
'comment on column TBL_DETMANTENIMIENTO.Cantidad_Producto
  is ''Cantidad de Producto''';    

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_DETMANTENIMIENTO
  add constraint TBL_DETMANTENIMIENTO_PK primary key (Id_DetMantenimiento)';
  
EXECUTE IMMEDIATE ' ALTER TABLE TBL_DETMANTENIMIENTO
            ADD CONSTRAINT FK1_TBL_DETMANTENIMIENTO FOREIGN KEY (Id_Mantenimiento)
            REFERENCES TBL_MANTENIMIENTO (Id_Mantenimiento)';  
            
 END;
/