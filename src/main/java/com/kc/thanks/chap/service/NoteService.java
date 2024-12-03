package com.kc.thanks.chap.service;

import com.kc.thanks.chap.dto.requestDTO.NoteWriteRequestDTO;
import com.kc.thanks.chap.entity.Note;
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
public class NoteService {
    private static final List<String> FIELD_ORDER = Arrays.asList("순번", "이름", "연락처", "개수", "수령방법", "주소", "신청시간");

    private final NoteMapper mapper;

    public void save(NoteWriteRequestDTO dto) {
        Note note = dto.toEntity();
        mapper.saveNote(note);
    }

    public List<Map<String, Object>> getAllData() {
        return mapper.getAllData();
    }

    public void generateExcel(HttpServletResponse response, List<Map<String, Object>> data) throws IOException {
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Data");

        // 헤더 스타일 정의
        CellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setFillForegroundColor(IndexedColors.YELLOW.getIndex()); // 배경색: 노란색
        headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

        Font headerFont = workbook.createFont();
        headerFont.setBold(true); // 폰트 굵게
        headerStyle.setFont(headerFont);

        // 헤더 작성
        Row headerRow = sheet.createRow(0);
        for (int i = 0; i < FIELD_ORDER.size(); i++) {
            String fieldName = FIELD_ORDER.get(i);
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(fieldName);
            cell.setCellStyle(headerStyle); // 스타일 적용
        }

        // 데이터 작성
        int rowIndex = 1;
        for (Map<String, Object> row : data) {
            Row dataRow = sheet.createRow(rowIndex++);
            for (int i = 0; i < FIELD_ORDER.size(); i++) {
                String fieldName = FIELD_ORDER.get(i);
                Cell cell = dataRow.createCell(i);
                Object value = row.get(fieldName);
                cell.setCellValue(value != null ? value.toString() : "");
            }
        }

        // 열 너비 자동 조정
        for (int i = 0; i < FIELD_ORDER.size(); i++) {
            sheet.autoSizeColumn(i);
        }

        // 엑셀 파일 응답
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment;filename=note_data.xlsx");
        workbook.write(response.getOutputStream());
        workbook.close();
    }

}