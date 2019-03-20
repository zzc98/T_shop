import java.sql.*;

public class test {
    public static void main(String[] args) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        //1、注册驱动
        try {
            Class.forName("com.mysql.jdbc.Driver");//注册一个类 //使用什么驱动连接数据库
            //2、建立连接
            String url = "jdbc:mysql://localhost:3306/test0";
            String user = "root";
            String password = "";
            con = DriverManager.getConnection(url, user, password);
            //3、发起请求
            stmt = con.createStatement();//statement用来发起请求
            rs = stmt.executeQuery("select * from user");//方法返回一个查询的结果集ResultSet,executexxx
            //4、对结果集进行处理
            while (rs.next()) {//next用来查询rs中是否还有数据，一次取一行得数据
                System.out.println(rs.getString("name") + "," + rs.getString("password"));
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }
}