DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_DEPARTAMENTO';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_DEPARTAMENTO';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_DEPARTAMENTO
(
  Id_Departamento     NUMBER not null,
  CodDANE_Departamento  NUMBER not null,
  Nombre_Departamento   VARCHAR2(50),
  Estado_Departamento   NUMBER(1),
  CONSTRAINT check_Estado_Departamento  
  CHECK (Estado_Departamento BETWEEN 0 and 1)
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_DEPARTAMENTO
  is ''Tabla de Departamentos''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_DEPARTAMENTO.Id_Departamento
  is ''Identificador del Departamento''';
EXECUTE IMMEDIATE   
'comment on column TBL_DEPARTAMENTO.CodDANE_Departamento
  is ''Codigo DANE del Departamento''';  
EXECUTE IMMEDIATE   
'comment on column TBL_DEPARTAMENTO.Nombre_Departamento
  is ''Nombre del Departamento''';
EXECUTE IMMEDIATE   
'comment on column TBL_DEPARTAMENTO.Estado_Departamento
  is ''Estado del Departamento 1-activo / 0-inactivo''';

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_DEPARTAMENTO
  add constraint TBL_DEPARTAMENTO_PK primary key (Id_Departamento)';

EXECUTE IMMEDIATE
'alter table TBL_DEPARTAMENTO
  add constraint TBL_DEPARTAMENTO_UK unique (Nombre_Departamento)';
  
 
END;
/