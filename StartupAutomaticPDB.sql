-- Verificando save state
SQL> select con_name, instance_name, state from dba_pdb_saved_states;

-- Salvando o estado que será mantido após o startup shutdown
SQL> alter pluggable database ALL save state; 
