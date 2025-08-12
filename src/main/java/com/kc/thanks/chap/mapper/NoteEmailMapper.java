package com.kc.thanks.chap.mapper;

import com.kc.thanks.chap.entity.Note;
import com.kc.thanks.chap.entity.NoteEmail;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoteEmailMapper {
    void saveNoteEmail(NoteEmail email);
}