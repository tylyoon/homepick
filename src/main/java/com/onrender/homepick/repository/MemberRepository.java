package com.onrender.homepick.repository;


import com.onrender.homepick.dto.MemberJoinDto;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository{

    private final JdbcTemplate jdbcTemplate;

    public MemberRepository(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    // 회원 저장 (비밀번호는 암호화된 상태로 입력됨)
    public void save(MemberJoinDto dto){
        String sql = "INSERT INTO member (username, password, name, email, role) VALUES (?, ?, ?, ?, 'ROLE_USER')";
        jdbcTemplate.update(sql, dto.getUsername(), dto.getPassword(), dto.getName(), dto.getEmail());
    }

    // 아이디 중복 확인
    public boolean existsByUsername(String username){
        String sql = "SELECT COUNT(*) FROM member WHERE username = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, username);
        return count != null && count > 0;
    }
}