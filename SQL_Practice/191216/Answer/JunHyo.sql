
--1. 학생테이블(student)을 사용하여 모든 학생들이 '서진수의 키는 180cm,
--몸무게는 55kg 입니다' 와  같은 형식으로 출력되도록 리터럴 문자를 추가하고,
--칼럼 이름은 '학생의 키와 몸무게' 라는 별명으로 출력하세요.
SELECT
    name ||'의 키는'||height||'cm, 몸무게는'||weight||'kg 입니다' AS "학생 키와 몸무게"
FROM student;

--2. 홍길동(교수), 홍길동'교수' 이렇게 나오도록 출력하세요.
SELECT
    name ||'('||position||')' AS "(교수)" , name || q'[']' || position || q'[']' AS "'교수'"
FROM professor;
-- 대체인용 연산자 q'[문자]'

--3. Professor 테이블에서 교수님의 이름을 조회하여 성 부분에 'ㅈ'이 포함된 사람의
--명단을 아래와 같이 출력하세요.
SELECT
    name
FROM professor
WHERE name BETWEEN NCHR(51088)AND NCHR(52263)  ;
-- NCHR 한글 초성 유니코드 변환) ㅇ:51087  ㅈ : 52263  

--4. emp 테이블에서 10번 부서에 근무하는 사원의 이름과 급여와 부서번호를 출력하세요.
SELECT
    ename,sal,deptno
FROM emp
WHERE deptno =10;

--5. between 연산자 사용해서 Student 테이블에서 몸무게가 60~80kg인 사람의 이름과 체중 출력하세요.
SELECT
    name,weight
FROM  student
WHERE weight BETWEEN 60 AND 80;

--6. Student 테이블을 참조해서 아래 화면과 같이 1전공(deptno1)이 101번인 학생의
--이름과 전화번호와 지역번호를 출력하세요(단, 지역번호는 숫자만 나와야 합니다.)

SELECT
    name,TEL,SUBSTR(TEL,1,INSTR(TEL,')',1,1)-1) AS "지역번호"
FROM student
WHERE deptno1 = 101;
--SUBSTR(문자열, 시작위치, 길이)
--시작 위치가 음수일 경우 우측 기준
--INSTR(문자열, 찾을 문자열, 시작 위치, 몇 번째로 발견할것인지 위치)
--함수의 네번째 인자값(몇번째로 발견할 것인지로 지정한 위치)으로 지정한 문자의 인덱스 값을 반환

--7. Dept2 테이블을 사용하여 dname을 아래 결과가 나오도록 작성하세요.
--아래 예시 화면은 dname을 총 10바이트로 출력하되 원래 dname이 나오고
--나머지 빈 자리는 해당 자리의 숫자가 나오면 됩니다. 즉 사장실은 이름이 총 6바이트이므로 숫자가 1234까지 나오는 것입니다.
SELECT
    LPAD(dname,10,'12345')
FROM dept2;
-- LPAD(컬럼,바이트수,빈자리표시문구) left

--8. Dept2 테이블을 사용하여 dname을 아래의 결과가 나오도록 쿼리 작성하세요.(7번 반대)
SELECT
    RPAD(dname,10,'7890')
FROM dept2;
-- RPAD(컬럼,바이트수,빈자리표시문구) right


