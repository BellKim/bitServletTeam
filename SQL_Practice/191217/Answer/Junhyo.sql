/*
8. Dept2 테이블을 사용하여 dname을 아래의 결과가 나오도록 쿼리 작성하세요.
RPAD 연습
-----------------
사장실7890
경영지원부
재무관리팀
총무팀7890
기술부7890
H/W지원890
S/W지원890
영업부7890
영업기획팀
영업1팀890
영업2팀890
영업3팀890
영업4팀890
-----------------
13 rows selected*/
SELECT
    RPAD(dname,10,'7890')
FROM dept2;


/*9. Student 테이블에서 아래와 같이 1전공(deptno1)이 10번인 학생들의 이름을 출력하되
가운데 글자만 '#' 으로 표시되게 출력하세요.
REPLACE
--------------
서#수
김#영
일#매
이#나
---------------*/
SELECT
    REPLACE(name,SUBSTR(name, 2, 1),'#') replace
FROM student
WHERE deptno1 = 101;
/*10. Student 테이블에서 다음과 같이 1전공(deptno1)이 101번인 학생들의 이름과
주민등록번호를 출력하되 주민등록번호의 뒤 7자리는 '*'로 표시되게 출력하세요
NAME	SSN
--------------
서진수	751023*******
김신영	760123*******
....
----------------*/
SELECT
    name , RPAD(SUBSTR(jumin,1,6),13,'*')
FROM student
WHERE deptno1 =101;

/*11. Student 테이블의 Birthday 칼럼을 참조하여 생일이 3월인 학생의 이름과 birthday를 출력
NAME	BIRTHDAY
------------------
박동호	03-MAR-75
김주현	24-MAR-78
------------------*/

SELECT
    name , TO_CHAR(TO_DATE(REPLACE(birthday,'-',''),'YYYYMMDD'),'DD-MON-YY','NLS_DATE_LANGUAGE=ENGLISH')
    -- 'NLS_DATE_LANGUAGE=ENGLISH'  영문날짜 변경
FROM student
WHERE SUBSTR(birthday,6,2) = 03;
 


/*12 . Student 테이블에서 1전공(deptno1)이 101번인 학생의 이름과 전화번호와 지역번호를 출력

지역번호가 02는 서울, 031은 경기, 051은 부산, 052는 울산, 055는 경남으로 출력하세요.

(DECODE 사용해서 풀 것)

NAME	TEL	지역
-------------------------
서진수	055)381-2158	경남
김신영	055)333-6328	경남
일지매	02)6788-4861	서울
...
-----------------------------*/

SELECT
    name,tel,
    DECODE(SUBSTR(tel,1,INSTR(tel,')',1,1)-1),
    '055','경남','02','서울','031','경기','051','부산','052','울산') AS "지역번호"
    
FROM student
WHERE deptno1 = 101;


/*13. 교수테이블(professor)을 조회하여 교수의 급여액수를 기준으로 200 미만은 4급,

201~300은 3급, 301~400은 2급, 401 이상은 1급으로 표시하여 교수의 번호, 교수이름, 급여,

등급을 출력하세요. 단 pay컬럼은 내림차순으로 정렬하세요.

PROFNO		NAME		PAY	등급
------------------------------------------------
4001		심슨		570	1급
1001		조인형		550	1급
....
3003		김현정		290	3급
....
------------------------------------------------
16 rows selected*/
SELECT
    profno, name, pay,
    /*DECODE(pay,
    pay BETWEEN 0 AND 200,'4급',
    pay BETWEEN 201 AND 300,'3급',
    pay BETWEEN 301 AND 400,'2급',
    pay>400,'1급') AS "등급"*/
    CASE 
    WHEN pay BETWEEN 0 AND 200 THEN '4급'
    WHEN pay BETWEEN 201 AND 300 THEN '3급'
    WHEN pay BETWEEN 301 AND 400 THEN '2급'
    WHEN pay >400 THEN '1급'
    END AS "등급"
FROM professor
ORDER BY pay DESC;






/*
1. professor 테이블에서 학과별로 교수들의 평균 급여를 출력.

DEPTNO	평균급여
-----------------
102	363.33333
201	450
....
-----------------
7 rows selected.*/

SELECT
    deptno,AVG(pay) AS "평균급여"
FROM professor 
GROUP BY deptno;


/*2. professor 테이블에서 학과별, 직급별 교수들의 평균 급여 출력.

DEPNO	POSITION	평균급여
--------------------------------
201	조교수		330
202	조교수		310
...
---------------------------------
16 rows selected.*/
SELECT
    deptno,position,AVG(pay)
FROM professor
GROUP BY deptno,position;

/*3. professor 테이블을 사용해 교수중 급여(pay) 보너스(bonus)를 합친 금액이
가장 많은 경우와 가장 적은 경우, 그리고 평균 금액을 구하세요. 단, 보너스가
없을 경우 보너스를 0으로 계산하고 출력 금액은 모두 소수점 첫째 자리까지만
나오도록 출력.
MAX	MIN	AVG
---------------------
700	220	418.8
-----------------------*/
SELECT
 MAX(pay + NVL(bonus,'0')) MAX, MIN(pay + NVL(bonus,'0')) MIN , ROUND(AVG(pay + NVL(bonus,'0')),1) AVG
FROM professor;



/*
4. 3번 문제와 동일하게 급여와 보너스를 합친 금액이 가장 많은경우,적은경우

평균 금액을 구하면 된다. 단, 이번엔 보너스가 없을 경우 급여를 0으로 계산하여

출력 한다.

MAX	MIN	AVG
---------------------
700	0	317.5
---------------------*/

SELECT
 MAX(NVL2(bonus,pay+bonus,pay*0)) MAX,
 MIN(NVL2(bonus,pay+bonus,pay*0)) MIN,
 ROUND(AVG(NVL2(bonus,pay+bonus,0)),1) AVG
FROM professor;

