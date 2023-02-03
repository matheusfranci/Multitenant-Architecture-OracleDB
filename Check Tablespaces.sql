set pages 80
 set lin 120
 set echo off
 set feed off
 column PCT format 999.99
 column tablespace format A30
 col container for a30
 select substr(t.tablespace_name,1,30) tablespace,
      round(t.tsbytes/(10241024),0) "ALLOCATED(MB)",      round(nvl(s.segbytes,0)/(10241024),0) "USED(MB)",
      round((nvl(s.segbytes,0)/t.tsbytes)*100,2) PCT,
      lower(vc.name) as container
 from
    (select con_id,tablespace_name,sum(bytes) tsbytes from cdb_data_files group by con_id,tablespace_name) t,
    (select con_id,tablespace_name,sum(bytes) segbytes from cdb_segments group by con_id,tablespace_name) s,
    v$containers vc
 where t.con_id=s.con_id(+)
   and t.tablespace_name=s.tablespace_name(+)
   and t.con_id=vc.con_id
 order by container, tablespace;
