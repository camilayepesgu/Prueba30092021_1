DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_MEDIOPAGO';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_MEDIOPAGO';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_MEDIOPAGO
(
  Id_MedioPago     NUMBER not null,
  Desc_MedioPago   VARCHAR2(50),
  Estado_MedioPago   NUMBER(1),
  CONSTRAINT check_Estado_MedioPago  
  CHECK (Estado_MedioPago BETWEEN 0 and 1)
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_MEDIOPAGO
  is ''Tabla de MedioPagos''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_MEDIOPAGO.Id_MedioPago
  is ''Identificador del Medio de Pago''';
EXECUTE IMMEDIATE   
'comment on column TBL_MEDIOPAGO.Desc_MedioPago
  is ''Nombre del Medio de Pago''';
EXECUTE IMMEDIATE   
'comment on column TBL_MEDIOPAGO.Estado_MedioPago
  is ''Estado del Medio de Pago 1-activo / 0-inactivo''';

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_MEDIOPAGO
  add constraint TBL_MEDIOPAGO_PK primary key (Id_MedioPago)';

EXECUTE IMMEDIATE
'alter table TBL_MEDIOPAGO
  add constraint TBL_MEDIOPAGO_UK unique (Desc_MedioPago)';
  
 
END;
/