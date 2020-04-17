package com.petmily.board.model.dao;

import static com.petmily.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.petmily.board.model.vo.PetSitterBoard;

import oracle.jdbc.proxy.annotation.Pre;
import sun.security.action.GetIntegerAction;

public class BoardDao2 {
   
   private Properties prop = new Properties();
   
   public BoardDao2() {
   
   try {
      String path=BoardDao2.class.getResource("/sql/board/board-query.properties").getPath();
      prop.load(new FileReader(path));
   }catch(IOException e) {
      e.printStackTrace();
   }
}
   
   public int setting(Connection conn,String userId) {
	   PreparedStatement pstmt = null;
	   int result = 0;
	   String sql = prop.getProperty("setting");
	   try {
		   pstmt=conn.prepareStatement(sql);
		   pstmt.setString(1, userId);
		   result=pstmt.executeUpdate();
	   }catch(SQLException e) {
		   e.printStackTrace();
	   }finally { 
		   close(pstmt);
	   }
	   return result;
   }
   public int boardNo(Connection conn,String userId) {
	   PreparedStatement pstmt = null;

	   ResultSet rs = null;
	   int result = 0;
	   String sql = prop.getProperty("boardNo");
	   try {
		   pstmt=conn.prepareStatement(sql);
		   pstmt.setString(1, userId);
		   rs=pstmt.executeQuery();
		   rs.next();
		   result=rs.getInt(1);
			 
		   }catch(SQLException e) {
			   e.printStackTrace();
	   }finally {
		   close(rs);
		   close(pstmt);
	   }
	   return result;
			 
   }
   public int boardInsert(Connection conn,PetSitterBoard pb) {
    
      PreparedStatement pstmt=null;
      int result = 0;
      String sql = prop.getProperty("boardInsert");
      try {
         pstmt=conn.prepareStatement(sql);
        
         pstmt.setString(1, pb.getUserId());
         pstmt.setString(2, pb.getBoardTitle());
         pstmt.setString(3, pb.getBoardInfo());
         pstmt.setInt(4,pb.getSmallPrice());
         pstmt.setInt(5,pb.getMiddlePrice());
         pstmt.setInt(6,pb.getBigPrice());
         pstmt.setString(7,pb.getBoardAddress());
         pstmt.setString(8,pb.getBoardAddressContent());
        
         result=pstmt.executeUpdate();
      
      }catch(SQLException e ) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      
      return result;
      
   }
   
   
   
   
public int boardImg(Connection conn,PetSitterBoard pb ,String img) {
     
      PreparedStatement pstmt = null;
      int result = 0;
      String sql = "";
      sql=prop.getProperty("boardImg");
      try {
    	  System.out.println("이미지no:"+pb.getBoardNo());
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1,pb.getBoardNo());
            pstmt.setString(2, img);
            result=pstmt.executeUpdate();
         
      }catch(SQLException e ) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      return result;
}

public  int addSale(Connection conn,String plus,PetSitterBoard pb,int boardNo) {
   PreparedStatement pstmt = null;
   int result = 0;
   String sql = prop.getProperty("addSale");
  
   try {
      pstmt=conn.prepareStatement(sql);
      
      pstmt.setInt(1,boardNo);
      pstmt.setString(2, plus);
      pstmt.setInt(3,pb.getSalePrice());
      result = pstmt.executeUpdate();
   }catch(SQLException e) {
      e.printStackTrace();
   }finally {
      close(pstmt);
   }
   return result;
}

public  int oldCare(Connection conn,String plus,PetSitterBoard pb,int boardNo) {
	   PreparedStatement pstmt = null;
	   int result = 0;
	   String sql =prop.getProperty("oldCare");
	   
	   try {
	      pstmt=conn.prepareStatement(sql);
	      
	      pstmt.setInt(1,boardNo);
	      pstmt.setString(2, plus);
	   	  result = pstmt.executeUpdate();
	   	      
	   }catch(SQLException e) {
	      e.printStackTrace();
	   }finally {
	      close(pstmt);
	   }
	   return result;
	}

public  int showerOn(Connection conn,String plus,PetSitterBoard pb,int boardNo) {
	   PreparedStatement pstmt = null;
	   int result = 0;
	   String sql = prop.getProperty("showerOn");
	  
	   try {
	      pstmt=conn.prepareStatement(sql);
	      
	      pstmt.setInt(1,boardNo);
	      pstmt.setString(2, plus);
	      pstmt.setInt(3, pb.getSmallPrice1());
	      pstmt.setInt(4, pb.getMiddlePrice1());
	      pstmt.setInt(5, pb.getBigPrice1());
	     
	      result = pstmt.executeUpdate();
	   }catch(SQLException e) {
	      e.printStackTrace();
	   }finally {
	      close(pstmt);
	   }
	   return result;
	}

public  int drug(Connection conn,String plus,PetSitterBoard pb,int boardNo) {
	   PreparedStatement pstmt = null;
	   int result = 0;
	   String sql = prop.getProperty("drug");
	  
	   try {
	      pstmt=conn.prepareStatement(sql);
	      
	      pstmt.setInt(1,boardNo);
	      pstmt.setString(2, plus);
	   
	      result = pstmt.executeUpdate();
	   }catch(SQLException e) {
	      e.printStackTrace();
	   }finally {
	      close(pstmt);
	   }
	   return result;
	}

public  int pickUp(Connection conn,String plus,PetSitterBoard pb,int boardNo) {
	   PreparedStatement pstmt = null;
	   int result = 0;
	   String sql = prop.getProperty("pickUp");
	  
	   try {
	      pstmt=conn.prepareStatement(sql);
	      
	      pstmt.setInt(1,boardNo);
	      pstmt.setString(2, plus);
	      pstmt.setInt(3, pb.getOneWayPrice());
	      pstmt.setInt(4, pb.getAllWayPrice());
	     
	      result = pstmt.executeUpdate();
	   }catch(SQLException e) {
	      e.printStackTrace();
	   }finally {
	      close(pstmt);
	   }
	   return result;
	}

public int defaultOption(Connection conn,String defaults,PetSitterBoard  pb,int boardNo) {
   PreparedStatement pstmt = null;
   int result = 0;
   String sql = prop.getProperty("defaultOptionInsert");
   try {
      pstmt=conn.prepareStatement(sql);
      pstmt.setInt(1, boardNo);
      pstmt.setString(2, defaults);
      result=pstmt.executeUpdate();
   }catch(SQLException e) {
      e.printStackTrace();
   }finally { 
      close(pstmt);
   }
   return result;
}

public PetSitterBoard boardDetail(Connection conn,String userId) {
   System.out.println("보드 상세 들왔음");
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   PetSitterBoard pb = null;
   String sql = prop.getProperty("boardDetail");
   
   
   try { 
      pstmt=conn.prepareStatement(sql);
      pstmt.setString(1, userId);
      rs = pstmt.executeQuery();
      
     while(rs.next()) {
        pb = new PetSitterBoard();
        pb.setBoardAddressContent(rs.getString("BOARD_ADDRESS_COMMENT"));
         pb.setBoardNo(rs.getInt("BOARD_CODE"));
         pb.setUserId(rs.getString("USER_ID"));
          pb.setBoardTitle(rs.getString("BOARD_TITLE"));
          pb.setBoardInfo(rs.getString("BOARD_INFO"));
          pb.setSmallPrice(rs.getInt("ONE_DAY_CARE_S_PRICE"));
          pb.setMiddlePrice(rs.getInt("ONE_DAY_CARE_M_PRICE"));
          pb.setBigPrice(rs.getInt("ONE_DAY_CARE_B_PRICE"));
          pb.setBoardAddress(rs.getString("BOARD_ADDRESS"));
          pb.setBoardAddressContent(rs.getString("BOARD_ADDRESS_COMMENT"));
          pb.setBoardBlind(rs.getString("BOARD_BLIND"));
        
     }
   }catch(SQLException e) {
      e.printStackTrace();
   }finally {
      close(rs);
      close(pstmt);
   }
   return pb;
}

public PetSitterBoard imgDetail(Connection conn, PetSitterBoard pb) {
      
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String sql = prop.getProperty("imgDetail");
      List<String> list = new ArrayList<String>();
      
      try { 
         pstmt=conn.prepareStatement(sql);
         pstmt.setInt(1,pb.getBoardNo());
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
           
            pb.setBoardNo(rs.getInt("BOARD_CODE"));
            list.add(rs.getString("IMG_FILENAME"));
            pb.setBoardImages(list);
           
         }
         
         
        
         
            
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      return pb;
   }

public PetSitterBoard defaultOptionDetail(Connection conn, PetSitterBoard pb) {
      
      PreparedStatement pstmt = null;
      ResultSet rs = null;
    
      String sql = prop.getProperty("defaultOptionDetail");
      List<String> list = new ArrayList<String>();
      
      try { 
         pstmt=conn.prepareStatement(sql);
         pstmt.setInt(1,pb.getBoardNo());
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            pb.setBoardNo(rs.getInt("BOARD_CODE"));
            list.add(rs.getString("DEFAULT_SERVICE_VALUES"));
         }
         pb.setServiceTypes(list);
       
            
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      return pb;
   }

public PetSitterBoard plusOptionDetail(Connection conn, PetSitterBoard pb) {
      
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String sql = prop.getProperty("plusOptionDetail");
      List<String> list = new ArrayList<String>();
 
      
      try { 
         pstmt=conn.prepareStatement(sql);
         pstmt.setInt(1,pb.getBoardNo());
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            
            
            pb.setBoardNo(rs.getInt("BOARD_CODE"));
            list.add(rs.getString("PLUS_SERVICE_VALUES"));
            pb.setPlus(list);
            	
            if(rs.getString("PLUS_SERVICE_VALUES").contains("목욕가능")==true) {
            pb.setSmallPrice1(rs.getInt("PLUS_SERVICE_SMALL_PRICE"));
            pb.setMiddlePrice1(rs.getInt("PLUS_SERVICE_MEDIUM_PRICE"));
            pb.setBigPrice1(rs.getInt("PLUS_SERVICE_BIG_PRICE"));
            }else if(rs.getString("PLUS_SERVICE_VALUES").contains("집앞픽업")==true) {
            pb.setOneWayPrice(rs.getInt("PLUS_SERVICE_ONE_WAY_PRICE"));
            pb.setAllWayPrice(rs.getInt("PLUS_SERVCIE_ROUND_TRIP_PRICE"));
            }else if(rs.getString("PLUS_SERVICE_VALUES").contains("추가할인")==true) {
            pb.setSalePrice(rs.getInt("PLUS_SERVICE_SAIL_PRICE"));
            }
         }
         System.out.println("dao 보드상세 :" +pb);
         	
            
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      return pb;
   }

public PetSitterBoard boardUpdate(Connection conn,String userId) {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	PetSitterBoard pb = null;
	String sql = prop.getProperty("boardUpdate");
	
	try { 
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userId);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
				  pb = new PetSitterBoard();
				  pb.setBoardNo(rs.getInt("BOARD_CODE"));
				  pb.setUserId(rs.getString("USER_ID"));
				  pb.setBoardTitle(rs.getString("BOARD_TITLE"));
				  pb.setBoardInfo(rs.getString("BOARD_INFO"));
				  pb.setSmallPrice(rs.getInt("ONE_DAY_CARE_S_PRICE"));
		          pb.setMiddlePrice(rs.getInt("ONE_DAY_CARE_M_PRICE"));
		          pb.setBigPrice(rs.getInt("ONE_DAY_CARE_B_PRICE"));
		          pb.setBoardAddress(rs.getString("BOARD_ADDRESS"));
		          pb.setBoardAddressContent(rs.getString("BOARD_ADDRESS_COMMENT"));
		          pb.setBoardBlind(rs.getString("BOARD_BLIND"));
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}finally { 
		close(rs);
		close(pstmt);
	}
	return pb;
}

public PetSitterBoard imgUpdate(Connection conn,PetSitterBoard pb) {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<String> list = new ArrayList<String>();
	String sql = prop.getProperty("");
	
	try {
		pstmt=conn.prepareStatement(sql);
	    pstmt.setInt(1,pb.getBoardNo());
		rs=pstmt.executeQuery();
		 while(rs.next()) {
	           
	            pb.setBoardNo(rs.getInt("BOARD_CODE"));
	            list.add(rs.getString("IMG_FILENAME"));
	            System.out.println("이미지업뎃:" +list);
	         }
	         pb.setBoardImages(list);
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
		close(rs);
		close(pstmt);
	}
	return pb;
}

public PetSitterBoard plusOptionUpdate(Connection conn, PetSitterBoard pb) {
    
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    String sql = prop.getProperty("plusOptionDetail");
    List<String> list = new ArrayList<String>();
    
    try { 
       pstmt=conn.prepareStatement(sql);
       pstmt.setInt(1,pb.getBoardNo());
       rs = pstmt.executeQuery();
       
       while(rs.next()) {
          
          
          pb.setBoardNo(rs.getInt("BOARD_CODE"));
          list.add(rs.getString("PLUS_SERVICE_VALUES"));
          pb.setSmallPrice1(rs.getInt("PLUS_SERVICE_SMALL_PRICE"));
          pb.setMiddlePrice1(rs.getInt("PLUS_SERVICE_MEDIUM_PRICE"));
          pb.setBigPrice1(rs.getInt("PLUS_SERVICE_BIG_PRICE"));
          pb.setOneWayPrice(rs.getInt("PLUS_SERVICE_ONE_WAY_PRICE"));
          pb.setAllWayPrice(rs.getInt("PLUS_SERVCIE_ROUND_TRIP_PRICE"));
          pb.setSalePrice(rs.getInt("PLUS_SERVICE_SAIL_PRICE"));
         
          
       }
       pb.setPlus(list);
       System.out.println("플러스업뎃:"+list);
          
    }catch(SQLException e) {
       e.printStackTrace();
    }finally {
       close(rs);
       close(pstmt);
    }
    return pb;
 }

public PetSitterBoard defaultOptionUpdate(Connection conn, PetSitterBoard pb) {
    
    PreparedStatement pstmt = null;
    ResultSet rs = null;
  
    String sql = prop.getProperty("defaultOptionDetail");
    List<String> list = new ArrayList<String>();
    
    try { 
       pstmt=conn.prepareStatement(sql);
       pstmt.setInt(1,pb.getBoardNo());
       rs = pstmt.executeQuery();
       
       while(rs.next()) {
          
          pb.setBoardNo(rs.getInt("BOARD_CODE"));
          list.add(rs.getString("DEFAULT_SERVICE_VALUES"));
          
       }
       pb.setServiceTypes(list);
       System.out.println("기본업뎃:"+list);
          
    }catch(SQLException e) {
       e.printStackTrace();
    }finally {
       close(rs);
       close(pstmt);
    }
    return pb;
 }



}
   
