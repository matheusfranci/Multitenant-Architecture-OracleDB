col tablespace for a10
SELECT d.con_id,A.tablespace_name tablespace, D.mb_total,
SUM (A.used_blocks * D.block_size) / 1024 / 1024 mb_used,
D.mb_total - SUM (A.used_blocks * D.block_size) / 1024 / 1024 mb_free
FROM v$sort_segment A,
(
SELECT b.con_id, b.tablespace_name, C.block_size, SUM (C.bytes) / 1024 / 1024 mb_total
FROM cdb_temp_files B, v$tempfile C
WHERE B.con_id= C.con_id and b.file_name = c.name
GROUP BY b.con_id,b.tablespace_name, C.block_size) D
WHERE A.tablespace_name = D.tablespace_name
GROUP by D.con_id,A.tablespace_name, D.mb_total;
