*********************insertar MES************************

declare 
v_fecha_ini date:= TO_dATE('20220601','yyyymmdd');
v_fecha_fin date:= TO_dATE('20220630','yyyymmdd');

begin
  while v_fecha_ini <=v_fecha_fin 
  loop
  insert into mfs_rev_junio 
  select A.FCT_DT,case when MFS_OTC_USR_KEY<>-1 then 'OTC' when APP_USR_30_DY_ST_KEY =566 then 'USSD'else 'DIGITAL'end channel,SVC_ALTRNTV_1_CD SERVICIO,count(0) CANTIDAD,
sum(billd_amt)revenue,sum(TRX_AMT_RL)Monto,count(distinct a.PRIM_MFS_USR_CI_KEY)usuarios,count(distinct MFS_OTC_USR_KEY) USURIOSOTC
   from dtl.mfs_svc_fct@BIDWDB a 
     left join (SELECT * FROM dtl.mfs_usr_trckng_fct@BIDWDB WHERE FCT_DT = v_fecha_ini)b
        on a.PRIM_MFS_USR_CI_KEY=b.mfs_usr_key AND A.FCT_DT =B.FCT_DT
        -- left join dtl.mfs_usr_trckng_fct subpartition(p20220630)d
     --   on a.SCDY_MFS_USR_CI_KEY=d.mfs_usr_key
      --  inner join dtl.mfs_usr_tp_dim c on b.mfs_usr_tp_key =c.mfs_usr_tp_key
      --   inner join dtl.mfs_usr_tp_dim e on d.mfs_usr_tp_key =e.mfs_usr_tp_key*/
    where A.SVC_USG_CMPLTN_KEY =184 AND  A.FCT_DT = v_fecha_ini
    GROUP BY A.FCT_DT,case when MFS_OTC_USR_KEY<>-1 then 'OTC' when APP_USR_30_DY_ST_KEY =566 then 'USSD'else 'DIGITAL'end,SVC_ALTRNTV_1_CD;
    commit;    
    v_fecha_ini:=v_fecha_ini + 1;
    end loop;
    
    end;
 /* 
 select count(1),fct_dt from mfs_rev_junio group by fct_dt order by fct_dt
 */   
    /*create table mfs_rev_junio as ( select A.FCT_DT,case when MFS_OTC_USR_KEY<>-1 then 'OTC' when APP_USR_30_DY_ST_KEY =566 then 'USSD'else 'DIGITAL'end channel,SVC_ALTRNTV_1_CD SERVICIO,count(0) CANTIDAD,
sum(billd_amt)revenue,sum(TRX_AMT_RL)Monto,count(distinct a.PRIM_MFS_USR_CI_KEY)usuarios,count(distinct MFS_OTC_USR_KEY) USURIOSOTC
   from dtl.mfs_svc_fct@BIDWDB a 
     left join (SELECT * FROM dtl.mfs_usr_trckng_fct@BIDWDB WHERE FCT_DT = TO_dATE('20220601','YYYYMMDD'))b
        on a.PRIM_MFS_USR_CI_KEY=b.mfs_usr_key AND A.FCT_DT =B.FCT_DT
        -- left join dtl.mfs_usr_trckng_fct subpartition(p20220630)d
     --   on a.SCDY_MFS_USR_CI_KEY=d.mfs_usr_key
      --  inner join dtl.mfs_usr_tp_dim c on b.mfs_usr_tp_key =c.mfs_usr_tp_key
      --   inner join dtl.mfs_usr_tp_dim e on d.mfs_usr_tp_key =e.mfs_usr_tp_key
    where A.SVC_USG_CMPLTN_KEY =184 AND  A.FCT_DT = TO_dATE('20220601','YYYYMMDD')
    GROUP BY A.FCT_DT,case when MFS_OTC_USR_KEY<>-1 then 'OTC' when APP_USR_30_DY_ST_KEY =566 then 'USSD'else 'DIGITAL'end,SVC_ALTRNTV_1_CD)
    
   select * from mfs_rev_junio
   truncate table mfs_rev_junio
*/    
 /*   
   select count(1) from(select A.FCT_DT,case when MFS_OTC_USR_KEY<>-1 then 'OTC' when APP_USR_30_DY_ST_KEY =566 then 'USSD'else 'DIGITAL'end channel,SVC_ALTRNTV_1_CD SERVICIO,count(0) CANTIDAD,
sum(billd_amt)revenue,sum(TRX_AMT_RL)Monto,count(distinct a.PRIM_MFS_USR_CI_KEY)usuarios,count(distinct MFS_OTC_USR_KEY) USURIOSOTC
   from dtl.mfs_svc_fct@BIDWDB a 
     left join (SELECT * FROM dtl.mfs_usr_trckng_fct@BIDWDB WHERE FCT_DT = TO_dATE('20220601','YYYYMMDD'))b
        on a.PRIM_MFS_USR_CI_KEY=b.mfs_usr_key AND A.FCT_DT =B.FCT_DT
        -- left join dtl.mfs_usr_trckng_fct subpartition(p20220630)d
     --   on a.SCDY_MFS_USR_CI_KEY=d.mfs_usr_key
      --  inner join dtl.mfs_usr_tp_dim c on b.mfs_usr_tp_key =c.mfs_usr_tp_key
      --   inner join dtl.mfs_usr_tp_dim e on d.mfs_usr_tp_key =e.mfs_usr_tp_key
    where A.SVC_USG_CMPLTN_KEY =184 AND  A.FCT_DT = TO_dATE('20220601','YYYYMMDD')
    GROUP BY A.FCT_DT,case when MFS_OTC_USR_KEY<>-1 then 'OTC' when APP_USR_30_DY_ST_KEY =566 then 'USSD'else 'DIGITAL'end,SVC_ALTRNTV_1_CD)
    