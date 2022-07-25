package io.ahakim.crud.controller;

import io.ahakim.crud.domain.Board;
import io.ahakim.crud.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;

    @GetMapping({"/list/", "/list/{current}"})
    @ResponseBody
    public List<Board> getList(@PathVariable(value = "current") Integer current,
                               @RequestParam(value = "amount", required = false, defaultValue = "10") Integer amount) {
        log.info("current={}", current);
        log.info("amount={}", amount);

        return boardService.getPostList(current, amount);
    }
}