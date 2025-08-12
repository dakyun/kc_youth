package com.kc.thanks.chap.dto.requestDTO;

import com.kc.thanks.chap.entity.Note;
import com.kc.thanks.chap.entity.NoteEmail;
import jakarta.validation.constraints.NotBlank;
import jdk.jfr.Timestamp;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoteEmailRequestDTO {

    @NotBlank
    private long note_seq;

    @NotBlank
    private String email;

    @NotBlank
    private String use_yn;

    @NotBlank
    private LocalDateTime reg_dt;

    @NotBlank
    private LocalDateTime chg_dt;

    @Timestamp
    @Builder.Default
    private LocalDateTime localDateTime = LocalDateTime.now();

    public NoteEmailRequestDTO(long noteSeq, String email, String y, LocalDateTime now, LocalDateTime now1) {
        this.note_seq = noteSeq;
        this.email = email;
        this.use_yn = y;
        this.reg_dt = now;
        this.chg_dt = now1;
    }

    public NoteEmail toEntity() {
        return NoteEmail.builder()
                .note_seq(this.note_seq)
                .email(this.email)
                .use_yn(this.use_yn)
                .reg_dt(this.reg_dt)
                .chg_dt(this.chg_dt)
                .build();
    }
}