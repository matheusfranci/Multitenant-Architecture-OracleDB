-- Verificar o db_create_file_dest
show parameter create;

-- Sair do sqlplus e entrar no RMAN
Report schema;

--Verificar onde estão os pdbs e alterar o db_create_file_dest apontando para a raiz deles.
ALTER SYSTEM SET DB_CREATE_FILE_DEST='C:\ORACLE\ORADATA';

--Criação junto com o admin
 create pluggable database PDBTEST admin user matheusorion identified by 2022;
  OR
 create pluggable database PDBTEST2 admin user matheusorion identified by 2022
  create_file_dest='C:\Oracle\oradata';
 
 -Dropar caso crie errado
 DROP PLUGGABLE DATABASE PDBTEST INCLUDING DATAFILES;
 
 
 
