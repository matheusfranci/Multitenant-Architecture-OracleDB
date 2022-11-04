-- Precisa ser criado no container root e ter o c## como préfixo
CREATE USER c##matheus
IDENTIFIED BY 2022
DEFAULT TABLESPACE USERS
QUOTA 10M ON USERS
PASSWORD EXPIRE
CONTAINER=ALL;

-- Grant de conexão, setagem de pdb e dicionário
GRANT SET CONTAINER, CREATE SESSION, SELECT ANY TABLE, SELECT ANY DICTIONARY TO c##matheus container=ALL;

-- Alteração de senha de usuário comum e local
alter user name identified by senha;

-- Alteração de usuário e senha sys
cd /u01/app/oracle/product/19.0.0/dbhome_1/dbs/
orapwd input_file=orapwnomedainstancia file=orapwnomedainstancia sys=y force=y

- Minha instância
orapwd input_file=orapwprd file=orapwpwd sys=y force=y

-- Bloqueando usuários
ALTER USER matheus ACCOUNT LOCK;

-- Verificando status
SELECT USERNAME, ACCOUNT_STATUS, LOCK_DATE FROM DBA_USERS;

-- Desbloqueando
ALTER USER matheus ACCOUNT UNLOCK;

-- Excluindo usuário
-- Verificando se ele está conectado e possui sessão
SELECT OWNER, OBJECT_NAME, FROM DBA_OBJECTS WHERE OWNER LIKE 'USUARIO';

-- Caso tenha sessão ativa
ALTER SYSTEM KILL SESSION 'SID, SERIAL';
DROP USER matheus;

-- Caso o usuário possua objetos
DROP USER matheus cascade;
