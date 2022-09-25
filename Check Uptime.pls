col name for a8
col "database uptime" for a30
select name,floor(sysdate-cast(open_time as date))||'Days '||floor(((sysdate-cast(open_time as date))-floor(sysdate-cast(open_time as date)))*24)||'hours '||round(((sysdate-cast(open_time as date)-floor(sysdate-cast(open_time as date) )*24)-floor((sysdate-cast(open_time as date)-floor(sysdate-cast(open_time as date))*24)))*60)||'minutes' "Database Uptime" from v$containers;
