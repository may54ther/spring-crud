package io.ahakim.crud.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class Board {
    private Long boardNo;
    private String writer;
    private String title;
    private String content;
    private Integer views;
    private Long origin;
    private Long parent;
    private Integer depth;
    private Date createdAt;
    private String flag;
}