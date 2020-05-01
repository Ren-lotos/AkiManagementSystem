<!-- mystore.jsp -->
<%@ page language="java" 
contentType="text/html;charset=UTF-8" %>
<%@ page 
import="java.sql.*,java.net.URLEncoder,java.util.*" %>
<%
String GOODS = request.getParameter("goods");
String SNUM = request.getParameter("snum");
String MYNUM = request.getParameter("mynum");
String GIFTNUM = request.getParameter("giftnum");
String BRONUM = request.getParameter("bronum");
String dbUrl = "jdbc:mysql://39.108.222.163:3306/term?serverTimezone=CST"; 
String SQLString1 = "select SUM(num) as A FROM myin where goods = 'A' group by goods";
String SQLString1b = "select SUM(num) as B FROM myin where goods = 'B' group by goods";
String SQLString2 = "select SUM(num) as A FROM myout where goods = 'A' group by goods";
String SQLString2b = "select SUM(num) as B FROM myout where goods = 'B' group by goods";
Connection conn = null;
int innum = 0;
int outnum =0;
int t1=0,t2=0,b1=0,b2=0;
int SA,SB;
	//in
	try 
	{
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		conn = DriverManager.getConnection(dbUrl, "root", "password"); // 建建資資資資建
		int i = 0;
		
		if(conn != null) {
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(SQLString1);
			while(rs.next()) {
				innum = rs.getInt("A");
			}
			t1=innum;
			rs.close();
			stat.close();
			conn.close();
		} 
		else 
		{
			out.println("资料库查询失败");}
		} 
	catch(Exception ex) 
	{
		out.println(innum + "资料库连线失败" +ex);
	}
	try 
	{
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		conn = DriverManager.getConnection(dbUrl, "root", "password"); // 建建資資資資建
		int i = 0;
		
		if(conn != null) {
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(SQLString2);
			while(rs.next()) {
				outnum = rs.getInt("A");
			}
			t2=outnum;
			rs.close();
			stat.close();
			conn.close();
		} 
		else 
		{
			out.println("资料库查询失败");}
		} 
	catch(Exception ex) 
	{
		out.println(innum + "资料库连线失败" +ex);
	}
	
	SA=t1-t2;
	
	try 
	{
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		conn = DriverManager.getConnection(dbUrl, "root", "password"); // 建建資資資資建
		int i = 0;
		
		if(conn != null) {
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(SQLString1b);
			while(rs.next()) {
				innum = rs.getInt("B");
			}
			b1=innum;
			rs.close();
			stat.close();
			conn.close();
		} 
		else 
		{
			out.println("资料库查询失败");}
		} 
	catch(Exception ex) 
	{
		out.println(innum + "资料库连线失败" +ex);
	}
	try 
	{
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		conn = DriverManager.getConnection(dbUrl, "root", "password"); // 建建資資資資建
		int i = 0;
		
		if(conn != null) {
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(SQLString2b);
			while(rs.next()) {
				outnum = rs.getInt("B");
			}
			b2=outnum;
			rs.close();
			stat.close();
			conn.close();
		} 
		else 
		{
			out.println("资料库查询失败");}
		} 
	catch(Exception ex) 
	{
		out.println(innum + "资料库连线失败" +ex);
	}
	
	SB=b1-b2;
	//进行insert insert * from  where goods = a 
	// insert 
	
	try {
Class.forName("com.mysql.cj.jdbc.Driver"); 
conn = DriverManager.getConnection(dbUrl, "root", 
"password"); 
if(conn != null) {
Statement stat = conn.createStatement();
ResultSet rs = stat.executeQuery("select * from mysave");
stat.executeUpdate("delete from mysave where goods='A'");
stat.executeUpdate("delete from mysave where goods='B'");
stat.close();
conn.close(); // 關關資資資資建
} else {
out.println("资料库未建立<br>");
}
} catch(Exception ex) {
out.println("资料库连接失败<br>");
out.println(ex);
}
	try {
		String dbqUrl ="jdbc:mysql://39.108.222.163:3306/term?serverTimezone=CST";
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		conn = DriverManager.getConnection(dbUrl, "root", 
		"password");
		if(conn != null) {
		Statement stat = conn.createStatement();
		String stat_insert="Insert into mysave values('"+"A"+"','"+ SA + "',0,0,0)";
		String stat_insert2="Insert into mysave values('"+"B"+"','"+ SB + "',0,0,0)";
		stat.execute(stat_insert);
		stat.execute(stat_insert2);
		stat.close();
		conn.close(); // 關關資資資資建
		} else {
		out.println("资料库连线失败<br>");
		}
		} catch(Exception ex) {
			out.println("新增资料失败<br>");
			out.println(ex);
		}
	String SQLString3 = "select * FROM mysave";
	//测试。


		
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <!-- ================= Favicon ================== -->
    <!-- Standard -->
    <link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
    <!-- Retina iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="144x144" href="http://placehold.it/144.png/000/fff">
    <!-- Retina iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="114x114" href="http://placehold.it/114.png/000/fff">
    <!-- Standard iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="72x72" href="http://placehold.it/72.png/000/fff">
    <!-- Standard iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="57x57" href="http://placehold.it/57.png/000/fff">
    <!-- Styles -->
    <link href="assets/fontAwesome/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="assets/css/lib/themify-icons.css" rel="stylesheet">
    <link href="assets/css/lib/mmc-chat.css" rel="stylesheet" />
    <link href="assets/css/lib/sidebar.css" rel="stylesheet">
    <link href="assets/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/lib/nixon.css" rel="stylesheet">
    <link href="assets/lib/lobipanel/css/lobipanel.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>
    <div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
        <div class="nano">
            <div class="nano-content">
                <ul>
                    <li>
                        <a href="index.html"><i class="ti-home"></i> 管理系统</a>
                    </li>
                    <li>
                    	<a href="myin.html"><i class="ti-layout-grid2-alt"></i> 进货管理系统</a>
                    </li>
                    <li>
                        <a href="myout.html"><i class="ti-panel"></i> 出货管理系统</a>
                    </li>
                    <li class="active">
                        <a href="mystore.html"><i class="ti-layout-grid4-alt"></i> 仓储管理系统</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- /# sidebar -->
    <div class="header">
        <div class="pull-left">
            <div class="logo">
                <a href="index.html">
                    <img id="logoImg" src="logo/logo.png" data-logo_big="logo/logo.png" data-logo_small="logo/logoSmall.png" alt="Nixon" />
                </a>
            </div>
        </div>
        <div class="pull-right p-r-15">
            <ul>
                <li class="header-icon dib">
                	<span class="user-avatar">Welcome you</span>
                </li>
            </ul>
        </div>
    </div>
    <div class="content-wrap">
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                </div>
                <!-- /# row -->
                <div class="main-content">
<%
	try 
	{
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		conn = DriverManager.getConnection(dbUrl, "root", "password"); // 建立资料库连接
		if(conn != null) 
		{
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(SQLString3);
			out.println("<center>查询结果列表</center>");
			out.println("<table border='1' cellpadding='0' cellspacing='0' width='100%' bordercolor='#FFFFFF'>");
			out.println(" <tr bgcolor='#0033CC' height='35'>");
			out.println(" <td width='5%' align='center'><fontcolor='#FFFFFF'>品名</font></td>");
			out.println(" <td width='10%' align='center'><fontcolor='#FFFFFF'>总数量</font></td>");
			out.println(" <td width='10%' align='center'><fontcolor='#FFFFFF'>己用数量</font></td>");
			out.println(" <td width='10%' align='center'><fontcolor='#FFFFFF'>赠送数量</font></td>");
			out.println(" <td width='10%' align='center'><fontcolor='#FFFFFF'>报损数量</font></td>");
			out.println(" </tr>"); 
		while(rs.next()) 
		{

			out.println(" <tr height='35' bgcolor='#CCFFFF'onMouseOver=\"this.style.backgroundColor='#FFCC00';this.style.cursor='hand';\" onMouseOut=\"this.style.backgroundColor='#CCFFFF';\">");
			out.println(" <td align='center'>" + rs.getString("GOODS") + "</td>");
			out.println(" <td align='center'>" + rs.getString("NUM") + "</td>");
			out.println(" <td align='center'>" + rs.getString("MYNUM") + "</td>");
			out.println(" <td align='center'>" + rs.getString("GIFTNUM") + "</td>");
			out.println(" <td align='center'>" + rs.getString("BRONUM") + "</td>");
		} 
		rs.close();
		stat.close();
		conn.close();
		out.println("</table>");
		} 
		else 
		{
			out.println("资料库连接失败");
		}
	} 
	catch(Exception ex) 
	{
		out.println("资料库查询资料失败");
		out.println(ex);
	}   
%>
                    <!-- /# row -->
                    <div class="row">
                        
                    </div>
                 </div>
                 <!-- /# card -->
            </div>
             <!-- /# column -->
        </div> 
    </div>
 </div>
 <!-- /# container-fluid -->
</div>
<!-- /# main -->
</div>



<!-- /# content wrap -->
<script src="assets/js/lib/jquery.min.js"></script>
<!-- jquery vendor -->
<script src="assets/js/lib/jquery.nanoscroller.min.js"></script>
<!-- nano scroller -->
<script src="assets/js/lib/sidebar.js"></script>
<!-- sidebar -->
<script src="assets/js/lib/bootstrap.min.js"></script>
<!-- bootstrap -->
<script src="assets/js/lib/mmc-common.js"></script>
<script src="assets/js/lib/mmc-chat.js"></script>
<!--  Chart js -->
<script src="assets/js/lib/chart-js/Chart.bundle.js"></script>
<script src="assets/js/lib/chart-js/chartjs-init.js"></script>
<!-- // Chart js -->
<!--  Datamap -->
<script src="assets/js/lib/datamap/d3.min.js"></script>
<script src="assets/js/lib/datamap/topojson.js"></script>
<script src="assets/js/lib/datamap/datamaps.world.min.js"></script>
<script src="assets/js/lib/datamap/datamap-init.js"></script>
<script src="assets/lib/lobipanel/js/lobipanel.js"></script>
<!-- // Datamap -->
<script src="assets/js/scripts.js"></script>
<!-- scripit init-->
<script>
    $(document).ready(function() {
        $('#lobipanel-custom-control').lobiPanel({
            reload: false,
            close: false,
            editTitle: false
        });
    });
</script>
</body>

</html>