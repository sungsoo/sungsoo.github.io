---
layout: post
title: Query Transformation
date: 2014-05-26
categories: [computer science]
tags: [data management]

---


# Query Transformation

## What is Query Transformation?

쿼리 변환(Query Transformation)은, 옵티마이저가 SQL을 분석해 의미적으로 동일(→ 같은 결과를 리턴)하면서도 더 나은 성능이 기대되는 형태로 재작성하는 것을 말한다. 이는 본격적으로 실행계획을 생성하고 비용을 계산하기에 앞서 사용자 SQL을 최적화에 유리한 형태로 재작성하는 것으로서, DBMS 버전이 올라갈수록 그 종류가 다양해짐은 물론 더 적극적인 시도가 이루어지고 있다. 비용기반 옵티마이저의 서브엔진으로서 Query Transformer, Estimator, Plan Generator가 있다고 설명했는데, 이 중 Query Transformer가 그런 역할을 담당한다([그림 Ⅲ-3-1] 참조). 쿼리 변환은 다음 두 가지 방식으로 작동한다.

휴리스틱(Heuristic) 쿼리 변환 : 결과만 보장된다면 무조건 쿼리 변환을 수행한다. 일종의 규칙 기반(Rule-based) 최적화 기법이라고 할 수 있으며, 경험적으로 (최소한 동일하거나) 항상 더 나은 성능을 보일 것이라는 옵티마이저 개발팀의 판단이 반영된 것이다.
비용기반(Cost-based) 쿼리 변환 : 변환된 쿼리의 비용이 더 낮을 때만 그것을 사용하고, 그렇지 않을 때는 원본 쿼리 그대로 두고 최적화를 수행한다.

## Subquery Unnesting

‘서브쿼리 Unnesting’은 중첩된 서브쿼리(Nested Subquery)를 풀어내는 것을 말한다. 서브쿼리를 메인쿼리와 같은 레벨로 풀어낸다면 다양한 액세스 경로와 조인 메소드를 평가할 수 있다. 특히 옵티마이저는 많은 조인테크닉을 가지기 때문에 조인 형태로 변환했을 때 더 나은 실행계획을 찾을 가능성이 높아진다. 아래는 하나의 쿼리에 서브쿼리가 이중삼중으로 중첩(nest)될 수 있음을 보여준다.

select * from emp a where exists ( select 'x' from dept where deptno = a.deptno ) and sal > (select avg(sal) from emp b where exists ( select 'x' from salgrade where b.sal between losal and hisal and grade = 4) )
위 쿼리의 논리적인 포함관계를 상자로 표현하면 [그림 Ⅲ-3-4]와 같다.


위 쿼리와 [그림 Ⅲ-3-4]에서 알 수 있듯이 ‘중첩된 서브쿼리(nested subquery)’는 메인쿼리와 부모와 자식이라는 종속적이고 계층적인 관계가 존재한다. 따라서 논리적인 관점에서 그 처리과정은 IN, Exists를 불문하고 필터 방식이어야 한다. 즉, 메인 쿼리에서 읽히는 레코드마다 서브쿼리를 반복 수행하면서 조건에 맞지 않는 데이터를 골라내는 것이다. 하지만 서브쿼리를 처리하는 데 있어 필터 방식이 항상 최적의 수행속도를 보장하지 못하므로 옵티마이저는 아래 둘 중 하나를 선택한다.

동일한 결과를 보장하는 조인문으로 변환하고 나서 최적화한다. 이를 일컬어 ‘서브쿼리 Unnesting’이라고 한다.
서브쿼리를 Unnesting하지 않고 원래대로 둔 상태에서 최적화한다. 메인쿼리와 서브쿼리를 별도의 서브플랜(Subplan)으로 구분해 각각 최적화를 수행하며, 이때 서브쿼리에 필터(Filter) 오퍼레이션이 나타난다.
1번 서브쿼리 Unnesting은 메인과 서브쿼리 간의 계층구조를 풀어 서로 같은 레벨(flat한 구조)로 만들어 준다는 의미에서 ‘서브쿼리 Flattening’이라고도 부른다. 이렇게 쿼리 변환이 이루어지고 나면 일반 조인문처럼 다양한 최적화 기법을 사용할 수 있게 된다. 2번처럼, Unnesting하지 않고 쿼리 블록별로 최적화할 때는 각각의 최적이 쿼리문 전체의 최적을 달성하지 못할 때가 많다. 그리고 Plan Generator가 고려대상으로 삼을만한 다양한 실행계획을 생성해 내는 작업이 매우 제한적인 범위 내에서만 이루어진다. 실제 서브쿼리 Unnesting이 어떤 식으로 작동하는지 살펴보자. 아래처럼 IN 서브쿼리를 포함하는 SQL문이 있다.

select * from emp where deptno in (select deptno from dept)
이 SQL문을 Unnesting하지 않고 그대로 최적화한다면 옵티마이저는 아래와 같이 필터 방식의 실행계획을 수립한다.

--------------------------------------------------------- | Id | Operation | Name | Rows | Bytes | Cost (%CPU) | --------------------------------------------------------- | 0 | SELECT STATEMENT | | 3 | 99 | 3 (0) | |* 1 | FILTER | | | | | | 2 | TABLE ACCESS FULL | EMP | 10 | 330 | 3 (0) | |* 3 | INDEX UNIQUE SCAN | DEPT_PK | 1 | 2 | 0 (0) | --------------------------------------------------------- Predicate Information (identified by operation id): --------------------------------------------------------- 1 - filter( EXISTS (SELECT 0 FROM "DEPT" "DEPT" WHERE "DEPTNO"=:B1)) 3 - access("DEPTNO"=:B1)
Predicate 정보를 보면 필터 방식으로 수행된 서브쿼리의 조건절이 바인드 변수로 처리된 부분(DEPTNO = :B1)이 눈에 띄는데, 이것을 통해 옵티마이저가 서브쿼리를 별도의 서브플랜(Subplan)으로 최적화한다는 사실을 알 수 있다. 메인 쿼리도 하나의 쿼리 블록이므로 서브쿼리를 제외한 상태에서 별도로 최적화가 이루어졌다. (아무 조건절이 없으므로 Full Table Scan이 최적이다.) 이처럼, Unnesting하지 않은 서브쿼리를 수행할 때는 메인 쿼리에서 읽히는 레코드마다 값을 넘기면서 서브쿼리를 반복 수행한다. (내부적으로 IN 서브쿼리를 Exists 서브쿼리로 변환한다는 사실도 Predicate 정보를 통해 알 수 있다.) 위 서브쿼리가 Unnesting 되면, 변환된 쿼리는 아래와 같은 조인문 형태가 된다.

select * from (select deptno from dept) a, emp b where b.deptno = a.deptno
그리고 이것은 바로 이어서 설명할 뷰 Merging 과정을 거쳐 최종적으로 아래와 같은 형태가 된다.

select emp.* from dept, emp where emp.deptno = dept.deptno
아래가 서브쿼리 Unnesting이 일어났을 때의 실행계획이다. 서브쿼리인데도 일반적인 Nested Loop 조인 방식으로 수행된 것을 볼 수 있다. 위 조인문을 수행할 때와 정확히 같은 실행계획이다.

select * from emp where deptno in (select deptno from dept) ------------------------------------------------------------------ | Id | Operation | Name | Rows | Bytes | Cost (%CPU)| ------------------------------------------------------------------ | 0 | SELECT STATEMENT | | 10 | 350 | 2 (0) | | 1 | TABLE ACCESS BY INDEX ROWID| EMP | 3 | 99 | 1 (0) | | 2 | NESTED LOOPS | | 10 | 350 | 2 (0) | | 3 | INDEX FULL SCAN | DEPT_PK | 4 | 8 | 1 (0) | |* 4 | INDEX RANGE SCAN | EMP_DEPTNO_IDX | 3 | | 0 (0) | ------------------------------------------------------------------ Predicate Information (identified by operation id): ------------------------------------------------------------------ 4 - access("DEPTNO"="DEPTNO")
주의할 점은, 서브쿼리를 Unnesting한 결과가 항상 더 나은 성능을 보장하지 않는다는 사실이다. 따라서 최근 옵티마이저는 서브쿼리를 Unnesting 했을 때 쿼리 수행 비용이 더 낮은지를 비교해 보고 적용 여부를 판단하는 쪽으로 발전하고 있다. 기본적으로 옵티마이저에게 맡기는 것이 바람직하지만, 앞서 얘기했듯이 옵티마이저가 항상 완벽할 순 없으므로 사용자가 직접 이 기능을 제어할 필요성이 생긴다. 이를 위해 Oracle은 아래 두 가지 힌트를 제공하고 있다.

unnest : 서브쿼리를 Unnesting 함으로써 조인방식으로 최적화하도록 유도한다.
no_unnest : 서브쿼리를 그대로 둔 상태에서 필터 방식으로 최적화하도록 유도한다.
서브쿼리가 M쪽 집합이거나 Nonunique 인덱스일 때

지금까지 본 예제는 메인 쿼리의 emp 테이블과 서브쿼리의 dept 테이블이 M:1 관계이기 때문에 일반 조인문으로 바꾸더라도 쿼리 결과가 보장된다. 옵티마이저는 dept 테이블 deptno 칼럼에 PK 제약이 설정된 것을 통해 dept 테이블이 1쪽 집합이라는 사실을 알 수 있다. 따라서 안심하고 쿼리 변환을 실시한다. 만약 서브쿼리 쪽 테이블의 조인 칼럼에 PK/Unique 제약 또는 Unique 인덱스가 없다면, 일반 조인문처럼 처리했을 때 어떻게 될까?

<사례1 >

select * from dept where deptno in (select deptno from emp)
위 쿼리는 1쪽 집합을 기준으로 M쪽 집합을 필터링하는 형태이므로 당연히 서브쿼리 쪽 emp 테이블 deptno 칼럼에는 Unique 인덱스가 없다. dept 테이블이 기준 집합이므로 결과집합은 이 테이블의 총 건수를 넘지 않아야 한다. 그런데 옵티마이저가 임의로 아래와 같은 일반 조인문으로 변환한다면 M쪽 집합인 emp 테이블 단위의 결과집합이 만들어지므로 결과 오류가 생긴다.

select * from (select deptno from emp) a, dept b where b.deptno = a.deptno
<사례2>

select * from emp where deptno in (select deptno from dept)
위 쿼리는 M쪽 집합을 드라이빙해 1쪽 집합을 서브쿼리로 필터링하도록 작성되었으므로 조인문으로 바꾸더라도 결과에 오류가 생기지는 않는다. 하지만 dept 테이블 deptno 칼럼에 PK/Unique 제약이나 Unique 인덱스가 없으면 옵티마이저는 emp와 dept 간의 관계를 알 수 없고, 결과를 확신할 수 없으니 일반 조인문으로의 쿼리 변환을 시도하지 않는다. (만약 SQL 튜닝 차원에서 위 쿼리를 사용자가 직접 조인문으로 바꿨는데, 어느 순간 dept 테이블 deptno 칼럼에 중복 값이 입력되면서 결과에 오류가 생기더라도 옵티마이저에게는 책임이 없다.) 이럴 때 옵티마이저는 두 가지 방식 중 하나를 선택하는데, Unnesting 후 어느 쪽 집합을 먼저 드라이빙 하느냐에 따라 달라진다.

1쪽 집합임을 확신할 수 없는 서브쿼리 쪽 테이블이 드라이빙된다면, 먼저 sort unique 오퍼레이션을 수행함으로써 1쪽 집합으로 만든 다음에 조인한다.
메인 쿼리 쪽 테이블이 드라이빙된다면 세미 조인(Semi Join) 방식으로 조인한다. 이것이 세미 조인(Semi Join)이 탄생하게 된 배경이다.
아래는 Sort Unique 오퍼레이션 방식으로 수행할 때의 실행계획이다.

alter table dept drop primary key; create index dept_deptno_idx on dept(deptno); select * from emp where deptno in (select deptno from dept); ----------------------------------------------------------- | Id | Operation | Name | Rows | Bytes | ----------------------------------------------------------- | 0 | SELECT STATEMENT | | 11 | 440 | | 1 | TABLE ACCESS BY INDEX ROWID | EMP | 4 | 148 | | 2 | NESTED LOOPS | | 11 | 440 | | 3 | SORT UNIQUE | | 4 | 12 | | 4 | INDEX FULL SCAN | DEPT_DEPTNO_IDX | 4 | 12 | |* 5 | INDEX RANGE SCAN | EMP_DEPTNO_IDX | 5 | | ----------------------------------------------------------- Predicate Information (identified by operation id): ----------------------------------------------------------- 5 - access("DEPTNO"="DEPTNO")
실제로 dept 테이블은 Unique한 집합이지만 옵티마이저는 이를 확신할 수 없어 sort unique 오퍼레이션을 수행하였다. 아래와 같은 형태로 쿼리 변환이 일어난 것이다.

select b.* from (select /*+ no_merge */ distinct deptno from dept order by deptno) a, emp b where b.deptno = a.deptno
아래는 세미 조인 방식으로 수행할 때의 실행계획이다.

select * from emp where deptno in (select deptno from dept) -------------------------------------------------------------- | Id | Operation | Name | Rows | Bytes | Cost (%CPU) | -------------------------------------------------------------- | 0 | SELECT STATEMENT | | 10 | 350 | 3 (0) | | 1 | NESTED LOOPS SEMI | | 10 | 350 | 3 (0) | | 2 | TABLE ACCESS FULL | EMP | 10 | 330 | 3 (0) | |* 3 | INDEX RANGE SCAN | DEPT_IDX | 4 | 8 | 0 (0) | -------------------------------------------------------------- Predicate Information (identified by operation id): -------------------------------------------------------------- 3 - access("DEPTNO"="DEPTNO")
NL 세미 조인으로 수행할 때는 sort unique 오퍼레이션을 수행하지 않고도 결과집합이 M쪽 집합으로 확장되는 것을 방지하는 알고리즘을 사용한다. 기본적으로 NL Join과 동일한 프로세스로 진행하지만, Outer (=Driving) 테이블의 한 로우가 Inner 테이블의 한 로우와 조인에 성공하는 순간 진행을 멈추고 Outer 테이블의 다음 로우를 계속 처리하는 방식이다. 아래 pseudo 코드를 참고한다면 어렵지 않게 이해할 수 있다.

for(i=0; ; i++) { // outer loop for(j=0; ; j++) { // inner loop if(i==j) break; } }

## View Merging

아래 <쿼리1>처럼 인라인 뷰를 사용하면 쿼리 내용을 파악하기가 더 쉽다. 서브쿼리도 마찬가지다. 서브쿼리로 표현하면 아무래도 조인문보다 더 직관적으로 읽힌다.

<쿼리1>

select * from (select * from emp where job = 'SALESMAN') a , (select * from dept where loc = 'CHICAGO') b where a.deptno = b.deptno
그런데 사람의 눈으로 볼 때는 쿼리를 블록화하는 것이 더 읽기 편할지 모르지만 최적화를 수행하는 옵티마이저의 시각에서는 더 불편하다. 그런 탓에 옵티마이저는 가급적 <쿼리2>처럼 쿼리 블록을 풀어내려는 습성을 갖는다. (옵티마이저 개발팀이 그렇게 만들었다.)

<쿼리2>

select * from emp a, dept b where a.deptno = b.deptno and a.job = 'SALESMAN' and b.loc = 'CHICAGO'
따라서 위에서 본 <쿼리1>의 뷰 쿼리 블록은 액세스 쿼리 블록(뷰를 참조하는 쿼리 블록)과의 머지(merge) 과정을 거쳐 <쿼리2>와 같은 형태로 변환되는데, 이를 ‘뷰 Merging’이라고 한다. 뷰를 Merging해야 옵티마이저가 더 다양한 액세스 경로를 조사 대상으로 삼을 수 있게 된다. 아래와 같이 조건절 하나만을 가진 단순한 emp_salesman 뷰가 있다.

create or replace view emp_salesman as select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp where job = 'SALESMAN' ;
위 emp_salesman 뷰와 조인하는 간단한 조인문을 작성해 보자.

select e.empno, e.ename, e.job, e.mgr, e.sal, d.dname from emp_salesman e, dept d where d.deptno = e.deptno and e.sal >= 1500 ;
위 쿼리를 뷰 Merging 하지 않고 그대로 최적화한다면 아래와 같은 실행계획이 만들어진다.

Execution Plan ------------------------------------------------------------- 0 SELECT STATEMENT Optimizer=ALL_ROWS (Cost=3 Card=2 Bytes=156) 1 0 NESTED LOOPS (Cost=3 Card=2 Bytes=156) 2 1 VIEW OF 'EMP_SALESMAN' (VIEW) (Cost=2 Card=2 Bytes=130) 3 2 TABLE ACCESS (BY INDEX ROWID) OF 'EMP' (TABLE) (Cost=2 Card=2 ) 4 3 INDEX (RANGE SCAN) OF 'EMP_SAL_IDX' (INDEX) (Cost=1 Card=7) 5 1 TABLE ACCESS (BY INDEX ROWID) OF 'DEPT' (TABLE) (Cost=1 Card=1 Bytes=13) 6 5 INDEX (UNIQUE SCAN) OF 'DEPT_PK' (INDEX (UNIQUE)) (Cost=0 Card=1)
뷰 Merging이 작동한다면 변환된 쿼리는 아래와 같은 모습일 것이다.

select e.empno, e.ename, e.job, e.mgr, e.sal, d.dname from emp e, dept d where d.deptno = e.deptno and e.job = 'SALESMAN' and e.sal >= 1500
그리고 이때의 실행계획은 다음과 같이 일반 조인문을 처리하는 것과 똑같은 형태가 된다.

Execution Plan ------------------------------------------------------------- 0 SELECT STATEMENT Optimizer=ALL_ROWS (Cost=3 Card=2 Bytes=84) 1 0 NESTED LOOPS (Cost=3 Card=2 Bytes=84) 2 1 TABLE ACCESS (BY INDEX ROWID) OF 'EMP' (TABLE) (Cost=2 Card=2 Bytes=58) 3 2 INDEX (RANGE SCAN) OF 'EMP_SAL_IDX' (INDEX) (Cost=1 Card=7) 4 1 TABLE ACCESS (BY INDEX ROWID) OF 'DEPT' (TABLE) (Cost=1 Card=1 Bytes=13) 5 4 INDEX (UNIQUE SCAN) OF 'DEPT_PK' (INDEX (UNIQUE)) (Cost=0 Card=1)
위와 같이 단순한 뷰는 Merging하더라도 성능이 나빠지지 않는다. 하지만 아래와 같이 복잡한 연산을 포함하는 뷰를 Merging하면 오히려 성능이 더 나빠질 수도 있다.

group by 절
select-list에 distinct 연산자 포함
따라서 뷰를 Merging했을 때 쿼리 수행 비용이 더 낮아지는지를 조사한 후에 적용 여부를 판단하는 쪽으로 옵티마이저가 발전하고 있다. 가급적 옵티마이저의 판단과 기능에 의존하는 것이 좋지만, 필요하다면 개발자가 이를 직접 조정할 줄도 알아야 한다. Oracle의 경우 이 기능을 제어할 수 있도록 merge와 no_merge 힌트를 제공하는데, 이를 사용하기에 앞서 실행계획을 통해 뷰 Merging이 발생했는지, 그리고 그것이 적정한지를 판단하는 능력이 더 중요하다. 아래는 뷰 Merging이 불가능한 경우인데, 힌트가 제공되지 않을 땐 이런 제약을 활용해 튜닝을 실시하기도 한다.

집합(set) 연산자(union, union all, intersect, minus)
connect by절
ROWNUM pseudo 칼럼
select-list에 집계 함수(avg, count, max, min, sum) 사용
분석 함수(Analytic Function)

## Predicate Pushing

옵티마이저가 뷰를 처리함에 있어 1차적으로 뷰 Merging을 고려하지만, 조건절(Predicate) Pushing을 시도할 수도 있다. 이는 뷰를 참조하는 쿼리 블록의 조건절을 뷰 쿼리 블록 안으로 밀어 넣는 기능을 말한다. 조건절이 가능한 빨리 처리되도록 뷰 안으로 밀어 넣는다면, 뷰 안에서의 처리 일량을 최소화하게 됨은 물론 리턴되는 결과 건수를 줄임으로써 다음 단계에서 처리해야 할 일량을 줄일 수 있다. 조건절 Pushing과 관련해 DBMS가 사용하는 기술로는 다음 3가지가 있다.

조건절(Predicate) Pushdown : 쿼리 블록 밖에 있는 조건절을 쿼리 블록 안쪽으로 밀어 넣는 것을 말함
조건절(Predicate) Pullup : 쿼리 블록 안에 있는 조건절을 쿼리 블록 밖으로 내오는 것을 말하며, 그것을 다시 다른 쿼리 블록에 Pushdown 하는 데 사용함
조인 조건(Join Predicate) Pushdown : NL Join 수행 중에 드라이빙 테이블에서 읽은 값을 건건이 Inner 쪽(=right side) 뷰 쿼리 블록 안으로 밀어 넣는 것을

###  Predicate Pushdown

group by절을 포함한 아래 뷰를 처리할 때, 쿼리 블록 밖에 있는 조건절을 쿼리 블록 안쪽에 밀어 넣을 수 있다면 group by 해야 할 데이터량을 줄일 수 있다. 인덱스 상황에 따라서는 더 효과적인 인덱스 선택이 가능해지기도 한다.

select deptno, avg_sal from (select deptno, avg(sal) avg_sal from emp group by deptno) a where deptno = 30 ----------------------------------------------------------- | Id | Operation | Name | Rows | Bytes | ----------------------------------------------------------- | 0 | SELECT STATEMENT | | 1 | 26 | | 1 | VIEW | | 1 | 26 | | 2 | SORT GROUP BY NOSORT | | 1 | 7 | | 3 | TABLE ACCESS BY INDEX ROWID | EMP | 6 | 42 | |* 4 | INDEX RANGE SCAN | EMP_DEPTNO_IDX | 6 | | ----------------------------------------------------------- Predicate Information (identified by operation id): ----------------------------------------------------------- 4 - access("DEPTNO"=30)
위 쿼리에 정의한 뷰 내부에는 조건절이 하나도 없다. 만약 쿼리 변환이 작동하지 않는다면, emp 테이블을 Full Scan 하고서 group by 이후에 deptno = 30 조건을 필터링했을 것이다. 하지만, 조건절 Pushing이 작동함으로써 emp_deptno_idx 인덱스를 사용한 것을 실행계획에서 볼 수 있다. 이번에는 조인문으로 테스트해 보자.

select b.deptno, b.dname, a.avg_sal from (select deptno, avg(sal) avg_sal from emp group by deptno) a , dept b where a.deptno = b.deptno and b.deptno = 30 ------------------------------------------------------------ | Id | Operation | Name | Rows | Bytes | ------------------------------------------------------------ | 0 | SELECT STATEMENT | | 1 | 39 | | 1 | NESTED LOOPS | | 1 | 39 | | 2 | TABLE ACCESS BY INDEX ROWID | DEPT | 1 | 13 | |* 3 | INDEX UNIQUE SCAN | DEPT_PK | 1 | | | 4 | VIEW | | 1 | 26 | | 5 | SORT GROUP BY | | 1 | 7 | | 6 | TABLE ACCESS BY INDEX ROWID | EMP | 6 | 42 | |* 7 | INDEX RANGE SCAN | EMP_DEPTNO_IDX | 6 | | ------------------------------------------------------------ Predicate Information (identified by operation id): ------------------------------------------------------------ 3 - access("B"."DEPTNO"=30) 7 - access("DEPTNO"=30)
위 실행계획과 Predicate Information을 보면, 인라인 뷰에 deptno = 30 조건절을 적용해 데이터량을 줄이고서 group by와 조인연산을 수행한 것을 알 수 있다. deptno = 30 조건이 인라인 뷰에 pushdown 될 수 있었던 이유는, 뒤에서 설명할 ‘조건절 이행’ 쿼리변환이 먼저 일어났기 때문이다. b.deptno = 30 조건이 조인 조건을 타고 a쪽에 전이됨으로써 아래와 같이 a.deptno = 30 조건절이 내부적으로 생성된 것이다. 이 상태에서 a.deptno = 30 조건절이 인라인 뷰 안쪽으로 Pushing 된 것이다.

select b.deptno, b.dname, a.avg_sal from (select deptno, avg(sal) avg_sal from emp group by deptno) a , dept b where a.deptno = b.deptno and b.deptno = 30 and a.deptno = 30

### Predicate Pullup

조건절을 쿼리 블록 안으로 밀어 넣을 뿐만 아니라 안쪽에 있는 조건들을 바깥 쪽으로 끄집어 내기도 하는데, 이를 ‘조건절(Predicate) Pullup’이라고 한다. 그리고 그것을 다시 다른 쿼리 블록에 Pushdown 하는 데 사용한다. 아래 실행계획을 보자.

select * from (select deptno, avg(sal) from emp where deptno = 10 group by deptno) e1 ,(select deptno, min(sal), max(sal) from emp group by deptno) e2 where e1.deptno = e2.deptno ------------------------------------------------------------ | Id | Operation | Name | Rows | Bytes | ------------------------------------------------------------ | 0 | SELECT STATEMENT | | 1 | 65 | |* 1 | HASH JOIN | | 1 | 65 | | 2 | VIEW | | 1 | 26 | | 3 | HASH GROUP BY | | 1 | 5 | | 4 | TABLE ACCESS BY INDEX ROWID | EMP | 5 | 25 | |* 5 | INDEX RANGE SCAN | EMP_DEPTNO_IDX | 5 | | | 6 | VIEW | | 1 | 39 | | 7 | HASH GROUP BY | | 1 | 5 | | 8 | TABLE ACCESS BY INDEX ROWID | EMP | 5 | 25 | |* 9 | INDEX RANGE SCAN | EMP_DEPTNO_IDX | 5 | | ------------------------------------------------------------ Predicate Information (identified by operation id): ------------------------------------------------------------ 1 - access("E1"."DEPTNO"="E2"."DEPTNO") 5 - access("DEPTNO"=10) 9 - access("DEPTNO"=10)
인라인 뷰 e2에는 deptno = 10 조건이 없지만 Predicate 정보를 보면 양쪽 모두 이 조건이 emp_deptno_idx 인덱스의 액세스 조건으로 사용된 것을 볼 수 있다. 아래와 같은 형태로 쿼리 변환이 일어난 것이다.

select * from (select deptno, avg(sal) from emp where deptno = 10 group by deptno) e1 ,(select deptno, min(sal), max(sal) from emp where deptno = 10 group by deptno) e2 where e1.deptno = e2.deptno
다. 조인 조건(Join Predicate) Pushdown

‘조인 조건(Join Predicate) Pushdown’은 말 그대로 조인 조건절을 뷰 쿼리 블록 안으로 밀어 넣는 것으로서, NL Join 수행 중에 드라이빙 테이블에서 읽은 조인 칼럼 값을 Inner 쪽(=right side) 뷰 쿼리 블록 내에서 참조할 수 있도록 하는 기능이다. 아래 실행계획에서 group by절을 포함한 뷰를 액세스하는 단계에서 ‘view pushed predicate’ 오퍼레이션(id=3)이 나타났다. 그 아래 쪽에 emp_deptno_idx 인덱스가 사용된 것을 볼 수 있는데, 이는 dept 테이블로부터 넘겨진 deptno에 대해서만 group by를 수행함을 의미한다.

select d.deptno, d.dname, e.avg_sal from dept d ,(select deptno, avg(sal) avg_sal from emp group by deptno) e where e.deptno(+) = d.deptno ----------------------------------------------------------- | Id | Operation | Name | Rows | Bytes | ----------------------------------------------------------- | 0 | SELECT STATEMENT | | 4 | 116 | | 1 | NESTED LOOPS OUTER | | 4 | 116 | | 2 | TABLE ACCESS FULL | DEPT | 4 | 64 | | 3 | VIEW PUSHED PREDICATE | | 1 | 13 | |* 4 | FILTER | | | | | 5 | SORT AGGREGATE | | 1 | 7 | | 6 | TABLE ACCESS BY INDEX ROWID | EMP | 5 | 35 | |* 7 | INDEX RANGE SCAN | EMP_DEPTNO_IDX | 5 | | ----------------------------------------------------------- Predicate Information (identified by operation id): ----------------------------------------------------------- 4 - filter(COUNT(*)>0) 7 - access("DEPTNO"="D"."DEPTNO")
이 기능은 부분범위처리가 필요한 상황에서 특히 유용한데, Oracle 11g에 이르러서야 구현되었다. 만약 위 SQL을 Oracle 10g 이하 버전에서 실행한다면, 조인 조건 Pushdown이 작동하지 않아 아래와 같이 emp 쪽 인덱스를 Full Scan하는 실행계획이 나타난다. dept 테이블에서 읽히는 deptno마다 emp 테이블 전체를 group by 하므로 성능상 불리한 것은 당연하다.

------------------------------------------------------------- | Id | Operation | Name | Rows | Bytes | ------------------------------------------------------------- | 0 | SELECT STATEMENT | | 4 | 148 | | 1 | NESTED LOOPS OUTER | | 4 | 148 | | 2 | TABLE ACCESS FULL | DEPT | 4 | 44 | |* 3 | VIEW | | 1 | 26 | | 4 | SORT GROUP BY | | 3 | 21 | | 5 | TABLE ACCESS BY INDEX ROWID | EMP | 14 | 98 | | 6 | INDEX FULL SCAN | EMP_DEPTNO_IDX | 14 | | ------------------------------------------------------------- Predicate Information (identified by operation id): --------------------------------------------------- 3 - filter("E"."DEPTNO"(+)="D"."DEPTNO")
위 쿼리는 다행히 집계함수가 하나뿐이므로 10g 이하 버전이더라도 아래 처럼 쉽게 스칼라 서브쿼리로 변환함으로써 부분범위 처리가 가능하도록 할 수 있다.

select d.deptno, d.dname ,(select avg(sal) from emp where deptno = d.deptno) from dept d
집계함수가 여러 개일 때가 문제인데, 만약 아래와 같이 쿼리하면 emp에서 같은 범위를 반복적으로 액세스하는 비효율이 생긴다.

select d.deptno, d.dname ,(select avg(sal) from emp where deptno = d.deptno) avg_sal ,(select min(sal) from emp where deptno = d.deptno) min_sal ,(select max(sal) from emp where deptno = d.deptno) max_sal from dept d
이럴 때는 아래 처럼 구하고자 하는 값들을 모두 결합하고서 바깥쪽 액세스 쿼리에서 substr 함수로 분리하는 방법이 유용할 수 있다.

select deptno, dname , to_number(substr(sal, 1, 7)) avg_sal , to_number(substr(sal, 8, 7)) min_sal , to_number(substr(sal, 15)) max_sal from ( select /*+ no_merge */ d.deptno, d.dname ,(select lpad(avg(sal), 7) || lpad(min(sal), 7) || max(sal) from emp where deptno = d.deptno) sal from dept d )

## 5. 조건절 이행
‘조건절 이행(Transitive Predicate Generation, Transitive Closure)’을 한마디로 요약하면, 「(A = B)이고 (B = C)이면 (A = C)이다」 라는 추론을 통해 새로운 조건절을 내부적으로 생성해 주는 쿼리변환이다. 「(A > B)이고 (B > C)이면 (A > C)이다」와 같은 추론도 가능하다. 예를 들어, A 테이블에 사용된 필터 조건이 조인 조건절을 타고 반대편 B 테이블에 대한 필터 조건으로 이행(移行)될 수 있다. 한 테이블 내에서도 두 칼럼간 관계정보(예를 들어, col1 >= col2)를 이용해 조건절이 이행된다.

select * from dept d, emp e where e.job = 'MANAGER' and e.deptno = 10 and d.deptno = e.deptno
위 쿼리에서 deptno = 10은 emp 테이블에 대한 필터 조건이다. 하지만 아래 실행계획에 나타나는 Predicate 정보를 확인해 보면, dept 테이블에도 같은 필터 조건이 추가된 것을 볼 수 있다.

------------------------------------------------------------- | Id | Operation | Name | Rows | Bytes | Cost (%CPU) | ------------------------------------------------------------- | 0 | SELECT STATEMENT | | 1 | 57 | 2 (0) | | 1 | NESTED LOOPS | | 1 | 57 | 2 (0) | | 2 | TABLE ACCESS BY INDEX ROWID | DEPT | 1 | 20 | 1 (0) | |* 3 | INDEX UNIQUE SCAN | DEPT_PK | 1 | | 0 (0) | | 4 | TABLE ACCESS BY INDEX ROWID | EMP | 1 | 37 | 1 (0) | |* 5 | INDEX RANGE SCAN | EMP_IDX | 1 | | 0 (0) | ------------------------------------------------------------- Predicate Information (identified by operation id): --------------------------------------------------- 3 - access("D"."DEPTNO"=10) 5 - access("E"."DEPTNO"=10 AND "E"."JOB"='MANAGER')
[e.deptno = 10]이고 [e.deptno = d.deptno]이므로 [d.deptno = 10]으로 추론되었고, 이런 조건절 이행(transitive)을 통해 쿼리가 아래와 같은 형태로 변환된 것이다.

select * from dept d, emp e where e.job = 'MANAGER' and e.deptno = 10 and d.deptno = 10
위와 같이 변환한다면, Hash Join 또는 Sort Merge Join을 수행하기 전에 emp와 dept 테이블에 각각 필터링을 적용함으로써 조인되는 데이터량을 줄일 수 있다. 그리고 dept 테이블 액세스를 위한 인덱스 사용을 추가로 고려할 수 있게 돼 더 나은 실행계획을 수립할 가능성이 커진다.

## 불필요한 조인 제거

1:M 관계인 두 테이블을 조인하는 쿼리문에서 조인문을 제외한 어디에서도 1쪽 테이블을 참조하지 않는다면, 쿼리 수행 시 1쪽 테이블은 읽지 않아도 된다. 결과집합에 영향을 미치지 않기 때문이다. 옵티마이저는 이 특성을 이용해 M쪽 테이블만 읽도록 쿼리를 변환하는데, 이를 ‘조인 제거(Join Elimination)’ 또는 ‘테이블 제거(Table Elimination)’라고 한다.

select e.empno, e.ename, e.deptno, e.sal, e.hiredate from dept d, emp e where d.deptno = e.deptno Rows Row Source Operation ---- --------------------------------------------------- 14 TABLE ACCESS FULL EMP (cr=8 pr=0 pw=0 time=58 us)
위 쿼리에서 조인 조건식을 제외하면 1쪽 집합인 dept에 대한 참조가 전혀 없다. 따라서 emp 테이블만 액세스한 것을 볼 수 있다. 이러한 쿼리 변환이 Oracle의 경우 10g부터 작동하기 시작했지만 SQL Server 등에서는 이미 오래 전부터 적용돼 온 기능이다. 조인 제거 기능이 작동하려면 아래와 같이 PK와 FK 제약이 설정돼 있어야만 한다. 이는 옵티마이저가 쿼리 변환을 수행하기 위한 지극히 당연한 조건이다. 만약 PK가 없으면 두 테이블 간 조인 카디널리티를 파악할 수 없고, FK가 없으면 조인에 실패하는 레코드가 존재할 수도 있어 옵티마이저가 함부로 쿼리 변환을 수행할 수가 없다.

SQL> alter table dept add 2 constraint deptno_pk primary key(deptno); SQL> alter table emp add 2 constraint fk_deptno foreign key(deptno) 3 references dept(deptno);
FK가 설정돼 있더라도 emp의 deptno 칼럼이 Null 허용 칼럼이면 결과가 틀리게 될 수 있다. 조인 칼럼 값이 Null인 레코드는 조인에 실패해야 정상인데, 옵티마이저가 조인문을 함부로 제거하면 그 레코드들이 결과집합에 포함되기 때문이다. 이런 오류를 방지하기 위해 옵티마이저가 내부적으로 e.deptno is not null 조건을 추가해 준다. Outer 조인일 때는 not null 제약이나 is not null 조건은 물론, FK 제약이 없어도 논리적으로 조인 제거가 가능하지만, Oracle 10g까지는 아래에서 보듯 조인 제거가 일어나지 않았다.

select e.empno, e.ename, e.sal, e.hiredate from emp e, dept d where d.deptno(+) = e.deptno -- Outer 조인 Rows Row Source Operation ---- --------------------------------------------------- 15 NESTED LOOPS OUTER (cr=10 pr=0 pw=0 time=119 us) 15 TABLE ACCESS FULL EMP (cr=8 pr=0 pw=0 time=255 us) 14 INDEX UNIQUE SCAN DEPT_PK (cr=2 pr=0 pw=0 time=265 us)(Object ID 58557)
11g에서는 아래와 같이 불필요한 Inner 쪽 테이블 제거 기능이 구현된 것을 볼 수 있다.

select e.empno, e.ename, e.sal, e.hiredate from emp e, dept d where d.deptno(+) = e.deptno -- Outer 조인 Rows Row Source Operation ---- --------------------------------------------------- 14 TABLE ACCESS FULL EMP (cr=8 pr=0 pw=0 time=0 us cost=3 size=770 card=14)
아래는 SQL Server에서 테스트한 것인데, 마찬가지로 Inner 쪽 테이블이 제거된 것을 볼 수 있다.

select e.empno, e.ename, e.sal, e.hiredate from dbo.emp e left outer join dbo.dept d on d.deptno = e.deptno 'Emp' 테이블. 스캔 수 1, 논리적 읽기 수 2, 물리적 읽기 수 0, 미리 읽기 수 0. SQL Server 실행 시간 : CPU 시간 = 0ms, 경과 시간 = 0ms. Rows Executes StmtText -- ----- -------------------------------------- 14 1 select e.empno, e.ename, e.sal, e.hiredate 14 1 |--Clustered Index Scan(OBJECT:([MyDB].[dbo].[Emp].[PK_Emp] AS [e]))
7. OR 조건을 Union으로 변환
아래 쿼리가 그대로 수행된다면 OR 조건이므로 Full Table Scan으로 처리될 것이다. (아니면, job 칼럼 인덱스와 deptno 칼럼 인덱스를 결합하고 비트맵 연산을 통해 테이블 액세스 대상을 필터링하는 Index Combine이 작동할 수도 있다.)

select * from emp where job = 'CLERK' or deptno = 20
만약 job과 deptno에 각각 생성된 인덱스를 사용하고 싶다면 아래와 같이 union all 형태로 바꿔주면 된다.

select * from emp where job = 'CLERK' union all select * from emp where deptno = 20 and LNNVL(job='CLERK')
사용자가 쿼리를 직접 바꿔주지 않아도 옵티마이저가 이런 작업을 대신해 주는 경우가 있는데, 이를 ‘OR-Expansion’이라고 한다. 아래는 OR-Expansion 쿼리 변환이 일어났을 때의 실행계획과 Predicate 정보다.

------------------------------------------------------------- | Id | Operation | Name | Rows | Bytes | ------------------------------------------------------------- | 0 | SELECT STATEMENT | | 7 | 224 | | 1 | CONCATENATION | | | | | 2 | TABLE ACCESS BY INDEX ROWID | EMP | 3 | 96 | |* 3 | INDEX RANGE SCAN | EMP_JOB_IDX | 3 | | |* 4 | TABLE ACCESS BY INDEX ROWID | EMP | 4 | 128 | |* 5 | INDEX RANGE SCAN | EMP_DEPTNO_IDX | 5 | | ------------------------------------------------------------- Predicate Information (identified by operation id): ------------------------------------------------------------- 3 - access("JOB"='CLERK') 4 - filter(LNNVL("JOB"='CLERK')) 5 - access("DEPTNO"=20)
job과 deptno 칼럼을 선두로 갖는 두 인덱스가 각각 사용되었고, union all 위쪽 브랜치는 job = ‘CLERK’인 집합을 읽고 아래쪽 브랜치는 deptno = 20인 집합만을 읽는다. 분기된 두 쿼리가 각각 다른 인덱스를 사용하긴 하지만, emp 테이블 액세스가 두 번 일어난다. 따라서 중복 액세스되는 영역(deptno=20이면서 job=‘CLERK’)의 데이터 비중이 작을수록 효과적이고, 그 반대의 경우라면 오히려 쿼리 수행 비용이 증가한다. OR-Expansion 쿼리 변환이 처음부터 비용기반으로 작동한 것도 이 때문이다. 중복 액세스되더라도 결과집합에는 중복이 없게 하려고 union all 아래쪽에 Oracle이 내부적으로 LNNVL 함수를 사용한 것을 확인하기 바란다. job < > ‘CLERK’ 이거나 job is null인 집합만을 읽으려는 것이며, 이 함수는 조건식이 false이거나 알 수 없는(Unknown) 값일 때 true를 리턴한다. Oracle에서 OR-Expansion을 제어하기 위해 사용하는 힌트로는 use_concat과 no_expand 두 가지가 있다. use_concat은 OR-Expansion을 유도하고자 할 때 사용하고, no_expand는 이 기능을 방지하고자 할 때 사용한다.

select /*+ USE_CONCAT */ * from emp where job = 'CLERK' or deptno = 20; select /*+ NO_EXPAND */ * from emp where job = 'CLERK' or deptno = 20;

## 기타 쿼리 변환
### 가. 집합 연산을 조인으로 변환

Intersect나 Minus 같은 집합(Set) 연산을 조인 형태로 변환하는 것을 말한다. 아래는 deptno = 10에 속한 사원들의 job, mgr을 제외시키고 나머지 job, mgr 집합만을 찾는 쿼리인데, 각각 Sort Unique 연산을 수행한 후에 Minus 연산을 수행하는 것을 볼 수 있다.

SQL> select job, mgr from emp 2 minus 3 select job, mgr from emp 4 where deptno = 10 ; ------------------------------------------------------------- | Id | Operation | Name | Rows | Bytes | Cost (%CPU) | Time | ------------------------------------------------------------- | 0 | SELECT STATEMENT | | 14 | 362 | 8 (63) | 00:00:01 | | 1 | MINUS | | | | | | | 2 | SORT UNIQUE | | 14 | 266 | 4 (25) | 00:00:01 | | 3 | TABLE ACCESS FULL | EMP | 14 | 266 | 3 (0) | 00:00:01 | | 4 | SORT UNIQUE | | 3 | 96 | 4 (25) | 00:00:01 | |* 5 | TABLE ACCESS FULL | EMP | 3 | 96 | 3 (0) | 00:00:01 | ------------------------------------------------------------- Predicate Information (identified by operation id): ------------------------------------------------------------- 5 - filter("DEPTNO"=10)
아래는 옵티마이저가 Minus 연산을 조인 형태로 변환했을 때의 실행계획이다.

------------------------------------------------------------- | Id | Operation | Name | Rows | Bytes | Cost (%CPU) | Time | ------------------------------------------------------------- | 0 | SELECT STATEMENT | | 13 | 663 | 8 (25) | 00:00:01 | | 1 | HASH UNIQUE | | 13 | 663 | 8 (25) | 00:00:01 | |* 2 | HASH JOIN ANTI | | 13 | 663 | 7 (15) | 00:00:01 | | 3 | TABLE ACCESS FULL | EMP | 14 | 266 | 3 (0) | 00:00:01 | |* 4 | TABLE ACCESS FULL | EMP | 3 | 96 | 3 (0) | 00:00:01 | ------------------------------------------------------------- Predicate Information (identified by operation id): ------------------------------------------------------------- 2 - access(SYS_OP_MAP_NONNULL("JOB")=SYS_OP_MAP_NONNULL("JOB") AND SYS_OP_MAP_NONNULL("MGR")=SYS_OP_MAP_NONNULL("MGR")) 4 - filter("DEPTNO"=10)
해시 Anti 조인을 수행하고 나서 중복 값을 제거하기 위한 Hash Unique 연산을 수행하는 것을 볼 수 있다. 아래와 같은 형태로 쿼리 변환이 일어난 것이다.

SQL> select distinct job, mgr from emp e 2 where not exists ( 3 select 'x' from emp 4 where deptno = 10 5 and sys_op_map_nonnull(job) = sys_op_map_nonnull(e.job) 6 and sys_op_map_nonnull(mgr) = sys_op_map_nonnull(e.mgr) 7 ) ;
Oracle의 sys_ p_map_nonnull 함수는 비공식적인 함수지만 가끔 유용하게 사용할 수 있다. null 값끼리 ‘=’ 비교(null = null)하면 false이지만 true가 되도록 처리해야 하는 경우가 있고, 그럴 때 이 함수를 사용하면 된다. 위에서는 job과 mgr이 null 허용 칼럼이기 때문에 위와 같은 처리가 일어났다.

### 나. 조인 칼럼에 IS NOT NULL 조건 추가

select count(e.empno), count(d.dname) from emp e, dept d where d.deptno = e.deptno and sal <= 2900
위와 같은 조인문을 처리할 때 조인 칼럼 deptno가 null인 데이터는 조인 액세스가 불필요하다. 어차피 조인에 실패하기 때문이다. 따라서 아래와 같이 필터 조건을 추가해 주면 불필요한 테이블 액세스 및 조인 시도를 줄일 수 있어 쿼리 성능 향상에 도움이 된다.

select count(e.empno), count(d.dname) from emp e, dept d where d.deptno = e.deptno and sal <= 2900 and e.deptno is not null and d.deptno is not null
is not null 조건을 사용자가 직접 기술하지 않더라도, 옵티마이저가 필요하다고 판단되면(Oracle의 경우, null 값 비중이 5% 이상일 때) 내부적으로 추가해 준다.

### 다. 필터 조건 추가

아래와 같이 바인드 변수로 between 검색하는 쿼리가 있다고 하자. 쿼리를 수행할 때 사용자가 :mx보다 :mn 변수에 더 큰 값을 입력한다면 쿼리 결과는 공집합이다.

select * from emp where sal between :mn and :mx
사전에 두 값을 비교해 알 수 있음에도 쿼리를 실제 수행하고서야 공집합을 출력한다면 매우 비합리적이다. 잦은 일은 아니겠지만 초대용량 테이블을 조회하면서 사용자가 값을 거꾸로 입력하는 경우를 상상해 보라. Oracle 9i부터 이를 방지하려고 옵티마이저가 임의로 필터 조건식을 추가해 준다. 아래 실행계획에서 1번 오퍼레이션 단계에 사용된 Filter Predicate 정보를 확인하기 바란다.

------------------------------------------------------ | Id | Operation | Name | Rows | Bytes | Cost | ------------------------------------------------------ | 0 | SELECT STATEMENT | | 1 | 32 | 2 | |* 1 | FILTER | | | | | |* 2 | TABLE ACCESS FULL | EMP | 1 | 32 | 2 | ------------------------------------------------------ Predicate Information (identified by operation id): ------------------------------------------------------ 1 - filter(TO_NUMBER(:MN)<=TO_NUMBER(:MX)) 2 - filter("EMP"."SAL">=TO_NUMBER(:MN) AND "EMP"."SAL"<=TO_NUMBER(:MX))
아래는 :mn에 5000, :mx에 100을 입력하고 실제 수행했을 때의 결과인데, 블록 I/O가 전혀 발생하지 않은 것을 볼 수 있다. 실행계획 상으로는 Table Full Scan을 수행하고 나서 필터 처리가 일어나는 것 같지만 실제로는 Table Full Scan 자체를 생략한 것이다.

Statistics ---------------------------------------------------------- 0 recursive calls 0 db block gets 0 consistent gets 0 physical reads .. .....

### 라. 조건절 비교 순서


위 데이터를 아래 SQL문으로 검색하면 B 칼럼에 대한 조건식을 먼저 평가하는 것이 유리하다. 왜냐하면, 대부분 레코드가 B = 1000 조건을 만족하지 않아 A 칼럼에 대한 비교 연산을 수행하지 않아도 되기 때문이다.

SELECT * FROM T WHERE A = 1 AND B = 1000 ;
반대로 A = 1 조건식을 먼저 평가한다면, A 칼럼이 대부분 1이어서 B 칼럼에 대한 비교 연산까지 그만큼 수행해야 하므로 CPU 사용량이 늘어날 것이다. 아래와 같은 조건절을 처리할 때도 부등호(>) 조건을 먼저 평가하느냐 like 조건을 먼저 평가하느냐에 따라 일량에 차이가 생긴다.

select /*+ full(도서) */ 도서번호, 도서명, 가격, 저자, 출판사, isbn from 도서 where 도서명 like '데이터베이스%' -- 사용자가 입력한 검색 키워드 and 도서명 > '데이터베이스성능고도화' -- 앞 페이지 화면에서 출력한 가장 마지막 도서명
DBMS 또는 버전에 따라 다르지만, 예전 옵티마이저는 where절에 기술된 순서 또는 반대 순서로 처리하는 내부 규칙을 따름으로써 비효율을 야기하곤 했다. 하지만 최신 옵티마이저는 비교 연산해야 할 일량을 고려해 선택도가 낮은 칼럼의 조건식부터 처리하도록 내부적으로 순서를 조정한다.