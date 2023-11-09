package com.onestop.core.bbs.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.web.servlet.ModelAndView;

import com.onestop.core.bbs.dao.BbsDao;

import com.onestop.core.bbs.service.BbsService;
import com.onestop.core.file.service.FilesService;

import com.onestop.core.util.IUtility;
import com.onestop.core.util.service.CommonServiceImpl;



/**
 * <pre>
 * Class Name: BbsServiceImpl.java
 * Description: 게시판 service클래스
 * </pre>
 * 
 * @author 김우영
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Service("bbsService")
public class BbsServiceImpl extends CommonServiceImpl implements BbsService {

	@Resource(name = "bbsDao")
	private BbsDao bbsDao;

	@Autowired
	private FilesService filesService;

	public Map<String, Object> selectBbsMgrInfo(Map<String, Object> map) throws Exception {
		return bbsDao.selectBbsMgrInfo(map);
	}
	
	public List<Map<String, Object>> selectBbsDataList(Map<String, Object> map) throws Exception {
		return bbsDao.selectBbsDataList(map);
	}

	public List<Map<String, Object>> selectBbsAuthInfo(Map<String, Object> map) throws Exception {
		return bbsDao.selectBbsAuthInfo(map);
	}

	public void updateBbsTimesno(Map<String, Object> map) throws Exception {
		bbsDao.updateBbsTimesno(map);
	}

	public Map<String, Object> saveBbsInfo(Map<String, Object> map) throws Exception {
		String mode = IUtility.parseNull(map.get("mode"));
		String modeStr = "";
		modeStr = "";

		if (mode.equals("WRITE_PROC") || mode.equals("ANSWER_PROC") ) {
			modeStr = "저장";
			map.put("mode", "C");
		} else if (mode.equals("MODIFY_PROC")) {
			modeStr = "수정";
			map.put("mode", "U");
		} else if (mode.equals("DEL_PROC")) {
			modeStr = "삭제";
			map.put("mode", "D");
		}
		Map<String,Object> resultMap = bbsDao.saveBbsInfo(map);
		
		map.put("NEW_BBS_POSTING_SEQ_NO", resultMap.getOrDefault("NEW_BBS_POSTING_SEQ_NO", ""));
		map.put("msg", "정상적으로 " + modeStr + " 되었습니다.");
		return map;
	}

	public Map<String, Object> saveBbsReplyInfo(Map<String, Object> map) throws Exception {
		String mode = IUtility.parseNull(map.get("mode"));
		String modeStr = "";
		modeStr = "";

		if (mode.equals("WRITE_PROC")) {
			modeStr = "저장";
			map.put("mode", "C");
		} else if (mode.equals("MODIFY_PROC")) {
			modeStr = "수정";
			map.put("mode", "U");
		} else if (mode.equals("DEL_PROC")) {
			modeStr = "삭제";
			map.put("mode", "D");
		}
		bbsDao.saveBbsReplyInfo(map);

		map.put("msg", "정상적으로 " + modeStr + " 되었습니다.");
		return map;
	}
	
	@Override
    public Map<String, Object> selectBbsPassword(Map<String, Object> map) throws Exception {
        return bbsDao.selectBbsPassword(map);
    }

	public Map<String, Object> selectBbsDetail(Map<String, Object> map) throws Exception {
		return bbsDao.selectBbsDetail(map);
	}

	public void setBbsAuth(Map<String, Object> bbsMgr, List<Map<String, Object>> bbsAuthList,
			Map<String, Object> bbsMgrAuth) {
		
		//bbsMgr.get("NOTICE_USE_FG") // 공지사용여부 : 공지글 노출 여부(목록)
		//bbsMgr.get("REPLY_USE_FG") // 답글 사용여부 : 답글 노출 여부 (목록)  
		//bbsMgr.get("POSTING_REPLY_USE_FG") // 댓글 사용여부 : 댓글 노출 여부 (상세) 
		//bbsMgr.get("CATE_FG") // 카테고리 사용여부 
		//bbsMgr.get("ATTACH_FILE_USE_FG") // 첨부파일 사용여부 :  목록의아이콘, 상세의첨부파일목록, 작성의 첨부파일 업로드 노출 여부 (목록,상세, 작성)
		//bbsMgr.get("PASSWORD_USE_FG") // 비밀글 사용여부 : 비밀글 항목 노출 여부(작성)
		//bbsMgr.get("NM_CLOSED_USE_FG") // 익명 사용여부 : 이름 노출 여부(목록)
		//bbsMgr.get("POSTING_CLOSE_DATE_USE_FG") // 게시종료일자 사용여부 : 목록의 게시종료일자 > getdate() 인 게시글만 노출, 작성의 게시종료일자항목 노출 여부 (목록,작성) 
		//bbsMgr.get("EMAIL_USE_FG") // 익명 사용여부 : 이메일 항목 노출 여부 (상세, 작성)
		//bbsMgr.get("PERINFO_AGREE_USE_FG") // 개인정보동의 사용여부 : 개인정보 동의 항목 노출 여부 (작성)
		//bbsMgr.get("PERINFO_AGREE_CONTENT") // 개인정보동의 내용
		String writeoutAuthFg = "N";
		String noticeAuthFg = "N";
		String replyWriteoutAuthFg = "N";
		String replySearchAuthFg = "N";
		String postingReplyWriteoutAuthFg = "N";
		String postingReplySearchFg = "N";
		String secretPostingSearchAuthFg = "N";
		String postingDelAuthFg = "N";
		String postingUpdAuthFg = "N";
		for (Map<String, Object> bbsAuth : bbsAuthList) {
			// 작성 권한
			if (IUtility.parseNull(bbsAuth.get("WRITEOUT_AUTH_FG")).equals("Y")) writeoutAuthFg = "Y";
			
			//공지 권한
			if (IUtility.parseNull(bbsAuth.get("NOTICE_AUTH_FG")).equals("Y")) noticeAuthFg = "Y";

			// 답변 권한 
			if ( IUtility.parseNull(bbsAuth.get("REPLY_WRITEOUT_AUTH_FG")).equals("Y"))replyWriteoutAuthFg = "Y";

			//답변 조회 권한
			if (IUtility.parseNull(bbsAuth.get("REPLY_SEARCH_AUTH_FG")).equals("Y"))replySearchAuthFg =  "Y";

			// 댓글 권한
			if ( IUtility.parseNull(bbsAuth.get("POSTING_REPLY_WRITEOUT_AUTH_FG")).equals("Y")) postingReplyWriteoutAuthFg = "Y";
			
			// 댓글 조회 권한 
			if ( IUtility.parseNull(bbsAuth.get("POSTING_REPLY_SEARCH_AUTH_FG")).equals("Y")) postingReplySearchFg = "Y";

			// 비밀글인 게시글 보기 권한 
			if (IUtility.parseNull(bbsAuth.get("SECRET_POSTING_SEARCH_AUTH_FG")).equals("Y"))secretPostingSearchAuthFg = "Y";

			//삭제 권한
			if (IUtility.parseNull(bbsAuth.get("POSTING_DEL_AUTH_FG")).equals("Y")) postingDelAuthFg = "Y";

			// 수정 권한
			if (IUtility.parseNull(bbsAuth.get("POSTING_UPD_AUTH_FG")).equals("Y")) postingUpdAuthFg = "Y";
		}
		
		bbsMgrAuth.put("WRITEOUT_AUTH_FG", writeoutAuthFg);
		bbsMgrAuth.put("NOTICE_AUTH_FG", noticeAuthFg);
		bbsMgrAuth.put("REPLY_WRITEOUT_AUTH_FG", replyWriteoutAuthFg);
		bbsMgrAuth.put("REPLY_SEARCH_AUTH_FG", replySearchAuthFg);
		bbsMgrAuth.put("POSTING_REPLY_WRITEOUT_AUTH_FG", postingReplyWriteoutAuthFg);
		bbsMgrAuth.put("POSTING_REPLY_SEARCH_FG", postingReplySearchFg);
		bbsMgrAuth.put("SECRET_POSTING_SEARCH_AUTH_FG", secretPostingSearchAuthFg);
		bbsMgrAuth.put("POSTING_DEL_AUTH_FG", postingDelAuthFg);
		bbsMgrAuth.put("POSTING_UPD_AUTH_FG", postingUpdAuthFg);
	}
	
	public void setMainBbsListConstructor(Map<String, Object> map, ModelAndView view) throws Exception {
		// 게시판 설정 정보
		Map<String, Object> bbsMgr = new HashMap<String, Object>();
		bbsMgr = bbsDao.selectBbsMgrInfo(map);
		
		/** 권한 설정 **/
		Map<String, Object> bbsMgrAuth = new HashMap<String, Object>();
		bbsMgrAuth.put("MENU_CD", map.get("SESSION_MENU_CD"));
		
		//if(IUtility.parseNull(bbsMgr.get("PORTLET_USE_FG")).equals("Y")) {
		// 게시판 권한 정보
		List<Map<String, Object>> bbsAuth = new ArrayList<Map<String, Object>>();
		map.put("BBS_TYPE_GCD", bbsMgr.get("BBS_TYPE_GCD"));
		map.put("BBS_TYPE_SEQ_NO", bbsMgr.get("BBS_TYPE_SEQ_NO"));
		bbsAuth = bbsDao.selectBbsAuthInfo(map);
		
		
		setBbsAuth(bbsMgr, bbsAuth, bbsMgrAuth);
		
		
		/** 게시글 목록 **/
		map.put("NOTICE_USE_FG", IUtility.parseNull(bbsMgr.get("NOTICE_USE_FG"),"N") );
		map.put("REPLY_USE_FG", IUtility.parseNull(bbsMgr.get("REPLY_USE_FG"),"N"));
		map.put("NM_CLOSED_USE_FG", IUtility.parseNull(bbsMgr.get("NM_CLOSED_USE_FG"),"N"));
		map.put("POSTING_CLOSE_DATE_USE_FG", IUtility.parseNull(bbsMgr.get("POSTING_CLOSE_DATE_USE_FG"),"N"));
		map.put("SCH_GUBUN", IUtility.parseNull(map.get("SCH_GUBUN"),"") );
		map.put("SCH_CONTENT", IUtility.parseNull(map.get("SCH_CONTENT"),"") );
		map.put("SESSION_USER_ID", IUtility.parseNull(map.get("SESSION_USER_ID"),"") );
		map.put("CATE_TYPE_SEQ_NO", IUtility.parseNull(map.get("CATE_TYPE_SEQ_NO"),"") );
		
		List<Map<String, Object>> resultBbsDataList = bbsDao.selectBbsDataList(map);
		
		List<Map<String, Object>> bbsDataList = new ArrayList<Map<String, Object>>();
		bbsDataList = (List<Map<String, Object>>) resultBbsDataList.get(0);

		for (Map<String, Object> bbsData : bbsDataList) {
			/** 게시글 파일목록 조회 **/
			map.put("ATTACH_FILE_GRP_CD", bbsData.get("ATTACH_FILE_GRP_CD"));
			map.put("ATTACH_FILE_GCD", "0001");
			
			// 카테고리 다국어 설정
			String locale = IUtility.parseNull(map.get("SESSION_LOCALE"));
			if(locale.equals("0001")) {
				bbsData.put("CATE_TYPE_NM", bbsData.get("CATE_TYPE_KOR_NM"));
			}else if(locale.equals("0002")) {
				bbsData.put("CATE_TYPE_NM", bbsData.get("CATE_TYPE_ENG_NM"));
			}else if(locale.equals("0003")) {
				bbsData.put("CATE_TYPE_NM", bbsData.get("CATE_TYPE_CHN_NM"));
			}else {
				bbsData.put("CATE_TYPE_NM", bbsData.get("CATE_TYPE_KOR_NM"));
			}

			List<Map<String, Object>> bbsFileList = new ArrayList<Map<String, Object>>();
			if (!IUtility.parseNull(map.get("ATTACH_FILE_GRP_CD")).equals("")) {
				bbsFileList = filesService.selectList(map);
				bbsData.put("bbsFileList", bbsFileList);
				if(bbsFileList.size() > 0) {
					bbsData.put("ATTACH_FILE_SEQ_NO",bbsFileList.get(0).get("ATTACH_FILE_SEQ_NO"));
					bbsData.put("ATTACH_FILE_GCD",bbsFileList.get(0).get("ATTACH_FILE_GCD"));
					bbsData.put("FILE_TAG_CONTENT",bbsFileList.get(0).get("FILE_TAG_CONTENT"));
					bbsData.put("PARAM_CODE",bbsFileList.get(0).get("PARAM_CODE"));
				}
			}
			
		}
	
		view.addObject("bbsMgr", bbsMgr);
		view.addObject("bbsDataList", bbsDataList);
		
		//}
		view.addObject("bbsMgrAuth", bbsMgrAuth);
	}

	public void setBbsConstructor(Map<String, Object> map, ModelAndView view) throws Exception {
		// BbsDomain bbsDomain = new BbsDomain();
		String mode = IUtility.parseNull(map.get("mode"));
		if (mode.equals("")) {
			mode = "LIST";
		}

		// 게시판 설정 정보
		Map<String, Object> bbsMgr = new HashMap<String, Object>();
		bbsMgr = bbsDao.selectBbsMgrInfo(map);
		view.addObject("bbsMgr", bbsMgr);
		
		
		// 게시판 권한 정보
		List<Map<String, Object>> bbsAuth = new ArrayList<Map<String, Object>>();
		map.put("BBS_TYPE_GCD", bbsMgr.get("BBS_TYPE_GCD"));
		map.put("BBS_TYPE_SEQ_NO", bbsMgr.get("BBS_TYPE_SEQ_NO"));
		bbsAuth = bbsDao.selectBbsAuthInfo(map);
		
		
		//게시판 카테고리 정보 조회

		String locale = IUtility.parseNull(map.get("SESSION_LOCALE"));
		if(IUtility.parseNull(bbsMgr.get("CATE_FG")).equals("Y")) {
			List<Map<String, Object>> bbsCateList = new ArrayList<Map<String, Object>>();
			bbsCateList = bbsDao.selectListBbsCate(map);
			for (Map<String, Object> map2 : bbsCateList) {
				
				// 카테고리 다국어 설정
				if(locale.equals("0001")) {
					map2.put("CATE_TYPE_NM", map2.get("CATE_TYPE_KOR_NM"));
				}else if(locale.equals("0002")) {
					map2.put("CATE_TYPE_NM", map2.get("CATE_TYPE_ENG_NM"));
				}else if(locale.equals("0003")) {
					map2.put("CATE_TYPE_NM", map2.get("CATE_TYPE_CHN_NM"));
				}else {
					map2.put("CATE_TYPE_NM", map2.get("CATE_TYPE_KOR_NM"));
				}
			}
			view.addObject("bbsCateList",bbsCateList);
		}

		/** 권한 설정 **/
		Map<String, Object> bbsMgrAuth = new HashMap<String, Object>();
		setBbsAuth(bbsMgr, bbsAuth, bbsMgrAuth);

		view.addObject("params", map);
		if (mode.equals("LIST")) {

			/** 게시판 권한 정보 **/
			// result.put("bbsAuth", "");

			/** 게시글 목록 **/
			

			map.put("NOTICE_USE_FG", IUtility.parseNull(bbsMgr.get("NOTICE_USE_FG"),"N") );
			map.put("REPLY_USE_FG", IUtility.parseNull(bbsMgr.get("REPLY_USE_FG"),"N"));
			map.put("NM_CLOSED_USE_FG", IUtility.parseNull(bbsMgr.get("NM_CLOSED_USE_FG"),"N"));
			map.put("POSTING_CLOSE_DATE_USE_FG", IUtility.parseNull(bbsMgr.get("POSTING_CLOSE_DATE_USE_FG"),"N"));
			map.put("SCH_GUBUN", IUtility.parseNull(map.get("SCH_GUBUN"),"") );
			map.put("SCH_CONTENT", IUtility.parseNull(map.get("SCH_CONTENT"),"") );
			map.put("CATE_TYPE_SEQ_NO", IUtility.parseNull(map.get("CATE_TYPE_SEQ_NO"),"") );
			List<Map<String, Object>> resultBbsDataList = bbsDao.selectBbsDataList(map);
			
			List<Map<String, Object>> bbsDataList1 = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> bbsDataList2 = new ArrayList<Map<String, Object>>();
			bbsDataList1 = (List<Map<String, Object>>) resultBbsDataList.get(0);
			bbsDataList2 = (List<Map<String, Object>>) resultBbsDataList.get(1);
			String totCnt = IUtility.parseNull(bbsDataList2.get(0).get("TOT_CNT"));
			
			for (Map<String, Object> bbsData : bbsDataList1) {
				/** 게시글 파일목록 조회 **/
				map.put("ATTACH_FILE_GRP_CD", bbsData.get("ATTACH_FILE_GRP_CD"));
				map.put("ATTACH_FILE_GCD", "0001");
				
				// 카테고리 다국어 설정
				if(locale.equals("0001")) {
					bbsData.put("CATE_TYPE_NM", bbsData.get("CATE_TYPE_KOR_NM"));
				}else if(locale.equals("0002")) {
					bbsData.put("CATE_TYPE_NM", bbsData.get("CATE_TYPE_ENG_NM"));
				}else if(locale.equals("0003")) {
					bbsData.put("CATE_TYPE_NM", bbsData.get("CATE_TYPE_CHN_NM"));
				}else {
					bbsData.put("CATE_TYPE_NM", bbsData.get("CATE_TYPE_KOR_NM"));
				}

				List<Map<String, Object>> bbsFileList = new ArrayList<Map<String, Object>>();
				if (!IUtility.parseNull(map.get("ATTACH_FILE_GRP_CD")).equals("")) {
					bbsFileList = filesService.selectList(map);
					bbsData.put("bbsFileList", bbsFileList);
					if(bbsFileList.size() > 0) {
						bbsData.put("ATTACH_FILE_SEQ_NO",bbsFileList.get(0).get("ATTACH_FILE_SEQ_NO"));
						bbsData.put("ATTACH_FILE_GCD",bbsFileList.get(0).get("ATTACH_FILE_GCD"));
						bbsData.put("FILE_TAG_CONTENT",bbsFileList.get(0).get("FILE_TAG_CONTENT"));
						bbsData.put("PARAM_CODE",bbsFileList.get(0).get("PARAM_CODE"));
					}
				}
				
			}

			
			view.addObject("bbsDataCount", "");
			view.addObject("data", bbsDataList1);
			view.addObject("totalCnt", bbsDataList1.size());
			view.addObject("pageInfo", IUtility.getPageInfo(map, totCnt));
			view.addObject("pageList", IUtility.getPageInfoArr(map));
			
			//게시글 소유 권한
			for (Map<String, Object> map2 : bbsDataList1) {
				if (IUtility.parseNull(map2.get("INS_USER_ID"))
						.equals(IUtility.parseNull(map.get("SESSION_USER_ID")))) {
					map2.put("bbsOwner", "Y");
				}
			}

		} else if (mode.equals("DETAIL")) {
			/** 조회수 증가 **/
			updateBbsTimesno(map);

			/** 게시글 상세정보 조회 **/
			Map<String, Object> bbsData = new HashMap<String, Object>();
			bbsData = selectBbsDetail(map);
			// 카테고리 다국어 설정
			if(locale.equals("0001")) {
				bbsData.put("CATE_TYPE_NM", bbsData.get("CATE_TYPE_KOR_NM"));
			}else if(locale.equals("0002")) {
				bbsData.put("CATE_TYPE_NM", bbsData.get("CATE_TYPE_ENG_NM"));
			}else if(locale.equals("0003")) {
				bbsData.put("CATE_TYPE_NM", bbsData.get("CATE_TYPE_CHN_NM"));
			}else {
				bbsData.put("CATE_TYPE_NM", bbsData.get("CATE_TYPE_KOR_NM"));
			}
			
			
			/** 게시글 파일목록 조회 **/
			List<Map<String, Object>> bbsFileList = new ArrayList<Map<String, Object>>();
			if (!IUtility.parseNull(map.get("ATTACH_FILE_GRP_CD")).equals("")) {
				bbsFileList = filesService.selectList(map);
			}else if (!IUtility.parseNull(bbsData.get("ATTACH_FILE_GRP_CD")).equals("")) {
				bbsFileList = filesService.selectList(bbsData);
			}

			/** 댓글 목록 조회 **/
			List<Map<String, Object>> bbsReplyDataList = new ArrayList<Map<String, Object>>();
			bbsReplyDataList = bbsDao.selectBbsReplyDataList(map);
			//댓글 소유 권한
			for (Map<String, Object> map2 : bbsReplyDataList) {
				if (IUtility.parseNull(map2.get("INS_USER_ID"))
						.equals(IUtility.parseNull(map.get("SESSION_USER_ID")))) {
					map2.put("replyBbsOwner", "Y");
				}
			}

			view.addObject("bbsData", bbsData);
			view.addObject("bbsFileList", bbsFileList);
			view.addObject("bbsReplyDataList", bbsReplyDataList);

			
			//게시글 소유 권한
			if (IUtility.parseNull(bbsData.get("INS_USER_ID"))
						.equals(IUtility.parseNull(map.get("SESSION_USER_ID")))) {
				bbsData.put("bbsOwner", "Y");
			}
		

		} else if (mode.equals("WRITE") || mode.equals("MODIFY") || mode.equals("ANSWER")) {

			/** 게시글 상세정보 조회 **/
			Map<String, Object> bbsData = new HashMap<String, Object>();
			if (!IUtility.parseNull(map.get("POSTING_SEQ_NO")).equals("")) {
				bbsData = selectBbsDetail(map);
			}

			/** 게시글 파일목록 조회 **/
			List<Map<String, Object>> bbsFileList = new ArrayList<Map<String, Object>>();
			if (!IUtility.parseNull(map.get("ATTACH_FILE_GRP_CD")).equals("")) {
				bbsFileList = filesService.selectList(map);
			}

			view.addObject("bbsData", bbsData);
			view.addObject("bbsFileList", bbsFileList);

		}

		view.addObject("bbsMgrAuth", bbsMgrAuth);

	}
}
