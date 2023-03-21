     SELECT E.deptno 
              , D.DEPTNO
              FROM EMP E ,EMP D
              WHERE E.ENAME = 'SMITH'
              ORDER BY E.EMPNO
              
              
               SELECT *
               FROM EMP,DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO 
               ORDER BY EMPNO;
              
              SELECT *
              FROM EMP E JOIN DEPT D 
                  ON(E.DEPTNO = D.DEPTNO)
                  ORDER BY EMPNO;
                 
                 
                 
                 SELECT E.ENAME
                 , E.DEPTNO
                 , E.JOB
                 , S.GRADE
                 , E.SAL
                 , S.LOSAL AS low_rng
                 , S.HISAL AS high_rng
                 FROM emp E, SALGRADE S
                 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL ;
                
                
                SELECT s.grade
                , count (e.ENAME) AS emp_cnt
                FROM emp e, salgrade s
                WHERE e.sal BETWEEN s.LOSAL AND s.HISAL 
                GROUP BY s.GRADE 
                ORDER BY emp_cnt DESC 
                ;
                 
                SELECT e1.empno
                FROM emp E,dept D
                WHERE E.DEPTNO = D.DEPTNO ;
                
               SELECT *
               FROM emp e1, emp e2
               WHERE e1.EMPNO = E2.MGR 
               ;
                
              SELECT e1.empno AS emp_no 
              , e1.ENAME AS emp_name
              , e2.MGR AS mgr_no
              , e2.ENAME AS mgr_name
                 FROM emp e1 
                
                
                 SELECT *
                 FROM EMP JOIN DEPT 
                 USING (DEPTNO)      
                 ORDER BY EMPNO; 

                
                
                
                
                SELECT E1.EMPNO
                ,E1. ENAME
                ,E1. MGR
                ,E2.EMPNO AS MGR_EMPNO
                ,E2.ENAME AS MGR_ENAME
                FROM EMP E1, EMP E2
                WHERE E1.MGR = E2.EMPNO;
                
                
          /*  LEFT - JOIN 에서 외쪽 테이블 값을 모두 가져오고 , JOIN하는 테이블에서 해당되는 값 일부만 가져오기 
           * 
           * 
           * 
           */   
               SELECT 
               FROM emp e1, emp e2
               WHERE ,
               
                
                VAR_SQL= SELECT E.EMPNO
                , e.HIREDATE
                , d.DNAME
                
                ,e.JOB
                .e.sal
                FROM emp E JOIN dept D 
                ON E.(var_deptno) = D.(var_deptno)
                
               SELECT e.EMPNO
               ,to_char(e.HIREDATE,'YYYY MM-DD') AS hireDt
               ,e.ENAME
               ,d.DEPTNO
               ,d.LOC
               ,e.sal
               FROM emp e
               ,dept d 
               WHERE e.DEPTNO = d.DEPTNO 
               ORDER BY e.sal , d.DEPTNO, e.EMPNO DESC ;
              
              
              SELECT e1.empno 
                 , e1.ENAME
                 , e1.MGR
                 , e2.EMPNO AS mgr_no
                 , e2.ename AS mgr_name
               
              FROM emp e1 LEFT OUTER JOIN emp e2
                                ON e1.MGR = E2.EMPNO ;
              
              
              SELECT e1.empno 
                 , e1.ENAME
                 , e1.MGR
                 , e2.EMPNO AS mgr_no
                 , e2.ename AS mgr_name
                 
                 
                FROM EMP E1, EMP E2
                WHERE E1.MGR = E2.EMPNO(+)
                ORDER BY E1.EMPNO;
                               
                               
              
              SELECT d.DANME
              ,round(avg(e.sal),0) AS avg_sal
              ,sum(e.sal) AS sum_sal
                 ,round(avg(e.sal),0) AS avg_sal
              ,sum(e.sal) AS sum_sal ,round(avg(e.sal),0) AS avg_sal
              ,sum(e.sal) AS sum_sal ,round(avg(e.sal),0) AS avg_sal
              ,sum(e.sal) AS sum_sal
              
              
              /*
              *   표준 SQL로 RIGHT -OUTER-JOING 출력
              */
              
              SELECT e1.empno
                 , e1.ENAME
                 , e1.MGR
                 , e2.EMPNO AS mgr_no
                 , e2.ename AS mgr_name
                 FROM emp e1 RIGHT OUTER JOIN emp e2
                 ON e1.mgr = e2.EMPNO ;
              
            
                
                SELECT e1.empno
                 , e1.ENAME
                 , e1.MGR
                 , e2.EMPNO AS mgr_no
                 , e2.ename AS mgr_name
                 FROM emp e1 FULL OUTER JOIN emp e2
                 ON (e1.mgr = e2.empno) 
               ORDER BY e1.empno;
                
                
              
                
                SELECT  d.DEPTNO
                , d.DNAME
                , e1.EMPNO
                , e1.ENAME
                , e1.MGR
                , e1.SAL
                , s.LOSAL
                , s.HISAL
                , s.GRADE
                , e2.EMPNO AS mgr_no
                , e2.ename AS mgr_name
                   FROM emp e1
                   , dept d
                   , SALGRADE s
                   , emp e2
                   WHERE e1.DEPTNO(+) = d.DEPTNO
                   AND e1.sal BETWEEN s.LOSAL AND s.HISAL 
                   AND e1.mgr = e2.EMPNO 
                   ORDER BY D.DEPTNO, E1.EMPNO;
                  
                  
                   SELECT  d.DEPTNO
                , d.DNAME
                , e1.EMPNO
                , e1.ENAME
                , e1.MGR
                , e1.SAL
                FROM emp e1, dept d
                WHERE e1.deptno(+) = d.DEPTNO ;
               
               SELECT 
                 FROM emp e1 RIGHT JOIN dept D 
                 ON e1.DEPTNO = d.DEPTNO 
                 LEFT OUTER JOIN SALGRADE S 
                 ON (e1.sal >= s.losal AND e1.sal <= s.hisal)
                 LEFT OUTER JOIN EMP e2
                 ON (e1.mgr = e2.empno);
 /*
  *    단일행 서브 쿼리 = 쿼리 안에 쿼리 문장을 사용

  *
  *   */               
                
                  
                 SELECT *
                 FROM EMP e WHERE SAL>2850;\
                 
                 SELECT ENAME, SAL
                 FROM EMP; 
                
                SELECT SAL
                FROM EMP 
                WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME= 'BLAKE');        
               
             SELECT *
             FROM emp e, dept d
             WHERE e.depno = d.DEPTNO
              AND e.DEPTNO = 20
              AND e.SAL >(SELECT avg(sal) FROM emp)
       
               
               
               SELECT avg(sal) FROM emp;
              
                     
             /*
              *select 쿼리의 결과는 --> 2개이상의 값으로 된 테이블 
              */
              
              
              SELECT MAX(SAL)
              FROM EMP e ;
              
              SELECT * 
               FROM EMP e 
               WHERE SAL = ANY (SUB_QUERY);
              
              SELECT min(SAL), max(sal)
              FROM EMP e WHERE DEPTNO = 30;
             
             SELECT * 
               FROM EMP e 
               WHERE SAL < ANY (SELECT SAL FROM EMP WHERE DEPTNO =30)
               
               
               
               SELECT *
               FROM EMP 
               WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'BLACK') ;
              
              SELECT DEPTNO, SAL, EMPNO, ENAME
              FROM EMP e WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
                                        FROM EMP GROUP BY DEPTNO);
                                       
              
                WITH  E AS (SELECT * FROM EMP WHERE DEPTNO =20)
                ,D AS (SELECT * FROM DEPT)
                ,S AS (SELECT * FROM SALGRADE)
                SELECT E.ENAME
                , D.DNAME
                , E.SAL
                , D.LOC
                , S.GRADE
                FROM E,D ,S
                WHERE E.DEPTNO = D.DEPTNO
                AND E.SAL BETWEEN S.LOSAL AND S.HISAL
                
              
                
                
                CREATE TABLE EMP_TEMP 
                AS SELECT * 
                FROM EMP e WHERE 1<>1;
               
               SELECT * FROM EMP_TEMP
              
              
               
               
                