# TAG: 회원
# - 회원가입: seq, id, pw, name, nickname, birth, email, createdAt, flag('U')
# - 회원탈퇴: deletedAt, flag('D')
#   - 탈퇴일 기준 한달 후 name, nickname, gender, birth, email 초기화: nickname, email 사용가능
#   - 단, 한번 가입했던 ID는 스케쥴링 이후에도 재사용 불가능!
CREATE TABLE web.USER
(
    seq       INT AUTO_INCREMENT UNIQUE NOT NULL COMMENT '고유번호',
    id        VARCHAR(20)               NOT NULL COMMENT '아이디',
    pw        VARCHAR(20)               NOT NULL COMMENT '비밀번호',
    name      VARCHAR(20)               NULL COMMENT '이름',
    nickname  VARCHAR(20) UNIQUE        NULL COMMENT '별명',
    gender    VARCHAR(1)                NULL CHECK (gender IN (NULL, 'F', 'M')) COMMENT '성별(기본값-NULL, 여-F, 남-M)',
    birth     DATE                      NULL COMMENT '생년월일',
    email     VARCHAR(50) UNIQUE        NULL COMMENT '이메일',
    createdAt DATETIME                  NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '가입일',
    deletedAt DATETIME                  NULL COMMENT '탈퇴일',
    flag      VARCHAR(2)                NOT NULL DEFAULT 'U' COMMENT '회원 상태, 회원-U/탈퇴-D',
    PRIMARY KEY (id)
);

# TAG: 게시판 카테고리
CREATE TABLE web.CATEGORY
(
    seq       INT AUTO_INCREMENT NOT NULL COMMENT '고유번호',
    name      VARCHAR(100)       NOT NULL COMMENT '게시판 이름',
    createdAt DATETIME           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일',
    flag      VARCHAR(1)         NOT NULL DEFAULT 'Y' COMMENT '사용여부(Y-사용/N-숨김)',
    PRIMARY KEY (seq)
);

# TAG: 게시글
CREATE TABLE web.BOARD
(
    seq       INT AUTO_INCREMENT NOT NULL COMMENT '고유번호',
    categoryNo       INT                NOT NULL COMMENT '카테고리 번호',
    writerId  VARCHAR(20)        NOT NULL COMMENT '작성자 아이디',
    writer    VARCHAR(20)        NOT NULL COMMENT '작성자 별명',
    title     VARCHAR(100)       NOT NULL COMMENT '게시글 제목',
    content   BLOB               NOT NULL COMMENT '게시글 내용',
    views     INT                NOT NULL DEFAULT 0 COMMENT '조회수',
    origin    INT                NOT NULL COMMENT '원본 게시글(원본이 없다면 현재 게시글)',
    parent    INT                NULL COMMENT '상위 게시글',
    depth     INT                NOT NULL DEFAULT 0 COMMENT '원본 게시글로부터의 깊이',
    createdAt DATETIME           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
    deletedAt DATETIME           NULL COMMENT '삭제일',
    flag      VARCHAR(1)         NOT NULL DEFAULT 'N' COMMENT '삭제여부(Y-삭제/N-기본값)',
    PRIMARY KEY (seq),
    FOREIGN KEY (categoryNo) REFERENCES CATEGORY (seq) ON DELETE CASCADE,
    FOREIGN KEY (writerId) REFERENCES USER (id) ON DELETE NO ACTION
);

# TAG: 게시판 첨부파일
CREATE TABLE web.FILE
(
    seq       INT AUTO_INCREMENT NOT NULL COMMENT '고유번호',
    boardNo       INT                NOT NULL COMMENT '게시글 번호',
    filename  VARCHAR(20)        NOT NULL COMMENT '파일 이름',
    ext       VARCHAR(20)        NOT NULL COMMENT '파일 확장자',
    size      VARCHAR(100)       NOT NULL COMMENT '파일 크기',
    createdAt DATETIME           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
    PRIMARY KEY (seq),
    FOREIGN KEY (boardNo) REFERENCES BOARD (seq) ON DELETE CASCADE
);

# TAG: 댓글
CREATE TABLE web.COMMENT
(
    seq       INT AUTO_INCREMENT NOT NULL COMMENT '고유번호',
    boardNo       INT                NOT NULL COMMENT '게시글 번호',
    writerId  VARCHAR(20)        NOT NULL COMMENT '작성자 아이디',
    writer    VARCHAR(20)        NOT NULL COMMENT '작성자 별명',
    content   VARCHAR(3000)      NOT NULL COMMENT '댓글 내용',
    origin    INT                NOT NULL COMMENT '원본 댓글(원본이 없다면 현재 댓글)',
    parent    INT                NULL COMMENT '상위 댓글',
    createdAt DATETIME           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
    deletedAt DATETIME           NULL COMMENT '삭제일',
    flag      VARCHAR(1)         NOT NULL DEFAULT 'N' COMMENT '삭제여부(Y-삭제/N-기본값)',
    PRIMARY KEY (seq),
    FOREIGN KEY (boardNo) REFERENCES BOARD (seq) ON DELETE CASCADE,
    FOREIGN KEY (writerId) REFERENCES USER (id) ON DELETE NO ACTION
);

# TAG: 서비스 로그
CREATE TABLE web.LOG_SERVICE
(
    seq    INT AUTO_INCREMENT NOT NULL COMMENT '고유번호',
    userId VARCHAR(20)        NULL COMMENT '회원 아이디',
    type   VARCHAR(50)        NULL COMMENT '유형(로그인, 회원수정, 회원탈퇴, 게시판.. 등)',
    text   VARCHAR(200)       NULL COMMENT '내용',
    ip     VARCHAR(20)        NULL COMMENT 'IP',
    date   DATETIME           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '발생시간',
    PRIMARY KEY (seq)
);

