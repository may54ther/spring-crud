package io.ahakim.crud.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class Comment {
    private Long seq;
    private Long bNo;
    private String writer;
    private String content;
    private Long origin;
    private Long parent;
    private Date createdAt;
    private String flag;
}
