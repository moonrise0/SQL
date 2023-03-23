
CREATE TABLE dept_temp
	AS (SELECT * FROM DEPT)
;


/*
 * create as 구문 
 */
SELECT *
FROM dept_temp dt
;


/*
 * insert = 데이터를 입력하는 방식
 * 
 */
INSERT INTO dept_temp (deptno, dname, loc)
	VALUES (50, 'DATABASE', 'SEOUL')
;

INSERT INTO dept_temp (deptno, dname, loc)
	VALUES (70, 'WEB', NULL)
;

INSERT INTO dept_temp (deptno, dname, loc)
	VALUES (70, 'WEB', NULL)
;

INSERT INTO dept_temp (deptno, dname, loc)
	VALUES (80, 'MOBILE', '')
;

INSERT INTO dept_temp (deptno, loc)
	VALUES (90, 'INCHEON')
;

COMMIT;

SELECT *
FROM DEPT_TEMP DT
;






CREATE TABLE emp_temp AS
	SELECT * FROM EMP
		WHERE 1 <> 1
;

COMMIT;

SELECT * FROM emp_temp;


INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (9999, '홍길동', 'PRESIDENT', NULL, '2001/01/01', 6000, 500, 10)
;

INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (2111, '이순신', 'MANAGER', 9999, '1994/07/01', 4000, NULL, 20)
;

INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (3111, '망고', 'MANAGER', 9999, SYSDATE, 4000, 500, 10)
;


SELECT *
FROM emp_temp
;

INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
SELECT e.EMPNO
		, e.ENAME
		, e.JOB
		, e.MGR
		, e.HIREDATE
		, e.SAL
		, e.COMM
		, e.DEPTNO
FROM emp e, SALGRADE s
WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL
	AND s.GRADE = 1
;

SELECT *
	FROM emp_temp
;



/*
 * update문: 필터된 데이터에 대해서 레코드 값을 수정
 */
DROP TABLE DEPT_TEMP2
;

CREATE TABLE dept_temp2
	AS (SELECT * FROM DEPT)
;

SELECT *
FROM dept_temp2
;



/*
 * update
 * set
 */
UPDATE DEPT_TEMP2
SET loc = "SEOUL"
WHERE 
;

ROLLBACK;

SELECT *
FROM EMP
WHERE ROWNUM < 3;

CREATE dept_temp2
SET dname = 'database'
	, loc = 'seoul'
WHERE deptno = 40
;


CREATE TABLE emp_temp2
	AS (SELECT * FROM EMP)
;

COMMIT;

DELETE FROM emp_temp2
WHERE job = 'MANAGER'
;

ROLLBACK;
COMMIT;

DELETE FROM emp_temp2
WHERE empno IN (SELECT empno
					FROM emp_test2 e, SALGRADE s
					WHERE e.sal BETWEEN s.LOSAL AND s.HISAL
					AND s.grade = 3
					AND deptno = 30)
;


SELECT e.empno
	FROM emp_temp2 e, SALGRADE s
	WHERE e.sal BETWEEN s.LOSAL AND s.HISAL
		AND s.GRADE = 3
		AND e.deptno = 30
;


/*
 * CREATE  : 기존에 없는 테이블 구조를 생성
 * 
 * 데이터는 없고, 테이블의 칼럼과 데이터타입, 제약조건 등 구조를 생성  
 */


CREATE TABLE emp_new
(	
	empno		NUMBER (4)
	, ename		varchar (10)
	, job		varchar (9)
	, mgr		NUMBER (4)
	, hiredate	DATE
	, SALGRADE	NUMBER (7,2)
	, comm 		number(7,2)
	, deptno	number(2)
)
;



SELECT *
	FROM EMP_NEW
;


SELECT *
FROM v$SESSION ;


CREATE TABLE DEPT_TCL
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TCL;


INSERT INTO DEPT_TCL 
VALUES (50, 'DATABASE', 'SEOUL') ;


UPDATE DEPT_TCL
SET LOC = 'BUSAN' 
WHERE DEPTNO = 40


DELETE dept_tcl
WHERE dname = 'RESEARCH'
;

SELECT *
FROM dept_tcl;

INSERT INTO DEPT_TCL 
VALUES (59,'NETWORK','SEOUL');



UPDATE DEPT_TCL 
 SET loc = 'busan'
 WHERE deptno =20
 E
 
 DELETE FRP, DEPT_TCL
 WHERE DEPTNO = 40;


SELECT * FROM DEPT_TCL;
-- UPDATE처리로 담당부서 직원 징계처리.

