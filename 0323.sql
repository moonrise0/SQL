

CREATE TABLE dept_tcl
	AS SELECT * 
		FROM TEST.DEPT;
	
SELECT * 
FROM dept_tcl
;

INSERT 
INTO dept_tcl 
VALUES(50, 'database', 'seoul');

SELECT * 
FROM dept_tcl;

UPDATE dept_tcl 
SET loc = 'BUSAN' 
WHERE deptno = 40
;

DELETE 
FROM dept_tcl 
WHERE dname = 'RESEARCH'
;

SELECT * 
FROM dept_tcl
;


-- commit 실행하는 경우
INSERT INTO dept_tcl
VALUES (50, 'NETWORK', 'SEOUL')
;

UPDATE dept_tcl
SET loc = 'BUSAN'
WHERE deptno = 20
;

DELETE FROM dept_tcl WHERE deptno = 40;

SELECT *
FROM dept_tcl
;

COMMIT;

SELECT *
FROM dept_tcl
;

DELETE FROM dept_tcl
WHERE deptno = 50
;



/*
 * LOCK 테스트
 * 
 * 동일한 계정으로 dbeaver 세션과 sqlplus 세션을 열어 데이터를 수정하는 동시작업을 수행
 */
UPDATE dept_tcl
SET loc = 'DAEGU'
WHERE deptno = 30
;


SELECT *
FROM dept_tcl 
;  -- SQL plus에서는 daegu 업데이트 결과가 안보임  

COMMIT;  

/*
 * tuning 기초 : 자동차 튜닝과 같이 db 처리 속도와 안정성 제고 목적
 */
SELECT *
FROM TEST.EMP WHERE substr(empno, 1, 2) = 75 --
AND LENGTH (empno) = 4 -- 불필요한 비교 
;

SELECT * FROM TEST.EMP
WHERE empno > 7499
	AND EMPNO < 7600
;

-- 튜닝 전후 비교
SELECT *
FROM TEST.EMP
WHERE ENAME || ' ' || job = 'WARD SALESMAN'
;

SELECT *
FROM TEST.EMP
WHERE ENAME = 'WARD'
	AND job = 'SALESMAN'
;



-- 튜닝 전후 비교 
SELECT *
FROM TEST.EMP WHERE deptno = '10'
UNION
SELECT *
FROM TEST.EMP WHERE deptno = '20'
;

SELECT *
FROM TEST.EMP
WHERE DEPTNO = 10
UNION ALL
SELECT *
FROM TEST.EMP
WHERE DEPTNO = 20
;



-- 튜닝 전후 비교 
SELECT ENAME
	, EMPNO
	, SUM(SAL)
FROM TEST.EMP
GROUP BY ENAME, EMPNO
;


SELECT EMPNO, ENAME, SUM(SAL)
FROM TEST.EMP
GROUP BY EMPNO, ENAME
;



-- 튜닝 전후 비교 
SELECT EMPNO
	, ENAME
FROM TEST.EMP
WHERE TO_CHAR(HIREDATE, 'YYYYMMDD') LIKE '1981%'  -- 동일한 데이터타입 
	AND EMPNO > 7700
;

SELECT EMPNO, ENAME
FROM TEST.EMP
WHERE EXTRACT(YEAR FROM HIREDATE) = 1981 
;

SELECT *
FROM DBA_indexes
WHERE TABLE_name LIKE 'EMP';




SELECT DEPTNO
FROM EMP
GROUP BY DEPTNO
;

SELECT DEPTNO
	, JOB
	, FLOOR(AVG(SAL)) AS AVG_SAL
FROM EMP
GROUP BY JOB, DEPTNO
HAVING AVG(SAL) >= 2000
ORDER BY JOB, DEPTNO
;



SELECT deptno