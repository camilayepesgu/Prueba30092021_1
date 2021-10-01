DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_EMPLEADO';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_EMPLEADO';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_EMPLEADO
(
  Id_Empleado         NUMBER not null,
  Id_Municipio       NUMBER not null,
  Id_TipoDocumento   NUMBER not null,
  NumeroDoc_Empleado  varchar2(20) not null,
  PrimerNom_Empleado  varchar2(50) not null,
  SegundoNom_Empleado varchar2(50),
  PrimerApe_Empleado  varchar2(50),
  SegundoApe_Empleado varchar2(50),
  Direccion_Empleado varchar2(100),
  NumeroCel_Empleado NUMBER(20),
  Email_Empleado varchar2(100),
  estado_Empleado  NUMBER(1),
  CONSTRAINT check_estado_Empleado
  CHECK (estado_Empleado BETWEEN 0 and 1)
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_EMPLEADO
  is ''Tabla de informacion de Empleados''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_EMPLEADO.Id_Empleado
  is ''Identificador del Empleado''';
EXECUTE IMMEDIATE 
'comment on column TBL_EMPLEADO.Id_Municipio
  is ''Identificador del municipio''';  
EXECUTE IMMEDIATE 
'comment on column TBL_EMPLEADO.Id_TipoDocumento
  is ''Identificador del tipo de documento''';    
EXECUTE IMMEDIATE   
'comment on column TBL_EMPLEADO.NumeroDoc_Empleado
  is ''Numero de Documento''';
EXECUTE IMMEDIATE   
'comment on column TBL_EMPLEADO.PrimerNom_Empleado
  is ''Primer Nombre''';
EXECUTE IMMEDIATE   
'comment on column TBL_EMPLEADO.SegundoNom_Empleado
  is ''Segundo Nombre''';  
EXECUTE IMMEDIATE   
'comment on column TBL_EMPLEADO.PrimerApe_Empleado
  is ''Primer Apellido''';
EXECUTE IMMEDIATE   
'comment on column TBL_EMPLEADO.SegundoApe_Empleado
  is ''Segundo Apellido'''; 
EXECUTE IMMEDIATE   
'comment on column TBL_EMPLEADO.Direccion_Empleado
  is ''Direccion''';  
EXECUTE IMMEDIATE   
'comment on column TBL_EMPLEADO.NumeroCel_Empleado
  is ''Numero Telefono Movil''';
EXECUTE IMMEDIATE   
'comment on column TBL_EMPLEADO.Email_Empleado
  is ''Correo Electronico'''; 
EXECUTE IMMEDIATE   
'comment on column TBL_EMPLEADO.estado_empleado
  is ''Estado del empleado 1-activo / 0-inactivo''';
EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_EMPLEADO
  add constraint TBL_EMPLEADO_PK primary key (Id_Empleado)';
  
  EXECUTE IMMEDIATE
'alter table TBL_EMPLEADO
  add constraint TBL_EMPLEADO_UK unique (Id_TipoDocumento,NumeroDoc_Empleado)';

EXECUTE IMMEDIATE ' ALTER TABLE TBL_EMPLEADO
            ADD CONSTRAINT FK1_TBL_EMPLEADO FOREIGN KEY (Id_TipoDocumento)
            REFERENCES TBL_TIPODOCUMENTO (Id_TipoDocumento)';  
            
EXECUTE IMMEDIATE ' ALTER TABLE TBL_EMPLEADO
            ADD CONSTRAINT FK2_TBL_EMPLEADO FOREIGN KEY (Id_Municipio)
            REFERENCES TBL_MUNICIPIO (Id_Municipio)'; 

        
 END;
/