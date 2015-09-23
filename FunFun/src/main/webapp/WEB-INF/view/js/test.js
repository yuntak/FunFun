


$(function(){
	$("#fregisterform").submit(function(event){
		event.preventDefault();
		var id=$("#id").val();
		var pass=$("#pass").val();
		
		//console.log(id);
		//console.log(pass);
		
		
		
		var url="./login_ajax";
		$.ajax({
			type:"post",
			url:url,
			data:{id:id,pass:pass},
			success:function(response){
				if(response=="true"){
					console.log("Login Sucess");
					 location.replace("./main");
				}
				else{
					console.log("Login Fail");
					$("#msg_box").css("display","block");
					$("#result").html("로그인 정보가 일치하지 않습니다.");
				}
			},
			error:function(request,status,error){
				console.log("ajax fail");
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
});
