create table members(
    id int PRIMARY KEY AUTO_INCREMENT,
    username varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    nickname varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

create table posts(
      id int PRIMARY KEY AUTO_INCREMENT,
      user_id int NOT NULL,
      title varchar(255) NOT NULL,
      body varchar(500) NOT NULL,
      create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      view_count int,
      category varchar(50),
      files BLOB
);

create table comments(
     id int PRIMARY KEY AUTO_INCREMENT,
     user_id int NOT NULL,
     post_id int NOT NULL,
     content varchar(500) NOT NULL,
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

insert into members (username, password, nickname, email)
VALUES ("admin", "adminpass", "관리자", "admin@board.com"),
       ("nomal", "nomalpass", "유저", "nomal@board.com"),
       ("crazy", "crazypass", "분탕", "crazy@board.com");


insert into posts (user_id, title, body, category, files, view_count)
values (1, "공지사항", "광고 행위는 금지입니다", "공지", null, 0),
       (2, "오늘 급식평가", "그냥 GOAT", "자유", null, 0),
       (3, "사과티비 무료...", "지금 접속...", "자유", null, 0);


insert into comments(user_id, post_id, content)
values (2, 1, "넵!"),
       (1, 3, "경고입니다.");


