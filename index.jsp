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
<%--修改模态框--%>
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >员工修改</h4>
            </div>
            <div class="modal-body">
                <%-- 插入水平表单，组件的提交的变量的name属性要与pojo的属性值对应--%>
                <form class="form-horizontal">
                    <%--文本框--%>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_ststic"></p>
                        </div>
                    </div>
                    <%--文本框--%>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@atguigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--单选框--%>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <%--下拉列表--%>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-10">
                            <%--提交部门id就行--%>
                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
<!-- 员工新增模态框，在框体里插了一个水平排列的表单-->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工新增</h4>
            </div>
            <div class="modal-body">
                <%-- 插入水平表单，组件的提交的变量的name属性要与pojo的属性值对应--%>
                <form class="form-horizontal">
                    <%--文本框--%>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--文本框--%>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@atguigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--单选框--%>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                        </label>
                        </div>
                    </div>
                    <%--下拉列表--%>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-10">
                            <%--提交部门id就行--%>
                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<%--显示页面--%>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button type="button" class="btn btn-success" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_modal-btn">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                      <th>
                          <input type="checkbox" id="check_all"/>
                      </th>
                      <th>#</th>
                      <th>empName</th>
                      <th>gender</th>
                      <th>email</th>
                      <th>deptName</th>
                      <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--分页--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info"></div>
            <%--分页条--%>
        <div class="col-md-6" id="page_nav"></div>
    </div>
</div>
    <script type="text/javascript">
        var totalRecord,currentPage;
        //1.发送ajax请求，获得分页数据
        $(function () {
            //首页
            to_page(1);
        });
        //发送ajax请求
        function to_page(p) {
            $.ajax({
                url:"${APP_PATH}/emps",
                data:"p="+p,
                type:"get",
                success:function (result) {
                    //console.log(result)
                    //1.解析并显示员工数据
                    build_emps_table(result);
                    //2.解析并显示分页信息
                    build_page_info(result);
                    //3.解析并显示分页条
                    build_page_nav(result);
                }
            });
        }
        function build_emps_table(result) {
            //清空表中数据
            $("#emps_table tbody").empty();
            var emps=result.map.pageInfo.list;
            $.each(emps,function (index,item) {
                var checkboxTd=$("<td><input type='checkbox'class='check_item' /></td>");
                var empIdTd=$("<td></td>").append(item.empId);
                var empNameTd=$("<td></td>").append(item.empName);
                var genderTd=$("<td></td>").append(item.gender==='M'?"男":"女");
                var emailTd=$("<td></td>").append(item.email);
                var deptNameTd=$("<td></td>").append(item.department.deptName);
                var editBtn=$("<button></button>").addClass("btn btn-success btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                //给编辑按钮添加一个属性表示当前对象的员工id
                editBtn.attr("edit-id",item.empId);
                var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                //给删除按钮添加一个属性表示当前对象的员工id
                delBtn.attr("delete-id",item.empId);
                var btn=$("<td></td>").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>").append(checkboxTd)
                    .append(empIdTd)
                    .append(empNameTd)
                    .append(genderTd)
                    .append(emailTd)
                    .append(deptNameTd)
                    .append(btn)
                    .appendTo("#emps_table tbody");
            });
        }
        function build_page_info(result){
            //清空数据
            $("#page_info").empty();
            $("#page_info").append("当前"+result.map.pageInfo.pageNum+"页，总"+result.map.pageInfo.pages+"页,总"
                +result.map.pageInfo.total+"条记录");
             totalRecord=result.map.pageInfo.total;
             currentPage=result.map.pageInfo.pageNum;
        }
        //分页条
        function build_page_nav(result){
            //清空数据
            $("#page_nav").empty();
            var ul=$("<ul></ul>").addClass("pagination");
            //首页，前一页，下一页，末页
            var firstPageLi=$("<li></li>").append($("<a></a>").append("首页"));
            var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
            //第一页，首页和前一页被禁止且没有点击事件
            if(result.map.pageInfo.hasPreviousPage===false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }else {
                //添加点击事件
                firstPageLi.click(function () {
                    to_page(1);
                })
                prePageLi.click(function () {
                    to_page(result.map.pageInfo.pageNum-1);
                })
            }

            var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi=$("<li></li>").append($("<a></a>").append("末页"));
            //最后一页，末页和下一页被禁止点击,其他页添加点击事件
            if(result.map.pageInfo.hasNextPage===false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else {
                //添加点击事件
                lastPageLi.click(function () {
                    to_page(result.map.pageInfo.pages);
                })
                nextPageLi.click(function () {
                    to_page(result.map.pageInfo.pageNum+1);
                })
            }

            //添加首页，前一页
            ul.append(firstPageLi).append(prePageLi);
            //1,2,3,4,5
            $.each(result.map.pageInfo.navigatepageNums,function (index,item) {
                var numLi=$("<li></li>").append($("<a></a>").append(item));
                if(result.map.pageInfo.pageNum===item){
                    numLi.addClass("active");
                }
                //点击会重新发送ajax请求，会访问要目标页
                numLi.click(function () {
                    to_page(item);
                })
                ul.append(numLi);
            })
            //添加下一页，末页
            ul.append(nextPageLi).append(lastPageLi);
            //把ul添加到nav中
            var navEle=$("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav");

        }
        function reset_form(ele){
            $(ele)[0].reset();
            //清空表单样式
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("");
        }
        //在弹出模态框之前发送ajax请求，查询部门信息
        $("#emp_add_modal_btn").click(function () {
            /*清除表单数据*/
            reset_form("#empAddModal form");
            getDepts("#empAddModal select");
            $("#empAddModal").modal({
                backdrop:"static"
            });
        });
        //发送ajax请求，返回部门信息
        function getDepts(ele) {
            /*清空之前下拉列表的值*/
            $(ele).empty();
            $.ajax({
                url:"${APP_PATH}/depts",
                type:"get",
                success:function (result){
                  //拿到的数据后遍历显示到列表中
                    $.each(result.map.depts,function () {
                        var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
                        optionEle.appendTo(ele);
                    });
                }
            });
        }
        /*数据校验*/
        function validate_add_form(){
            /*1.先对名字校验*/
            /*获取输入的name值*/
            var empName=$("#empName_add_input").val();
            //校验规则：a-z或A-Z或0-9组合的6-16位的英文或者2-5位的汉字
            var regName=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            if(!regName.test(empName)){
                //alert("用户名是a-z，A-Z，0-9组合的6-16位的英文或者2-5位的汉字");
                show_validate_msg("#empName_add_input","error","用户名是a-z，A-Z，0-9组合的6-16位的英文或者2-5位的汉字");
                return false;
            }else {
                show_validate_msg("#empName_add_input","success","");
            }
            /*2.对邮箱校验*/
            var email=$("#email_add_input").val();
            /*第一部分表示：可以匹配多次，每一次匹配的范围是：a-z,0-9，小数点，-，中的一个*/
            var regEmail= /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                //alert("邮箱格式不正确");
                show_validate_msg("#email_add_input","error","邮箱格式不正确");
                return false;
            }else {
                show_validate_msg("#email_add_input","success","");
            }
            return true;
        }
        /*校验状态不一样，文本框的显示也不一样*/
        function show_validate_msg(ele,status,msg){
            //清除当前元素的校验状态
            $(ele).parent().removeClass("has-successes  has-error");
            $(ele).next("span").text("");
            if("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if("error"==status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }

        }
        /*每次输入都需要校验用户是否已存在*/
        $("#empName_add_input").change(function () {
            var empName=this.value;
            $.ajax({
                url:"${APP_PATH}/checkUser",
                data:"empName="+empName,
                type:"post",
                success:function (result) {
                    if(result.code==100){
                        show_validate_msg("#empName_add_input","success","用户名可用");
                        /*绑定一个属性值*/
                        $("#emp_save_btn").attr("ajax-va","success");
                    }else {
                        show_validate_msg("#empName_add_input","error",result.map.va_msg);
                        $("#emp_save_btn").attr("ajax-va","error");
                    }
                }
            });
        });
       $("#emp_save_btn").click(function () {
           //alert($("#empAddModal form").serialize());
           /*在把数据写入数据库之前校验数据,如果return false不往下执行*/
           if(!validate_add_form()){
               return false;
           }
           /*存在的话直接return false*/
           if($(this).attr("ajax-va")=="error"){
               return false;
           }
           /*发送ajax请求写入数据*/
          $.ajax({
             url:"${APP_PATH}/emp",
             type:"post",
             data:$("#empAddModal form").serialize(),
             success:function (result) {
                 //alert(result.msg);
                 $("#empAddModal").modal('hide');
                 to_page(totalRecord);
             }
          });
       });
       /*编辑按钮*/
       $(document).on("click",".edit_btn",function () {
           //alert("edit")
           /*查询部门信息*/
           getDepts("#empUpdateModal select");
           /*查询员工信息*/
           getEmp($(this).attr("edit-id"));
           /*将员工的empId传递给更新按钮*/
           $("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));
           /*打开模态框*/
           $("#empUpdateModal").modal({
               backdrop:"static"
           });
       });
        function getEmp(id) {
            $.ajax({
                url:"${APP_PATH}/emp/"+id,
                type:"get",
                success:function(result){
                    //console.log(result);
                    var empData=result.map.emp;
                    $("#empName_update_ststic").text(empData.empName);
                    $("#email_update_input").val(empData.email);
                    $("#empUpdateModal input[name=gender]").val([empData.gender]);
                    $("#empUpdateModal select").val([empData.dId]);
                }
            });
        }
        /*为更新按钮绑定事件*/
        $("#emp_update_btn").click(function () {
            //1.校验邮箱
            var email=$("#email_update_input").val();
            var regEmail= /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                show_validate_msg("#email_update_input","error","邮箱格式不正确");
                return false;
            }else {
                show_validate_msg("#email_update_input","success","");
            }
            //2.发送ajax请求
            $.ajax({
                url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
                //通过HttpPutFormContentFilter这个过滤器能够直接Put访问
                type:"PUT",
                //HiddenHttpMethodFilter这个过滤器把post方式转换为put方式
                //type:"POST",
                //data:$("#empUpdateModal form").serialize()+"&_method=PUT",
                data:$("#empUpdateModal form").serialize(),
                success:function (result) {
                    //alert(result.msg);
                   /* $("#empUpdateModal").modal('hide');
                    to_page(currentPage)*/
                }
            });
        });
        /*单个删除按钮*/
        $(document).on("click",".delete_btn",function () {
            //要删除的对象名
            var empName=$(this).parents("tr").find("td:eq(2)").text();
            //当前操作的员工id
            var empId=$(this).attr("delete-id");
            //confirm("显示的文字")会弹出一个确认对话框，点击确认返回true
            if(confirm("确认删除【"+empName+"】吗？")){
                //点击确认发送ajax请求
                $.ajax({
                    url:"${APP_PATH}/emp/"+empId,
                    type:"DELETE",
                    success:function (result) {
                        //输出删除成功信息
                        alert(result.msg);
                        //返回当前页
                        to_page(currentPage);
                    }
                });
            }
        });
        //全选：check_all选中的话，让下面的每一个都选中
        //全不选：check_all不选中的话，让下面的每一个都选中
        $("#check_all").click(function () {
            //prop("属性",true or false)，获取或修改属性的值。
            // 这里true时表示选中，false不选中
            $(".check_item").prop("checked",$(this).prop("checked"));
        });
        //check_item：所有的check_item都选中，check_all就选中；
        //有一个check_item不选中，check_all就不选中
        $(document).on("click",".check_item",function () {
            //$(".check_item:checked").length返回选中的个数，$(".check_item").length返回一共checkbox的个数
            var flag=$(".check_item").length==$(".check_item:checked").length;
            $("#check_all").prop("checked",flag);
        });
        //给批量删除按钮绑定事件
        $("#emp_delete_modal-btn").click(function () {
            var empNames="";
            var ids="";
            //遍历选中的对象，组装要删除的名字和id
            $.each($(".check_item:checked"),function () {
                empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
                ids+=$(this).parents("tr").find("td:eq(1)").text()+"-";
            });
            empNames=empNames.substring(0,empNames.length-1);
            //去除最后一个"-"
            ids=ids.substring(0,ids.length-1);
            if(confirm("确认要删除【"+empNames+"】吗？")){
                $.ajax( {
                    url:"${APP_PATH}/emp/"+ids,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.msg);
                        to_page(currentPage);
                    }
                });
            }
        });
</script>
</body>
</html>
