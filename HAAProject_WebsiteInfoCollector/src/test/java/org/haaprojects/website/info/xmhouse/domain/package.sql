CREATE TABLE HOUSE_DETAIL (HOUSE_ID VARCHAR2(20 BYTE), HOUSE_ADDRESS VARCHAR2(500 BYTE), HOUSE_TYPE VARCHAR2(100 BYTE), HOUSE_USAGE VARCHAR2(100 BYTE), HOUSE_AREA NUMBER(8,2), HOUSE_PRICE NUMBER(10,0), HOUSE_LIMIT VARCHAR2(100 BYTE));
CREATE INDEX IDX_HD_ADDRESS ON HOUSE_DETAIL (HOUSE_ADDRESS);
CREATE INDEX IDX_HD_TYPE ON HOUSE_DETAIL (HOUSE_TYPE);
CREATE INDEX IDX_HD_USAGE ON HOUSE_DETAIL (HOUSE_USAGE);
CREATE INDEX IDX_HD_AREA ON HOUSE_DETAIL (HOUSE_AREA);
CREATE INDEX IDX_HD_LIMIT ON HOUSE_DETAIL (HOUSE_LIMIT);
ALTER TABLE HOUSE_DETAIL ADD PRIMARY KEY (HOUSE_ID) ENABLE;
ALTER TABLE HOUSE_DETAIL ADD UPDATED_TIME TIMESTAMP;

create or replace TRIGGER HOUSE_DETAIL_UPDATED_TIME
BEFORE INSERT OR UPDATE ON HOUSE_DETAIL
FOR EACH ROW
BEGIN
    :new.UPDATED_TIME := sysdate;
END;


CREATE TABLE SECONDARY_HOUSE (HOUSE_ID VARCHAR2(20 BYTE), HOUSE_ADDRESS VARCHAR2(500 BYTE), HOUSE_TYPE VARCHAR2(100 BYTE), HOUSE_USAGE VARCHAR2(100 BYTE), HOUSE_AREA NUMBER(8,2), HOUSE_PRICE NUMBER(10,0));
CREATE INDEX IDX_SHD_ADDRESS ON SECONDARY_HOUSE (HOUSE_ADDRESS);
CREATE INDEX IDX_SHD_TYPE ON SECONDARY_HOUSE (HOUSE_TYPE);
CREATE INDEX IDX_SHD_USAGE ON SECONDARY_HOUSE (HOUSE_USAGE);
CREATE INDEX IDX_SHD_AREA ON SECONDARY_HOUSE (HOUSE_AREA);
CREATE INDEX IDX_SHD_PUBLISH_TIME ON SECONDARY_HOUSE (PUBLISH_TIME);

ALTER TABLE SECONDARY_HOUSE ADD PRIMARY KEY (HOUSE_ID) ENABLE;
ALTER TABLE SECONDARY_HOUSE ADD PUBLISH_TIME VARCHAR2(20);
ALTER TABLE SECONDARY_HOUSE ADD COMPANY_NAME VARCHAR2(200);
ALTER TABLE SECONDARY_HOUSE ADD CONTACT VARCHAR2(30);
ALTER TABLE SECONDARY_HOUSE ADD PHONE_NO VARCHAR2(20);
ALTER TABLE SECONDARY_HOUSE ADD QQ VARCHAR2(20);
ALTER TABLE SECONDARY_HOUSE ADD EMAIL VARCHAR2(20);
ALTER TABLE SECONDARY_HOUSE ADD UPDATED_TIME TIMESTAMP;

create or replace TRIGGER SECONDARY_HOUSE_UPDATED_TIME
BEFORE INSERT OR UPDATE ON SECONDARY_HOUSE
FOR EACH ROW
BEGIN
    :new.UPDATED_TIME := sysdate;
END;
