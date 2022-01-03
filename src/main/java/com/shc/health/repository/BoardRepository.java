package com.shc.health.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shc.health.dto.BoardDTO;
import com.shc.health.dto.CategoryDTO;

@Repository
public class BoardRepository {
	
	@Autowired
	private SqlSessionTemplate sql;

	public List<BoardDTO> findAll() {
		return sql.selectList("Board.findAll");
	}

	public int save(BoardDTO board) {
		return sql.insert("Board.insert",board);
	}

	public List<BoardDTO> pagingList1(Map<String, Integer> pagingParam) {
		return sql.selectList("Board.pagingList1", pagingParam);
	}

	public int boardCount() {
		return sql.selectOne("Board.count");
	}

	public BoardDTO detail(long b_number) {
		sql.update("Board.hits",b_number);
		BoardDTO board =sql.selectOne("Board.detail",b_number);
		return board;
	}

	public int delete(long b_number) {
		return sql.delete("Board.delete", b_number);
	}

	public BoardDTO findById(long b_number) {
		return sql.selectOne("Board.detail",b_number);
	}

	public int update(BoardDTO board) {
		return sql.update("Board.update",board);
	}

	public List<BoardDTO> search(Map<String, String> searchParam) {
		return sql.selectList("Board.search", searchParam);
	}

	public void cateinsert(CategoryDTO cate) {
		sql.insert("cate.cateinsert", cate);
	}

	public List<BoardDTO> findCate(int cate_number) {
		return sql.selectList("Board.findCate", cate_number);
	}

	public CategoryDTO cate_name(int cate_number) {
		return sql.selectOne("cate.cate_name", cate_number);
	}


	public List<BoardDTO> catePagingList(Map<String, Integer> pagingParam) {
		return sql.selectList("Board.catePagingList", pagingParam);
	}

	public List<BoardDTO> catePagingList1(Map<String, Integer> pagingParam) {
		return sql.selectList("Board.catePagingList1", pagingParam);
	}
	
	public int cateBoardCount(int cate_number) {
		return sql.selectOne("Board.cateBoardCount",cate_number);
	}
	
}
