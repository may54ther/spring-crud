package io.ahakim.crud.controller;

import io.ahakim.crud.domain.Board;
import io.ahakim.crud.service.BoardService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class BoardControllerTest {

    private final BoardService boardService;
    Board board = new Board();

    @Autowired
    BoardControllerTest(BoardService boardService) {
        this.boardService = boardService;
    }

    @Test
    void total() throws Exception {
        boardService.total();
    }

    @Test
    void getPostList() throws Exception {
        List<Board> boardList = boardService.getPostList(1, 10);
    }

    @Test
    void getPost() throws Exception {
        Board board = boardService.getPost(4);
    }

    @Test
    void addPost() throws Exception {
        boardService.addPost(board);
    }

    @Test
    void editPost() throws Exception {

        Board editBoard = new Board();
        editBoard.setBoardNo(9L);
        editBoard.setTitle("수정-제목9");
        editBoard.setContent("수정-내용9");

        boardService.editPost(editBoard);
    }

    @Test
    void removePost() throws Exception {
        boardService.removePost(1);
    }
}