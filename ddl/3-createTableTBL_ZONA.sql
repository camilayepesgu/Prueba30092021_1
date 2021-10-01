DECLARE
  l_cnt integer;
 
BEGIN
  SELECT COUNT(*)
    INTO l_cnt 
    FROM all_all_tables 
   WHERE OWNER = 'CARCENTER'
     AND TABLE_NAME = 'TBL_ZONA';
  
  IF( l_cnt = 1 ) THEN
    --drop tabla
    EXECUTE IMMEDIATE 'DROP TABLE TBL_ZONA';
    
  END IF;

--Crear tablas
 EXECUTE IMMEDIATE 'create table TBL_ZONA
(
  id_zona     NUMBER not null,
  nombre_zona VARCHAR2(50),
  estado_zona  NUMBER(1),
  CONSTRAINT check_estado_zona
  CHECK (estado_zona BETWEEN 0 and 1)
)';

EXECUTE IMMEDIATE 
-- Add comments to the table 
'comment on table TBL_ZONA
  is ''Tabla de Zonas del carcenter''';
    
EXECUTE IMMEDIATE 
-- Add comments to the columns 
'comment on column TBL_ZONA.id_zona
  is ''Identificador de la zona''';
EXECUTE IMMEDIATE   
'comment on column TBL_ZONA.nombre_zona
  is ''Nombre de la zona''';
EXECUTE IMMEDIATE   
'comment on column TBL_ZONA.estado_zona
  is ''Estado de la zona 1-activo / 0-inactivo''';

EXECUTE IMMEDIATE 
-- Create/Recreate primary, unique and foreign key constraints 
'alter table TBL_ZONA
  add constraint TBL_ZONA_PK primary key (id_zona)';

EXECUTE IMMEDIATE
'alter table TBL_ZONA
  add constraint TBL_ZONA_UK unique (nombre_zona)';
  
 
END;
/