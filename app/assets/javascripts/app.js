var ready = function(){
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
		$(this).parent().siblings(".progress").children()[0].style.width = percent;
		//$(this).siblings("#progress-bar")[0].style.width = percent;
	});

	$(window).scroll(function() {
		if(($(".white-bg").scrollTop()) > 0) {
			$(".nav-wrapper").addClass("z-depth-2");
			$(".nav-wrapper").removeClass("z-depth-0");
			$(".nav-wrapper").css("background-color", "white");
		}
		else if(($(".white-bg").scrollTop()) == 0){
			$(".nav-wrapper").addClass("z-depth-0");
			$(".nav-wrapper").removeClass("z-depth-2");
			$(".nav-wrapper").css("background-color", "transparent");
		}
	});

	$(".sort-icon").click(function(){
		$(".sort-icon").removeClass("icon-selected");
		$(this).toggleClass("icon-selected", true);
	});



	$(function(){
	  if($('body').is('.single-deck-page')){
	  		var array = (gon.mana_costs);
	  		$(".zero-cost").children(".mana").animate({height: (array[0]*10)}, 'swing');
	  		$(".one-cost").children(".mana").animate({height: (array[1]*10)}, 'swing');
	  		$(".two-cost").children(".mana").animate({height: (array[2]*10)}, 'swing');
	  		$(".three-cost").children(".mana").animate({height: (array[3]*10)}, 'swing');
	  		$(".four-cost").children(".mana").animate({height: (array[4]*10)}, 'swing');
	  		$(".five-cost").children(".mana").animate({height: (array[5]*10)}, 'swing');
	  		$(".six-cost").children(".mana").animate({height: (array[6]*10)}, 'swing');
	  		$(".seven-cost").children(".mana").animate({height: (array[7]*10)}, 'swing');
	  		$(".eight-cost").children(".mana").animate({height: (array[8]*10)}, 'swing');
	  		$(".nine-cost").children(".mana").animate({height: (array[9]*10)}, 'swing');
	  }
	});

	// Changes deck class to selected option
  $("body").on("click", ".sort-icon.decks", function() {
    var s_class = this.id;
    $.ajax({
      url: '/decks',
      type: 'get',
      data: s_class != "All" ? {selected_class: s_class} : undefined,
      dataType: "script",
    });
    return false;
  });

  // Changes deck tier to selected tier
   $("body").on("click", ".tiers", function() {
    var tier_num= this.id;
    $.ajax({
      url: '/decks',
      type: 'get',
      data: {tier: tier_num},
      dataType: "script",
    });
    return false;
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
