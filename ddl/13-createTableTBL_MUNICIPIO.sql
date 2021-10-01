DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_MUNICIPIO';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_MUNICIPIO';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_MUNICIPIO
(
  Id_Municipio       NUMBER not null,
  Id_Departamento    NUMBER not null,
  CodDANE_Municipio  NUMBER not null,
  Nombre_Municipio   VARCHAR2(50),
  Estado_Municipio   NUMBER(1),
  CONSTRAINT check_Estado_Municipio  
  CHECK (Estado_Municipio BETWEEN 0 and 1)
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_MUNICIPIO
  is ''Tabla de Municipios''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_MUNICIPIO.Id_Municipio
  is ''Identificador del Municipio''';
EXECUTE IMMEDIATE 
'comment on column TBL_MUNICIPIO.Id_Departamento
  is ''Identificador del Departamento''';  
EXECUTE IMMEDIATE   
'comment on column TBL_MUNICIPIO.CodDANE_Municipio
  is ''Codigo DANE del Municipio''';  
EXECUTE IMMEDIATE   
'comment on column TBL_MUNICIPIO.Nombre_Municipio
  is ''Nombre del Municipio''';
EXECUTE IMMEDIATE   
'comment on column TBL_MUNICIPIO.Estado_Municipio
  is ''Estado del Municipio 1-activo / 0-inactivo''';

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_MUNICIPIO
  add constraint TBL_MUNICIPIO_PK primary key (Id_Municipio)';

 
EXECUTE IMMEDIATE ' ALTER TABLE TBL_MUNICIPIO
            ADD CONSTRAINT FK1_TBL_MUNICIPIO FOREIGN KEY (Id_Departamento)
            REFERENCES TBL_DEPARTAMENTO (Id_Departamento)';  
 
END;
/