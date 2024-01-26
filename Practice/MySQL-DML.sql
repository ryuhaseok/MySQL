create table author(
	author_id  int auto_increment primary key,
    author_name varchar(100),
    author_desc varchar(500)
)
;

drop table author;

insert into author
values(null, '김문열', '경북 영양');

insert into author
values(null, '박경리', '경상남도 통영');

insert into author
values(null, '유시민', '17대 국회의원');

insert into author
values(null, '기안84', '기안동에서 산 84년생');

insert into author
values(null, '강풀', '온라인 만화가 1세대');

insert into author
values(null, '김영하', '알쓸신잡');


select *
from author;

create table book(
	book_id int auto_increment primary key,
    title varchar(100),
    pubs varchar(100),
    pub_date datetime,
    author_id int,
    constraint book_fk foreign key (author_id)
    references author(author_id)
);

insert into book
values(null, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);

insert into book
values(null, '삼국지', '민음사', '2002-03-01', 1);

insert into book
values(null, '토지', '마로니에북스', '2012-08-15', 2);

insert into book
values(null, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);

insert into book
values(null, '패션왕', '중앙북스(books)', '2012-02-22', 4);

insert into book
values(null, '순정만화', '재미주의', '2011-08-03', 5);

insert into book
values(null, '오직두사람', '문학동네', '2017-05-04', 6);

insert into book
values(null, '26년', '재미주의', '2012-02-04', 5);

select * 
from book;

select  b.book_id,
		b.title,
        b.pubs,
        b.pub_date,
        b.author_id,
        a.author_name,
        a.author_desc
from book b
inner join author a on b.author_id = a.author_id
;

update author
set author_desc = '서울특별시'
where author_id = 5;

delete from author
where author_id = 4;
-- 기안84 데이터가 book테이블에서 사용 중이기 때문에 author 테이블에서 삭제할 수 없음
-- 삭제하려면 book테이블에서 기안84데이터를 사용하는 데이터를 삭제한 후 삭제 가능

delete from book
where book_id = 5;

delete from author
where author_id = 4;