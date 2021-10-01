DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_CLIENTE';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_CLIENTE';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_CLIENTE
(
  Id_Cliente         NUMBER not null,
  Id_Municipio       NUMBER not null,
  Id_TipoDocumento   NUMBER not null,
  NumeroDoc_Cliente  varchar2(20) not null,
  PrimerNom_Cliente  varchar2(50) not null,
  SegundoNom_Cliente varchar2(50),
  PrimerApe_Cliente  varchar2(50),
  SegundoApe_Cliente varchar2(50),
  Direccion_Cliente varchar2(100),
  NumeroCel_Cliente NUMBER(20),
  Email_Cliente varchar2(100)
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_CLIENTE
  is ''Tabla de informacion de Clientes''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_CLIENTE.Id_Cliente
  is ''Identificador del cliente''';
EXECUTE IMMEDIATE 
'comment on column TBL_CLIENTE.Id_Municipio
  is ''Identificador del municipio''';  
EXECUTE IMMEDIATE 
'comment on column TBL_CLIENTE.Id_TipoDocumento
  is ''Identificador del tipo de documento''';    
EXECUTE IMMEDIATE   
'comment on column TBL_CLIENTE.NumeroDoc_Cliente
  is ''Numero de Documento''';
EXECUTE IMMEDIATE   
'comment on column TBL_CLIENTE.PrimerNom_Cliente
  is ''Primer Nombre''';
EXECUTE IMMEDIATE   
'comment on column TBL_CLIENTE.SegundoNom_Cliente
  is ''Segundo Nombre''';  
EXECUTE IMMEDIATE   
'comment on column TBL_CLIENTE.PrimerApe_Cliente
  is ''Primer Apellido''';
EXECUTE IMMEDIATE   
'comment on column TBL_CLIENTE.SegundoApe_Cliente
  is ''Segundo Apellido'''; 
EXECUTE IMMEDIATE   
'comment on column TBL_CLIENTE.Direccion_Cliente
  is ''Direccion''';  
EXECUTE IMMEDIATE   
'comment on column TBL_CLIENTE.NumeroCel_Cliente
  is ''Numero Telefono Movil''';
EXECUTE IMMEDIATE   
'comment on column TBL_CLIENTE.Email_Cliente
  is ''Correo Electronico'''; 

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_CLIENTE
  add constraint TBL_CLIENTE_PK primary key (Id_Cliente)';
  
  EXECUTE IMMEDIATE
'alter table TBL_CLIENTE
  add constraint TBL_CLIENTE_UK unique (Id_TipoDocumento,NumeroDoc_Cliente)';

EXECUTE IMMEDIATE ' ALTER TABLE TBL_CLIENTE
            ADD CONSTRAINT FK1_TBL_CLIENTE FOREIGN KEY (Id_TipoDocumento)
            REFERENCES TBL_TIPODOCUMENTO (Id_TipoDocumento)';  
            
EXECUTE IMMEDIATE ' ALTER TABLE TBL_CLIENTE
            ADD CONSTRAINT FK2_TBL_CLIENTE FOREIGN KEY (Id_Municipio)
            REFERENCES TBL_MUNICIPIO (Id_Municipio)'; 

        
 END;
/