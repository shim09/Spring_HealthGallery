package com.shc.health.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shc.health.dto.MemberDTO;


@Repository
public class MemberRepository {
	@Autowired
	private SqlSessionTemplate sql;

	public int insert (MemberDTO member) {
		return sql.insert("Member.insert", member);
	}

	public MemberDTO login(MemberDTO check) {
		return sql.selectOne("Member.login", check);
	}

	public String idDuplicate(String m_id) {
		return sql.selectOne("Member.idDuplicate",m_id);
	}

	public MemberDTO mypage(long m_number) {
		return sql.selectOne("Member.mypage", m_number);
	}

	public List<MemberDTO> findAll() {
		return sql.selectList("Member.findAll");
	}

	public void delete(long m_number) {
		sql.delete("Member.delete",m_number);
	}

	public MemberDTO findById(long m_number) {
		return sql.selectOne("Member.findById", m_number);
	}

	public int updateFile(MemberDTO member) {
		return sql.update("Member.updateFile", member);
	}
	public int update(MemberDTO member) {
		return sql.update("Member.update", member);
	}
}
