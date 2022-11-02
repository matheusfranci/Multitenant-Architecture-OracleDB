create or replace trigger startup_pdbs
after startup on database
begin
  execute immediate 'alter pluggable database ORCLPDB open';
  execute immediate 'alter pluggable database PDBTEST open';
end;
/
