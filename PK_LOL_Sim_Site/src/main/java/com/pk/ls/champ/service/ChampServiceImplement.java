 package com.pk.ls.champ.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pk.ls.champ.controller.ChampController;
import com.pk.ls.champ.dao.ChampDao;
import com.pk.ls.champ.vo.ChampVo;
import com.pk.ls.util.FileUtils;

import sun.util.logging.resources.logging;

@Service
public class ChampServiceImplement implements ChampService{

	private static final Logger log = LoggerFactory.getLogger(ChampServiceImplement.class);
	
	@Autowired
	public ChampDao champDao;
	
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	// 챔피언 포지션 별로 보는 거
	@Transactional
	@Override
	public  Map<String, Object> champList(String position, int start, int end) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<ChampVo> champList = champDao.champList(position, start, end);
		
		Map<String, Object> fileMap = new HashMap<String,Object>();
		
		for (int i = 0; i < champList.size(); i++) {
			String STORED_FILE_NAME = "";
			
			fileMap = champDao.fileSelectStoredFileName(champList.get(i).getChampionNumber());
			STORED_FILE_NAME = (String) fileMap.get("STORED_FILE_NAME");
			
			champList.get(i).setSTORED_FILE_NAME(STORED_FILE_NAME);
		}
		
		resultMap.put("champList", champList);
		resultMap.put("fileList", fileMap);
		
		return resultMap;
	}
	
	// 챔피언 리스트 페이징할 때 총 챔피언의 수를 구한다
	@Override
	public int champPositionTotalCount(String position) {

		return champDao.champPositionTotalCount(position);
	}
	
	// 챔피언 하나 상세 보기
	@Override
	public Map<String, Object> champSelectOne(int championNumber) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();

		ChampVo champVo = (ChampVo) champDao.champSelectOne(championNumber);
		resultMap.put("champVo", champVo);

		Map<String, Object> fileName = champDao.fileSelectStoredFileName(championNumber);
		resultMap.put("fileName", fileName);

		return resultMap;
	}
	
	// 챔피언 등록
	@Transactional
	@Override
	public void champCreate(ChampVo champVo, MultipartHttpServletRequest 
			multipartHttpServletRequest) throws Exception{
		
		champDao.champCreate(champVo);
		
		int championNumber = champVo.getChampionNumber();
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo
				(championNumber, multipartHttpServletRequest);
		
		for (int i = 0; i < list.size(); i++) {
			champDao.insertFile(list.get(i));
		}
	}
	
	// 챔피언 정보 업데이트
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int champUpdateOne(ChampVo champVo, MultipartHttpServletRequest 
			multipartHttpServletRequest) 
			throws Exception {
		int resultNum = 0;
		
		log.debug("왔노라");
		
		try {
			resultNum = champDao.champUpdateOne(champVo);

			int championNumber = champVo.getChampionNumber();
			
			List<Map<String, Object>> list = 
					fileUtils.parseInsertFileInfo(championNumber, multipartHttpServletRequest);
			
			List<Map<String, Object>> tempFileMap = 
					champDao.fileSelectList(championNumber);
			
			// 오로지 하나만 관리
			if (list.isEmpty() == false) {
				
				String newOriginalFileName = (String) list.get(0).get("original_file_name");
				long newFileSize = (long) list.get(0).get("file_size");
				
				String fileSizeStr = String.valueOf(tempFileMap.get(0).get("FILE_SIZE"));
				long fileSize = Long.parseLong(fileSizeStr);
				String originalFileName = (String) tempFileMap.get(0).get("ORIGINAL_FILE_NAME");
				
				if(fileSize != newFileSize || !originalFileName.equals(newOriginalFileName)) {
					
					fileUtils.parseUpdateFileInfo(tempFileMap.get(0));
					champDao.fileDelete(championNumber);
					
					Map<String, Object> map = list.get(0);
					
					champDao.insertFile(map);
				} else {
					
				}	
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
			
		return resultNum;
	}

	// 챔피언 삭제
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int champDelete(int championNumber) throws Exception {
		// 저장된 파일 이름을 추출할 준비
		Map<String, Object> tempFileMap = null;
		// 저장된 파일 이름을 추출해서 담는다
		tempFileMap = champDao.fileSelectStoredFileName(championNumber);
		
		int result = 0;
		
		// 저장된 이름이 null이 아니라면
		if(tempFileMap != null) {
			// DB의 챔피언 이미지 파일을 삭제
			 result = champDao.fileDelete(championNumber);	
		}
		// 위의 if문을 수행한 결과값이 0이 아니라면 (즉, 성공적으로 DB에서 이미지 파일을 삭제했다면)
		if(result != 0) {
			// 저장된 이미지를 지운다
			fileUtils.parseUpdateFileInfo(tempFileMap);
		}
		
		return champDao.champDelete(championNumber);
	}
	// 이미지만 가져오기
	@Override
	public List<Map<String, Object>> imageSelect(int championNumber) {
		
		return champDao.fileSelectList(championNumber);
	}
}
