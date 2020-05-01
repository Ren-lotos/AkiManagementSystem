<!-- SelectData2.jsp -->
<%@ page language="java" 
contentType="text/html;charset=UTF-8" %>
<%@ page 
import="java.sql.*,java.net.URLEncoder,java.util.*" %>
<%
    String id = request.getParameter("id");
    String dbUrl = 
    "jdbc:mysql://39.108.222.163/term?serverTimezone=CST&useUnicode=true&characterEncoding=UTF8"; // MySQL 资料库连接字串
    String SQLString = "select * from myout";
    Connection conn = null; 
    if((id.trim().length() > 0) && (!id.trim().equals("*"))) {
        SQLString = SQLString + " where id='" + id + "'";
    } 

%>
<html lang="utf-8">
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
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // 载入jdbc驱动工具
        conn = DriverManager.getConnection(dbUrl, "root", "password"); // 建立资料库连线
        int i = 0; 
        if(conn != null) {
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(SQLString);
            out.println("查询结果列表");
            out.println("<table border='1' cellpadding='0' cellspacing='0' width='100%' bordercolor='#FFFFFF'>");
            out.println(" <tr bgcolor='#0033CC' height='35'>");
            out.println(" <td width='5%'  align='center'><font color='#FFFFFF'>序号</font></td>");
            out.println(" <td width='5%'  align='center'><font color='#FFFFFF'>单号</font></td>");
            out.println(" <td width='10%' align='center'><font color='#FFFFFF'>品名</font></td>");
            out.println(" <td width='10%' align='center'><font color='#FFFFFF'>经办人</font></td>");
            out.println(" <td width='10%'align='center'><font color='#FFFFFF'>日期</font></td>");
            out.println(" <td width='10%' align='center'><font color='#FFFFFF'>支付情况</font></td>");
            out.println(" <td width='10%'align='center'><font color='#FFFFFF'>进价</font></td>");
            out.println(" <td width='10%' align='center'><font color='#FFFFFF'>数量</font></td>");
            out.println(" <td width='10%' align='center'><font color='#FFFFFF'>客户</font></td>");
            out.println(" <td width='10%' align='center'><font color='#FFFFFF'></font></td>");
            out.println(" </tr>"); 
            while(rs.next()) {
                i++;
                out.println(" <tr height='35'  bgcolor='#CCFFFF' onMouseOver=\"this.style.backgroundColor='#FFCC00';this.style.cursor='hand';\" onMouseOut=\"this.style.backgroundColor='#CCFFFF';\">");
                out.println(" <td align='center'>" + i + "</td>");
                out.println(" <td align='center'>" +  rs.getString("id") + "</td>");
                out.println(" <td align='center'>" +  rs.getString("goods") + "</td>");
                out.println(" <td align='center'>" +  rs.getString("name") + "</td>");
                out.println(" <td align='center'>" + rs.getString("date") + "</td>");
                out.println(" <td align='center'>" + rs.getString("state") + "</td>");
                out.println(" <td align='center'>" +  rs.getString("price") + "</td>");
                out.println(" <td align='center'>" +  rs.getString("num") + "</td>");
                out.println(" <td align='center'>" +  rs.getString("customer") + "</td>");
                out.println(" <td align='center'> <a href='UpdateDataOut.jsp?id=" +  rs.getString("id") + "'>修改</a> <a href='DeleteDataOut.jsp?id=" +  rs.getString("id") + "'>删除</a></td>");
                out.println(" </tr>");
            } 
            rs.close();
            stat.close();
            conn.close();
            out.println("</table></center>");
        } else {
            out.println("资料库连线失败");
        }
    } catch(Exception ex) {
        out.println("资料库查询资料失败");
    }
%>
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