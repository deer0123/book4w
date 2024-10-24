package com.book4w.book4w.service;

import com.book4w.book4w.dto.request.MemberRequestDTO;
import com.book4w.book4w.entity.Member;
import com.book4w.book4w.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberRepository memberRepository;

    public void save(MemberRequestDTO dto) {

        Member member = dto.toEntity();
        memberRepository.save(member);
    }

    public Member findByEmail(String email) {
        return memberRepository.findByEmail(email);
    }

    public void updateMemberSessionId(Member member) {
        memberRepository.save(member);
    }

    public Member findBySessionId(String id) {
        return memberRepository.findBySessionId(id);
    }
}