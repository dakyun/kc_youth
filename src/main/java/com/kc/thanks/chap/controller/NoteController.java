package com.kc.thanks.chap.controller;

import com.kc.thanks.chap.dto.requestDTO.NoteWriteRequestDTO;
import com.kc.thanks.chap.service.NoteService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
public class NoteController {

    private static final String ADMIN_SECRET_PASSWORD = "1234";
    private final NoteService noteService;

    @GetMapping("/note")
    public String index(Model model, HttpSession session) {
        log.info("note page로 요청 들어옴!");
        return "chap/note";
    }

    @PostMapping("/note/apply")
    @ResponseBody
    public ResponseEntity<String> noteApply(@RequestBody NoteWriteRequestDTO dto, HttpSession session) {
        log.info("/note/apply으로 요청 들어옴! dto에 담긴 값 : " + dto);
        noteService.save(dto);
        return ResponseEntity.ok("신청 성공");
    }

    @GetMapping("/note/admin")
    public String noteAdmin(Model model, HttpSession session) {
        log.info("note admin로 요청 들어옴!");
        return "chap/noteAdminPassword";
    }

    @PostMapping("/note/admin")
    public String noteAdminVerifyPassword(@RequestParam("password") String password, Model model) {
        if (ADMIN_SECRET_PASSWORD.equals(password)) {
            return "chap/noteAdmin";
        }
        model.addAttribute("error", "패스워드가 맞지 않습니다.");
        return "chap/noteAdminPassword";
    }

    @PostMapping("/note/download/excel")
    public void downloadExcel(HttpServletResponse response) throws IOException {
        List<Map<String, Object>> data = noteService.getAllData(); // 데이터 조회
        noteService.generateExcel(response, data); // 엑셀 파일 생성
    }

}