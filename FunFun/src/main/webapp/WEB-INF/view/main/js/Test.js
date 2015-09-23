
$(function(){
	console.log("JQuery Start");
	$("#fregisterform").on("submit",function(form){
		var id=document.getElementById("id").value;
		console.log(id);
		var pass= document.getElementById("pass").value;
		console.log(pass);
		var $target=$("#result");
		var $msgbox=$("#msg_box");
		var url="<%=request.getContextPath() %>/login_ajax";
		$.ajax({
			type:"post",
			url:url,
			data:{id:id,pass:pass},
			success:function(response){
				if(response==true){
					form.action('./main');
					return true;
				}
				else{
					$msgbox.css("display","block");
					$target.html("로그인 정보가 일치하지 않습니다.");
				return false;
				}
			},
			error:function(){
				console.log("ajax fail...");
			}
		});
	});
});
