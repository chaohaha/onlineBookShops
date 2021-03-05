<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表 —— 显示所有书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toAddBook">新增</a>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书名</th>
                    <th>作者</th>
                    <th>分类</th>
                    <th>库存</th>
                    <th>单价</th>
                    <th>销量</th>
                    <th>详情</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="book" items="${requestScope.get('list')}">
                    <tr>
                        <td>${book.getBook_id()}</td>
                        <td>${book.getBook_name()}</td>
                        <td>${book.getBook_author()}</td>
                        <td>${book.getBook_category()}</td>
                        <td>${book.getBook_counts()}</td>
                        <td>${book.getBook_price()}</td>
                        <td>${book.getBook_sales()}</td>
                        <td>${book.getBook_details()}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/book/toUpdateBook?book_id=${book.getBook_id()}">更改</a> |
                            <a href="${pageContext.request.contextPath}/book/del/${book.getBook_id()}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
