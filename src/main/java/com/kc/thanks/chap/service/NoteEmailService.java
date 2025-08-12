package com.kc.thanks.chap.service;

import com.kc.thanks.chap.dto.requestDTO.NoteEmailRequestDTO;
import com.kc.thanks.chap.dto.requestDTO.NoteWriteRequestDTO;
import com.kc.thanks.chap.entity.Note;
import com.kc.thanks.chap.entity.NoteEmail;
import com.kc.thanks.chap.mapper.NoteEmailMapper;
import com.kc.thanks.chap.mapper.NoteMapper;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class NoteEmailService {
    private final NoteEmailMapper mapper;

    public void saveNoteEmail(NoteEmailRequestDTO dto) {
        NoteEmail mail = dto.toEntity();
        mapper.saveNoteEmail(mail);
    }
}