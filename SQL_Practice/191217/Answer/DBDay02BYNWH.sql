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
