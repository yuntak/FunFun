my_fun=null;
$(function(){
	console.log("JQuery Start");

	

$("#fregisterform").submit( function(event){

event.preventDefault();
  logCheck=document.getElementById("logCheckVal").value;
console.log(logCheck);
        console.log(logCheck);
		var id=document.getElementById("id").value;
		console.log(id);

		var pass= document.getElementById("pass").value;
		console.log(pass);

		var $target=$("#result");
		var $msgbox=$("#msg_box");
		var url="./login_ajax";

		$.ajax({
			type:"post",
			url:url,
			data:{id:id,pass:pass},
			success:function(response){
				console.log(response);
				
				if(response=="true"){
					console.log("login_ajax complt");
var url="./main";
					$(location).attr('href',url);
					
					
				}
				else{
                    console.log("login_ajax fail");
					$msgbox.css("display","block");
					$target.html("로그인 정보가 일치하지 않습니다.");
				
				}
			},
			error:function(request,status,error){
  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				console.log("ajax fail...");
			}
		});
	});

});



