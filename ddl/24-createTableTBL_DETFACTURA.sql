DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_DETFACTURA';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_DETFACTURA';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_DETFACTURA
(
  Id_DetFactura NUMBER not null,
  Id_Factura NUMBER not null,
  Id_Producto NUMBER NOT NULL,
  Cantidad_Producto number NOT NULL,
  Descuentos  number ,
  ValorTotal_Producto  number,
  ValorImpuestos_producto Number 
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_DETFACTURA
  is ''Tabla de informacion de detalle de factura''';

EXECUTE IMMEDIATE
-- Add comments to the columns 
'comment on column TBL_DETFACTURA.Id_detFactura
  is ''Identificador del detalle'''; 
EXECUTE IMMEDIATE 

'comment on column TBL_DETFACTURA.Id_Factura
  is ''Identificador de factura''';
EXECUTE IMMEDIATE 
'comment on column TBL_DETFACTURA.Id_Producto
  is ''Identificador de producto''';  
EXECUTE IMMEDIATE 
'comment on column TBL_DETFACTURA.Cantidad_Producto
  is ''Cantidad del producto''';    
EXECUTE IMMEDIATE 
'comment on column TBL_DETFACTURA.Descuentos
  is ''Valor descuento producto'''; 

EXECUTE IMMEDIATE 
'comment on column TBL_DETFACTURA.ValorTotal_producto
is ''Valor total del producto''';
EXECUTE IMMEDIATE 
'comment on column TBL_DETFACTURA.ValorImpuestos_producto
is ''Valor total de impuestos del producto''';
  
EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_DETFACTURA
  add constraint TBL_DETFACTURA_PK primary key (Id_Factura)';
  
EXECUTE IMMEDIATE ' ALTER TABLE TBL_DETFACTURA
            ADD CONSTRAINT FK1_TBL_DETFACTURA FOREIGN KEY (Id_Factura)
            REFERENCES TBL_ENCFACTURA (Id_Factura)'; 
EXECUTE IMMEDIATE ' ALTER TABLE TBL_DETFACTURA
            ADD CONSTRAINT FK2_TBL_DETFACTURA FOREIGN KEY (Id_Producto)
            REFERENCES TBL_PRODUCTO (Id_Producto)';  
            
 END;
/