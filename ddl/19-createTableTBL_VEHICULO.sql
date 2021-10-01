DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_VEHICULO';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_VEHICULO';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_VEHICULO
(
  Id_Vehiculo NUMBER not null,
  Id_Clase   NUMBER not null,
  Id_Marca   NUMBER not null,
  Id_TipoCombustible   NUMBER not null,
  Id_Cliente   NUMBER not null,
  Placa_Vehiculo  varchar2(10),
  Color_Vehiculo  varchar2(50),
  Cilindraje_Vehiculo NUMBER not null,
  Modelo_Vehiculo  NUMBER not null
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_VEHICULO
  is ''Tabla de informacion de Vehiculos''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_VEHICULO.Id_Vehiculo
  is ''Identificador del Vehiculo''';
EXECUTE IMMEDIATE 
'comment on column TBL_VEHICULO.Id_Clase
  is ''Identificador de la clase''';  
EXECUTE IMMEDIATE 
'comment on column TBL_VEHICULO.Id_Marca
  is ''Identificador de la marca''';    
EXECUTE IMMEDIATE   
'comment on column TBL_VEHICULO.Id_TipoCombustible
  is ''Identificador del tipo de combustible''';
EXECUTE IMMEDIATE   
'comment on column TBL_VEHICULO.Id_Cliente
  is ''Identificador del Cliente''';
EXECUTE IMMEDIATE   
'comment on column TBL_VEHICULO.Placa_Vehiculo
  is ''Identificador de los vehiculos''';  
EXECUTE IMMEDIATE   
'comment on column TBL_VEHICULO.Color_Vehiculo
  is ''Color del vehiculo''';
EXECUTE IMMEDIATE   
'comment on column TBL_VEHICULO.Cilindraje_Vehiculo
  is ''Cilidraje del Vehiculo'''; 
EXECUTE IMMEDIATE   
'comment on column TBL_VEHICULO.Modelo_Vehiculo
  is ''Modelo del vehiculo''';  

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_VEHICULO
  add constraint TBL_VEHICULO_PK primary key (Id_Vehiculo)';
  
  EXECUTE IMMEDIATE
'alter table TBL_VEHICULO
  add constraint TBL_VEHICULO_UK unique (Placa_Vehiculo)';
  
EXECUTE IMMEDIATE ' ALTER TABLE TBL_VEHICULO
            ADD CONSTRAINT FK1_TBL_VEHICULO FOREIGN KEY (Id_Clase)
            REFERENCES TBL_CLASE (Id_Clase)';  
            
EXECUTE IMMEDIATE ' ALTER TABLE TBL_VEHICULO
            ADD CONSTRAINT FK2_TBL_VEHICULO FOREIGN KEY (Id_Marca)
            REFERENCES TBL_MARCA (Id_Marca)'; 
EXECUTE IMMEDIATE ' ALTER TABLE TBL_VEHICULO
            ADD CONSTRAINT FK3_TBL_VEHICULO FOREIGN KEY (Id_TipoCombustible)
            REFERENCES TBL_TIPOCOMBUSTIBLE (Id_TipoCombustible)';  
            
EXECUTE IMMEDIATE ' ALTER TABLE TBL_VEHICULO
            ADD CONSTRAINT FK4_TBL_VEHICULO FOREIGN KEY (Id_Cliente)
            REFERENCES TBL_CLIENTE (Id_Cliente)';
        
 END;
/