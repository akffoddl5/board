/**
 * create table member(
    id varchar2(50) primary key,
    pw varchar2(50) not null,
    name varchar2(50) not null,
    phone1 varchar2(50) not null,
    phone2 varchar2(50) not null,
    phone3 varchar2(50) not null,
    email varchar2(200) not null,
    zipcode varchar2(400) not null,
    address1 varchar2(150) not null,
    address2 varchar2(150) not null
);
select* from member;
insert into member values('red','red','red','red','red','red','red','red','red','red');
commit;
select* from tab;

create table zipcode(
    seq number(10,0) primary key,
    zipcode varchar2(50) not null,
    sido varchar2(90),
    gugun varchar2(90),
    dong varchar2(90) ,
    ri varchar2(90) ,
    bunji varchar2(90) 
);
drop table zipcode;
select* from zipcode;

commit;
select* from zipcode where sido like '%�꽍�닔%' or gugun like
 '%�꽍�닔%' or dong like '%�꽍�닔%' or ri like '%�꽍�닔%';
 
 create table board(
 bNum number(7,0) primary key,
 bWriter varchar2(50) not null,
 bSubject varchar2(80) not null,
 bReadCount number(5,0) default 0 not null,
 bRef number(5,0) default 0 not null,
 bStep number(5,0) default 0 not null,
 bDepth number(5,0) default 0 not null,
 bRegDate timestamp (6) default sysdate not null,
 bContent varchar2(4000) not null,
 bIp varchar2(30) not null
 );
 
 create sequence board_seq
 start with 1
 increment by 1
 nomaxvalue
 nocache
 nocycle;

select rownum, bNum from board;

select count(*) as countA from  board;

insert into board (bNum,bwriter,bsubject,bcontent,bip) values (1,'red','red','red','red');

commit;

create sequence board_seq;

select* from board;

update board set bReadCount=bReadCount+1 where bNum = 1;

rollback;


select* from (
select rownum as rnum ,bnum,bwriter,bsubject,breadcount,bref,bstep,bdepth,bregdate,bcontent,bip from board order by bNum desc
)where rnum<=5;


 */
package com.java.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {
	
	private static DAO instance;
	
	private DAO() {}
	
	public static synchronized DAO GetInstance() {
		if(instance==null) {
			instance=new DAO();
		}
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		try {
		Context init = new InitialContext();
		DataSource dataSource = (DataSource)(init.lookup("java:comp/env/jdbc/myRed"));
		conn = dataSource.getConnection();
		
		
		}catch(Exception e) {
			System.out.println("get Connection Fail");
			e.printStackTrace();
		}
		return conn;
	}
	
	public boolean idCheck(String id) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		boolean check= false;
		try {
			conn=getConnection();
			
			String sql = "select * from member where id = ?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check= false;
			}else {
				check= true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();}catch(SQLException sqle) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn!=null) try {conn.close();}catch(SQLException sqle3) {}
		}
		return check;
		
	}
	
	public ArrayList<ZipDTO> getZipcode(String search){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ZipDTO> list = new ArrayList<ZipDTO>();
		try {
			conn = getConnection();
			String sql = "select * from zipcode where sido like '%"+search+"%' or gugun like " + 
					" '%"+search+"%' or dong like '%"+search+"%' or ri like '%"+search+"%' ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZipDTO zipDTO = new ZipDTO();
				zipDTO.setSeq(rs.getString("seq"));
				zipDTO.setZipcode(rs.getString("zipcode"));
				zipDTO.setSido(rs.getString("sido"));
				zipDTO.setGugun(rs.getString("gugun"));
				zipDTO.setDong(rs.getString("ri"));
				zipDTO.setBunji(rs.getString("bunji"));
				
				list.add(zipDTO);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();}catch(SQLException sqle) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn!=null) try {conn.close();}catch(SQLException sqle3) {}
		}
		
		
		return list;
	}
	
	public boolean joinService(MemberDTO memberDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = -1;
		try {
			conn=getConnection();
			String sql = "insert into member values "
					+ "(?,?,?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			pstmt.setString(2, memberDTO.getPw());
			pstmt.setString(3, memberDTO.getName());
			pstmt.setString(4, memberDTO.getPhone1());
			pstmt.setString(5, memberDTO.getPhone2());
			pstmt.setString(6, memberDTO.getPhone3());
			pstmt.setString(7, memberDTO.getEmail());
			pstmt.setString(8, memberDTO.getZipcode());
			pstmt.setString(9, memberDTO.getAddress1());
			pstmt.setString(10, memberDTO.getAddress2());
			check = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();} catch (SQLException e) {}
			if(conn!=null) try {conn.close();} catch (SQLException e) {}
		}
		
		if(check==1) return true;
		else return false;
	}
	
	public int loginService(String id,String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;
		try {
			conn=getConnection();
			String sql = "select * from member "
					+ "where id = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("pw").equals(pw)) {
					check=1;
				}else {
					check=-1;
				}
			}else {
				check=0;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();} catch (SQLException e) {}
			if(conn!=null) try {conn.close();} catch (SQLException e) {}
		}
		return check;
	}
	
	public MemberDTO getMemberDTO(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO memberDTO = new MemberDTO();
		try {
			conn= getConnection();
			String sql = "select* from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPw(rs.getString("pw"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setPhone1(rs.getString("phone1"));
				memberDTO.setPhone2(rs.getString("phone2"));
				memberDTO.setPhone3(rs.getString("phone3"));
				memberDTO.setEmail(rs.getString("email"));
				memberDTO.setZipcode(rs.getString("zipcode"));
				memberDTO.setAddress1(rs.getString("address1"));
				memberDTO.setAddress2(rs.getString("address2"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch (SQLException e) {}
			if(conn!=null) try {conn.close();} catch (SQLException e) {}
		}
		return memberDTO;
	}
	
	public int getBoardCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		try {
			conn = getConnection();
			String sql = "select count(*) as countA from  board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = Integer.parseInt(rs.getString("countA"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch (SQLException e) {}
			if(conn!=null) try {conn.close();} catch (SQLException e) {}
		}
		
		return cnt;
	}
	
	public ArrayList<BoardDTO> getAllBoard(int start , int end){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			conn = getConnection();
			String sql = "select* from( " + 
					"select rownum as rNum ,bnum,bwriter,bsubject,breadcount,bref,bstep,bdepth,bregdate,bcontent,bip from( " + 
					"select * from board order by bnum desc) " +  
					")where rnum>= ? and rnum<= ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setbNum(Integer.parseInt(rs.getString("bNum")));
				boardDTO.setrNum(rs.getInt("rNum"));
				boardDTO.setbWriter(rs.getString("bWriter"));
				boardDTO.setbSubject(rs.getString("bSubject"));
				boardDTO.setbReadCount(rs.getInt("bReadCount"));
				boardDTO.setbRef(rs.getInt("bRef"));
				boardDTO.setbStep(rs.getInt("bStep"));
				boardDTO.setbDepth(rs.getInt("bDepth"));
				boardDTO.setbRegDate(rs.getTimestamp("bRegDate"));
				boardDTO.setbContent(rs.getString("bContent"));
				boardDTO.setbIp(rs.getString("bIp"));
				list.add(boardDTO);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch (SQLException e) {}
			if(conn!=null) try {conn.close();} catch (SQLException e) {}
		}
		
		return list;
	}
	
	public BoardDTO getBoard(int bNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO boardDTO = new BoardDTO();
		try {
			conn = getConnection();
			String sql = "select * from  board where bNum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				boardDTO.setbNum(rs.getInt("bNum"));
				boardDTO.setbWriter(rs.getString("bWriter"));
				boardDTO.setbSubject(rs.getString("bSubject"));
				boardDTO.setbReadCount(rs.getInt("bReadCount"));
				boardDTO.setbRef(rs.getInt("bRef"));
				boardDTO.setbStep(rs.getInt("bStep"));
				boardDTO.setbDepth(rs.getInt("bDepth"));
				boardDTO.setbRegDate(rs.getTimestamp("bRegDate"));
				boardDTO.setbContent(rs.getString("bContent"));
				boardDTO.setbIp(rs.getString("bIp"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch (SQLException e) {}
			if(conn!=null) try {conn.close();} catch (SQLException e) {}
		}
		
		return boardDTO;
	}
	
	public boolean insertBoard(String id,String subject,String content,String ip) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean check = false;
		try {
			conn = getConnection();
			String sql = "insert into board (BNum,bWriter,bSubject,bContent,bIp) values(board_seq.nextVal,?,?,?,?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setString(4, ip);
			int update = pstmt.executeUpdate();
			
			if(update==1) {
				check=true;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();} catch (SQLException e) {}
			if(conn!=null) try {conn.close();} catch (SQLException e) {}
		}
		
		return check;
	}
	
	public void upCountBoard(String bNum) {
		System.out.println("upcount exe");
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "update board set bReadCount=bReadCount+1 where bNum = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,Integer.parseInt(bNum));
		
			pstmt.executeUpdate();
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();} catch (SQLException e) {}
			if(conn!=null) try {conn.close();} catch (SQLException e) {}
		}
		
		
	}
	
	public void updateBoard(String bNum,String subject,String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "update board set bReadCount=bReadCount+1 where bNum = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,Integer.parseInt(bNum));
		
			pstmt.executeUpdate();
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();} catch (SQLException e) {}
			if(conn!=null) try {conn.close();} catch (SQLException e) {}
		}
		
	}
	

}
