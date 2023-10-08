-- Check Local Undo
column property_name format a30
column property_value format a30
select property_name, property_value from
database_properties
where property_name = 'LOCAL_UNDO_ENABLED';

-- Mudando de shared undo para local undo:
conn / as sysdba
shutdown immediate;
startup upgrade;
alter database local undo on;
shutdown immediate;
startup;
