create or replace database lith;

drop table lith.member;
drop table lith.todaytip;
drop table lith.board;

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

insert into lith.member(id,pwd,nickname, level, meso) values('test','test','test', 252, 100);
insert into lith.member(id,pwd,nickname, level, meso) values('test2','test2','리스', 201, 100);

insert into lith.todaytip(tip) values('이벤트 기간에는 모든 아이템을 50% 할인된 가격에 구매할 수 있습니다');
insert into lith.todaytip(tip) values('버닝 시즌을 활용하세요~~!');
insert into lith.todaytip(tip) values('현재 진행중인 이벤트: test');
insert into lith.todaytip(tip) values('오늘의 tip TEST1');
insert into lith.todaytip(tip) values('이벤트 기간에는 모든 아이템을 50% 할인된 가격에 구매할 수 있습니다2');
insert into lith.todaytip(tip) values('이벤트 기간에는 모든 아이템을 50% 할인된 가격에 구매할 수 있습니다3');
insert into lith.todaytip(tip) values('버닝 시즌을 활용하세요~~!4');
insert into lith.todaytip(tip) values('현재 진행중인 이벤트: test5');
insert into lith.todaytip(tip) values('오늘의 tip TEST16');
insert into lith.todaytip(tip) values('이벤트 기간에는 모든 아이템을 50% 할인된 가격에 구매할 수 있습니다27');
insert into lith.todaytip(tip) values('이벤트 기간에는 모든 아이템을 50% 할인된 가격에 구매할 수 있습니다8');
insert into lith.todaytip(tip) values('버닝 시즌을 활용하세요~~!9');
insert into lith.todaytip(tip) values('현재 진행중인 이벤트: test10');
insert into lith.todaytip(tip) values('오늘의 tip TEST111');
insert into lith.todaytip(tip) values('이벤트 기간에는 모든 아이템을 50% 할인된 가격에 구매할 수 있습니다212');
insert into lith.todaytip(tip) values('1이벤트 기간에는 모든 아이템을 50% 할인된 가격에 구매할 수 있습니다');
insert into lith.todaytip(tip) values('2버닝 시즌을 활용하세요~~!');
insert into lith.todaytip(tip) values('3현재 진행중인 이벤트: test');
insert into lith.todaytip(tip) values('4오늘의 tip TEST1');
insert into lith.todaytip(tip) values('5이벤트 기간에는 모든 아이템을 50% 할인된 가격에 구매할 수 있습니다2');
insert into lith.todaytip(tip) values('6이벤트 기간에는 모든 아이템을 50% 할인된 가격에 구매할 수 있습니다3');
insert into lith.todaytip(tip) values('7버닝 시즌을 활용하세요~~!4');
insert into lith.todaytip(tip) values('8현재 진행중인 이벤트: test5');
insert into lith.todaytip(tip) values('9오늘의 tip TEST16');
insert into lith.todaytip(tip) values('0이벤트 기간에는 모든 아이템을 50% 할인된 가격에 구매할 수 있습니다27');
insert into lith.todaytip(tip) values('11이벤트 기간에는 모든 아이템을 50% 할인된 가격에 구매할 수 있습니다8');
insert into lith.todaytip(tip) values('12버닝 시즌을 활용하세요~~!9');
insert into lith.todaytip(tip) values('13현재 진행중인 이벤트: test10');
insert into lith.todaytip(tip) values('14오늘의 tip TEST111');
insert into lith.todaytip(tip) values('15이벤트 기간에는 모든 아이템을 50% 할인된 가격에 구매할 수 있습니다212');


insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.','테스트내용','test');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');
insert into lith.board(title, content, id) values('테스트입니다.2','테스트내용2','test2');