<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>	
<style>
#themecommentcontent{
	display : inline-block;
}
.btn-success{
	padding : 5px 10px;
	background-color :#DAE9F8;
	border-radius : 10px;
	right : 0;
	display : inline-block;
}
td div {
	display: flex;
	justify-content: flex-end;
}


#comment-list-item{
	
	border-bottom : 1px solid #ccc;
	padding-bottom : 10px;
	padding-top : 10px;
	width : 85%;
}
</style>
</head>
<body>
	<div class="container">
    <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr> 
                        <td>
                            <c:if test="${sessionScope.account.userid != null}">
									<textarea style="width: 1100px" rows="2" cols="30"
										id="themecommentcontent" name="themecommentcontent"
										placeholder="댓글을 입력하세요"></textarea>
									<br>
									<div>
										<a href='#' onClick="fn_comment('${result.code }')"
											class="btn pull-right btn-success">등록</a>
									</div>
								</c:if> <c:if test="${sessionScope.account.userid == null}">
									<textarea style="width: 1100px" rows="2" cols="30"
										id="themecommentcontent" name="themecommentcontent"
										placeholder="댓글을 입력하려면 로그인이 필요합니다."></textarea>
									<br>
									
								</c:if>
                            
                        </td>  
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="b_code" name="b_code" value="${result.code }" />        
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
 
<script>
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(code){
    $.ajax({
        type:'GET',
        url : '${pageContext.request.contextPath}/addComment?themecode=${foodtodetailpage.themecode}&themepostid=${foodtodetailpage.contentid}&userid=${sessionScope.account.userid}',
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {

                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           
       }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    
    $.ajax({
        type:'GET',
        url : "<c:url value='commentList?themecode=${foodtodetailpage.themecode}&themepostid=${foodtodetailpage.contentid}'/>",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div id='comment-list-item'><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
                    html += data[i].comment + "<tr><td></td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}
 
</script>
</body>
</html>