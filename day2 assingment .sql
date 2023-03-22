


--이론과제 2일차 


-- 1-1. 테이블
-- 1-2. 외래 키
-- 1-3. 널

-- 2-1. 문자셋
-- 2-2. 문자셋

-- 3-1. VARCHAR2
-- 3-2. CHAR

-- 4-1. 제약 조건
-- 4-2. 기본키
-- 4-3. 외래키

-- 5-1. 무결성
-- 5-2. 무결성
-- 5-3. 무결성

-- 6-1. unique
-- 6-2. not null
-- 6-3. index





/* 실습과제 186-1  */
SELECT DEPTNO, TRUNC(AVG(SAL)) , MAX(SAL) , MIN(SAL) , COUNT(*) AS CNT
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO DESC

/* 실습과제 186-2 */
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3

/* 실습과제 186 -3  */
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*) CNT
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO

/* 실습과제 187-4 */
SELECT NVL2(COMM, 'Y', 'N') AS EXIST_COMM,
       COUNT(*) AS CNT
FROM EMP
GROUP BY NVL2(COMM, 'Y', 'N')

SELECT * FROM EMP

/* 실습과제 187-5 */
SELECT DEPTNO, TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, COUNT(*) AS CNT, MAX(SAL) AS MAX_SAL, SUM(SAL) AS SUM_SAL, AVG(SAL) AS AVG_SAL
FROM EMP
GROUP BY ROLLUP (DEPTNO, TO_CHAR(HIREDATE, 'YYYY'))

/* 실습과제 198-1*/
SELECT D.DEPTNO
    , E.JOB AS DNAME
    , E.EMPNO
    , E.ENAME
    , E.SAL
FROM EMP E JOIN DEPT D ON E.SAL > 2000
ORDER BY D.DEPTNO, E.JOB ASC

SELECT D.DEPTNO
    , E.JOB AS DNAME
    , E.EMPNO
    , E.ENAME
    , E.SAL
FROM EMP E, DEPT D
WHERE E.SAL > 2000
ORDER BY D.DEPTNO, E.JOB ASC

/* 실습과제 198-2*/
SELECT E.DEPTNO
    , D.DNAME
    , FLOOR(AVG(E.SAL)) AS AVG_SAL
    , MAX(E.SAL) AS MAX_SAL
    , MIN(E.SAL) AS MIN_SAL
    , COUNT(E.DEPTNO) AS CNT
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY E.DEPTNO, D.DNAME
ORDER BY E.DEPTNO, D.DNAME

/* 실습과제 199-3 */
SELECT E.DEPTNO
    , D.DNAME
    , E.EMPNO
    , E.ENAME
    , E.JOB
    , E.SAL
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
ORDER BY E.DEPTNO, D.DNAME

/* 실습과제 199-4 */
SELECT D.DEPTNO AS DEPTNO
    , D.DNAME
    , E.EMPNO
    , E.ENAME
    , E.MGR
    , E.SAL
    , E.DEPTNO AS DEPTNO
    , S.LOSAL
    , S.HISAL
    , S.GRADE
    , E2.EMPNO AS MGR_EMPNO
    , E2.ENAME AS MGR_ENAME
FROM EMP E RIGHT JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
LEFT OUTER JOIN SALGRADE S ON (E.SAL >= S.LOSAL AND E.SAL <= S.HISAL)
LEFT OUTER JOIN EMP E2 ON (E.MGR = E2.EMPNO)
ORDER BY D.DEPTNO, E.EMPNO

/* 실습과제 210 -1 */
SELECT E.JOB
    , E.EMPNO
    , E.ENAME
    , E.SAL
    , D.DEPTNO
    , D.DNAME
FROM DEPT D, EMP E
WHERE E.JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN')

/* 실습과제 210-2 */
SELECT E.EMPNO
    , E.ENAME
    , D.DNAME
    , E.HIREDATE
    , D.LOC
    , E.SAL
    , S.GRADE
FROM EMP E LEFT JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
INNER JOIN SALGRADE S ON (E.SAL >= S.LOSAL AND E.SAL <= S.HISAL)
AND E.SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY GRADE DESC

/* 실습과제 211-3*/
SELECT E.EMPNO
    , E.ENAME
    , E.JOB
    , E.DEPTNO
    , D.DNAME
    , D.LOC
FROM EMP E, DEPT D
WHERE E.ENAME IN (SELECT ENAME FROM EMP WHERE DEPTNO = '10')
AND E.JOB NOT IN (SELECT JOB FROM EMP WHERE DEPTNO = '30')

/* 실습과제 211-4 */
SELECT E.EMPNO
    , E.ENAME
    , E.JOB
    , E.DEPTNO
    , D.DNAME
    , D.LOC
FROM EMP E, DEPT D
WHERE E.SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB = 'PRESIDENT')

/* 실습과제 211-5 */
SELECT E.EMPNO
    , E.ENAME
    , E.JOB
    , E.DEPTNO
    , D.DNAME
    , D.LOC
FROM EMP E, DEPT D
WHERE E.SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'PRESIDENT')

