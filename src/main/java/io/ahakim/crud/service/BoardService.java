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

    public int total() {
        return boardMapper.total();
    }

    public List<Board> getPostList(Integer current, Integer amount) {
        return boardMapper.selectAll(current, amount);
    }

    public Board getPost(int boardNo) {
        return boardMapper.select(boardNo);
    }

    public void addPost(Board board) {
        boardMapper.insert(board);
    }

    public void editPost(Board board) {
        boardMapper.update(board);
    }

    public void removePost(int boardNo) {
        boardMapper.delete(boardNo);
    }
}