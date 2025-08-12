package com.kc.thanks.chap.entity;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoteEmail {
    private long note_seq;
    private String email;
    private String use_yn;
    private LocalDateTime reg_dt;
    private LocalDateTime chg_dt;
}