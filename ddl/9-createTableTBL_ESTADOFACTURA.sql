DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_ESTADOFACTURA';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_ESTADOFACTURA';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_ESTADOFACTURA
(
  Id_EstadoFactura     NUMBER not null,
  Desc_EstadoFactura   VARCHAR2(50),
  Estado_EstadoFactura   NUMBER(1),
  CONSTRAINT check_Estado_EstadoFactura  
  CHECK (Estado_EstadoFactura BETWEEN 0 and 1)
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_ESTADOFACTURA
  is ''Tabla de EstadoFacturas''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_ESTADOFACTURA.Id_EstadoFactura
  is ''Identificador del Estado de la Factura''';
EXECUTE IMMEDIATE   
'comment on column TBL_ESTADOFACTURA.Desc_EstadoFactura
  is ''Nombre del Estado de la Factura''';
EXECUTE IMMEDIATE   
'comment on column TBL_ESTADOFACTURA.Estado_EstadoFactura
  is ''Estado del Estado de la Factura 1-activo / 0-inactivo''';

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_ESTADOFACTURA
  add constraint TBL_ESTADOFACTURA_PK primary key (Id_EstadoFactura)';

EXECUTE IMMEDIATE
'alter table TBL_ESTADOFACTURA
  add constraint TBL_ESTADOFACTURA_UK unique (Desc_EstadoFactura)';
  
 
END;
/