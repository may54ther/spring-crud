# 게시판-V1
# TAG: 게시글
CREATE TABLE BOARD
(
    boardNo INT AUTO_INCREMENT NOT NULL COMMENT '고유번호',
    writer VARCHAR(20) NOT NULL COMMENT '작성자 별명',
    title VARCHAR(100) NOT NULL COMMENT '게시글 제목',
    content BLOB NOT NULL COMMENT '게시글 내용',
    views INT NOT NULL DEFAULT 0 COMMENT '조회수',
    origin INT NOT NULL COMMENT '원본 게시글(원본이 없다면 현재 게시글)',
    parent INT NULL COMMENT '상위 게시글',
    depth INT NOT NULL DEFAULT 0 COMMENT '원본 게시글로부터의 깊이',
    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
    flag VARCHAR(1) NOT NULL DEFAULT 'N' COMMENT '삭제여부(Y-삭제/N-기본값)',
    PRIMARY KEY (boardNo)
);
# TAG: 댓글
CREATE TABLE COMMENT
(
    commentNo INT AUTO_INCREMENT NOT NULL COMMENT '고유번호',
    boardNo INT NOT NULL COMMENT '게시글 번호',
    writer VARCHAR(20) NOT NULL COMMENT '작성자 별명',
    content VARCHAR(3000) NOT NULL COMMENT '댓글 내용',
    origin INT NOT NULL COMMENT '원본 댓글(원본이 없다면 현재 댓글)',
    parent INT NULL COMMENT '상위 댓글',
    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
    flag VARCHAR(1) NOT NULL DEFAULT 'N' COMMENT '삭제여부(Y-삭제/N-기본값)',
    PRIMARY KEY (commentNo),
    FOREIGN KEY (boardNo) REFERENCES BOARD (boardNo) ON DELETE CASCADE
);