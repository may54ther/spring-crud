package io.ahakim.crud.mapper;

import io.ahakim.crud.domain.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {

    int total();
    List<Board> selectAll(Integer current, Integer amount);
    Board select(int boardNo);
    void insert(Board board);
    void update(Board board);
    void delete(int boardNo);
}

