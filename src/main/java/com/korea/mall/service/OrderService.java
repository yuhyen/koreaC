package com.korea.mall.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.google.common.base.CharMatcher;
import com.korea.mall.dao.BasketDAO;
import com.korea.mall.dao.OrderDAO;
import com.korea.mall.dao.ProductDAO;
import com.korea.mall.dao.UserDAO;
import com.korea.mall.dao.UserupdateDAO;
import com.korea.mall.dto.BasketDTO;
import com.korea.mall.dto.OrderDTO;
import com.korea.mall.dto.ProductDTO;
import com.korea.mall.dto.SearchDTO;
import com.korea.mall.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderService {
 private final UserupdateDAO userupdateDAO;
 private final BasketDAO basketDAO;
 @Autowired
	HttpSession session;
private final ProductDAO productDAO; 
private final OrderDAO orderDAO;
private final UserDAO userDAO;
 
 //�쉶�썝�젙蹂� �닔�젙
 public int update(UserDTO dto) {
	 return userupdateDAO.update(dto); 
 }
	
 public List<BasketDTO> selectList() {
	 BasketDTO dto =new BasketDTO();
	 UserDTO user = (UserDTO) session.getAttribute("u_id");
	 dto.setB_id(user.getU_id());
	 return basketDAO.selectList(dto);
 }
 
 public int basketInsert(String num) {
	 
	 
	 BasketDTO dto = new BasketDTO();
	 BasketDTO preDto = null;
	 int output =0;
	 UserDTO user = (UserDTO) session.getAttribute("u_id");
	 dto.setB_id(user.getU_id());
	 dto.setB_num(Integer.parseInt(num));
	 preDto = basketDAO.selectByProduct(dto);

	 //상품값 1개 있으면 
	 if(preDto != null ) {
		 //상품갯수 1개 증가후 update
		 dto = preDto;
		 dto.setB_quantity(preDto.getB_quantity() +1);
		 output = basketDAO.update(dto);
		 
	 }else {
		 //아닐경우 1로 셋팅해서 insert
		 dto.setB_quantity(1);	 
		 output = basketDAO.insert(dto);
	 }
	 
	 
	 return output;
 }

 public int delete(int idx) {
	 return basketDAO.delete(idx);
	 
 }
 
 public List<BasketDTO> selectList(String type) {
	 String[] types = type.split(",");
	int[] inttypes = Arrays.stream(types).mapToInt(Integer::parseInt).toArray();
	 
	ArrayList<Integer> typelist = new ArrayList<>(inttypes.length);
	for(int num : inttypes) {
		typelist.add(num);
	}
	
	 return  basketDAO.selectList(typelist);		
 }
 
 public List<BasketDTO> selectProduct(String pronum, int num){
	Integer p_num = Integer.parseInt(pronum);
	 ProductDTO p_dto = productDAO.selectOne(p_num);
	 BasketDTO b_dto = new BasketDTO();
	 b_dto.setB_num(p_dto.getP_num());
	 b_dto.setB_quantity(num);
	 b_dto.setB_shipping(3000);
	 b_dto.setP_color(p_dto.getP_color());
	 b_dto.setP_explain(p_dto.getP_explain());
	 b_dto.setP_id(p_dto.getP_id());
	 b_dto.setP_name(p_dto.getP_name());
	 b_dto.setP_num(p_dto.getP_num());
	 b_dto.setP_pabric(p_dto.getP_pabric());
	 b_dto.setP_picture(p_dto.getP_picture());
	 b_dto.setP_price(p_dto.getP_price());
	 b_dto.setP_size(p_dto.getP_size());
	 List<BasketDTO> list = new ArrayList<BasketDTO>();
	 list.add(b_dto);
	 return list;
 }
 	
 
 public int deleteList(List<Integer> b_idxlist) {
	 
	 return basketDAO.deleteList(b_idxlist);
 }
 
 
 
 public int insertorder(HashMap<String, Object> jsonString) {
		Object u_usernamejs = jsonString.get("u_usernamejs"); //String
		Object u_idjs = jsonString.get("u_idjs"); //String
		Object u_addresjs = jsonString.get("u_addresjs"); //String
		Object u_teljs = jsonString.get("u_teljs"); //String
		Object u_emailjs = jsonString.get("u_emailjs"); //String
		Object messagejs = jsonString.get("messagejs"); //String
		Object p_numjs = jsonString.get("p_numjs"); //int
		Object b_idxjs = jsonString.get("b_idxjs"); //int
		Object quantityjs = jsonString.get("quantityjs"); //int
		Object totaljs = jsonString.get("totaljs"); //int 
		
		ObjectMapper obj = new ObjectMapper();
		String u_username = u_usernamejs.toString();
		String u_id = u_idjs.toString();
		String u_addres = u_addresjs.toString();
		String u_tel = u_teljs.toString();
		String u_email = u_emailjs.toString();
		String message = messagejs.toString();
		List<Integer> quantity = obj.convertValue(quantityjs, TypeFactory.defaultInstance().constructCollectionType(List.class, Integer.class));
		List<Integer> p_numlist = obj.convertValue(p_numjs, TypeFactory.defaultInstance().constructCollectionType(List.class, Integer.class));
		List<Integer> b_idxlist = obj.convertValue(b_idxjs, TypeFactory.defaultInstance().constructCollectionType(List.class, Integer.class));
		
		List<ProductDTO> prodto = orderDAO.selectproList(p_numlist);
		int res = 0;
		int seq = orderDAO.selectSEQ();
		
		OrderDTO orderdto = new OrderDTO();
		
		orderdto.setO_ordernum(seq);
		orderdto.setO_addres(u_addres);
		orderdto.setO_email(u_email);
		orderdto.setO_id(u_id);
		orderdto.setO_message(message);
		orderdto.setO_name(u_username);
		orderdto.setO_tel(u_tel);
		//주문처리상태 , 구매 날자 추가해야함 sql로
		
		for(int i = 0; i < prodto.size(); i++) {
			orderdto.setO_num(prodto.get(i).getP_num());
			orderdto.setO_pabrice(prodto.get(i).getP_pabric());
			orderdto.setO_price(prodto.get(i).getP_price());
			orderdto.setO_quantity(quantity.get(i));
			orderdto.setO_size(prodto.get(i).getP_size());
			orderdto.setO_picture(prodto.get(i).getP_picture());
			orderdto.setO_proname(prodto.get(i).getP_name());
			orderdto.setO_color(prodto.get(i).getP_color());
			res = res + orderDAO.insert(orderdto);
		}
		if(b_idxlist.get(0) != 0) {
			 basketDAO.deleteList(b_idxlist);
		}
		
		String total = totaljs.toString();
		
		int pstotal = Integer.parseInt(total);
		
		int u_reserve = (int)(pstotal * 0.3);
		
		UserDTO userdto = new UserDTO();
		
		userdto.setU_id(u_id);
		userdto.setU_total(pstotal);
		userdto.setU_reserve(u_reserve);
		
		int udatetotal = orderDAO.updateTotal(userdto);
		
		return res;
		
 }
 
  public List<OrderDTO> selectOrderList(){
	  UserDTO userdto = (UserDTO)session.getAttribute("u_id");
	  
	  
	  return orderDAO.selectOrderList(userdto.getU_id());
	  
  }
 
// public List<OrderDTO> selectSearch(HashMap<String, Object> jsonString){
//	 Object enddatejs = jsonString.get("enddatejs");
//	 Object startdatejs = jsonString.get("startdatejs");
//	 Object orderstatusjs = jsonString.get("orderstatusjs");
//	 Object useridjs = jsonString.get("useridjs");
//	 
//	 String enddate = enddatejs.toString();
//	 String startdate = startdatejs.toString();
//	 String orderstatus = orderstatusjs.toString();
//	 String userid = useridjs.toString();
//
//	 if(enddate == "") {
//	 
//		 enddate = "1111-11-11";
//	 }
//	 if(startdate == "") {
//		startdate = "1111-11-11";
//		
//	 }
//	 
//	 
//	 String str = "0123456789";
//	 enddate = CharMatcher.anyOf(str).retainFrom(enddate);
//	 startdate = CharMatcher.anyOf(str).retainFrom(startdate);
//	
//		 long psenddate = Integer.parseInt(enddate);
//		 long psstartdate = Integer.parseInt(startdate);
//	 
//		 
//		 
//		 
//	 if(orderstatus.equals("--전체--")) {
//		 orderstatus = null;
//	 }
//	
//	 SearchDTO serdto = new SearchDTO(); serdto.setEnddate(psenddate);
//		  serdto.setOrderstatus(orderstatus); serdto.setStartdate(psstartdate);
//		  serdto.setUserid(userid);
//		  
//		  List<OrderDTO> orderdto = orderDAO.selectSearch(serdto);
//		 
//	 
//	 
//	 return orderdto;
// }
 
 public List<OrderDTO> selectSearch(String orderstatus, String startdate, String enddate, String userid){
	 
	 if(enddate == "") {
		 
		 enddate = "1111-11-11";
	 }
	 if(startdate == "") {
		startdate = "1111-11-11";
		
	 }
	
	 String str = "0123456789";
	 enddate = CharMatcher.anyOf(str).retainFrom(enddate);
	 startdate = CharMatcher.anyOf(str).retainFrom(startdate);
	
		 long psenddate = Integer.parseInt(enddate);
		 long psstartdate = Integer.parseInt(startdate);
	 
		 
		 
		 
	 if(orderstatus.equals("--전체--")) {
		 orderstatus = null;
	 }
	
	 	 SearchDTO serdto = new SearchDTO(); 
	 	  serdto.setEnddate(psenddate);
		  serdto.setOrderstatus(orderstatus); 
		  serdto.setStartdate(psstartdate);
		  serdto.setUserid(userid);
		  
		  List<OrderDTO> orderdto = orderDAO.selectSearch(serdto);
		 
	 
	 
	 return orderdto;
	 
 }
 
}