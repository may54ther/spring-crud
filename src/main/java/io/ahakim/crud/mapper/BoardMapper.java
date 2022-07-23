package io.ahakim.crud.mapper;

import io.ahakim.crud.domain.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<Board> list(Integer current, Integer amount);

}

