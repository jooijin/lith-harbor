1. 로그인 페이지: 아이디/비밀번호 찾기 -> 본인인증 jsp signIn.jsp/loginCert.jsp
3. 회원가입 페이지 signUp.jsp
4. 로그인 후 메인화면 main.jsp (오늘의 메이플 지식/메이플 직업추천/자유게시판/메이플마켓/i'm feeling lucky/공식 유튜브 링크/공지사항/계산기)
5. 메이플 직업 추천 recommend.jsp
6. 자유게시판 board.jsp
7. 글쓰기 write.jsp
8. 수정 update.jsp
9. 삭제 delete.jsp
10. 메이플 마켓 market.jsp
11. lucky.jsp
12. caculator.jsp


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