select * from v$process where spid=23022;
select * from v$session where paddr='000000042C3781D8';
select * from v$sql a where a.SQL_ID='fzkatnxmx15yc';

select "credate" from bbgps."e_cargps" order by "credate" desc;

select distinct sq.sql_text from v$process pr,v$session se,v$sql sq where pr.spid=31879 and se.paddr=pr.addr and sq.sql_id=se.sql_id;

--�鿴������������ Oracle �ĻỰ����
select PROGRAM,TERMINAL,count(*) as num from v$session group by PROGRAM,TERMINAL order by num desc;

--���� sql id ��ѯ sql ������Ϣ
select SQL_FULLTEXT FROM v$sql where sql_id='0qp9bc901j2h9';

--��ѯ��� sql ִ����Ϣ
select sql_id,count(*),sql_opname,min(sample_time),max(sample_time),program,module,action,machine
       from v$active_session_history
       where sql_id='0qp9bc901j2h9'
       group by sql_id,sql_opname,program,module,action,machine;

--��ѯ�������
select INDEX_NAME,COLUMN_NAME from all_ind_columns where table_name = 't_rent_request_fee';

--��������
--create index idx_pre_request_id on BBGO."e_charge_request"("pre_request_id");

--���ݱ�ռ��ѯ��Ĵ�С
select * from (select segment_name,segment_type,bytes / 1024 / 1024 AS MB
    from dba_segments
    where tablespace_name = 'BBGODB'
    and bytes / 1024 / 1024 >100
    order by bytes desc);
