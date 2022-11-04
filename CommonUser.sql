-- Precisa ser criado no container root e ter o c## como préfixo
CREATE USER c##matheus
IDENTIFIED BY 2022
DEFAULT TABLESPACE USERS
QUOTA 10M ON USERS
PASSWORD EXPIRE
CONTAINER=ALL;

