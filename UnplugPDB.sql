sqlplus / as sysdba

-- Dentro do cdb
ALTER PLUGGABLE DATABASE pdbname CLOSE;

-- Dentro do cdb
ALTER PLUGGABLE DATABASE pdb5 UNPLUG INTO '/u01/pdb5.pdb';


-- Em outra instância com o arquivo gerado do pdp dentro do fs para criar o pdb com base em outro basta esse comando
CREATE PLUGGABLE DATABASE ecoapp using '/mnt/c/Oracle Backup/ecoapp.pdb';




SET SERVEROUTPUT ON
DECLARE
  l_result BOOLEAN;
BEGIN
  l_result := DBMS_PDB.check_plug_compatibility(
                pdb_descr_file => '/mnt/c/Oracle Backup/ecoapp.pdb',
                pdb_name       => 'ecoapp');

  IF l_result THEN
    DBMS_OUTPUT.PUT_LINE('compatible');
  ELSE
    DBMS_OUTPUT.PUT_LINE('incompatible');
  END IF;
END;
/

