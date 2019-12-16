-- 문제1) 학생테이블 (student)를 사용하여 모든 학생들이 서진수의 키는 180cm, 몸무게는 55kg 입니다' 와 같은 형식으로 출력되도록 리터럴 문자를 추가하고, 칼럼 이름은 '학생의 키와 몸무게' 라는 별명으로 출력하세요.
SELECT name || '의 키는' || height ||'cm, 몸무게는' || weight || 'kg 입니다'"학생의 키와 몸무게"
FROM student;

-- 문제2) 홍길동(교수), 홍길동'교수'
SELECT name||'('||position||'), ' || name || chr(39) ||position || chr(39)
FROM professor;

-- 문제3) Professor 테이블에서 교수님의 이름을 조회하여 성 부분에 'ㅈ'이 포함된 사람의 명단을 아래와 같이 출력하세요.
SELECT name
FROM professor
WHERE SUBSTR(name, 1, 1) BETWEEN '읳' AND '즿'
ORDER BY name;

-- 문제4) emp 테이블에서 10번 부서에 근무하는 사원의 이름과 급여와 부서번호를 출력하세요.
SELECT ename, sal, deptno
FROM emp
WHERE deptno = '10';

-- 문제5) between 연산자 사용해서 Student 테이블에서 몸무게가 60~80kg인 사람의 이름과 체중 출력하세요.
SELECT name, weight
FROM student
WHERE weight BETWEEN 60 AND 80 ;

-- 문제6) Student 테이블을 참조해서 아래 화면과 같이 1전공(deptno1)이 101번인 학생의 이름과 전화번호와 지역번호를 출력하세요(단, 지역번호는 숫자만 나와야 합니다.)
SELECT name, tel, SUBSTR(tel,1,3)
FROM student
WHERE deptno1 = '101'; -- 다시작성해야함.

-- 문제7) Dept2 테이블을 사용하여 dname을 아래 결과가 나오도록 작성하세요.
-- 아래 예시 화면은 dname을 총 10바이트로 출력하되 원래 dname이 나오고 나머지 빈 자리는 해당 자리의 숫자가 나오면 됩니다. 즉 사장실은 이름이 총 6바이트
-- 이므로 숫자가 1234까지 나오는 것입니다.
SELECT LPAD(dname, 10, '1234567890')
FROM dept2;

-- 문제8) Dept2 테이블을 사용하여 dname을 아래의 결과가 나오도록 쿼리 작성하세요.
SELECT RPAD(dname, 10, '1234567890')
FROM dept2; -- 다시작성해야함.

-- 문제9) Student 테이블에서 아래와 같이 1전공(deptno1)이 101번인 학생들의 이름을 출력하되 가운데 글자만 '#' 으로 표시되게 출력하세요.
SELECT SUBSTR(name, 1,1) || '#' || SUBSTR(name, -1, 1)
FROM student
WHERE deptno1 = '101';

-- 문제10) Student 테이블에서 다음과 같이 1전공(deptno1)이 101번인 학생들의 이름과 주민등록번호를 출력하되 주민등록번호의 뒤 7자리는 '*'로 표시되게 출력하세요
SELECT name, SUBSTR(jumin, 1, 6) || '*******'
FROM student
WHERE deptno1 = 101;

-- 문제11) Student 테이블의 Birthday 칼럼을 참조하여 생일이 3월인 학생의 이름과 birthday를 출력
SELECT name, birthday, SUBSTR(TO_CHAR(birthday, 'YYYYMMDD'), 5, 2) || '-MAR-' || SUBSTR(TO_CHAR(birthday, 'YYYYMMDD'), 7, 2)"birthday"
FROM student
WHERE SUBSTR(TO_CHAR(birthday, 'YYYYMMDD'), 5, 4) BETWEEN 0300 AND 0400;

-- 문제12) Student 테이블에서 1전공(deptno1)이 101번인 학생의 이름과 전화번호와 지역번호를 출력 지역번호가 02는 서울, 031은 경기, 051은 부산, 052는 울산, 055는 경남으로 출력하세요.
SELECT name, tel
FROM student
WHERE deptno1 = 101; -- 모르겠음

-- 문제13) 교수테이블(professor)을 조회하여 교수의 급여액수를 기준으로 200 미만은 4급, 
-- 201~300은 3급, 301~400은 2급, 401 이상은 1급으로 표시하여 교수의 번호, 교수이름, 급여, 등급을 출력하세요. 단 pay컬럼은 내림차순으로 정렬하세요.
SELECT profno, name, pay
FROM professor
ORDER BY pay DESC;