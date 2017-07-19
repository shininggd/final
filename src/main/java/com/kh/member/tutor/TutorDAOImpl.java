package com.kh.member.tutor;


import java.util.List;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.member.MemberDAO;
import com.kh.member.MemberDTO;
import com.kh.util.ListInfo;

@Repository
public class TutorDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "TutorMapper.";

	@Override
	public int memberJoin(MemberDTO memberDTO) throws Exception {
		int result = sqlSession.insert(NAMESPACE+"memberJoin", memberDTO);
		int result2 = sqlSession.insert( NAMESPACE+"tutorJoin", memberDTO);	
		return result+result2;
	}
	@Override
	public int memberUpdate(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public MemberDTO memberLogin(MemberDTO memberDTO, HttpSession session) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"tutorLogin", memberDTO);
	}
	@Override
	public String IdFind(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String PwFind(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String memberIdCheck(String id) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"IdCheck", id);
	}
	
	public List<TutorDTO> tutorinfo(ListInfo listInfo) throws Exception {
		 return  sqlSession.selectList(NAMESPACE+"tutorInfo", listInfo);
	}

	public int LRupdate(TutorDTO tutorDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"adminTupdate", tutorDTO);
	}
	
	public int Tcount(ListInfo listInfo){
		int count = sqlSession.selectOne(NAMESPACE+"tcount");
		return count;
	}
}
