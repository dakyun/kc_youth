package com.kc.thanks.chap.dto.requestDTO;

import com.kc.thanks.chap.entity.Note;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
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
public class NoteWriteRequestDTO {

    private Long seq;
    @NotBlank
    private String name;
    @NotBlank
    private String contact;
    @NotNull
    @Positive
    private Integer cnt;
    @NotBlank
    private String type;
    @NotBlank
    private String addr;
    @NotBlank
    private String use_yn;
    @NotNull @Min(0)
    private Integer digital_cnt;
    @NotNull private
    LocalDateTime reg_dt;
    @NotNull private
    LocalDateTime chg_dt;

    private List<String> email;

    @Timestamp
    @Builder.Default
    private LocalDateTime localDateTime = LocalDateTime.now();

    public Note toEntity() {
        return Note.builder()
                .name(this.name)
                .contact(this.contact)
                .cnt(this.cnt)
                .type(this.type)
                .addr(this.addr)
                .digital_cnt(this.digital_cnt)
                .use_yn(this.use_yn)
                .reg_dt(this.localDateTime)
                .chg_dt(this.localDateTime)
                .build();
    }
}