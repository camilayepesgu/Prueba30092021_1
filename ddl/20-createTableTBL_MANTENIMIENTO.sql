DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_MANTENIMIENTO';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_MANTENIMIENTO';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_MANTENIMIENTO
(
  Id_Mantenimiento NUMBER not null,
  Id_Vehiculo      NUMBER not null,
  Id_Empleado      NUMBER not null,
  Id_EstadoMantenimiento NUMBER not null,
  Id_sucursal     NUMBER not null,
  FechaIngreso_Mantenimiento   DATE,
  FechaSalida_Mantenimiento   DATE,
  Observaciones  varchar2(1000),
  Presupuesto_Mantenimiento  NUMBER
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_MANTENIMIENTO
  is ''Tabla de informacion de Mantenimientos''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_MANTENIMIENTO.Id_Mantenimiento
  is ''Identificador del Mantenimiento''';
EXECUTE IMMEDIATE 
'comment on column TBL_MANTENIMIENTO.Id_Vehiculo
  is ''Identificador de Vehiculo''';  
EXECUTE IMMEDIATE 
'comment on column TBL_MANTENIMIENTO.Id_Empleado
  is ''Identificador del empleado encargado''';    
EXECUTE IMMEDIATE   
'comment on column TBL_MANTENIMIENTO.Id_EstadoMantenimiento
  is ''Identificador del estado de mantenimiento''';
EXECUTE IMMEDIATE   
'comment on column TBL_MANTENIMIENTO.FechaIngreso_Mantenimiento
  is ''Fecha ingreso a mantenimiento''';
EXECUTE IMMEDIATE   
'comment on column TBL_MANTENIMIENTO.FechaSalida_Mantenimiento
  is ''Fecha salida de mantenimiento''';  
EXECUTE IMMEDIATE   
'comment on column TBL_MANTENIMIENTO.Observaciones
  is ''Obserrvaciones del mantenimiento''';
EXECUTE IMMEDIATE   
'comment on column TBL_MANTENIMIENTO.Presupuesto_Mantenimiento
  is ''Presupuesto del Mantenimiento'''; 
 

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_MANTENIMIENTO
  add constraint TBL_MANTENIMIENTO_PK primary key (Id_Mantenimiento)';
  
EXECUTE IMMEDIATE ' ALTER TABLE TBL_MANTENIMIENTO
            ADD CONSTRAINT FK1_TBL_MANTENIMIENTO FOREIGN KEY (Id_Vehiculo)
            REFERENCES TBL_VEHICULO (Id_Vehiculo)';  
            
EXECUTE IMMEDIATE ' ALTER TABLE TBL_MANTENIMIENTO
            ADD CONSTRAINT FK2_TBL_MANTENIMIENTO FOREIGN KEY (Id_Empleado)
            REFERENCES TBL_EMPLEADO (Id_Empleado)'; 
EXECUTE IMMEDIATE ' ALTER TABLE TBL_MANTENIMIENTO
            ADD CONSTRAINT FK3_TBL_MANTENIMIENTO FOREIGN KEY (Id_EstadoMantenimiento)
            REFERENCES TBL_ESTADOMANTENIMIENTO (Id_EstadoMantenimiento)';  

EXECUTE IMMEDIATE ' ALTER TABLE TBL_MANTENIMIENTO
            ADD CONSTRAINT FK4_TBL_MANTENIMIENTO FOREIGN KEY (Id_sucursal)
            REFERENCES TBL_SUCURSAL (Id_sucursal)';  

 END;
/