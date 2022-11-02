create or replace trigger startup_pdbs
after startup on database
begin
  execute immediate 'alter pluggable database name open';
end;
/
