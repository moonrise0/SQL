

CONNECT scott/tiger
DROP TABLE regions;
 CREATE TABLE regions;
CREATE UNIQUE INDEX reg_id_pk ON regions

ALTER TABLE countries   
ADD (CONSTRAINT loc_id_pk)




/*
 * 
 * 시퀸스 생성
 * 필요한 일련번호를 만들어 사용하거나, 일련번호를 pk로 사용하는 경우.
 * 
 * 
 */

CREATE SEQUENCE seq_dept
 INCREMENT BY
 START WITH 
 MAXVALUE 
 MINVALUE 
 nocycle
 nocache
 
 SELECT *
 FROM DEPT_TEMP2 dt;

INSERT INTO DEPT_TEMP2
VALUE (SEQ_DEPT.NEXTVAL, 'DB','SUSAN');
 


ALTER TABLE emp NEW 
MODIFY empno NUMBER(5);
SELECT FROM EMPNO NUMBER(5);



COMMIT;

SELECT 


ALTER TABLE emp_new
 RENAME TO emp_new_ename
