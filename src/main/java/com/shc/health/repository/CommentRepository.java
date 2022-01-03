package com.shc.health.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shc.health.dto.CommentDTO;

@Repository
public class CommentRepository {

	@Autowired
	private SqlSessionTemplate sql;
	
	public void save(CommentDTO comment) {
		sql.insert("Comment.save",comment);
		
	}

	public List<CommentDTO> findAll(long b_number) {
		return sql.selectList("Comment.findAll",b_number);
	}

	public int delete(long c_number) {
		return sql.delete("Comment.delete",c_number);
	}

	public int update(CommentDTO comment) {
		return sql.update("Comment.update",comment);
	}

	public CommentDTO findById(long c_number) {
		return sql.selectOne("Comment.detail",c_number);
	}

}
