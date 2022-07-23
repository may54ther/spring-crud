package io.ahakim.crud.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 기능
 * - 페이징 블록 생성(페이징 시작번호, 표시 수)
 * - 첫 페이지로 이동
 * - 이전 페이지로 이동
 * - 다음 페이지로 이동
 */
@Getter
@Setter
@ToString
public class Criteria {
    private int current;
    private int amount;

    public Criteria() {
        this(1, 10);
    }

    public Criteria(int current, int amount) {
        this.current = current;
        this.amount = amount;
    }

//    public int getStartPageNum(){
//        return this.current;
//    }
}
