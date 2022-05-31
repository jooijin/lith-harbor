[ 테이블 생성 ]
create table board(
  num int not null auto_increment,
  title varchar(100) not null,
  name varchar(20) not null,
  pwd varchar(20) not null,
  content varchar(3000) not null,
  regdate timestamp default now(),
  hit int not null default 0,
  primary key(num)
);

[ URL 설계 ]
1. 글 쓰기폼 : writeform.jsp
2. 글 저장 : write.jsp, insert
3. 글 리스트 : list.jsp, select
4. 글 하나 읽기 : read.jsp, select
5. 글 수정 폼 : updateform.jsp, select
6. 글 수정 : update.jsp, update
7. 글 삭제 폼 : deleteform.jsp
8. 글 삭제 : delete.jsp, delete

[ 프로젝트 내보내기 ]
프로젝트 > 우클릭 > Export > Export...
 > General > Archive File > Browse... > ~.zip > Finish
 
 [ 프로젝트 삭제 ]
프로젝트 > 우클릭 > Delete > v Delete project contents on disk(cannot be undone)
> OK

[ 프로젝트 가져오기 ]
File > Import > General > Existing Projects into Workspace
> [Next] > Select archive File > Browse... > ~.zip
> Finish
