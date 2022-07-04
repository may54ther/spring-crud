package io.ahakim.crud.domain;

import lombok.Data;

import java.util.Date;

@Data
public class UserVO {
    private Long seq;
    private String id;
    private String pw;
    private String name;
    private String nickname;
    private String gender;
    private Date birth;
    private String email;
    private Date createdAt;
    private Date deletedAt;
    private Date flag;
}