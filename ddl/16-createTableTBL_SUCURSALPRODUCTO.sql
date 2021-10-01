DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_SUCURSALPRODUCTO';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_SUCURSALPRODUCTO';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_SUCURSALPRODUCTO
(
  Id_SucursalProducto NUMBER not null,
  Id_Producto       NUMBER not null,
  Id_Sucursal       NUMBER not null,
  cantidad_SucursalProducto NUMBER not null
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_SUCURSALPRODUCTO
  is ''Tabla de Productos en la sucursal''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_SUCURSALPRODUCTO.Id_SucursalProducto
  is ''Identificador del registro que relaciona las sucursales con los productos''';
EXECUTE IMMEDIATE 
'comment on column TBL_SUCURSALPRODUCTO.Id_Producto
  is ''Identificador del producto''';  
EXECUTE IMMEDIATE 
'comment on column TBL_SUCURSALPRODUCTO.Id_Sucursal
  is ''Identificador de la sucursal''';    
EXECUTE IMMEDIATE   
'comment on column TBL_SUCURSALPRODUCTO.cantidad_SucursalProducto
  is ''Unidades del Producto en la sucursal''';

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_SUCURSALPRODUCTO
  add constraint TBL_SUCURSALPRODUCTO_PK primary key (Id_SucursalProducto)';

EXECUTE IMMEDIATE ' ALTER TABLE TBL_SUCURSALPRODUCTO
            ADD CONSTRAINT FK1_TBL_SUCURSALPRODUCTO FOREIGN KEY (Id_sucursal)
            REFERENCES TBL_SUCURSAL (Id_sucursal)';  
            
EXECUTE IMMEDIATE ' ALTER TABLE TBL_SUCURSALPRODUCTO
            ADD CONSTRAINT FK2_TBL_SUCURSALPRODUCTO FOREIGN KEY (Id_Producto)
            REFERENCES TBL_PRODUCTO (Id_Producto)'; 

        
 END;
/