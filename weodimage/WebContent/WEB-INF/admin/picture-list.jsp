<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>壁纸列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 壁纸管理 <span class="c-gray en">&gt;</span> 壁纸列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">
		<input type="text" name="" id="" placeholder=" 壁纸名称" style="width:250px" class="input-text">
		<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜壁纸</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="picture_add('添加壁纸','picture-add.html')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加壁纸</a></span> <span class="r">共有数据：<strong>54</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="40"><input name="" type="checkbox" value=""></th>
					<th width="80">ID</th>
					<th width="300">标题</th>
					<th width="100">作者</th>
					<th width="210">壁纸缩略图</th>
					<th width="150">创建时间</th>
					<th width="150">更新时间</th>
					<th width="60">发布状态</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
				<!-- <tr class="text-c">
					<td><input name="" type="checkbox" value=""></td>
					<td>001</td>
					<td>你好些天</td>
					<td class="text-l"><a class="maincolor" href="javascript:;" onClick="picture_edit('图库编辑','picture-show.html','10001')">现代简约 白色 餐厅</a></td>
					<td><a href="javascript:;" onClick="picture_edit('图库编辑','picture-show.html','10001')"><img width="210" class="picture-thumb" src="temp/200x150.jpg"></a></td>
					<td class="text-c">标签</td>
					<td>2014-6-11 11:11:42</td>
					<td class="td-status"><span class="label label-danger radius">待审核</span></td>
					<td class="td-manage"><a style="text-decoration:none" onClick="picture_shenhe(this,'10001')" href="javascript:;" title="审核">审核</a> <a style="text-decoration:none" class="ml-5" onClick="picture_edit('图库编辑','picture-add.html','10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
				</tr> -->
				<%-- <c:if test="${is_pass ==0}">
								<span class="label label-danger radius">待审核</span>
							</c:if>
							<c:if test="${is_pass ==1 }">
								<span class="label label-defaunt radius">审核未通过</span>
							</c:if>
							<c:if test="${is_pass ==2 && is_pub==0 }">
								<span class="label label-defaunt radius">已下架</span>
							</c:if>
							<c:if test="${is_pass ==2 && is_pub==1 }">
								<span class="label label-defaunt radius">发布中</span>
							</c:if> --%>
				<c:forEach items="${imagelist }" var="i">
					<tr class="text-c">
						<td><input name="" type="checkbox" value=""></td>
						<td class="image-id">${i.id }</td>
						<td>${i.title }</td>
						<td>${i.author }</td>
						<td><img width="210" class="picture-thumb" src="${i.img_src }"></td>
						<td class="text-c" class="data">${i.create_time_format }</td>
						<td>${i.upload_time_format }</td>
						<c:if test="${i.is_pass ==0}">
							<td class="td-status">
								<span class="label label-danger radius">待审核</span>
							</td>
							<td class="td-manage">
								<a style="text-decoration:none" onClick="picture_shenhe(this,'${i.id}')" href="javascript:;" title="审核">审核</a> 
								
								<a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'${i.id}')" href="javascript:;" title="删除">
									<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
							</td>
						</c:if>
						<c:if test="${i.is_pass ==1}">
							<td class="td-status">
								<span class="label label-defaunt radius">审核未通过</span>
							</td>
							<td class="td-manage">
								<a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'${i.id}')" href="javascript:;" title="删除">
									<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
							</td>
						</c:if>
						<c:if test="${i.is_pass ==2 && i.is_pub==0}">
							<td class="td-status">
								<span class="label label-primary radius">已审核</span>
							</td>
							<td class="td-manage">
							<a class="c-primary" onclick="picture_start(this,'${i.id}')" href="javascript:;" title="申请上线">申请上线</a>
								<a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'${i.id}')" href="javascript:;" title="删除">
									<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
							</td>
						</c:if>
						<c:if test="${i.is_pass ==2 && i.is_pub==1 }">
							<td class="td-status">
								<span class="label label-defaunt radius">已下架</span>
							</td>
							<td class="td-manage">
								<a style="text-decoration:none" onclick="picture_start(this,'${i.id}')" href="javascript:;" title="发布">
									<i class="Hui-iconfont"></i>
								</a>
								<a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'${i.id}')" href="javascript:;" title="删除">
									<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
							</td>
						</c:if>
						<c:if test="${i.is_pass ==2 && i.is_pub==2 }">
							<td class="td-status">
								<span class="label label-success radius">发布中</span>
							</td>
							<td class="td-manage">
								<a style="text-decoration:none" onclick="picture_stop(this,'${i.id}')" href="javascript:;" title="下架">
									<i class="Hui-iconfont"></i>
								</a>
								<a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'${i.id}')" href="javascript:;" title="删除">
									<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
							</td>
						</c:if>
					</tr>
				
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,8]}// 制定列不参与排序
	]
});

/*壁纸-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*壁纸-查看*/
function picture_show(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*壁纸-审核*/
function picture_shenhe(obj,id){
	layer.confirm('审核壁纸？', {
		btn: ['通过','不通过'], 
		shade: false
	},
	function(){
	
		var id=$(obj).parents("tr").find(".image-id").text();
		$.ajax({
			type:"get",
			url:"http://localhost:8080/weodimage/admin/isPassTrue.action?id="+id,
			async:true,
			success:function(){
				$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-primary radius">已审核</span>');
				$(obj).remove();
				
				layer.msg('审核成功', {icon:6,time:1000});
			},
			error:function(){
				layer.msg('网络出现故障', {icon:6,time:1000});
			}
		});
		
	},
	function(){
	
    	layer.msg('请说明未通过原因，系统将发送邮件给用户', {icon:5,time:1000});
		 layer.prompt({title: '请说明未通过原因，系统将发送邮件给用户', formType: 2}, function(text, index){
		    layer.close(index);
		    id=$(obj).parents("tr").find(".image-id").text();
		    $.ajax({
		    	type:"get",
		    	url:"http://localhost:8080/weodimage/admin/isPassFalse.action?id="+id+"&emaill"+text,
		    	async:true,
		    	success:function(){
		    		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">审核未通过</span>');
					$(obj).remove();
					layer.msg("未通过原因："+text+"<br/>已成功发送邮件给用户");
		    	},
		    	error:function(){
		    		layer.msg('网络出现故障', {icon:6,time:1000});
		    	}
		    });
		   
		  });
	});	
}

/*壁纸-下架*/
function picture_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		id=$(obj).parents("tr").find(".image-id").text();
		
		$.ajax({
			type:"get",
			url:"http://localhost:8080/weodimage/admin/isPubFalse.action?id="+id,
			async:true,
			success:function(){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
				$(obj).remove();
				layer.msg('已下架!',{icon: 5,time:1000});
			},
			error:function(){
				layer.msg('网络出现故障', {icon:6,time:1000});
			}
		});
		
	});
}

/*壁纸-发布*/
function picture_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		
		id=$(obj).parents("tr").find(".image-id").text();
		$.ajax({
			type:"get",
			url:"http://localhost:8080/weodimage/admin/isPubTrue.action?id="+id,
			async:true,
			success:function(){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
				$(obj).remove();
				layer.msg('已发布!',{icon: 6,time:1000});
			},
			error:function(){
				layer.msg('网络出现故障', {icon:6,time:1000});
			}
		});
	});
}

/*壁纸-申请上线*/
function picture_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}

/*壁纸-编辑*/
function picture_edit(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*壁纸-删除*/
function picture_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
/*壁纸放大图*/
layer.photos({
  photos: '.text-c'
  ,anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
}); 
</script>
</body>
</html>