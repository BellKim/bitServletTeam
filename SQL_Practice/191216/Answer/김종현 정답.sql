
---------------------------------------
DB_Oracle 주말 과제 (범위: 처음~ 단일 행 함수)
---------------------------------------
select * from student;
1. 학생테이블(student)을 사용하여 모든 학생들이 '서진수의 키는 180cm,

몸무게는 55kg 입니다' 와 같은 형식으로 출력되도록 리터럴 문자를 추가하고,

칼럼 이름은 '학생의 키와 몸무게' 라는 별명으로 출력하세요.


<결과화면>

학생의 키와 몸무게
----------------------------------
서진수의 키는 180 cm, 몸무게는 72 kg 입니다
서재수의 키는 172 cm, 몸무게는 64 kg 입니다
.....
-------------------------------------------

SELECT  name || '의 키는' || height ||'cm, 몸무게는'|| weight ||' kg입니다.'
FROM student;


힌트) 리터럴 문자 : select 구문 뒤에 '(홑따옴표)로 묶어서 사용

ex) select name, '반갑습니다'
    from professor;

NAME	'반갑습니다'
---------------------
조인형	반갑습니다
박승곤	반갑습니다
주승재	반갑습니다
....
---------------------



2. 홍길동(교수), 홍길동'교수' 이렇게 나오도록 출력하세요.

<결과화면>

교수님
---------------------------------
조인형(정교수), 조인형'정교수'
박승곤(조교수), 박승곤'조교수'
송도권(전임강사), 송도권'전임강사'

...
----------------------------------
16 rows selected

SELECT name||'('||position||'), '|| name||' '' '||position||'''' AS 교수님
FROM professor;



3. Professor 테이블에서 교수님의 이름을 조회하여 성 부분에 'ㅈ'이 포함된 사람의

명단을 아래와 같이 출력하세요.

NAME
--------------
전민
조인형
주승재
--------------- 
3 rows selected

SELECT name
FROM professor
WHERE name between '자%'AND '짛%';




4. emp 테이블에서 10번 부서에 근무하는 사원의 이름과 급여와 부서번호를 출력하세요.

ENAME	SAL	DEPTNO
-----------------------
CLARK	2450	10
KING	5000	10
MILLER	1300	10
------------------------
SELECT ename, sal, deptno
FROM emp
WHERE deptno = 10;




5. between 연산자 사용해서 Student 테이블에서 몸무게가 60~80kg인 사람의 이름과 체중 출력하세요.

NAME	WEIGHT
------------------
서진수	72
서재수	64
...
-----------------
6 rows selected

SELECT name, weight
FROM student
WHERE weight between 60 and 80;



6. Student 테이블을 참조해서 아래 화면과 같이 1전공(deptno1)이 101번인 학생의

이름과 전화번호와 지역번호를 출력하세요(단, 지역번호는 숫자만 나와야 합니다.)


NAME		TEL		지역번호
-----------------------------------------
서진수	055)381-2158		055
김신영	055)333-6328		055
일지매	02)6788-4861		02
이윤나	055)278-3649		055
-----------------------------------------

--select name, tel, substr(tel,1,3) AS 지역번호
select name, tel, substr(tel,1,instr(tel,')')-1) AS 지역번호
FROM student
WHERE deptno1=101;



7. Dept2 테이블을 사용하여 dname을 아래 결과가 나오도록 작성하세요.

아래 예시 화면은 dname을 총 10바이트로 출력하되 원래 dname이 나오고

나머지 빈 자리는 해당 자리의 숫자가 나오면 됩니다. 즉 사장실은 이름이 총 6바이트

이므로 숫자가 1234까지 나오는 것입니다.
SELECT * FROM dept2;

LPAD 연습
----------------
1234사장실
경영지원부
재무관리팀
1234총무팀
1234기술부
123H/W지원
123S/W지원
1234영업부
영업기획팀
123영업1팀
-----------------
--- 함수  :  LPAD("값", "총 문자길이", "채움문자")
SELECT LPAD(dname, 10, '123456789') AS LPAD연습
FROM dept2;



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
13 rows selected

SELECT RPAD(dname, 10, '7890') AS LPAD연습
FROM dept2;

--답안지 참고함
select rpad(dname,10,substr('1234567897890def',lengthb(dname)+1))"RPAD연습"
from dept2;


9. Student 테이블에서 아래와 같이 1전공(deptno1)이 101번인 학생들의 이름을 출력하되

가운데 글자만 '#' 으로 표시되게 출력하세요.

REPLACE
--------------
서#수
김#영
일#매
이#나
---------------

SELECT name, replace(name, substr(name,2,1),'#')
FROM student
WHERE deptno1=101;
--REPLACE('문자열' or 열 이름, '바꾸려는 문자열', '바뀔 문자열')
--substr('문자열',번째, 갯수)
select name, substr(name,2,1) 
from student;


10. Student 테이블에서 다음과 같이 1전공(deptno1)이 101번인 학생들의 이름과

주민등록번호를 출력하되 주민등록번호의 뒤 7자리는 '*'로 표시되게 출력하세요


NAME	SSN
--------------
서진수	751023*******
김신영	760123*******
....
----------------
SELECT name, REPLACE(jumin,substr(jumin, 6,12),'******') AS SSN
FROM student
WHERE deptno1=101;
SELECT *
FROM student;

11. Student 테이블의 Birthday 칼럼을 참조하여 생일이 3월인 학생의 이름과 birthday를 출력

NAME	BIRTHDAY
------------------
박동호	03-MAR-75
김주현	24-MAR-78   substr(jumin, 6,12)
------------------
 SELECT name, TO_CHAR(birthday, 'YYYY-mon-DD')
FROM student;

select name, to_char(birthday,'dd-mon-yy')
from student
where to_char(birthday,'mm')='03';

SELECT *
FROM student;


12 . Student 테이블에서 1전공(deptno1)이 101번인 학생의 이름과 전화번호와 지역번호를 출력

지역번호가 02는 서울, 031은 경기, 051은 부산, 052는 울산, 055는 경남으로 출력하세요.

(DECODE 사용해서 풀 것)

NAME	TEL	지역
-------------------------
서진수	055)381-2158	경남
김신영	055)333-6328	경남
일지매	02)6788-4861	서울
...
-----------------------------
SELECT name, TEL, DECODE(substr(tel,1,instr(tel,')')-1),
                                '02','서울',
                                '031','경기',
                                '051','부산',
                                '052','울산',
                                '055','경남',
                                '기타') AS " 지 역 "
FROM student
WHERE deptno1=101;

SELECT * FROM student;




13. 교수테이블(professor)을 조회하여 교수의 급여액수를 기준으로 200 미만은 4급,

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

16 rows selected














