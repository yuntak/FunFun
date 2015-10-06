


$(function(){
	$("#fregisterform").submit(function(event){
		event.preventDefault();
		var id=$("#id").val();
		var pass=$("#pass").val();
		
		//console.log(id);
		//console.log(pass);
		
		
		
		var url="./IdPassCheck";
		$.ajax({
			type:"post",
			url:url,
			data:{id:id,pass:pass},
			success:function(response){
				if(response=="true"){
					console.log("Login Sucess");
					
				}
				else{
					console.log("Login Fail");
					$("#msg_box").css("display","block");
					$("#result").html("비밀번호가 틀립니다.");
				}
			},
			error:function(request,status,error){
				console.log("ajax fail");
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
});
