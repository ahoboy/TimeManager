<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en"> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
<title>房源发布</title>

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<link href="css/normalize.css" rel="stylesheet"/>
<link href="css/jquery-ui.css" rel="stylesheet"/>
<link href="css/jquery.idealforms.min.css" rel="stylesheet" media="screen"/>

<style type="text/css">
body{font:normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;color: #222;background:url(pattern.png);overflow-y:scroll;padding:0 0 0 0;}
#my-form{width:755px;margin:0 auto;border:1px solid #ccc;padding:3em;border-radius:3px;box-shadow:0 0 2px rgba(0,0,0,.2);}
#comments{width:350px;height:100px;}
</style>

</head>
<body>

<jsp:include page="./header.jsp"></jsp:include>

<div class="row">

  <div class="eightcol last">

    <!-- Begin Form -->

    <form id="my-form" method="post" action="${pageContext.request.contextPath }/addHouse" enctype="multipart/form-data">

        <section name="基本信息">

          <div><label>房屋名称:</label><input type="text" id="hname" name="hname" placeholder="给你的小屋取个名字吧" /></div>
          <div><label>出租价格:</label><input type="text" id="hprice" name="hprice" placeholder="请输入房屋价格" /></div>
          <div><label>房屋地址:</label><input type="text" id="address" name="address" placeholder="省/市/详细地址" /></div>
          
          <input type="hidden" name="uid" value="${user.uid }">

        </section>

        <!-- <section name="上传照片">
           
           <div><label>房屋照片:</label><input id="himage" name="himage" multiple type="file"/></div>
           
  		</section> -->
        

        <section name="详细描述">
          <div><label>户型:</label>
          <select id="hsize" name="hsize">
            <option value="default">&ndash; 选择户型 &ndash;</option>
            <option value="两室一厅">两室一厅</option>
            <option value="两室两厅">两室两厅</option>
            <option value="一室一厅">一室一厅</option>
            <option value="一室一厨">一室一厨</option>
            <option value="三室一厅">三室一厅</option>
            <option value="三室两厅">三室两厅</option>
            <option value="两室三厅">两室三厅</option>
            <option value="四室一厅">四室一厅</option>
            <option value="四室两厅">四室两厅</option>
          </select>
        </div>
        <div><label>详细介绍:</label><textarea id="hdesc" name="hdesc"></textarea></div>
         <div>
       
        <button type="submit" style="margin-left:200px">提交</button>
        
        <button id="reset" type="button">重置</button>
      </div>
      </section>

      <div><hr/></div>


    </form>

    <!-- End Form -->

  </div>

</div>


<script type="text/javascript" src="js/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/js/jquery.idealforms.js"></script>
<script type="text/javascript">
var options = {

	onFail: function(){
		alert( '请检查信息是否填写完整' )
	},

	inputs: {
		'password': {
			filters: 'required pass',
		},
		'username': {
			filters: 'required username',
			data: {
			}
		},
		'file': {
			filters: 'extension',
			data: { extension: ['jpg'] }
		},
		'comments': {
			filters: 'min max',
			data: { min: 20, max: 200 }
		},
		'states': {
			filters: 'exclude',
			data: { exclude: ['default'] },
			errors : {
				exclude: '选择户型.'
			}
		},
		'langs[]': {
			filters: 'min max',
			data: { min: 1, max: 3 },
			errors: {
				min: 'Check at least <strong>1</strong> options.',
				max: 'No more than <strong>1</strong> options allowed.'
			}
		}
	}
	
};

var $myform = $('#my-form').idealforms(options).data('idealforms');

$('#fail').click(function(){
   alert('请登录后再进行发布')
});

$('#reset').click(function(){
	$myform.reset().fresh().focusFirst()
});

$myform.focusFirst();
</script>
<jsp:include page="./footer.jsp"></jsp:include>

</body>
</html>