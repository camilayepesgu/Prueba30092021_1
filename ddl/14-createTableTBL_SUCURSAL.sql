DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_SUCURSAL';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_SUCURSAL';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_SUCURSAL
(
  Id_Sucursal       NUMBER not null,
  Id_Zona           NUMBER not null,
  Id_Municipio      NUMBER not null,
  Nombre_Sucursal   VARCHAR2(50),
  Direccion_Sucursal   VARCHAR2(100),
  Estado_Sucursal   NUMBER(1),
  CONSTRAINT check_Estado_Sucursal  
  CHECK (Estado_Sucursal BETWEEN 0 and 1)
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_SUCURSAL
  is ''Tabla de Sucursals''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_SUCURSAL.Id_Sucursal
  is ''Identificador del Sucursal''';
EXECUTE IMMEDIATE 
'comment on column TBL_SUCURSAL.Id_Zona
  is ''Identificador de la Zona''';  
EXECUTE IMMEDIATE 
'comment on column TBL_SUCURSAL.Id_Municipio
is ''Identificador del Municipio''';  
EXECUTE IMMEDIATE   
'comment on column TBL_SUCURSAL.Nombre_Sucursal
  is ''Nombre de la Sucursal''';
EXECUTE IMMEDIATE   
'comment on column TBL_SUCURSAL.Direccion_Sucursal
  is ''Direccion de la Sucursal''';  
EXECUTE IMMEDIATE   
'comment on column TBL_SUCURSAL.Estado_Sucursal
  is ''Estado del Sucursal 1-activo / 0-inactivo''';

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_SUCURSAL
  add constraint TBL_SUCURSAL_PK primary key (Id_Sucursal)';

 
EXECUTE IMMEDIATE ' ALTER TABLE TBL_SUCURSAL
            ADD CONSTRAINT FK1_TBL_SUCURSAL FOREIGN KEY (Id_Zona)
            REFERENCES TBL_ZONA (Id_Zona)'; 

EXECUTE IMMEDIATE ' ALTER TABLE TBL_SUCURSAL
            ADD CONSTRAINT FK2_TBL_SUCURSAL FOREIGN KEY (Id_Municipio)
            REFERENCES TBL_MUNICIPIO (Id_Municipio)';              
 
END;
/