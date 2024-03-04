package com.korea.mall.service;

import java.io.File;
import java.net.MalformedURLException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriUtils;

import com.korea.mall.common.Const;
import com.korea.mall.dto.FileDTO;
import com.korea.mall.dto.UserDTO;



public class CommonService {
	
	@Autowired
	HttpSession session;
	
	
	private FileDTO fileUploadProc(MultipartFile multipartFile) {
		
	    String path = Const.FILE_PATH;
	    String uuid = UUID.randomUUID().toString();
	    UserDTO user = (UserDTO) session.getAttribute(Const.U_SESSION_KEY);
	    FileDTO file = new FileDTO();
	    file.setDelYn("N");
	    file.setStriostoredFileName(uuid);
	    file.setRegUser(user.getU_idx());
	    file.setUpdUser(user.getU_idx());
	    file.setOrgFileName(multipartFile.getOriginalFilename());
	    file.setFileSize(multipartFile.getSize());
	    
	    File saveFile = new File(path, file.getStriostoredFileName());
	    
	    try {
	    	
	    	//서버저장
			multipartFile.transferTo(saveFile);
			//dao db넣기
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	    
	    return file;
	}
	
	public List<FileDTO> uploadFile(MultipartFile[] uploadFile) {
		List<FileDTO> fileList = new ArrayList<FileDTO>();  
		for(MultipartFile multipartFile : uploadFile) {
//			log.info("----------------------------");
//			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
//			log.info("Upload File Size: " + multipartFile.getSize());
			fileList.add(this.fileUploadProc(multipartFile));
		}
		return fileList;
		
	}
	
	public FileDTO uploadFile(MultipartFile multipartFile) {
		return this.fileUploadProc(multipartFile);
	}
	
	
	
	public ResponseEntity<Resource> downloadFile(long fileNo){
		
		FileDTO file = new FileDTO();
		file.setFileNo(fileNo);
		//dao 넣기
		
		
		try {
			
			
			return this.getResource(file);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//오류일경우
		return null;
	}
	
	
	private ResponseEntity<Resource> getResource(FileDTO file) throws MalformedURLException {

		String uploadFileName = file.getOrgFileName();
	    String storeFileName = file.getStriostoredFileName();
	    UrlResource urlResource = new UrlResource("file 경로지정:");

	    String encodeUploadFileName = UriUtils.encode(uploadFileName, StandardCharsets.UTF_8);
	    String contentDisposition = "attachment; filename=\"" + encodeUploadFileName + "\"";
	    return ResponseEntity.ok()
	            .header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition)
	            .body(urlResource);
	}
}


