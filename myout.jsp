<!-- myout.jsp -->
<%@ page language="java" 
contentType="text/html;charset=UTF-8" %>
<%@ page 
import="java.sql.*,java.net.URLEncoder,java.util.*" %>
<%
    Connection conn = null;
    String id = request.getParameter("id");
    String goods = new String(request.getParameter("goods").getBytes("ISO-8859-1"), "UTF-8");
    String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
    String date = request.getParameter("date");
    String state = new String(request.getParameter("state").getBytes("ISO-8859-1"), "UTF-8");
    String price = request.getParameter("price");
    String num = request.getParameter("num");
    String customer = new String(request.getParameter("customer").getBytes("ISO-8859-1"), "UTF-8");
    String dbUrl = 
    "jdbc:mysql://39.108.222.163/term?serverTimezone=CST&useUnicode=true&characterEncoding=UTF8"; // MySQL 资料库连接字串
    String WK_Message = "";
    String SQLString = "insert into myout values('";
    SQLString += id + "', '" + name + "', '" + date + 
    "', '" + state + "', '" + price + "', '" + num + 
    "', '" + customer + "','" + goods + "')";
    String[] WK_Data = new String[8]; 
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // 载入jdbc驱动工具
        conn = DriverManager.getConnection(dbUrl, "root", "password"); // 建立资料库连线
        if(conn != null) {
            Statement stat = conn.createStatement();
            stat.execute(SQLString);
            SQLString = "select * from myout where id='" + id + "'";
            ResultSet rs = stat.executeQuery(SQLString);
            if(rs.next()) {
                WK_Data[0] = rs.getString("id");
                WK_Data[1] = rs.getString("goods");
                WK_Data[2] = rs.getString("name");
                WK_Data[3] = rs.getString("date");
                WK_Data[4] = rs.getString("state");
                WK_Data[5] = rs.getString("price");
                WK_Data[6] = rs.getString("num");
                WK_Data[7] = rs.getString("customer");
            }
            rs.close();
            stat.close();
            conn.close(); // 关闭资料库连线
            WK_Message = "新增出货单成功";
        } else {
            WK_Message = "资料库连线未建立";
        }
    } catch(Exception ex) {
        WK_Message = "新增出货单失败" + ex;
    }
%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>出货管理系统</title>
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
                    <li class="active">
                        <a href="myout.html"><i class="ti-panel"></i> 出货管理系统</a>
                    </li>
                    <li>
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
                    <form name="form1" method="POST" action="UpdateDataOut.jsp">
                    <table width="85%" border="0">
                        <tr>
                        <td align="right" width="25%"><font>单号：</font></td>
                        <td align="left" bgcolor="#CCFFFF"><%= WK_Data[0] %></td>
                        </tr>
                        <tr>
                        <td align="right" width="25%"><font>品名：</font></td>
                        <td align="left" bgcolor="#CCFFFF"><%= WK_Data[1] %></td>
                        </tr>
                        <tr>
                        <td align="right" width="25%"><font>经办人：</font></td>
                        <td align="left" bgcolor="#CCFFFF"><%= WK_Data[2] %></td>
                        </tr>
                        <tr>
                        <td align="right" width="25%"><font>日期：</font></td>
                        <td align="left" bgcolor="#CCFFFF"><%=WK_Data[3]%></td>
                        </tr>
                        <tr>
                        <td align="right" width="25%"><font>支付情况：</font></td>
                        <td align="left" bgcolor="#CCFFFF"><%=WK_Data[4]%></td>
                        </tr>
                        <tr>
                        <td align="right" width="25%"><font>价格：</font></td>
                        <td align="left" bgcolor="#CCFFFF"><%=WK_Data[5]%></td>
                        </tr>
                        <tr>
                        <td align="right" width="25%"><font>数量：</font></td>
                        <td align="left" bgcolor="#CCFFFF"><%=WK_Data[6]%></td>
                        </tr>
                        <tr>
                        <td align="right" width="25%" ><font>客户：</font></td>
                        <td align="left" bgcolor="#CCFFFF"><%=WK_Data[7]%></td>
                        </tr>
                    </table>
                    <div class="row" style="margin-top: 2%">
                        <center>
                            <%=WK_Message%>
                        </center>
                    </div>
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