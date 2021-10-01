-- SQL은 대소문자 구별은 안함(쿼리문)
-- 대소문자 구별은 비밀번호만 함
-- 문자열 표현할 때 홑따옴표 사용함

-- scott 계정에 존재하는 모든 테이블 조회

SELECT
    *
FROM
    tab;

--조회(Select) : 행 단위로 조회, 열 단위로 조회

-- emp 테이블의 내용을 전체조회
SELECT
    *
FROM
    emp;

--emp테이블의 empno, ename, job만 조회
SELECT
    empno,
    ename,
    job
FROM
    emp;

-- emp 테이블의 empno, deptno 조회
SELECT
    empno,
    deptno
FROM
    emp;

-- 중복 제거 후 조회 : distinct
SELECT DISTINCT
    deptno
FROM
    emp;

-- 별칭을 붙여서 조회 : AS(alais)
SELECT
    empno AS 사원번호
FROM
    emp;

SELECT
    ename           AS 사원명,
    job             AS "직 책",
    sal             AS 급여,
    comm            AS 추가수당,
    sal * 12 + comm AS 연봉
FROM
    emp;

-- 정렬 : ORDER BY 컬럼명 기준 (오름차순-asc, 내림차순-desc)
-- ename, sal 조회할 때 sal 내림차순으로 정렬
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

-- 오름차순(생략가능-기본값)
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;

--emp 테이블의 전체 내용을 조회하고, 단 사원번호 내림차순
SELECT
    *
FROM
    emp
ORDER BY
    empno DESC;

--전체 내용 조회(부서번호 오름차순, 급여 내림차순)
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;

SELECT
    empno  AS employee_no,
    ename  AS employee_name,
    mgr    AS manager,
    sal    AS salary,
    comm   AS commision,
    deptno AS department_no,
    job    hiredate
FROM
    emp
ORDER BY
    deptno DESC,
    ename ASC;
    
-- 특정 조건을 기준으로 원하는 데이터를 조회 : where
-- 전체 데이터 조회, 단, 부서번호가 30번인 데이터 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;

-- 사원번호가 7782번 조회
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

-- 부서번호가 30번이고, 사원직책이 SALESMAN인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

-- 사원번호가 7499이고, 부서번호가 30인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;

--부서번호가 30이거나 사원직책이 CLERK인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';

-- 산술연산자를 사용한 WHERE

-- 연봉이 36000인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

-- 월급이 3000보다 큰 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal > 3000;

-- 월급이 3000이상인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;

--이름의 첫글자가 F이후인 사람
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

--급여가 2500 이상이고, 직업이 ANALYST인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2500
    AND job = 'ANALYST';

-- 직무가 SALESMAN 이거나, CLERK 이거나, MANAGER인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job = 'SALESMAN'
    OR job = 'CLERK'
    OR job = 'MANAGER';

-- 등가비교연산자(=, 같지 않음 -> !=, <>,^=)
SELECT
    *
FROM
    emp
WHERE
    sal != 3000;

SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;

SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;

--IN
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'SALESMAN', 'CLERK', 'ANALYST' );

SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'SALESMAN', 'CLERK', 'ANALYST' );

--부서번호가 10, 20번 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );

--BETWEEN A AND B
--급여가 2000-3000 사이인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2000
    AND sal <= 3000;

SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

--급여가 2000-3000 사이가 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자와 와일드 카드
-- 일부 문자열이 포함된 데이터 조회
-- 와일드 카드
-- ① % : 길이와 상관없이 모든 문자 데이터를 의미
-- ② _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미


-- 사원명이 S로 시작하는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%'; 

-- 사원명의 두번째 글자가 L인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

-- 사원명에 AM 문자가 포함되어 있는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

-- 사원명에 AM 문자가 포함되어 있지 않은 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';

-- IS NULL 
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;
-- null은 0 아니고 완전히 비어있는 상태

--mgr이 null인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;

--mgr이 null이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;

-- 집합 연산자 : 합집합 - UNION, UNION ALL(중복값을 제거하지 않음),
--             교집합 - INTERSECT
--             차집합 - MINUS

--EMPNO, ENAME, SAL, DEPTNO 조회(부서번호가 10번이거나 20번인)

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    sal,
    job,
    deptno,
    sal
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

-- 오라클 함수

--내장함수 1) 문자함수

--           대소문자 변경
--           UPPER(문자열) : 괄호 안 문자를 모두 대문자로 변환 
--           LOWER(문자열) : 괄호 안 문자를 모두 소문자로 변환  
--           INITCAP(문자열) : 괄호 안 문자 중 첫글자만 대문자로 변환, 나머지는 소문자 

SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;
-- ENAME이 SCOTT 찾기
SELECT
    *
FROM
    emp
WHERE
    ename = 'scott';

SELECT
    *
FROM
    emp
WHERE
    lower(ename) = 'scott';

SELECT
    *
FROM
    emp
WHERE
    lower(ename) = lower('scott');

SELECT
    *
FROM
    emp
WHERE
    lower(ename) LIKE lower('%scott%');

--              문자 길이 구하기
--              length(문자열) : 해당 문자열의 길이 돌려줌
--              LEGNTHB(문자열) : 해당 문자열의 바이트수 돌려줌
SELECT
    ename,
    length(ename)
FROM
    emp;

SELECT
    length('한글'),
    lengthb('한글')
FROM
    dual;
--한글 한자당 3바이트 사용, 
-- DUAL 데이터베이스 관리자가 소유한 테이블 / 임시 연산이나 함수의 결과 값 확인 용도

--JOB이 6글자 이상인 사원들 조회
SELECT
    *
FROM
    emp
WHERE
    length(job) >= 6;

--                문자열 일부를 추출하기(오라클은 index가 1번부터 시작)
--                SUBSTR(문자열데이터,시작위치,추출길이)
--                SUBSTR(문자열데이터,시작위치)

SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5)
FROM
    emp;

-- EMP 테이블의 모든 사원 이름을 세번째 글자부터 끝까지 출력하기
SELECT
    ename,
    substr(ename, 3)
FROM
    emp; 

--              문자열 데이터 안에서 특정 문자를 찾기
--              INSTR(문자열,찾을문자열,시작위치(옵션), 몇번째에 있는 걸 찾을 것인지(옵션) 

SELECT
    instr('HELLO, ORACLE!', 'L'),
    instr('HELLO, ORACLE!', 'L', 5),
    instr('HELLO, ORACLE!', 'L', 2, 2)
FROM
    dual;

-- 원본 문자열 : 이것이 Oracle이다. 이것도 오라클이다.
-- 찾을 문자열 : 이것

-- 제일 처음에 나오는 이것의 위치를 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것')
FROM
    dual;

-- 시작위치를 3으로 지정한 후 나오는 이것의 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 3)
FROM
    dual;

-- 이것이 두번째로 나오는 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 1, 2)
FROM
    dual;

--사원 이름에 문자 S가 있는 사원 구하기
SELECT
    *
FROM
    emp
WHERE
    instr(lower(ename), 's') > 0;

SELECT
    *
FROM
    emp
WHERE
    upper(ename) LIKE '%S%';


--              특정 문자를 다른 문자로 바꾸는 함수
--              REPLACE(문자열 데이터 또는 열이름, 찾는문자, 바꿀문자)

-- 010-1234-5678 -> 010 1234 5678, 01012345678
SELECT
    '010-1234-5678'                    AS 원본,
    replace('010-1234-5678', '-', ' ') AS replace1,
    replace('010-1234-5678', '-')  AS replace2
FROM
    dual;


--              두 문자열 데이터를 합치는 함수
--              CONCAT(문자열1,문자열2) 인수는 2개만 받는다
-- empno, ENAME 합쳐서 조회

SELECT EMPNO, ENAME, CONCAT(EMPNO,ENAME) 
FROM EMP WHERE ENAME = 'SCOTT';

-- 7788:SCOTT
SELECT EMPNO, ENAME, CONCAT(EMPNO,CONCAT(':',ENAME)) 
FROM EMP WHERE ENAME = 'SCOTT';

-- || : 문자열 데이터 연결 연산자
SELECT EMPNO||ENAME, EMPNO||':'||ENAME
FROM EMP WHERE ENAME = 'SCOTT';


--  문자열 함수 : 공백제거(기본)
--                TRIM : 양쪽 공백 제거
--                LTRIM : 왼쪽 공백 제거
--                RTRIM : 오른쪽 공백 제거

SELECT
    '    이것이    ',
    TRIM('    이것이    ')
FROM
    dual;
    
    
    
-- TRIM(삭제옵션(선택), 삭제할 문자(선택), from 원본문자열)  
SELECT
    '['
    || TRIM('_' FROM '__Oracle__')
    || ']' AS trim,
    '['
    || TRIM(LEADING '_' FROM '__Oracle__')
    || ']' AS trim_leading,
    '['
    || TRIM(TRAILING '_' FROM '__Oracle__')
    || ']' AS trim_trailing,
    '['
    || TRIM(BOTH '_' FROM '__Oracle__')
    || ']' AS trim_both
FROM
    dual;
    
    
-- 숫자함수 : ROUND(숫자,반올림 위치(선택))
--            TRUNC(숫자,버림 위치(선택))
--            CEIL(숫자) : 입력된 숫자와 가장 가까운 큰 정수
--            FLOOR(숫자) : 입력된 숫자와 가장 가까운 작은 정수
--            MOD(숫자,나눌숫자) : 나머지 값

SELECT
    round(1234.5678)      AS round,
    round(1234.5678, 0)   AS round0,
    round(1234.5678, 1)   AS round1,
    round(1234.5678, 2)   AS round2,
    round(1234.5678, - 1) AS round_minus1,
    round(1234.5678, - 2) AS round_minus2
FROM
    dual;

SELECT
    trunc(1234.5678)      AS trunc,
    trunc(1234.5678, 0)   AS trunc0,
    trunc(1234.5678, 1)   AS trunc1,
    trunc(1234.5678, 2)   AS trunc2,
    trunc(1234.5678, - 1) AS trunc_minus1,
    trunc(1234.5678, - 2) AS trunc_minus2
FROM
    dual;

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;

SELECT
    mod(15, 6),
    mod(10, 2),
    mod(11, 2)
FROM
    dual;
    
-- 날짜함수
-- SYSDATE : 오라클 데이터베이스 서버가 설치된 os의 현재 날짜와 시간
-- ADD_MONTHS : 몇 개월 이후 날짜를 구하는 함수

SELECT
    sysdate     AS now,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual;

SELECT
    sysdate,
    add_months(sysdate, 3)
FROM
    dual;


-- 입사 20주년이 되는 날짜 조회
SELECT
    ename,
    hiredate,
    add_months(hiredate, 240)
FROM
    emp;
    
-- 현재 날짜를 기준으로 입사 40년 미만인 사원 조회

SELECT
    ename,
    hiredate
FROM
    emp
WHERE
    add_months(hiredate, 480) > sysdate;





-- MONTHS_BETWEEN : 두 날짜 간의 개월 수 차이 구하기
SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    MONTHS_BETWEEN(SYSDATE,hiredate) as month1,
    MONTHS_BETWEEN(hiredate,SYSDATE) as month2,
    trunc(MONTHS_BETWEEN(SYSDATE,hiredate)) as month3
FROM
    emp;
    
-- next_day(날짜,요일문자)
-- last_day(날짜)

select sysdate,next_day(sysdate,'월요일'),last_day(sysdate)
from dual;

-- 형변환 함수
-- TO_CHAR() : 숫자 또는 날짜 데이터를 문자 데이터로 변환
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY/MM/DD') AS 현재날짜 FROM DUAL;

SELECT SYSDATE,TO_CHAR(SYSDATE,'MM') AS 현재월 FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'MON') AS 현재월 FROM DUAL;

SELECT SYSDATE,TO_CHAR(SYSDATE,'HH:MI:SS') AS 현재시간 FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'HH12:MI:SS AM') AS 현재시간 FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'HH24:MI:SS') AS 현재시간 FROM DUAL;

-- L(Locale) : 지역화폐단위를 붙여서 출력
-- 9, 0 : 숫자의 한 자리를 의미함(9는 빈자리를 채우지 않음, 0 빈자리를 채우는 개념)
SELECT SAL,
       TO_CHAR(SAL,'$999,999') AS SAL_$,
       TO_CHAR(SAL,'$000,000') AS SAL_$2,
       TO_CHAR(SAL,'L999,999') AS SAL_L 
FROM emp;

SELECT TO_NUMBER('1,300','999,999')
FROM DUAL;

SELECT TO_DATE('2021-09-12','YYYY-MM-DD') AS TODATE1,
       TO_DATE('20210912','YYYY-MM-DD') AS TODATE2
FROM DUAL;

-- 날짜 데이터는 연산이 가능함
-- 1981-06-01 이후 입사자

SELECT *
FROM EMP
WHERE hiredate > TO_DATE('1981/06/01','YYYY-MM-DD');


-- 널처리 함수
-- NVL(데이터,널이면 반환할 값)
select empno, ename, sal,comm, sal+comm
from emp;

select empno, ename, sal,comm, sal+comm, nvl(comm,0), sal+nvl(comm,0)
from emp;

-- NVL2(데이터,널이 아닐경우 반환할 값,널이면 반환할 값)
select empno, ename, sal,comm, NVL2(COMM,'O','X'), NVL2(COMM, SAL*12+COMM, SAL*12)
from emp;
    

select * from emp where empno=7369;


-- DECODE 함수
-- DECODE([검사 대상이 될 열 또는 데이터],
--[조건1],[데이터가 조권 1과 일치할 때 반환할 결과])
--[조건2],[데이터가 조권 2와 일치할 때 반환할 결과]
-- .......
--[위 조건들 중에서 일치한 경우가 없을 때 반환할 결과])

-- job_id 에 따라 급여의 비율 설정
select empno, ename, job, sal, 
decode(job, 'MAGAGER', sal*1.1, 'SALESMAN', sal*1.05,
'ANALYST', sal, sal*1.03) AS upsal from emp;

-- CASE : DECODE문으로 작성할 수 있는 것들은 모두 변환 가능
--         =의 의미로 사용되지만 다른 조건도 가능하다

select empno, ename, job, sal, 
CASE job WHEN 'MAGAGER' THEN sal*1.1
WHEN 'SALESMAN' THEN sal*1.05
WHEN 'ANALYST' THEN sal 
ELSE sal*1.03 END 
AS upsal from emp;

-- COMM이 널이면 '해당사항 없음', 0이면 '수당없음'
-- 0보다 크면 '수당 :2500' 출력

SELECT EMPNO, ENAME, COMM, 
CASE WHEN COMM IS NULL THEN '해당사항 없음'
WHEN COMM = 0 THEN '수당없음'
WHEN COMM > 0 THEN '수당 : ' || COMM END
AS COMM_TEXT FROM EMP;

--EMP 테이블에서 사원들의 월 평균 근무일수는 21.5일이다. 
--하루 근무 시간을 8시간으로 보았을 때 사원들의 하루 급여(DAY_PAY)와 시급(TIME_PAY)를 계산하여 결과를 출력한다. 
--단, 하루 급여는 소수점 셋째 자리에서 버리고, 시급은 두 번째 소수점에서 반올림하시오.
SELECT EMPNO, ENAME, SAL, TRUNC(SAL/21.5,2) AS DAY_PAY,
ROUND((SAL/21.5)/8,1) AS TIME_PAY FROM EMP;

-- EMP 테이블에서 사원들은 입사일(HIREDATE)을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다. 
--사원들이 정직원이 되는 날짜(R_JOB)를 YYYY-MM-DD 형식으로 아래와 같이 출력하시오. 
--단, 추가수당(COMM)이 없는 사원의 추가 수당은 N/A로 출력하시오.

select comm, nvl(comm,0) from emp;
select comm, nvl(comm,'0') from emp;
select comm, nvl(TO_CHAR(comm),'N/A') from emp;
--타입이 안맞아서

SELECT EMPNO, ENAME, HIREDATE, 
NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일') AS R_JOB, 
NVL(TO_CHAR(COMM),'N/A') AS COMM FROM EMP;

--EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원 번호(MGR)를 
--다음과 같은 조건을 기준으로 변환해서 CHG_MGR 열에 출력하시오.

SELECT EMPNO, ENAME, MGR, 
CASE WHEN TO_CHAR(MGR)IS NULL THEN '0000'
WHEN TO_CHAR(MGR) LIKE '75__' THEN '5555'
WHEN TO_CHAR(MGR) LIKE '76__' THEN '6666'
WHEN TO_CHAR(MGR) LIKE '77__' THEN '7777'
WHEN TO_CHAR(MGR) LIKE '78__' THEN '8888'
ELSE TO_CHAR(MGR) END AS CHG_MGR FROM EMP;

SELECT EMPNO, ENAME, MGR, 
CASE WHEN MGR IS NULL THEN 0000
WHEN MGR LIKE '75%' THEN 5555
WHEN MGR LIKE '76%' THEN 6666
WHEN MGR LIKE '77%' THEN 7777
WHEN MGR LIKE '78%' THEN 8888
ELSE MGR END AS CHG_MGR FROM EMP;

SELECT EMPNO, ENAME, MGR, 
DECODE(SUBSTR(TO_CHAR(MGR),1,2), NULL, '0000',
'75','5555','76','6666','77','7777','78','8888',
MGR)
AS CHG_MGR FROM EMP;

-- 다중행 함수 : SUM(), COUNT(), MAX(), MIN(), AVG()
SELECT SUM(SAL) FROM EMP;
SELECT SUM(SAL),ENAME FROM EMP; -- 단일 그룹의 그룹 함수가 아닙니다

--EMP 테이블의 데이터 개수 조회
SELECT COUNT(*) FROM EMP;
SELECT COUNT(EMPNO) FROM EMP;
SELECT COUNT(SAL) FROM EMP;
SELECT COUNT(DISTINCT SAL) FROM EMP;

--부서번호가 10번인 사원의 최대 급여
SELECT MAX(SAL) FROM EMP WHERE DEPTNO=10;

--부서번호가 10번인 사원의 최소 급여
SELECT MIN(SAL) FROM EMP WHERE DEPTNO=10;

--부서번호가 20번인 사원 중에서 제일 오래된 입사일 조회
SELECT MIN(HIREDATE) FROM EMP WHERE DEPTNO=20;

--부서번호가 30번인 사원들의 평균 급여 조회
SELECT AVG(SAL) FROM EMP WHERE DEPTNO=30;
SELECT AVG(DISTINCT SAL) FROM EMP WHERE DEPTNO=30;

--GROUP BY 그룹화 열 지정(여러개 지정 가능)

--부서별 급여의 합 조회
SELECT SUM(SAL),DEPTNO FROM EMP GROUP BY DEPTNO 
ORDER BY DEPTNO;

--부서별 평균 급여 조회
SELECT AVG(SAL),DEPTNO FROM EMP GROUP BY DEPTNO 
ORDER BY DEPTNO;

--부서별, 직무별, 급여 평균 조회
SELECT AVG(SAL),DEPTNO,JOB FROM EMP GROUP BY DEPTNO, JOB 
ORDER BY DEPTNO,JOB;

-- GROUP BY ~ HAVING 조건식

-- 부서별, 직무별 급여 평균 조회(단, 급여의 평균이 2000 이상)
SELECT AVG(SAL),DEPTNO,JOB FROM EMP
WHERE AVG(SAL)>=2000 GROUP BY DEPTNO,JOB ORDER BY DEPTNO, JOB;

SELECT AVG(SAL),DEPTNO,JOB FROM EMP
GROUP BY DEPTNO,JOB HAVING AVG(SAL) >= 2000 
ORDER BY DEPTNO, JOB;

SELECT AVG(SAL),DEPTNO,JOB FROM EMP
WHERE SAL <=3000 -- ①출력 대상이 되는 행을 제한
GROUP BY DEPTNO,JOB HAVING AVG(SAL) >= 2000 --②그룹화한 행 제한 
ORDER BY DEPTNO, JOB;

SELECT DEPTNO, TRUNC(AVG(SAL),0) AS AVG_SAL, 
MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(*) AS CNT
FROM EMP GROUP BY DEPTNO ORDER BY DEPTNO DESC;

SELECT JOB, COUNT(*) FROM EMP 
GROUP BY JOB HAVING COUNT(JOB)>= 3; 

SELECT TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR,
DEPTNO, COUNT(*) AS CNT
FROM EMP GROUP BY TO_CHAR(HIREDATE,'YYYY'), DEPTNO 
ORDER BY HIRE_YEAR DESC, DEPTNO ASC;

--데이터 삽입, 삭제, 수정 : 결과는 실행된 행의 갯수로 넘어옴

--실습용 테이블 생성
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP;

--INSERT :데이터 삽입
--INSERT INTO 테이블명(필드명....) VALUES(값1, 값2....)
--INSERT INTO 테이블명 VALUES(값1, 값2....)

INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) 
VALUES(50,'DATABASE','SEOUL');

INSERT INTO DEPT_TEMP VALUES(60,'NETWORK','BUSAN');

INSERT INTO DEPT_TEMP VALUES('NETWORK','BUSAN',70); --수치가 부적합합니다

INSERT INTO DEPT_TEMP(DNAME, LOC, DEPTNO) 
VALUES('NETWORK','BUSAN',70);

--이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) 
VALUES (500, 'DATABASE', 'SEOUL');

--NULL 삽입하는 방법(테이블 생성시 널이 가능하도록 열이 설정되어 있는 경우만 사용가능)
INSERT INTO DEPT_TEMP(DEPTNO, DNAME) 
VALUES (90, 'DATABASE');

SELECT*FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) 
VALUES (91, 'WEB', NULL);

INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) 
VALUES (92, 'MOBILE', '');

COMMIT;

--실습용 테이블 생성
--테이블 구조는 복사하되, 데이터는 복사하고 싶지 않을 때
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1;

SELECT * FROM EMP_TEMP;

DESC EMP_TEMP;

INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(1111,'홍길동','MANAGER',NULL,'2021-09-27',4000,NULL,10);

INSERT INTO EMP_TEMP
VALUES(2222,'성춘향','ANALYST',NULL,'2021/09/27',5000,NULL,10);

INSERT INTO EMP_TEMP
VALUES(3333,'박보검','ANALYST',NULL,SYSDATE,5000,NULL,10);

SELECT * FROM EMP_TEMP;

COMMIT;

--UPDATE : 수정
--UPDATE 테이블명 SET 변경할 열 = 변경할 값, 변경할 열 = 변경할 값...
--UPDATE 테이블명 SET 변경할 열 = 변경할 값...WHERE 수정할 조건

SELECT*FROM DEPT_TEMP;

UPDATE DEPT_TEMP SET LOC = 'SEOUL' WHERE DEPTNO =90;
UPDATE DEPT_TEMP SET LOC = 'BUSAN' WHERE DEPTNO =91;

COMMIT;

SELECT*FROM EMP_TEMP;

--SAL이 4000이하인 사원만 추가수당을 50으로 변경
UPDATE EMP_TEMP SET COMM = 50 WHERE SAL<=4000;

UPDATE EMP_TEMP SET COMM = 100;

ROLLBACK;

COMMIT;

--DELETE : 삭제
--DELETE 테이블명 WHERE 삭제할 데이터 조건
--DELETE FROM 테이블명 WHERE 삭제할 데이터 조건

CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP;

SELECT*FROM EMP_TEMP2;

--JOB이 MANAGER인 사원 삭제
DELETE EMP_TEMP2 WHERE JOB='MANAGER';

--전체사원 삭제
DELETE EMP_TEMP2;

ROLLBACK;

select*from emp_temp;

desc emp_temp;

--조인
select count(*) from emp;
select count(*) from dept;

--카테시안 조인 : 나올 수 있는 모든 조합(14행*4행=56행)
select * from emp,dept;

--내부조인(inner 조인)
--등가조인 : 일치하는 데이터를 기준으로 조인
--비등가조인 : 특정 범위에 있는 데이터 추출

select*from emp,dept where emp.deptno= dept.deptno;

--ORA-00918: 열의 정의가 애매합니다 "column ambiguously defined"
select empno,ename,emp.deptno,dname from emp,dept 
where emp.deptno= dept.deptno;

select empno,ename,emp.deptno,dname from emp,dept 
where emp.deptno= dept.deptno
order by dname;

--테이블 별칭 설정
select empno,ename,emp.deptno,dname 
from emp e,dept d 
where e.deptno= d.deptno
order by dname;

--sal 3000이상인 사원들의 사번, 이름, 부서번호, 부서명, 급여
select empno,ename,d.deptno,dname,sal
from emp e , dept d
where e.deptno=d.deptno and sal>=3000;

--급여가 2500 이하이고, 사원번호가 9999 이하인 사원의 사번, 이름,급여, 부서명, 부서위치
SELECT EMPNO, ENAME, SAL, DNAME, LOC FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND SAL <=2500 AND EMPNO<=9999;

--EMP 테이블의 급여가 SALGRADE 특정 범위에 속하면 GRDAE값 조회
SELECT*FROM SALGRADE;
SELECT*FROM EMP;

SELECT*
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

--자체조인(셀프 조인) :본인 테이블과 조인
SELECT E1.EMPNO,E1.ENAME, E1.MGR, E2.EMPNO, E2.ENAME,E2.JOB
FROM EMP E1, EMP E2 WHERE E1.MGR = E2.EMPNO;

--외부조인(OUTER JOIN)
--왼쪽 외부조인(LEFT OUTER JOIN)
SELECT E1.EMPNO,E1.ENAME, E1.MGR, E2.EMPNO, E2.ENAME,E2.JOB
FROM EMP E1, EMP E2 WHERE E1.MGR = E2.EMPNO(+);

--오른쪽 외부조인(RIGHT OUTER JOIN)
SELECT E1.EMPNO,E1.ENAME, E1.MGR, E2.EMPNO, E2.ENAME,E2.JOB
FROM EMP E1, EMP E2 WHERE E1.MGR(+) = E2.EMPNO;

--양쪽 조인

--모든 데에티버에스에서 사용가능한 표준 조인 구문



-- 외부조인(outer join)
-- 왼쪽외부조인(left outer join)  
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno (+);  
  
  
-- 오른쪽외부조인(right outer join)  
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr (+) = e2.empno;    
  
-- 양쪽외부조인(+ 기호는 제공안함)  
-- outer-join된 테이블은 1개만 지정할 수 있습니다
--select e1.empno, e1.ename,e1.mgr, e2.empno, e2.ename
--from emp e1, emp e2
--where e1.mgr(+) = e2.empno(+);   
   

-- 모든 데이터 베이스에서 사용가능한 표준 조인 구문

-- join~on

SELECT
    empno,
    ename,
    emp.deptno,
    dname
FROM
         emp
    JOIN dept ON emp.deptno = dept.deptno
ORDER BY
    dname;

SELECT
    empno,
    ename,
    d.deptno,
    dname,
    sal
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
    sal >= 3000;

SELECT
    empno,
    ename,
    sal,
    dname,
    loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        sal <= 2500
    AND empno <= 9999;

SELECT
    *
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;

-- outer 표준 구문
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1
    LEFT OUTER JOIN emp e2 ON e1.mgr = e2.empno;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1
    RIGHT OUTER JOIN emp e2 ON e1.mgr = e2.empno;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1
    FULL OUTER JOIN emp e2 ON e1.mgr = e2.empno;

-- [실습1] 급여가 2000초과인 사원들의 부서 정보, 사원 정보를 
-- 아래와 같이 출력하는 SQL 문을 작성하시오.
-- deptno, dname, empno, ename, sal

SELECT
    d.deptno,
    dname,
    empno,
    ename,
    sal
FROM
    dept d,
    emp  e
WHERE
        d.deptno = e.deptno
    AND sal > 2000
ORDER BY
    d.deptno;

SELECT
    d.deptno,
    dname,
    empno,
    ename,
    sal
FROM
         dept d
    JOIN emp e ON d.deptno = e.deptno
WHERE
    sal > 2000
ORDER BY
    d.deptno;


-- [실습2] 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수를 출력하는 SQL문을 작성하시오.

SELECT
    d.deptno,
    dname,
    floor(AVG(sal)) AS avg_sal,
    MAX(sal)        max_sal,
    MIN(sal)        min_sal,
    COUNT(*)        cnt
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno
GROUP BY
    d.deptno,
    dname;

SELECT
    d.deptno,
    dname,
    floor(AVG(sal)) AS avg_sal,
    MAX(sal)        max_sal,
    MIN(sal)        min_sal,
    COUNT(*)        cnt
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
GROUP BY
    d.deptno,
    dname;

-- [실습3] 모든 부서정보와 사원 정보를 아래와 같이 부서번호, 사원이름 순으로 
-- 정렬하여 출력하는 SQL문을 작성하시오
-- deptno, dname, empno, ename, job, sal

SELECT
    d.deptno,
    dname,
    empno,
    ename,
    job,
    sal
FROM
    dept d,
    emp  e
WHERE
    d.deptno = e.deptno (+);

SELECT
    d.deptno,
    dname,
    empno,
    ename,
    job,
    sal
FROM
    dept d
    LEFT OUTER JOIN emp  e ON d.deptno = e.deptno
ORDER BY
    d.deptno,
    e.empno;


-- 세 개 테이블 조인
SELECT
    *
FROM
    emp e1,
    emp e2,
    emp e3
WHERE
        e1.empno = e2.empno
    AND e2.empno = e3.empno;

SELECT
    *
FROM
         emp e1
    JOIN emp e2 ON e1.empno = e2.empno
    JOIN emp e3 ON e2.empno = e3.empno;
            
-- [실습4] 모든 부서정보와 사원 정보, 급여등급 정보, 각 사원의 직속 상관의 
-- 정보 부서번호, 사원번호 순으로 정렬하여 출력하는 SQL문을 작성하시오.

-- emp e1 테이블과 dept 테이블 조인 => dept 테이블 기준(dept 테이블 내용 모두 출력)
select *
from emp e1, dept d1
where e1.deptno(+) = d1.deptno;

-- 첫번째 연결 결과랑 salgrade 조인
select *
from emp e1, dept d1, salgrade s1
where e1.deptno(+) = d1.deptno and e1.sal between s1.losal(+) and s1.hisal(+);


-- 두번째 결과의 mgr이랑 emp e2 테이블의 empno 랑 조인
SELECT
    d.deptno,
    dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    losal,
    hisal,
    grade,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp      e1,
    dept     d,
    salgrade s,
    emp      e2
WHERE
        e1.deptno(+) = d.deptno
    AND e1.sal BETWEEN s.losal(+) AND s.hisal(+)
    AND e1.mgr = e2.empno(+)
order by d.deptno, e1.ename;
    
    
SELECT
    d.deptno,
    dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    losal,
    hisal,
    grade,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1 right outer join  dept d on e1.deptno = d.deptno
           left outer join salgrade on e1.sal BETWEEN s.losal AND s.hisal
           left outer join emp  e2 on e1.mgr = e2.empno
order by d.deptno, e1.ename; 

-- 서브쿼리 : sql문을 실행하는 데 필요한 데이터를 추가로 조회하기 위해  
-- sql문 내부에서 사용하는 select문을 말함
-- 연산자와 같은 비교 또는 조회 대상이 오른쪽에 놓여서 괄호로 묶어서 사용
-- 서브쿼리의 SELECT 절에 명시한 열은 메인쿼리의 
-- 비교대상과 같은 자료형과 같은 개수로 지칭


--Jones 사원의 급여보다 높은 급여를 받는 사원 조회
--Jones 사원의 급여 조회
SELECT SAL FROM EMP WHERE ENAME = 'JONES';  --2975
--2975보다 큰 사원 조회
SELECT *FROM EMP WHERE SAL > 2975;

--단일행 서브쿼리
--서브쿼리의 결과가 단 하나의 행으로 나온 상황
-->,>=,=<=,<>,^=,!=
SELECT *FROM EMP WHERE SAL > 
(SELECT SAL FROM EMP WHERE ENAME = 'JONES'); 

--ALLEN 사원의 추가 수당보다 많은 추가수당을 받는 사원 조회
SELECT * FROM EMP WHERE COMM > 
(SELECT COMM FROM EMP WHERE ENAME = 'ALLEN');

--WARD 사원의 입사일보다 빨리 입사한 사원 목록 조회
SELECT * FROM EMP WHERE HIREDATE 
< (SELECT HIREDATE FROM EMP WHERE ENAME = 'WARD');

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원정보
--(사원번호, 사원명, 직업, 급여)와 소속부서정보(부서번호, 부서명, 부서위치)를 조회
SELECT EMPNO, ENAME, JOB, SAL, D.DEPTNO,ENAME, LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND D.DEPTNO=20 
AND E.SAL > (SELECT AVG(SAL) FROM EMP);

--다중행 서브쿼리
--서브쿼리 실행결과가 여러개로 나오는 걸 의미
--IN : 메인 쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치하면 TRUE
--ANY(SOME): 메인 쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 TRUE
--ALL: 메인쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 TRUE
--EXISTS : 서브 쿼리의 결과가 존재하면(행 1개 이상 존재하면) TRUE

--부서별 최고급여와 같은 사원 조회
SELECT * FROM EMP WHERE SAL IN
(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- ANY(SOME)
SELECT * FROM EMP WHERE SAL = ANY
(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

--30번 부서 사원들의 최고급여보다 적은 사원 조회
SELECT * FROM EMP WHERE SAL < 
ANY(SELECT SAL FROM EMP WHERE DEPTNO=30); --MAX쓸 필요없음

--30번 부서 사원들의 최저급여보다 많은 사원 조회
SELECT * FROM EMP WHERE SAL >
ANY(SELECT SAL FROM EMP WHERE DEPTNO=30); -- MIN쓸 필요없음

--ALL
--30번 부서 사원들의 급여보다 적은 사원 조회
SELECT*FROM EMP WHERE SAL < 
ALL (SELECT SAL FROM EMP WHERE DEPTNO=30);

--30번 부서 사원들의 급여보다 큰 사원 조회
SELECT*FROM EMP WHERE SAL > 
ALL (SELECT SAL FROM EMP WHERE DEPTNO=30);

--EXISTS
SELECT * FROM EMP WHERE EXISTS 
(SELECT DNAME FROM DEPT WHERE DEPTNO=10);

SELECT * FROM EMP WHERE EXISTS 
(SELECT DNAME FROM DEPT WHERE DEPTNO=50);

--문제] 전체 사원 중 ALLEN과 같은 직책인 사원들의 사원정보, 부서정보 출력하기
SELECT ENAME, EMPNO, JOB, SAL, D.DEPTNO, DNAME 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.JOB IN (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN');

-- 전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사원정보, 부서정보, 급여등급
--출력하기(급여가 많은 순으로 정렬하되 급여가 같은 경우에는 사원번호 오름차순으로 정렬)
SELECT * FROM 
EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL
AND E.SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY E.SAL DESC, E.EMPNO ASC;

-- 비교할 열이 여러개인 다중열 서브쿼리
SELECT * FROM EMP WHERE (DEPTNO, SAL) 
IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);

--FROM 서브쿼리 (인라인 뷰)
SELECT EMPNO, ENAME, D.DEPTNO, DNAME, LOC
FROM (SELECT*FROM EMP WHERE DEPTNO=10) E10,
(SELECT*FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

--INSERT 사용하는 서브쿼리
--VALUES 절은 사용하지 않음
--데이터가 추가되는 테이블의 열 개수와 서브쿼리의 열 개수가 일치해야 한다.
--데이터가 추가되는 테이블의 자료형과 서브쿼리의 자료형이 일치해야 한다.
--EMP 테이블에서 SALGRADE 테이블을 참조하여 급여 등급이 1인 사원만을 EMP_TEMP
--에 추가하기

INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
SELECT E.EMPNO,E.ENAME,E.JOB,E.MGR,E.HIREDATE,E.SAL,E.COMM,E.DEPTNO
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
AND S.GRADE=1;

--UPDATE 서브쿼리
SELECT *FROM DEPT_TEMP;

--40번 부서의 부서 이름과 지역 수정(DEPT 테이블의 DEPTNO=30인 지역명, 부서명추출)
UPDATE DEPT_TEMP SET (DNAME, LOC) =
(SELECT DNAME, LOC FROM DEPT WHERE DEPTNO=30)
WHERE DEPTNO=40;

UPDATE DEPT_TEMP SET LOC = 'SEOUL'
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'ACCOUNTING');

--DELETE 서브쿼리
DELETE DEPT_TEMP; 

--급여 등급이 3등급이고 30번 부서인 사원들만 삭제

DELETE EMP_TEMP
WHERE EMPNO IN 
(SELECT EMPNO FROM
EMP_TEMP E, SALGRADE S 
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
AND E.DEPTNO =30 AND S.GRADE =3);

CREATE TABLE EXAM_EMP AS SELECT*FROM EMP;
CREATE TABLE EXAM_DEPT AS SELECT*FROM DEPT;
CREATE TABLE EXAM_SALGRADE AS SELECT*FROM SALGRADE;

INSERT INTO EXAM_EMP VALUES
(7201, 'TEST_USER1','MANAGER',7788,'2016-01-02',4500,NULL,50);
INSERT INTO EXAM_EMP VALUES
(7202, 'TEST_USER2','CLERK',7201,'2016-02-21',1800,NULL,50);
INSERT INTO EXAM_EMP VALUES
(7203, 'TEST_USER3','ANALYST',7201,'2016-04-11',3400,NULL,60);
INSERT INTO EXAM_EMP VALUES
(7204, 'TEST_USER4','SALESMAN',7201,'2016-05-31',2700,300,60);
INSERT INTO EXAM_EMP VALUES
(7205, 'TEST_USER5','CLERK',7201,'2016-07-20',2600,NULL,70);
INSERT INTO EXAM_EMP VALUES
(7206, 'TEST_USER6','CLERK',7201,'2016-09-08',2600,NULL,70);
INSERT INTO EXAM_EMP VALUES
(7207, 'TEST_USER7','LECTURER',7201,'2016-10-28',2300,NULL,80);
INSERT INTO EXAM_EMP VALUES
(7208, 'TEST_USER8','STUDENT',7201,'2018-03-09',1200,NULL,80);

--[실습3] EXAM_EMP에 속한 사원 중 50번 부서에서 근무하는 사원들의 평균 급여보다 많은 급여를 받고 있는 사원들을 70번 부서로 옮기는 SQL 문 작성하기
UPDATE EXAM_EMP SET DEPTNO = 70
WHERE SAL > 
(SELECT AVG(SAL) FROM EXAM_EMP WHERE DEPTNO=50);

--[실습4] EXAM_EMP에 속한 사원 중 60번 부서의 사원 중에서 입사일이 가장 빠른 사원보다 늦게 입사한 사원의 급여를 10% 인상하고 80번 부서로 옮기는 SQL 문 작성하기
UPDATE EXAM_EMP SET SAL = SAL*1.1, DEPTNO=80
WHERE HIREDATE > ANY
(SELECT HIREDATE FROM EXAM_EMP WHERE DEPTNO =60);

--[실습5] EXAM_EMP에 속한 사원 중, 급여 등급이 5인 사원을 삭제하는 SQL문을 작성하기
DELETE EXAM_EMP 
WHERE EMPNO IN
(SELECT EMPNO
FROM EXAM_EMP E, EXAM_SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND GRADE = 5);

--트랜젝션 하나의 단위로 데이터를 처리
CREATE TABLE DEPT_TCL AS SELECT*FROM DEPT;
SELECT*FROM DEPT_TCL;

--트랜젝션과 관련있는 명령어 실행
INSERT INTO DEPT_TCL VALUES(50,'DATABASE','SEOUL');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;
DELETE FROM DEPT_TCL WHERE DNAME='RESEARCH';
SELECT*FROM DEPT_TCL;

-----------------
--수행된 명령 취소 
ROLLBACK;

--수행된 명령 최종반영
COMMIT;

--세션 : 어떤 활동을 위한 시간이나 기간
-- 데이터베이스 접속을 시작으로 여러 데이터베이스에서 관련 작업을 수행한 후
-- 접속을 종료하기까지 전체 기간

delete dept_tcl where deptno = 50;
select*from dept_tcl;
commit;

update dept_tcl set loc = 'seoul' where deptno=30;
COMMIT;

--DDL(데이터 정의어)
--객체를 생성, 변경, 삭제
--실행하면 반영됨
--create(생성), alter(변경), drop(삭제)

-- create table 테이블이름(
--             필드명1 자료형, 필드명2 자료형,
-- )

-- 테이블 이름 규칙
-- 문자로 시작
-- 같은 사용자 안에서 동일한 테이블명 사용불가
-- sql 키워드는 테이블 이름으로 사용할 수 없음

--필드명 생성 규칙
-- 문자로 시작
-- 열 이름은 중복되면 안됨
-- sql 키워드 사용불가

-- 자료형 : 숫자 NUMBER, 문자 VARCHAR2, 날짜 DATE

CREATE TABLE EMP_DDL(
EMPNO NUMBER(4), --숫자로 4자리 허용
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR NUMBER(4),
HIREDATE DATE,
SAL NUMBER(7,2), -- 숫자로 7자리 허용(소수점 2자리 허용)
COMM NUMBER(7,2),
DEPTNO NUMBER(2)
);

DESC EMP_DDL;

DROP TABLE EMP_DDL;

CREATE TABLE DEPT_DDL AS SELECT * FROM DEPT;
CREATE TABLE DEPT_DDL_30 AS SELECT * FROM DEPT
WHERE DEPTNO=30;

SELECT*FROM DEPT_DDL_30;

CREATE TABLE DEPT_DDL2 AS SELECT*FROM DEPT WHERE 1<>1;
SELECT * FROM DEPT_DDL2;

--ALTER
--이미 생성된 객체를 변경 

CREATE TABLE EMP_ALTER AS SELECT*FROM EMP;

--새로운 컬럼(열) 추가 : ADD
DESC EMP_ALTER;

ALTER TABLE EMP_ALTER ADD HP VARCHAR2(20);
SELECT * FROM EMP_ALTER;

--RENAME: 열 이름을 변경
ALTER TABLE EMP_ALTER RENAME COLUMN HP TO TEL;

--MODIFY : 열의 자료형을 변경
ALTER TABLE EMP_ALTER MODIFY EMPNO NUMBER(5);

--DROP 열삭제
ALTER TABLE EMP_ALTER DROP COLUMN TEL;

--테이블 이름 변경 
RENAME EMP_ALTER TO EMP_RENAME;

DESC EMP_RENAME;

-- 테이블 데이터를 삭제 TRUNCATE
SELECT * FROM EMP_RENAME;
TRUNCATE TABLE EMP_RENAME;

CREATE TABLE MEMBER(
ID CHAR(8),
NAME VARCHAR(10),
ADDR VARCHAR2(50),
NATION CHAR(4),
EMAIL VARCHAR2(50),
AGE NUMBER(7,2)
);

ALTER TABLE MEMBER MODIFY NAME VARCHAR2(10); 
ALTER TABLE MEMBER ADD BIGO VARCHAR2(20);

SELECT*FROM MEMBER;

ALTER TABLE MEMBER MODIFY BIGO VARCHAR2(30);
DESC MEMBER;

ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK;

