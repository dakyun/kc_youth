package com.kc.thanks.chap.controller;

import com.kc.thanks.chap.common.Page;
import com.kc.thanks.chap.common.PageMaker;
import com.kc.thanks.chap.dto.responseDTO.ReplyListResponseDTO;
import com.kc.thanks.chap.service.ReplyService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/replies")
@Slf4j
public class ReplyController {

    private final ReplyService replyService;

    public ReplyController(ReplyService replyService) {
        this.replyService = replyService;
    }

    @GetMapping
    public ResponseEntity<?> getReplies(@ModelAttribute Page page) {
        log.info("Replies API 요청: pageNo={}", page.getPageNo());

        // reply list를 요청하는 로직
        List<ReplyListResponseDTO> replyList = replyService.findAll(page);

        // 전체 reply 갯수를 요청하는 로직
        int replyCount = replyService.countAll();

        // 페이지 버튼 만들기
        PageMaker pageMaker = new PageMaker(page, replyCount);

        // 응답 데이터 구성
        Map<String, Object> response = new HashMap<>();
        response.put("replyList", replyList);
        response.put("replyCount", replyCount);
        response.put("maker", pageMaker);

        return ResponseEntity.ok(response);
    }
}