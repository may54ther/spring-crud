package io.ahakim.crud.service;

import io.ahakim.crud.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BoardService{
    private final BoardMapper boardMapper;
}
