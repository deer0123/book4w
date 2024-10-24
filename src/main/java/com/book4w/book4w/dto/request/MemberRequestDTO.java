package com.book4w.book4w.dto.request;

import com.book4w.book4w.entity.Member;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class MemberRequestDTO {
    private String email;
    private String password;
    private String nickname;

    public Member toEntity() {
        return Member.builder()
                .email(email)
                .password(password)
                .nickname(nickname)
                .build();
    }
}
