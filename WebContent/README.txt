[ 기본 설정 ]

JRE 8
APACHE TOMCAT 9.0
DATABASE LITH
DATEBASE 값 insert 스크립트: 최상단 디렉토리의 DBscript.sql
localhost:8090/lith_harbor -> 로그인 페이지로 연결


[ 메인화면 설명]

우측 상단: 로그아웃 버튼
오늘의 팁: 새로고침 시 업데이트됨
오늘의 팁 옆의 몬스터 로고 클릭: 메이플 직업 추천 화면으로 연결
인기글: 조회수 순으로 정렬된 글 목록, 클릭시 게시판으로 이동
지금 바로 게임하러가기 클릭: 메이플 공식 페이지로 연결
I'm feeling lucky!: 추첨을 통해 랜덤하게 메소 지급, member 테이블 업데이트됨



[ 테이블 생성 ]

create table lith.member(
	id varchar(20) not null,
	pwd varchar(20) not null,
	nickname varchar(20) not null,
	level int default 1,
	meso int default 0,
	primary key(id)
)


create table lith.todaytip(
	tipnum int not null auto_increment,
	tip varchar(100) not null,
	primary key(tipnum)
)

create table lith.board(
	num int not null auto_increment,
	title varchar(30) not null,
	id varchar(20) not null references lith.member(id),
	content varchar(3000) not null,
	regdate timestamp default now(),
	hit int not null default 0,
	primary key(num)
);



[ URL 설계 ]

1. 로그인: signIn.jsp, loginVerify.jsp
2. 로그아웃: signOut.jsp
3. 메인화면: main.jsp
4. 메이플 직업 추천: jobRecomm.jsp
5. i'm feeling luck 클릭 시: mesoPlus.jsp
6. 글 쓰기폼 : writeform.jsp
7. 글 저장 : write.jsp, insert
8. 글 리스트 : list.jsp, select
9. 글 하나 읽기 : read.jsp, select
10. 글 수정 폼 : updateform.jsp, select
11. 글 수정 : update.jsp, update
12. 글 삭제 폼 : deleteform.jsp
13. 글 삭제 : delete.jsp, delete