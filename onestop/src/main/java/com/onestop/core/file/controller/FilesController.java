package com.onestop.core.file.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import java.util.Enumeration;
import java.util.HashMap;

import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.onestop.core.file.service.FilesService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.ConstantUtil;
import com.onestop.core.util.Function;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.ProjectConstant;
import com.onestop.core.util.controller.CommonController;

@RestController
@RequestMapping("/file")
public class FilesController extends CommonController {
	
	private final Logger LOGGER = LoggerFactory.getLogger(getClass().getName());
	
	@Autowired
	private FilesService filesService;

	@Autowired
	ServletContext context;

	public String addDate(int y, int m, int d, String pattern) throws Exception {
		return LocalDate.now().plusDays(d).plusMonths(m).plusYears(y).format(DateTimeFormatter.ofPattern(pattern));
	}

	public String uploadFolder() throws Exception {
		return addDate(0, 0, 0, "yyyy") + "/" + addDate(0, 0, 0, "MM") + "/" + addDate(0, 0, 0, "dd") + "/";
	}

	@RequestMapping("/multiUpload")
	public List<Map<String, Object>> multiUpload(MultipartHttpServletRequest request, HttpServletResponse res)
			throws Exception {

		List<Map<String, Object>> dataList = new ArrayList<Map<String, Object>>();
		Map<String, Object> parameter = new HashMap<String, Object>();

		Enumeration<String> paramNames = request.getParameterNames();

		while (paramNames.hasMoreElements()) {
			String key = paramNames.nextElement();
			parameter.put(key, request.getParameter(key));
		}

		String callback = Function.parseNull(parameter.get("callback"));

		String path = Function.parseNull(parameter.get("PATH"));
		String name = Function.parseNull(parameter.get("NAME"));
		String grpCd = Function.parseNull(parameter.get("ATTACH_FILE_GRP_CD"));
		String fileGcd = Function.parseNull(parameter.get("ATTACH_FILE_GCD"));
		String systemGcd = Function.parseNull(parameter.get("SYSTEM_GCD"));

		List resultArray = new ArrayList();

		File resultFile = null;
		try {
			Iterator<String> fileNames = request.getFileNames();

			String fileName = "";
			String path2 = "";

			while (fileNames.hasNext()) {
				fileName = fileNames.next();

				List<MultipartFile> files = request.getFiles(fileName);

				for (MultipartFile file : files) {

					if (file != null && !file.getOriginalFilename().equals("")) {

						path2 = ConstantUtil.FILE_UPLOAD_ROOT + "/" + (!systemGcd.equals("") ? systemGcd : "0001") + "/"
								+ uploadFolder();
						if (!name.equals("")) {
							resultFile = Function.fileUpload(path2, file, name);
						} else {
							resultFile = Function.fileUpload(path2, file);
						}

						String realName = resultFile.getName();
						String originalFileName = new String(file.getOriginalFilename());

						InetAddress local;

						local = InetAddress.getLocalHost();
						String ip = local.getHostAddress();

						originalFileName = new String(originalFileName.getBytes("ksc5601"), "euc-kr");

						Long longFileSize = file.getSize();
						Double doubleFileSize = Math.floor(longFileSize / 1024);
						Integer intFileSize = doubleFileSize.intValue();
						Map<String, Object> params = new HashMap<String, Object>();
						params.put("ATTACH_FILE_GRP_CD", grpCd);
						params.put("ATTACH_FILE_GCD", fileGcd);
						params.put("ATTACH_FILE_NM", realName);
						params.put("ATTACH_FILE_SENIOR_CONTENT", path2 + realName);
						params.put("ORIGIN_FILE_NM", originalFileName);
						params.put("FILE_EXTENSION_CONTENT", Function.getFileExt(file));
						params.put("FILE_SIZE", Long.toString(resultFile.length()));

						resultArray.add(params);
					}
				}
			}
		} catch (Exception e) {
			for (int idx = 0; idx < resultArray.size(); idx++) {
				File file2 = new File((String) ((Map) resultArray.get(idx)).get("ATTACH_FILE_SENIOR_CONTENT"));
				if (file2.exists() && file2.isFile()) {
					file2.delete();
				}
			}
			throw e;
		}

		if (resultArray != null && resultArray.size() > 0) {
			List<Map> result = (List<Map>) resultArray;

			for (Map map : result) {
				Map<String, Object> data = new HashMap<String, Object>();
				data.put("key", Function.parseNull(map.get("ATTACH_FILE_GRP_CD")) + "^"
						+ Function.parseNull(map.get("ATTACH_FILE_GCD")));
				data.put("file", Function.parseNull(map.get("ATTACH_FILE_SENIOR_CONTENT")) + "^"
						+ Function.parseNull(map.get("ATTACH_FILE_NM")));
				data.put("localFile", Function.parseNull(map.get("ORIGIN_FILE_NM")) + "^"
						+ Function.parseNull(map.get("FILE_EXTENSION_CONTENT")));
				data.put("size", Function.parseNull(map.get("FILE_SIZE")));

				dataList.add(data);
			}

		}

		return dataList;
	}

	@RequestMapping(value = "/saveFileList")
	public Map<String, Object> save(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		@SuppressWarnings("unchecked")
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

		filesService.saveAttachFileInfo(param);
		setSuccess(result, param);
		return result;
	}

	@RequestMapping("/download")
	public void download(HttpServletResponse response, HttpServletRequest request) throws Exception {

		try {
			Enumeration<String> paramNames = request.getParameterNames();
			String encParamCode = "";
			while (paramNames.hasMoreElements()) {
				encParamCode = paramNames.nextElement();
			}

			Map<String, Object> parameter2 = new HashMap<String, Object>();
			encParamCode = encParamCode.replaceAll(" ", "+");
			String decParamCode = IUtility.getDecStr(encParamCode, ProjectConstant.SECURITY_KEY);
			String[] arrParamCode = decParamCode.split("\\^");
			String systemGcd = arrParamCode[0];
			String attachFileGrpCd = arrParamCode[1];
			String attachFileGcd = arrParamCode[2];
			String attachFileSeqNo = arrParamCode[3];

			parameter2.put("SESSION_SYSTEM_GCD", systemGcd);
			parameter2.put("ATTACH_FILE_GRP_CD", attachFileGrpCd);
			parameter2.put("ATTACH_FILE_GCD", attachFileGcd);
			parameter2.put("ATTACH_FILE_SEQ_NO", attachFileSeqNo);

			List<Map<String, Object>> rtnList = filesService.selectDetail(parameter2);
			File file = null;
			String realPath = "";
			String uploadName = "";
			String downloadName = "";

			if (rtnList != null && !rtnList.isEmpty()) {
				Map<String, Object> rtnMap = rtnList.get(0);
				realPath = (String) rtnMap.get("ATTACH_FILE_SENIOR_CONTENT");
				downloadName = (String) rtnMap.get("ORIGIN_FILE_NM");
				file = new File(realPath);
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('파일이 존재하지 않습니다.');history.back;</script>");
				out.flush();
			}

			if (file != null && file.exists()) {
				response.setCharacterEncoding("UTF-8");
				/*
				 * InetAddress local; local = InetAddress.getLocalHost(); String ip =
				 * local.getHostAddress();
				 */
				// response.setHeader("Content-Disposition", "attachment; filename=" + (new
				// String(downloadName.getBytes("euc-kr"),"ksc5601")).replace(",","_"));
				response.setHeader("Content-Disposition", "attachment; filename="
						+ (new String(downloadName.getBytes("UTF-8"), "8859_1")).replace(",", "_"));

				FileCopyUtils.copy(new FileInputStream(file), response.getOutputStream());
				response.flushBuffer();
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('파일이 존재하지 않습니다..');history.back();</script>");
				out.flush();
				// response.setCharacterEncoding("UTF-8");
				// response.getWriter().write("<script>alert('파일이 존재하지 않습니다.')</script>");
				// response.getWriter().close();
			}
		} catch (Exception e) {
			throw e;
		}
	}

	@RequestMapping(value = "/selectTagGroupList")
	public ModelAndView selectTagGroupList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

		List<Map<String, Object>> fileList = filesService.selectList(param);

		// 파일목록에서 FILE_TAG_CONTENT 중복된값 제거후 fileTabList 에 담기
		List<String> fileTabList = new ArrayList<String>();
		List<String> newFileTabList = new ArrayList<String>();
		for (Map<String, Object> map : fileList) {
			fileTabList.add(IUtility.parseNull(map.get("FILE_TAG_CONTENT")));
		}
		newFileTabList = fileTabList.stream().distinct().collect(Collectors.toList());
		view.addObject("fileTabList", newFileTabList);
		view.addObject("fileList", fileList);

		return view;
	}

	@RequestMapping(value = "/selectList")
	public Map<String, Object> selectList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

		setSuccess(result, filesService.selectList(param));
		return result;
	}

	@ResponseBody
    @RequestMapping(value = "/delete")
    public String delete(ParamMap paramMap, HttpServletRequest request) throws Exception {
        return deleteFile((Map<String, Object>) paramMap.get("data"));
    }

	public String deleteFile(Map<String, Object> parameter) throws Exception {
		JSONObject result = new JSONObject();
		ArrayList<Map<String, Object>> resultList = new ArrayList();

		parameter.put("SESSION_SYSTEM_GCD", parameter.get("SYSTEM_GCD"));
		List<Map<String, Object>> rtnList = filesService.selectDetail(parameter);
		if (rtnList != null && !rtnList.isEmpty()) {
			for (int i = 0; i < rtnList.size(); i++) {
				Map<String, Object> resultMap = new HashMap<String, Object>();
				Map<String, Object> rtnMap = rtnList.get(i);

				String realPath = (String) rtnMap.get("ATTACH_FILE_SENIOR_CONTENT");

				filesService.deleteAttachFileInfo(rtnMap);

				File file = new File(realPath);
				if (file.exists() && file.isFile()) {
					resultMap.put("O_RSLT", file.delete() ? "Y" : "N");
				}
				resultList.add(resultMap);
			}
		}
		result.put("data", resultList);

		return result.toString();
	}

	@RequestMapping(value = "/fileTransComplete")
	public Map<String, Object> fileTransComplete(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

		Enumeration<String> paramNames = request.getParameterNames();

		filesService.fileTransComplete(param);

		setSuccess(result, null);
		return result;
	}

	@RequestMapping(value = "/fileInfoDelete")
	public Map<String, Object> fileInfoDelete(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
		param.put("ATTACH_FILE_SEQ_NO", "0");
		List<Map<String, Object>> rtnList = filesService.selectDetail(param);
		if (rtnList != null && !rtnList.isEmpty()) {
			for (int i = 0; i < rtnList.size(); i++) {
				Map<String, Object> resultMap = new HashMap<String, Object>();
				Map<String, Object> rtnMap = rtnList.get(i);

				String realPath = (String) rtnMap.get("ATTACH_FILE_SENIOR_CONTENT");

				File file = new File(realPath);
				if (file.exists() && file.isFile()) {
					file.delete();
				}
			}
			filesService.fileInfoDelete(param);
		}

		setSuccess(result, null);
		return result;
	}

	/**
	 * CKEDITOR 이미지 업데이트용 URL 처리 메서드
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping("/CKEDITORImgPasteUpload")
	public void CKEDITORImgPasteUpload(MultipartHttpServletRequest request, HttpServletResponse response)
			throws Exception {
		JSONObject json = new JSONObject();
		Map<String, Object> parameter = new HashMap<String, Object>();

		Enumeration<String> paramNames = request.getParameterNames();

		while (paramNames.hasMoreElements()) {
			String key = paramNames.nextElement();
			parameter.put(key, request.getParameter(key));
		}

		String path = Function.parseNull(parameter.get("PATH"));
		String name = Function.parseNull(parameter.get("NAME"));
		String grpCd = Function.parseNull(generateKey());
		String fileGcd = Function.parseNull("9998");
		String systemGcd = Function.parseNull(parameter.get("SYSTEM_GCD"));

		String sessionMenuCd = Function.parseNull(parameter.get("SESSION_MENU_CD"));
		String sessionUserId = Function.parseNull(parameter.get("SESSION_USER_ID"));
		String sessionUserIp = Function.parseNull(parameter.get("SESSION_USER_IP"));

		List resultArray = new ArrayList();
		Map<String, Object> params = new HashMap<String, Object>();
		File resultFile = null;
		try {
			Iterator<String> fileNames = request.getFileNames();

			String fileName = "";
			String path2 = "";
			while (fileNames.hasNext()) {
				fileName = fileNames.next();

				List<MultipartFile> files = request.getFiles(fileName);

				for (MultipartFile file : files) {
					if (file != null) {

						path2 = ConstantUtil.FILE_UPLOAD_ROOT + "/" + "CKEDITOR"
								+ (!systemGcd.equals("") ? systemGcd : "0001") + "/" + uploadFolder();
						if (!name.equals("")) {
							resultFile = Function.fileUpload(path2, file, name);
						} else {
							resultFile = Function.fileUpload(path2, file);
						}

						String realName = resultFile.getName();
						String originalFileName = new String(file.getOriginalFilename());

						InetAddress local;

						local = InetAddress.getLocalHost();
						String ip = local.getHostAddress();

						originalFileName = new String(originalFileName.getBytes("ksc5601"), "euc-kr");

						Long longFileSize = file.getSize();
						Double doubleFileSize = Math.floor(longFileSize / 1024);
						Integer intFileSize = doubleFileSize.intValue();

						params.put("ATTACH_FILE_GRP_CD", grpCd);
						params.put("ATTACH_FILE_GCD", fileGcd);
						params.put("ATTACH_FILE_NM", realName);
						params.put("ATTACH_FILE_SENIOR_CONTENT", path2 + realName);
						params.put("ORIGIN_FILE_NM", originalFileName);
						params.put("FILE_EXTENSION_CONTENT", Function.getFileExt(file));
						params.put("FILE_SIZE", Long.toString(resultFile.length()));

						params.put("SESSION_SYSTEM_GCD", systemGcd);
						params.put("SESSION_USER_ID", sessionUserId);
						params.put("SESSION_MENU_CD", sessionMenuCd);
						params.put("SESSION_USER_IP", sessionUserIp);

						// DB테이블 저장
						filesService.saveAttachFileInfoCKEDITOR(params);
						// 최종 업데이트 처리
						filesService.fileTransComplete(params);

						String paramCode = systemGcd + "^" + grpCd + "^" + fileGcd + "^" + 1;
						paramCode = IUtility.getEncStr(paramCode, ProjectConstant.SECURITY_KEY);

						// CKEDITOR용 JSON리턴 처리
						String url = "/file/download.do?" + paramCode;
						json.put("uploaded", 1);
						json.put("fileName", realName);
						json.put("url", url);
						resultArray.add(params);

					}
				}
			}
		} catch (Exception e) {
			for (int idx = 0; idx < resultArray.size(); idx++) {
				File file2 = new File((String) ((Map) resultArray.get(idx)).get("ATTACH_FILE_SENIOR_CONTENT"));
				if (file2.exists() && file2.isFile()) {
					file2.delete();
				}
			}
			throw e;
		}
		PrintWriter out = response.getWriter();
		out.print(json);
	}

	@RequestMapping("/manualImgUpload")
	public void manualImgUpload(@RequestParam HashMap<String, Object> reqParam, MultipartHttpServletRequest request,
			HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=UTF-8");

		String systemGcd = Function.parseNull(reqParam.get("SYSTEM_GCD"));
		String menuCd = Function.parseNull(reqParam.get("MENU_CD"));
		String callbackFn = reqParam.get("callbackFunction") == null ? "" : (String) reqParam.get("callbackFunction");

		String path2 = "";
		File resultFile = null;

		PrintWriter out = response.getWriter();

		try {

			Iterator<String> fileNames = request.getFileNames();
			while (fileNames.hasNext()) {
				String fileName = fileNames.next();
				List<MultipartFile> files = request.getFiles(fileName);

				for (MultipartFile file : files) {
					if (file != null) {
						path2 = ConstantUtil.FILE_UPLOAD_ROOT + File.separator + "manual" + File.separator + systemGcd
								+ File.separator + menuCd + File.separator;
						resultFile = Function.fileUpload(path2, file, true);
					}
				}
			}
			out.print("<script>window.onload = doInit;function doInit() {parent." + callbackFn + "('<ret><IMG_PATH>/"
					+ systemGcd + "/" + menuCd + "/" + resultFile.getName()
					+ "</IMG_PATH><O_RSLT>Y</O_RSLT><O_MSG></O_MSG></ret>');}</script>");

		} catch (Exception ex) {
			out.print("<script>window.onload = doInit;function doInit() {parent." + callbackFn
					+ "('<ret><IMG_PATH>x_x</IMG_PATH><O_RSLT>N</O_RSLT><O_MSG>" + ex.getMessage()
					+ "</O_MSG></ret>');}</script>");
		}
	}

	@RequestMapping("/manualImgPasteUpload")
	public void manualImgPasteUpload(@RequestParam HashMap<String, Object> reqParam,
			MultipartHttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=UTF-8");

		String systemGcd = Function.parseNull(reqParam.get("SYSTEM_GCD"));
		String menuCd = Function.parseNull(reqParam.get("MENU_CD"));

		String path2 = "";
		File resultFile = null;

		PrintWriter out = response.getWriter();

		try {

			Iterator<String> fileNames = request.getFileNames();
			while (fileNames.hasNext()) {
				String fileName = fileNames.next();
				List<MultipartFile> files = request.getFiles(fileName);

				for (MultipartFile file : files) {
					if (file != null) {
						path2 = ConstantUtil.FILE_UPLOAD_ROOT + File.separator + "manual" + File.separator + systemGcd
								+ File.separator + menuCd + File.separator;
						resultFile = Function.fileUpload(path2, file, true);
					}
				}
			}
			out.print("<ret><IMG_PATH>/" + systemGcd + "/" + menuCd + "/" + resultFile.getName()
					+ "</IMG_PATH><O_RSLT>Y</O_RSLT><O_MSG></O_MSG></ret>");

		} catch (Exception ex) {
			out.print("<ret><IMG_PATH>x_x</IMG_PATH><O_RSLT>N</O_RSLT><O_MSG>" + ex.getMessage() + "</O_MSG></ret>");
		}
	}

	@GetMapping("/manual/img")
	public ResponseEntity<Resource> getManualImg(@Param("filePath") String filePath) throws Exception {

		String path = ConstantUtil.FILE_UPLOAD_ROOT + File.separator + "manual" + filePath;

		Resource resource = new FileSystemResource(path);

		if (!resource.exists()) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}

		HttpHeaders header = new HttpHeaders();
		Path filePath2 = null;
		try {
			filePath2 = Paths.get(path);
			header.add("content-type", Files.probeContentType(filePath2));
		} catch (IOException e) {
			LOGGER.error(e.getMessage());
		}
		return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
	}
	
	@GetMapping("/old/attach/img")
	public ResponseEntity<Resource> getOldAttachlImg(@Param("filePath") String filePath) throws Exception {

		String path = ConstantUtil.FILE_UPLOAD_ROOT + File.separator + "old" + filePath;

		Resource resource = new FileSystemResource(path);

		if (!resource.exists()) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}

		HttpHeaders header = new HttpHeaders();
		Path filePath2 = null;
		try {
			filePath2 = Paths.get(path);
			header.add("content-type", Files.probeContentType(filePath2));
		} catch (IOException e) {
			LOGGER.error(e.getMessage());
		}
		return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
	}

	@RequestMapping("/uploadExcel")
	public List<Map<String, Object>> uploadExcel(@RequestParam(value = "file", required = false) MultipartFile file,
			MultipartHttpServletRequest request, HttpServletResponse res) throws Exception {
		ModelAndView view = new ModelAndView();

		String headerFg = IUtility.parseNull(request.getParameter("HEADER_FG"));
		int startRow = IUtility.parseInt(request.getParameter("START_ROW"));
		int startCol = IUtility.parseInt(request.getParameter("START_COL"));
		int sheetNo = IUtility.parseInt(request.getParameter("SHEET_NO"));
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Workbook workbook = null;
		if (!file.isEmpty()) {
			InputStream inputStream = new ByteArrayInputStream(file.getBytes());
			workbook = WorkbookFactory.create(inputStream);

			Sheet datatypeSheet = workbook.getSheetAt(sheetNo);
			Iterator<Row> iterator = datatypeSheet.iterator();

			Map<String, Object> param = null;

			int i = 0;
			while (iterator.hasNext()) {
				Row currentRow = iterator.next();
				Iterator<Cell> cellIterator = currentRow.iterator();
				if (startRow <= i) {
					param = new HashMap<String, Object>();
					if (!headerFg.equals("Y") && i == 0) {
						i++;
						continue;
					}
					int j = 0;
					int dataIdx = 0;
					while (cellIterator.hasNext()) {

						Cell currentCell = cellIterator.next();
						String value = "";
						if (startCol <= j) {
							switch (currentCell.getCellType()) { // 각 셀에 담겨있는 데이터의 타입을 체크하고 해당 타입에 맞게 가져온다.
							case HSSFCell.CELL_TYPE_NUMERIC:

								if (HSSFDateUtil.isCellDateFormatted(currentCell)) {
                                    SimpleDateFormat fommatter = new SimpleDateFormat("yyyy-MM-dd",Locale.getDefault());
                                    value = fommatter.format(currentCell.getDateCellValue());
                                } else {
                                    double ddata = currentCell.getNumericCellValue();
                                    if (HSSFDateUtil.isValidExcelDate(ddata)) {
                                        SimpleDateFormat fommatter = new SimpleDateFormat("yyyy-MM-dd",Locale.getDefault());
                                        //value = fommatter.format(currentCell.getDateCellValue());
                                        value = Integer.toString((int)currentCell.getNumericCellValue());
                                    } else {
                                        //value = String.valueOf(ddata);
                                        value = Integer.toString((int)currentCell.getNumericCellValue());
                                    }
                                }
								break;
							case HSSFCell.CELL_TYPE_STRING:
								value = currentCell.getStringCellValue() + "";
								break;
							case HSSFCell.CELL_TYPE_BLANK:
								value = currentCell.getBooleanCellValue() + "";
								break;
							case HSSFCell.CELL_TYPE_ERROR:
								value = currentCell.getErrorCellValue() + "";
								break;
							default :
								value = "";
							}
							param.put("data_" + dataIdx, value);
							dataIdx++;
						}

						j++;
					}
					list.add(param);
				}
				i++;
			}
		}

		return list;
	}


	public static String getStringValue(Cell cell) {
		String rtnValue = "";
		try {
			rtnValue = cell.getStringCellValue();
		} catch (IllegalStateException e) {
			rtnValue = Integer.toString((int) cell.getNumericCellValue());
		}
		return rtnValue;
	}

	/**
	 * CKEDITORImgPasteUpload 시 ATTACH_FILE_GRP_CD 생성용 메서드 (30자리 랜덤키 생성)
	 * 
	 * @return String
	 * @throws Exception
	 */
	public static String generateKey() throws Exception {
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 30; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			default :
				break;
			}
		}
		return temp.toString();
	}
}
