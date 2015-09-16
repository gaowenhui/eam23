			
create sequence SEQ_DIC_APP_ASSETTYPE1
minvalue 0
maxvalue 99999999
start with 20
increment by 1
nocache;

	

CREATE OR REPLACE TRIGGER "TIB_DIC_APP_ASSETTYPE1" BEFORE INSERT
ON DIC_APP_ASSETTYPE1 FOR EACH ROW
BEGIN
    SELECT SEQ_DIC_APP_ASSETTYPE1.NEXTVAL INTO :NEW.assettype1_id FROM DUAL;
END;


			
create sequence SEQ_DIC_APP_ASSETTYPE2
minvalue 0
maxvalue 99999999
start with 2000
increment by 1
nocache;

CREATE OR REPLACE TRIGGER "TIB_DIC_APP_ASSETTYPE2" BEFORE INSERT
ON DIC_APP_ASSETTYPE2 FOR EACH ROW
BEGIN
    SELECT SEQ_DIC_APP_ASSETTYPE2.NEXTVAL INTO :NEW.assettype2_id FROM DUAL;
END;



				
create sequence SEQ_DIC_APP_ASSETTYPE3
minvalue 0
maxvalue 99999999
start with 2000
increment by 1
nocache;


CREATE OR REPLACE TRIGGER "TIB_DIC_APP_ASSETTYPE3" BEFORE INSERT
ON DIC_APP_ASSETTYPE3 FOR EACH ROW
BEGIN
    SELECT SEQ_DIC_APP_ASSETTYPE3.NEXTVAL INTO :NEW.assettype3_id FROM DUAL;
END;
