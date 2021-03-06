package chitkara.operation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import chitkara.dao.ComplaintDao;
import chitkara.dao.UserDao;
import chitkara.db.DbConnection;
public class UserOperation {
 static PreparedStatement stmt=null;
 static Connection con=null;
 static ResultSet rs=null;
 
public static UserDao login(UserDao user)
{
	try {
		con=DbConnection.getCon();
		stmt=con.prepareStatement("select * from user where uid=? and Psw=?");
	    stmt.setString(1, user.getUid());
	    stmt.setString(2, user.getPwd());
	    rs=stmt.executeQuery();
	    if(rs.next())
	    {
	    	user.setFirst_name(rs.getString("first_name"));
	    	user.setLast_name(rs.getString("last_name"));
	    	user.setId(rs.getInt("id"));
	    	user.setUser_type(rs.getString("User_type"));
	    }
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	return user;
}
public static int addStudent(UserDao user) {
	int i=0;
	try {
		con=DbConnection.getCon();
		stmt=con.prepareStatement("insert into user(first_name,last_name,uid,Psw,User_type) values(?,?,?,?,?)");
		stmt.setString(1, user.getFirst_name());
		stmt.setString(2, user.getLast_name());
		stmt.setString(3, user.getUid());
		stmt.setString(4, user.getPwd());
		stmt.setString(5, user.getUser_type());
		i=stmt.executeUpdate();
	}catch(Exception e) {
		e.printStackTrace();
	}
	return i;
}
public static int addComplaint(ComplaintDao com)
{
    int i=0;
    try{
        con=DbConnection.getCon();
        stmt=con.prepareStatement("insert into complaint(first_name,last_name,uid,comp,status) values (?,?,?,?,?)");
        stmt.setString(1,com.getFirst_name());
        stmt.setString(2,com.getLast_name());
        stmt.setString(3,com.getUid());
        stmt.setString(4,com.getComplaint());
        stmt.setString(5,com.getStatus());
        //stmt.setString(5,com.getUser_type());
        i=stmt.executeUpdate();
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    return i;
}
    
    public static int updateComplaint(int id,String status)
    {
        int i=0;
        try{
            con=DbConnection.getCon();
            stmt=con.prepareStatement("update complaint set status=? where id=?");
            stmt.setString(1,status);
            stmt.setInt(2,id);
            i=stmt.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return i;
    }
}
