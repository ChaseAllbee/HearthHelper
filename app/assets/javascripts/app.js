$( document ).ready(function(){
	$(".button-collapse").sideNav();

	var lemailflag = false;
	var lpasswordflag = false;
	//Swap classes for login and sign out depending on which one is selected at the time
	$("#login").click(function(){
		if($("#login").hasClass("login-notselected")){
			$("#login").toggleClass("login-notselected", false);
			$("#login").toggleClass("login-selected", true);
			$("#signup").toggleClass("login-selected", false);
			$("#signup").toggleClass("login-notselected", true);
			$("#signup-content").toggleClass("hide");
			$("#login-content").toggleClass();
		}
	});

	$("#signup").click(function(){
		if($("#signup").hasClass("login-notselected")){
			$("#signup").toggleClass("login-notselected", false);
			$("#signup").toggleClass("login-selected", true);
			$("#login").toggleClass("login-selected", false);
			$("#login").toggleClass("login-notselected", true);
			$("#signup-content").toggleClass();
			$("#login-content").toggleClass("hide");
		}
	});

	$("#signup").click(function(){
		if($("#signup").hasClass("login-notselected")){
		}
	});


	$(".cards-owned").each(function(index){
		//alert(index);
		var progressbar = $(this).html();
		var temp="";
		var percent = 0;
		for(var j=0; j<2;j++){
			if(progressbar[j]=="/"){
				break;
			}
			temp += "" + progressbar[j];
		}
		percent = "" + (Math.round((+temp)/30*100)) + "%";
		$(this).siblings(".progress").children()[0].style.width = percent;
		//$(this).siblings("#progress-bar")[0].style.width = percent;
	});



});