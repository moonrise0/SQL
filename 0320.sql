    SELECT ROUND(1234.5678) AS R, ROUND(1234.5678 , 0) AS R_0 ,
              ROUND(1234.5678, 1) AS R_1, ROUND(1234.5678 , 2) AS R_2 
              FROM DUAL;
            
             
              SELECT TRUNC(1234.5678) AS TRUNC, TRUNC (1234.5678 , 0) AS T_0,
                      TRUNC(1234.5671,1 ) AS T_1, TRUNC (1234.5678 , 2) AS T_2
                      FROM DUAL;
              
                     SELECT CEIL(3.14)AS CEIL, FLOOR(3.14)AS FLOOR,
                     CEIL(3.14) AS CEIL_M , FLOOR(-3.14) AS FLOOR_M
                     FROM DUAL;
                    
                     SELECT MOD (15,6), MOD(10,2), MOD(11,2) FROM DUAL;
          
                    
                    SELECT sysdate AS now
                    , sysdate- 1 AS yesterday
                    , sysdate + 10 AS ten_days_from_now
                    FROM dual;
                   
                   SELECT add_months(sysdate, :month)
                   FROM dual;
                  
                  
                  SELECT ename
                  , hiredate
                  , MONTHS_BETWEEN(hirdedate,sysdate) 
                  FROM EMP
                  
                  
                  
                  SELECT EMPNO,ENAME,SAL,COMM, SAL+COMM
                  ,NVL(COMM,0)
                  ,SAL+NVL(COMM,0)
                  FROM EMP;
                  
                 SELECT EMPNO,ENAME,COMM 
                 ,NVL2(COMM,'O','X')
                 ,NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL
                 FROM EMP;
                 
                  
                  
                  SELECT EMPNO, ENAME, EMPNO +'500' FROM EMP e
                  WHERE ENAME = 'SCOTT';
                    
                 
                 SELECT TO_NUMBER('1500','99999')-1300 FROM DUAL;
                
                
                SELECT EMPNO, ENAME, JOB, SAL
                             ,CASE JOB
                              WHEN 'MANAGER'THEN SAL*0.2
                               WHEN'SALESMAN' THEN SAL*0.3
                               WHEN'ANALYST'THEN SAL*0.05
                              ELSE SAL*0.1
                              END AS BONUS
                              FROM EMP;
                             
                             
                             
               SELECT to_date('2023/03/20', 'YYYY/MM/DD' )AS ymd FROM dual               
                             
                             
                             
                 SELECT AVG(SAL),DEPTNO
                 FROM EMP 
                 GROUP BY DEPTNO;
                
                
             
                
                SELECT DEPTNO, JOB, AVG(SAL)
                FROM EMP
                GROUP BY  DEPTNO,JOB
                HAVING AVG(SAL) >=2000
                ORDER BY DEPTNO,JOB ;
                
               
               SELECT DEPTNO, JOB, COUNT(*),MAX(SAL),SUM(SAL),AVG(SAL)
               FROM EMP
                GROUP BY DEPTNO, JOB
               ORDER BY DEPTNO, JOB;




DROP TABLE DEPT;
DROP TABLE DEPT CASCADE CONSTRAINTS;
COMMIT;

SELECT * FROM DEPT;

CREATE TABLE DEPT (
	DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14),
	LOC VARCHAR2(13)
);
​
INSERT INTO DEPT VALUES (
	10,
	'ACCOUNTING',
	'NEW YORK'
);
​
INSERT INTO DEPT VALUES (
	20,
	'RESEARCH',
	'DALLAS'
);
​
INSERT INTO DEPT VALUES (
	30,
	'SALES',
	'CHICAGO'
);
​
INSERT INTO DEPT VALUES (
	40,
	'OPERATIONS',
	'BOSTON'
);
​

SELECT * FROM EMP;


CREATE TABLE EMP (
	EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7, 2),
	COMM NUMBER(7, 2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);
​
INSERT INTO EMP VALUES (
	7369,
	'SMITH',
	'CLERK',
	7902,
	TO_DATE('17-12-1980', 'dd-mm-yyyy'),
	800,
	NULL,
	20
);
​
INSERT INTO EMP VALUES (
	7499,
	'ALLEN',
	'SALESMAN',
	7698,
	TO_DATE('20-2-1981', 'dd-mm-yyyy'),
	1600,
	300,
	30
);
​
INSERT INTO EMP VALUES (
	7521,
	'WARD',
	'SALESMAN',
	7698,
	TO_DATE('22-2-1981', 'dd-mm-yyyy'),
	1250,
	500,
	30
);
​
INSERT INTO EMP VALUES (
	7566,
	'JONES',
	'MANAGER',
	7839,
	TO_DATE('2-4-1981', 'dd-mm-yyyy'),
	2975,
	NULL,
	20
);
​
INSERT INTO EMP VALUES (
	7654,
	'MARTIN',
	'SALESMAN',
	7698,
	TO_DATE('28-9-1981', 'dd-mm-yyyy'),
	1250,
	1400,
	30
);
​
INSERT INTO EMP VALUES (
	7698,
	'BLAKE',
	'MANAGER',
	7839,
	TO_DATE('1-5-1981', 'dd-mm-yyyy'),
	2850,
	NULL,
	30
);
​
INSERT INTO EMP VALUES (
	7782,
	'CLARK',
	'MANAGER',
	7839,
	TO_DATE('9-6-1981', 'dd-mm-yyyy'),
	2450,
	NULL,
	10
);
​
INSERT INTO EMP VALUES (
	7788,
	'SCOTT',
	'ANALYST',
	7566,
	TO_DATE('13-7-1987', 'dd-mm-yyyy')-85,
	3000,
	NULL,
	20
);
​
INSERT INTO EMP VALUES (
	7839,
	'KING',
	'PRESIDENT',
	NULL,
	TO_DATE('17-11-1981', 'dd-mm-yyyy'),
	5000,
	NULL,
	10
);
​
INSERT INTO EMP VALUES (
	7844,
	'TURNER',
	'SALESMAN',
	7698,
	TO_DATE('8-9-1981', 'dd-mm-yyyy'),
	1500,
	0,
	30
);
​
INSERT INTO EMP VALUES (
	7876,
	'ADAMS',
	'CLERK',
	7788,
	TO_DATE('13-7-1987', 'dd-mm-yyyy')-51,
	1100,
	NULL,
	20
);
​
INSERT INTO EMP VALUES (
	7900,
	'JAMES',
	'CLERK',
	7698,
	TO_DATE('3-12-1981', 'dd-mm-yyyy'),
	950,
	NULL,
	30
);
​
INSERT INTO EMP VALUES (
	7902,
	'FORD',
	'ANALYST',
	7566,
	TO_DATE('3-12-1981', 'dd-mm-yyyy'),
	3000,
	NULL,
	20
);
​
INSERT INTO EMP VALUES (
	7934,
	'MILLER',
	'CLERK',
	7782,
	TO_DATE('23-1-1982', 'dd-mm-yyyy'),
	1300,
	NULL,
	10
);
​
​
​
​
CREATE TABLE BONUS (
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	SAL NUMBER,
	COMM NUMBER
);
​
CREATE TABLE SALGRADE (
	GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER
);
​
INSERT INTO SALGRADE VALUES (
	1,
	700,
	1200
);
​
INSERT INTO SALGRADE VALUES (
	2,
	1201,
	1400
);
​
INSERT INTO SALGRADE VALUES (
	3,
	1401,
	2000
);
​
INSERT INTO SALGRADE VALUES (
	4,
	2001,
	3000
);
​
INSERT INTO SALGRADE VALUES (
	5,
	3001,
	9999
);
​






/* 실습과제 150P 5번 */
SELECT *
FROM EMP
WHERE JOB IN ('MANAGER', 'CLERK')
AND ENAME NOT LIKE ('_L%')
AND EMPNO IN
(SELECT EMPNO
FROM EMP
WHERE COMM IS NULL
AND MGR IS NOT NULL);



SELECT EMPNO
FROM EMP 
WHERE MGR IS NULL AND COMM IS NULL








SELECT * 
FROM EMP e
WHERE COMM IS NULL AND MGR IS NOT NULL 
AND JOB IN('MANAGER', 'CLERK')
AND ENAME NOT LIKE '_L%';



COMMIT;
​
SET TERMOUT ON
​
SET ECHO ON



--
--SELECT EMPNO, ENAME
--, RPAD(SUBSTR(EMPNO,1,2),4, '*') AS "EMPNO 마스킹처리"
--, RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME), '*' )AS "ENAME 마스킹 처리"
--FROM EMP e 
--WHERE LENGTH(ENAME) >=6;



SELECT *
FROM v$sqlfn_metadata v
WHERE v.name = 'NVL'

SELECT ename
    ,upper(ename) AS to_upper_name
    ,lower(ename) AS to_lower_name
    FROM EMP;
    
SELECT *
          FROM EMP 
          WHERE upper(ename) = upper('ScoTT')
          
--          TRIM : 공란 제거, 특정값 제거 // concat 문자열 연결(더하기)

          SELECT empno
                 ,ename
                 ,concat(empno ,ename)
                 ,concat(empno, ' ')
          FROM EMP e WHERE ename = 'SMITH'
          ;
          
         * REPLACE 문자열 교체*
         SELECT '010-1234-5678' AS mobile_phone
         , replace('010-1234-5678' , '-', '') AS REPLACE_1
         FROM dual;
         
          
        SELECT * FROM dual;
        
        SELECT lpad('ORA_1234_XE',10 ) AS lpad_20
        , rpad('ORA_1234_XE' ,20) AS rpad_20 
        FROM dual ;
       
       
       
          
                
                
                