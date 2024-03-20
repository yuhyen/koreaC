package com.korea.mall.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.korea.mall.common.Const;
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
		
		//�슂嫄곗벐硫� was二쇱냼媛��졇�샂.
		Resource resource = resourceLoader.getResource(Const.FILE_PATH);
		String path ="";
//	    String path = request.getServletContext().getRealPath(Const.FILE_PATH);
	    String uuid = UUID.randomUUID().toString();
	    UserDTO user = (UserDTO) session.getAttribute(Const.U_SESSION_KEY);
	    //userDTO �뜑誘� set mok test
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
	    	//�엫�떆肄붾뵫
//	    	path = "C:\\Users\\admin\\git\\koreaC\\src\\main\\webapp\\resources\\file\\";
	    	path = resource.getFile().getPath();
	    	Files.createDirectories(Paths.get(path));
	    	File saveFile = new File(path, file.getStriostoredFileName());
	    	//�꽌踰꾩��옣
			multipartFile.transferTo(saveFile);
			//�뾽濡쒕뱶 �꽦怨듭떆 dao db�꽔湲�
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
//		//dao �꽔湲�
//		try {
//			
//			
//			return this.getResource(file);
//		} catch (MalformedURLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		//�삤瑜섏씪寃쎌슦
//		return null;
//	}
//	
//	
//	private ResponseEntity<Resource> getResource(FileDTO file) throws MalformedURLException {
//
//		String uploadFileName = file.getOrgFileName();
//	    String storeFileName = file.getStriostoredFileName();
//	    UrlResource urlResource = new UrlResource("file 寃쎈줈吏��젙:");
//
//	    String encodeUploadFileName = UriUtils.encode(uploadFileName, StandardCharsets.UTF_8);
//	    String contentDisposition = "attachment; filename=\"" + encodeUploadFileName + "\"";
//	    return ResponseEntity.ok()
//	            .header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition)
//	            .body(urlResource);
//	}
}


