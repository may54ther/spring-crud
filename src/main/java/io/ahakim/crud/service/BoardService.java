package io.ahakim.crud.service;

import io.ahakim.crud.domain.Board;
import io.ahakim.crud.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardService {
    private final BoardMapper boardMapper;

    public List<Board> list(Integer current, Integer amount) {
        return boardMapper.list(current, amount);
    }
}