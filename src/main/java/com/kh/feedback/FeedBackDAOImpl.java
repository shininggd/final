package com.kh.feedback;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.board.BoardDAO;
import com.kh.board.BoardDTO;
import com.kh.study.StudyDTO;
import com.kh.util.ListInfo;

@Repository
public class FeedBackDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "FeedBackMapper.";
	
	
	
	@Override
	public BoardDTO view(int num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"view", num);
	}

	@Override
	public int write(BoardDTO boardDTO) throws Exception {

		return sqlSession.insert(NAMESPACE+"write",(FeedBackDTO)boardDTO);
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"update",(FeedBackDTO)boardDTO);
	}

	@Override
	public int delete(int num) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"delete", num);
	}

	@Override
	public int count(ListInfo listInfo) throws Exception {
		String find =  listInfo.getFind();
		String search = listInfo.getSearch();
		String [] far = find.split(",");
		String [] sar = search.split(",");	
		HashMap<String, Object> map = new HashMap<String, Object>();
		for(int i = 0 ; i < sar.length ; i ++){
			map.put("search"+i, sar[i]);
		}
		for(int i = 0 ; i < far.length ; i ++){
			map.put("find"+i, far[i]);
			;
		}
		
		int num = sqlSession.selectOne(NAMESPACE+"count", map);
		return num;
	}

	@Override
	public List<BoardDTO> list(ListInfo listInfo) throws Exception {
		String find =  listInfo.getFind();
		String search = listInfo.getSearch();
		String [] far = find.split(",");
		String [] sar = search.split(",");	
		HashMap<String, Object> map = new HashMap<String, Object>();
		for(int i = 0 ; i < sar.length ; i ++){
			map.put("search"+i, sar[i]);
		}
		for(int i = 0 ; i < far.length ; i ++){
			map.put("find"+i, far[i]);
			;
		}

		map.put("startRow",listInfo.getStartRow());
		map.put("lastRow",listInfo.getLastRow());
		List<BoardDTO> ar = sqlSession.selectList(NAMESPACE+"list", map);
		
			
		return ar;
	}
	public int reply(BoardDTO boardDTO) throws Exception{
		
		return sqlSession.insert(NAMESPACE+"reply", (FeedBackDTO)boardDTO);
	}
	public int replyUpdate(BoardDTO boardDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"replyUpdate", (FeedBackDTO)boardDTO);
	}
	public HashMap<Object, Object> studyPage(int num){
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		StudyDTO studyDTO = sqlSession.selectOne("StudyMapper.studyView", num);
		map.put("dto", studyDTO);
		map.put("fname", sqlSession.selectOne("TutorMapper.tutorImage",studyDTO.getTid()));
		return  map;
		
	}
	public int feedback_upload(FeedBack_UploadDTO feedBack_UploadDTO){
	
		return sqlSession.insert(NAMESPACE+"feedback_upload", feedBack_UploadDTO);
	}
	public int feedback_upload_update(FeedBack_UploadDTO feedBack_UploadDTO){
		
		return sqlSession.insert(NAMESPACE+"feedback_upload_update", feedBack_UploadDTO);
	}
	public int feedback_max(){
		
		return (Integer)sqlSession.selectOne(NAMESPACE+"max_num");
	}
	public FeedBack_UploadDTO checkUpload(int num){
		return sqlSession.selectOne(NAMESPACE+"checkUpload", num);
	}

}
