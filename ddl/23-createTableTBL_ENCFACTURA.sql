DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_ENCFACTURA';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_ENCFACTURA';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_ENCFACTURA
(
  Id_Factura NUMBER not null,
  Id_Mantenimiento NUMBER not null,
  Id_Cliente  NUMBER not null,
  Id_EstadoFactura NUMBER not null,
  Id_MedioPago NUMBER not null,
  Id_sucursal NUMBER not null,
  FechaEmision_Factura Date NOT NULL,
  FechaPago_Factura Date ,
  Observaciones Varchar2(1000),
  ValorTotal_Factura number,
  ValorImpuestos_Factura Number,
  ValorDescuentos_Factura Number,
  Usuario_Generacion Varchar2(100) 
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_ENCFACTURA
  is ''Tabla de informacion de encabezados de factura''';

EXECUTE IMMEDIATE
-- Add comments to the columns 
'comment on column TBL_ENCFACTURA.Id_Factura
  is ''Identificador de factura'''; 
EXECUTE IMMEDIATE 

'comment on column TBL_ENCFACTURA.Id_Mantenimiento
  is ''Identificador del Mantenimiento''';
EXECUTE IMMEDIATE 
'comment on column TBL_ENCFACTURA.Id_Cliente
  is ''Identificador de cliente''';  
EXECUTE IMMEDIATE 
'comment on column TBL_ENCFACTURA.Id_EstadoFactura
  is ''Identificador de estado de la factura''';    
EXECUTE IMMEDIATE 
'comment on column TBL_ENCFACTURA.Id_MedioPago
  is ''Identificador de medio de pago'''; 

EXECUTE IMMEDIATE 
'comment on column TBL_ENCFACTURA.FechaEmision_Factura
  is ''Fecha de generacion de la factura''';    
EXECUTE IMMEDIATE 
'comment on column TBL_ENCFACTURA.FechaPago_Factura
  is ''Fecha de pago'''; 
EXECUTE IMMEDIATE 
'comment on column TBL_ENCFACTURA.Observaciones
  is ''Observaciones'''; 
EXECUTE IMMEDIATE 
'comment on column TBL_ENCFACTURA.ValorTotal_Factura
is ''Valor total de la factura''';
EXECUTE IMMEDIATE 
'comment on column TBL_ENCFACTURA.ValorImpuestos_Factura
is ''Valor total de impuestos de la factura''';
EXECUTE IMMEDIATE 
'comment on column TBL_ENCFACTURA.ValorDescuentos_Factura
is ''Valor total de descuentos de la factura''';

EXECUTE IMMEDIATE 
'comment on column TBL_ENCFACTURA.Usuario_Generacion
is ''Usuario que genera de la factura''';  
  
EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_ENCFACTURA
  add constraint TBL_ENCFACTURA_PK primary key (Id_Factura)';
  
EXECUTE IMMEDIATE ' ALTER TABLE TBL_ENCFACTURA
            ADD CONSTRAINT FK1_TBL_ENCFACTURA FOREIGN KEY (Id_Mantenimiento)
            REFERENCES TBL_MANTENIMIENTO (Id_Mantenimiento)'; 
EXECUTE IMMEDIATE ' ALTER TABLE TBL_ENCFACTURA
            ADD CONSTRAINT FK2_TBL_ENCFACTURA FOREIGN KEY (Id_Cliente)
            REFERENCES TBL_CLIENTE (Id_Cliente)';            
EXECUTE IMMEDIATE ' ALTER TABLE TBL_ENCFACTURA
            ADD CONSTRAINT FK3_TBL_ENCFACTURA FOREIGN KEY (Id_EstadoFactura)
            REFERENCES TBL_ESTADOFACTURA (Id_EstadoFactura)';
EXECUTE IMMEDIATE ' ALTER TABLE TBL_ENCFACTURA
            ADD CONSTRAINT FK4_TBL_ENCFACTURA FOREIGN KEY (Id_MedioPago)
            REFERENCES TBL_MEDIOPAGO (Id_MedioPago)';
EXECUTE IMMEDIATE ' ALTER TABLE TBL_ENCFACTURA
            ADD CONSTRAINT FK5_TBL_ENCFACTURA FOREIGN KEY (Id_sucursal)
            REFERENCES TBL_SUCURSAL (Id_sucursal)';              
            
 END;
/