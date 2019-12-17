
-- 1. 학생 테이블에서 '서진수의 키는 180cm, 몸무게는 55kg 입니다' 와 같은 형식으로 출력되도록 리터럴 문자 추가 후
-- 컬럼이름은 '학생의 키와 몸무게' 라는 별명으로 출력

select * from student;
------------------------
select name||'의 키는'||height||'cm,'||'몸무게는'||weight||'kg 입니다.' as "학생의 키와 몸무게"
from student;

-- 2. 홍길동(교수), 홍길동'교수' 이렇게 나오도록 출력 (교수테이블)

select * from professor;
----------------------------------
select name||'('||position||'),'||name||''''||position||'''' "교수님"
from professor;


-- 3. professor 테이블에서 교수님의 이름을 조회하여 성 부분에 'ㅈ'이 포함된 사람의 명단을 출력
-- 함수 NCHR : 유니코드 문자를 반환 한다.
-- 'ㅈ'의 유니코드를 사용하여 접근해야 한다.(52263)
-- 'ㅇ'를 포함한 글자의 유니코드가 51087까지라서 51088부터 ㅈ을 포함한 글자의 끝인 52263까지 검색

select name
from professor
where name between nchr(51088) and nchr(52263);

-- 4. emp 테이블에서 10번 부서에 근무하는 사원의 이름과 급여와 부서번호를 출력

select * from emp;

select ename,sal,deptno
from emp
where deptno=10;

-- 5. between 연산자 사용해서 student 테이블에서 몸무게가 60~80kg인 사람의 이름과 체중 출력

select name, weight
from student
where weight between 60 and 80;


-- 6. student 테이블을 참조해서 1전공이 101번인 학생의 이름과 전화번호, 지역번호를 출력
-- 지역번호는 숫자만

select name
     , tel
     , substr(tel,1,instr(tel,')',1)-1) "지역번호" 
from student
where deptno1=101;

-- 7. dept2 테이블 사용해서 dname을 10바이트로 출력하되 남는공간은 해당자리의 숫자가 나오면 된다.

select lpad(dname,10,'1234567890') "LPAD연습"
from dept2;

-- 8. 7번과 비슷하게  RPAD를 사용해서 나타내자.
-- 현재 우리가 작업하고 있는 디벨로퍼는 UTP-8로 한글을 3바이트로 인식
-- 벗 문제는 utp-8환경이 아닌 한글을 2바이트로 인식하는 환경. 
-- 따라서 문제를 알아서 살짝 바꿔서 풀어야 함.....

select rpad(dname,10,substr('1234567890abcdef',lengthb(dname)+1))"RPAD연습"
from dept2;


-- 9. Student 테이블에서 1전공이 10번인 학생의 이름 출력하되 가운데 글자만 '#'으로 표시

select replace(name,substr(name,2,1),'#')
from student
where deptno1 = 101;

-- 10. Student 테이블에서 1전공이 101번 학생의 이름과 주민번호 출력하되 뒤 7자리는 '*'로 표시
select *from student;
select name,substr(jumin,1,6)||'*******' SSN
from student
where deptno1 = 101;

-- 11. student 테이블의 birthday 칼럼을 참조하여 생일이 3월인 학생의 이름과 생일 출력

select name
     , to_char(birthday,'dd-mon-yy')
from student
where to_char(birthday,'mm')='03';

-- 12. student 테이블에서 1전공이 101번인 학생의 이름과 전화번호와 지역번호 출력
-- 지역번호가 02는 서울, 031은 경기, 051은 부산, 052는 울산, 055는 경남으로 출력
-- decode 사용

select name
     , tel
     , decode(substr(tel,1,instr(tel,')',1)-1),'02','서울','031','경기','051','부산','052','울산','055','경남')
from student
where deptno1=101;


-- 13. 교수테이블을 조회하여 교수의 급여액수를 기준으로 등급별 표시하여 교수번호,교수이름,급여,등급 출력
-- 단 pay는 내림차순
select * from professor;

select profno
     , name
     , pay
     , case when pay<200 then '4급'
            when pay between 201 and 300 then '3급'
            when pay between 301 and 400 then '2급'
            else '1급'
            end "등급"
from professor
order by pay desc;




