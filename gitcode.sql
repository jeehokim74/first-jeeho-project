DECLARE __BSDA  DATE;
DECLARE __PCF_BSDA  DATE;
DECLARE __BSTR STRING DEFAULT NULL;
DECLARE __PVC_CD STRING DEFAULT NULL;                 /* SET_PVC_VDL_HNDL_STAT 변수 */
DECLARE __CMPN_CD STRING DEFAULT '1000';
DECLARE __ROWCOUNT  INT64 DEFAULT 0;
DECLARE __ITEM_CNT_MAX_VL FLOAT64 DEFAULT 0;
DECLARE __MSG_FLG  FLOAT64 DEFAULT 0;
DECLARE __MSG_ST  STRING  DEFAULT NULL;
DECLARE __NULL_STR STRING DEFAULT NULL;

SET __PVC_CD = 'GP_A014C_MD_W01';     /* PVC_INFO 참고, PVC_CD*/
SET __BSDA = PARSE_DATE('%Y%m%d', '20220623');
SET __PCF_BSDA = __BSDA;
SET __BSTR = FORMAT_DATE('%Y%m%d', __BSDA);
SET __PCF_BSDA = (SELECT MAX(BSDA) FROM vdl_cf2b9cfa.TAG_CVT_TBL_META WHERE CVT_ID LIKE 'pcf_rv10_002_m%' AND BSDA <= __BSDA);    
SET __ITEM_CNT_MAX_VL = (SELECT ITEM_CNT_MAX_VL FROM vdl_c9df0ef1.PVC_INFO WHERE PVC_CD = __PVC_CD);

SELECT *
FROM vdl_cf2b9cfa.GET_TB_TAG_DATA(__BSDA, 'erp_rv14_001_d' )
WHERE TRUE
AND BSDA = __BSDA