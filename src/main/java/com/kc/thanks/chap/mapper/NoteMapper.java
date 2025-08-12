package com.kc.thanks.chap.mapper;

import com.kc.thanks.chap.entity.Note;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface NoteMapper {
    int saveNote(Note note);

    List<Map<String, Object>> getAllData();
}