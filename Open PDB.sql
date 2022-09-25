--Lembre-se sempre de verificar o pdb atual com a consulta:
show con_name

-- Primeiro deve-se entrar no pdb:
alter session set container=nomedopdb; 

-- Abertura em modo restrito
alter pluggable database open restricted;

--Abertura normal
alter pluggable database open;
