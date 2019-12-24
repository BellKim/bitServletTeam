--1. professor 테이블에서 학과별로 교수들의 평균 급여를 출력.
SELECT deptno, avg(pay) as 평균급여
FROM professor
GROUP BY deptno;


/*
DEPTNO	평균급여
-----------------
102	363.33333
201	450
....
-----------------
7 rows selected.
*/

--2. professor 테이블에서 학과별, 직급별 교수들의 평균 급여 출력.
SELECT deptno, position, avg(pay)
FROM professor
GROUP BY deptno, position
ORDER BY deptno ASC;

/*
DEPNO	POSITION	평균급여
--------------------------------
201	조교수		330
202	조교수		310
...
---------------------------------
16 rows selected.
*/

/*
3. professor 테이블을 사용해 교수중 급여(pay) 보너스(bonus)를 합친 금액이
가장 많은 경우와 가장 적은 경우, 그리고 평균 금액을 구하세요. 단, 보너스가
없을 경우 보너스를 0으로 계산하고 출력 금액은 모두 소수점 첫째 자리까지만
나오도록 출력.
*/
SELECT MAX(pay + NVL(bonus, 0)) MAX, MIN(pay + NVL(bonus, 0)) MIN, ROUND(AVG(pay + NVL(bonus, 0)),1) AVG
FROM professor;

/*
MAX	MIN	AVG
---------------------
700	220	418.8
-----------------------
*/

/*
4. 3번 문제와 동일하게 급여와 보너스를 합친 금액이 가장 많은경우,적은경우
평균 금액을 구하면 된다. 단, 이번엔 보너스가 없을 경우 급여를 0으로 계산하여
출력 한다.

MAX	MIN	AVG
---------------------
700	0	317.5
---------------------
*/
SELECT MAX(pay + NVL(bonus, 0)) MAX, MIN(pay + NVL(bonus, -pay)) MIN, ROUND(AVG(pay + NVL(bonus, -pay)),1) AVG
FROM professor;

--5. student 테이블의 birthday 칼럼을 사용해 아래화면처럼 월별로 태어난 인원수를 구하시오.
/*
합계  1월 2월 3월 4월 5월 6월 7월 8월 9월 10월 11월 12월
-----------------------------------------------------------
20     3   3   2   2   0   1   0   2   2   2    1     2
-----------------------------------------------------------
*/
SELECT
    count(birthday) 합계,
    SUM(DECODE(TO_CHAR(birthday, 'MM'), '01', 1)) "1월",
    SUM(DECODE(TO_CHAR(birthday, 'MM'), '02', 1)) "2월",
    SUM(DECODE(TO_CHAR(birthday, 'MM'), '03', 1)) "3월",
    SUM(DECODE(TO_CHAR(birthday, 'MM'), '04', 1)) "4월",
    SUM(DECODE(TO_CHAR(birthday, 'MM'), '05', 1)) "5월",
    SUM(DECODE(TO_CHAR(birthday, 'MM'), '06', 1)) "6월",
    SUM(DECODE(TO_CHAR(birthday, 'MM'), '07', 1)) "7월",
    SUM(DECODE(TO_CHAR(birthday, 'MM'), '08', 1)) "8월",
    SUM(DECODE(TO_CHAR(birthday, 'MM'), '09', 1)) "9월",
    SUM(DECODE(TO_CHAR(birthday, 'MM'), '10', 1)) "10월",
    SUM(DECODE(TO_CHAR(birthday, 'MM'), '11', 1)) "11월",
    SUM(DECODE(TO_CHAR(birthday, 'MM'), '12', 1)) "12월"
FROM student;

/*
6. student 테이블의 tel 칼럼을 참고해 아래처럼 지역별 인원수를 출력.
단 02는 서울 031은 경기 051은 부산 052는 울산 053은 대구 055는 경남이다.

합계	서울	경기	부산	울산	대구	경남
----------------------------------------------------------
20	   6	   2 	   4	   0	  2	   6
-----------------------------------------------------------
*/
SELECT
    count(tel) 합계,
    SUM(DECODE(SUBSTR(tel, 1, INSTR(tel, ')' ) -1), '02', 1)) "서울",
    SUM(DECODE(SUBSTR(tel, 1, INSTR(tel, ')' ) -1), '031', 1)) "경기",
    SUM(DECODE(SUBSTR(tel, 1, INSTR(tel, ')' ) -1), '051', 1)) "부산",
    SUM(DECODE(SUBSTR(tel, 1, INSTR(tel, ')' ) -1), '052', 1)) "울산",
    SUM(DECODE(SUBSTR(tel, 1, INSTR(tel, ')' ) -1), '053', 1)) "대구",
    SUM(DECODE(SUBSTR(tel, 1, INSTR(tel, ')' ) -1), '055', 1)) "경남"
FROM student;











