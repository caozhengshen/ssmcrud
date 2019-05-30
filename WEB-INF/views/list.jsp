<%--
  Created by IntelliJ IDEA.
  User: 26089
  Date: 2019/5/14
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>员工列表</title>
    <%
        //拿到当前项目名： /ssmcrud
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <%--基于服务器的相对路径，全路径是：http://localhost:3306/项目名/static/js/jquery-1.12.4.min.js--%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--页面--%>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-success">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <th>${emp.empId}</th>
                        <th>${emp.empName}</th>
                        <th>${emp.gender}</th>
                        <th>${emp.email}</th>
                        <th>${emp.department.deptName}</th>
                        <th>
                            <button class="btn btn-success btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                编辑
                            </button>
                        </th>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
    <%--分页--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6">
            当前${pageInfo.pageNum}页，总共${pageInfo.pages}页,共${pageInfo.total}条纪录
        </div>
            <%--分页条--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH}/emps?p=1">首页</a></li>
                    <%--如果有上一页，才显示。没有不显示--%>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/emps?p=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <%--展示分页页数--%>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                        <%--当前页高亮显示--%>
                        <c:if test="${page_num==pageInfo.pageNum}">
                            <li class="active"><a href="#">${page_num}</a></li>
                        </c:if>
                        <%--非当前页普通显示，给一个超链接跳转--%>
                        <c:if test="${page_num !=pageInfo.pageNum}">
                            <li ><a href="${APP_PATH}/emps?p=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>

                    <%--有下一页才显示，没有不显示--%>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/emps?p=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <li><a href="${APP_PATH}/emps?p=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>

</body>
</html>
