package com.korea.mall.service;

import java.io.File;
import java.net.MalformedURLException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriUtils;

import com.korea.mall.common.Const;
import com.korea.mall.dao.BoardDAO;
import com.korea.mall.dao.FileDAO;
import com.korea.mall.dto.FileDTO;
import com.korea.mall.dto.UserDTO;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class CommonService {
	
	
	private final HttpSession session;
	private final ResourceLoader resourceLoader;
	private final FileDAO fileDao;
//	private final HttpServletRequest request;
	
	
	private FileDTO fileUploadProc(MultipartFile multipartFile) {
		
		//요거쓰면 was주소가져옴.
		Resource resource = resourceLoader.getResource(Const.FILE_PATH);
		String path ="";
//	    String path = request.getServletContext().getRealPath(Const.FILE_PATH);
	    String uuid = UUID.randomUUID().toString();
	    UserDTO user = (UserDTO) session.getAttribute(Const.U_SESSION_KEY);
	    //userDTO 더미 set mok test
	    if(user == null) {
	    	user = new UserDTO();
	    	user.setU_idx(9999);
	    }
	    FileDTO file = new FileDTO();
	    file.setDelYn("N");
	    file.setStriostoredFileName(uuid);
	    file.setRegUser(user.getU_idx());
	    file.setUpdUser(user.getU_idx());
	    file.setOrgFileName(multipartFile.getOriginalFilename());
	    file.setFileSize(multipartFile.getSize());
	    try {
	    	//임시코딩
//	    	path = "C:\\Users\\admin\\git\\koreaC\\src\\main\\webapp\\resources\\file\\";
	    	path = resource.getFile().getPath();
	    	Files.createDirectories(Paths.get(path));
	    	File saveFile = new File(path, file.getStriostoredFileName());
	    	//서버저장
			multipartFile.transferTo(saveFile);
			//업로드 성공시 dao db넣기
			fileDao.insert(file);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	    
	    return file;
	}
	
	public List<FileDTO> uploadFile(MultipartFile[] uploadFile) {
		List<FileDTO> fileList = new ArrayList<FileDTO>();  
		for(MultipartFile multipartFile : uploadFile) {
			fileList.add(this.fileUploadProc(multipartFile));
		}
		return fileList;
		
	}
	
	public List<FileDTO> uploadFile(List<MultipartFile> uploadFile) {
		List<FileDTO> fileList = new ArrayList<FileDTO>();  
		for(MultipartFile multipartFile : uploadFile) {
			fileList.add(this.fileUploadProc(multipartFile));
		}
		return fileList;
		
	}
	
	
	
	public FileDTO uploadFile(MultipartFile multipartFile) {
		return this.fileUploadProc(multipartFile);
	}
	
	
	
//	public ResponseEntity<Resource> downloadFile(long fileNo){
//		
//		FileDTO file = new FileDTO();
//		file.setFileNo(fileNo);
//		//dao 넣기
//		try {
//			
//			
//			return this.getResource(file);
//		} catch (MalformedURLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		//오류일경우
//		return null;
//	}
//	
//	
//	private ResponseEntity<Resource> getResource(FileDTO file) throws MalformedURLException {
//
//		String uploadFileName = file.getOrgFileName();
//	    String storeFileName = file.getStriostoredFileName();
//	    UrlResource urlResource = new UrlResource("file 경로지정:");
//
//	    String encodeUploadFileName = UriUtils.encode(uploadFileName, StandardCharsets.UTF_8);
//	    String contentDisposition = "attachment; filename=\"" + encodeUploadFileName + "\"";
//	    return ResponseEntity.ok()
//	            .header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition)
//	            .body(urlResource);
//	}
}


