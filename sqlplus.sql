-- Adicionando linhas abaixo no arquivo:
set lines 160
set pages 50000
set time on
set timing on
set sqlprompt "_user'@'_connect_identifier> "

-- Queries de referência
column nome heading "NOME" Format a15 JUSTIFY CENTER
column DESDE heading "DESDE" Format a21 JUSTIFY CENTER
column CRIADO heading "CRIADO" Format a21 JUSTIFY CENTER
column ID format 99 JUSTIFY CENTER
SET UNDERLINE =
set colsep ' | '
select name as nome, 
con_id as ID,
open_mode as status,
restricted as restrito,
to_char(OPEN_TIME,'DD-MON-YYYY HH24:MI:SS') AS DESDE,
creation_time as "CRIADO",
total_size /1024/1024 as "TAMANHO MB"
from v$containers;
