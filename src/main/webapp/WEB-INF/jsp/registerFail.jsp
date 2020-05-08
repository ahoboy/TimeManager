<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head >
    <title>注册失败</title>
<script language="javascript" type="text/javascript">
    var time = 5;
    function tiaozhuan()
    {
        if(time==0)
            window.location="index";
        document.all.tiao.innerText="注册失败,"+time+"秒后跳转到网站首页";
        time--;
    }
    setInterval("tiaozhuan()",1000);
</script>
</head>
<body onload="tiaozhuan()">
    <form id="form1">
    <div>
        <a href="index.jsp" id="tiao"></a>
    </div>
    </form>
</body>
</html>