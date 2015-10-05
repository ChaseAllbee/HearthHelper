console.log("out of doit");
var allCards = [];
//$('#doit').click(function() {
  //console.log("in doit");
$.ajax({
  url: 'https://omgvamp-hearthstone-v1.p.mashape.com/cards',
  type: 'GET', // The HTTP Method
  data: {}, // Additional parameters here
  datatype: 'json',
  success: function(data) {
    $.each(data, function() {
      $.each(this, function(name, value) {
        card = {}; 
        if(value.type == "Minion"){
          card.attack = value.attack;
          card.health = value.health;
        }
        var hey;
        card.name = value.name;
        card.cardSet = value.cardSet;
        card.rarity = value.rarity;
        card.image = value.img;
        if(value.playerClass == undefined){
          card.class = "Neutral"
        }
        else{
          card.class = value.playerClass;
        }
        card.type = value.type;
        card.cost = value.cost;
        allCards[counter] = card;
        if (typeof card.rarity != 'undefined'){
          counter++;
        }
        else{
        }
      });
    });//End for each
    JSON.stringify(allCards);
  }
});

$.ajax({
      url: '/cards',
      type: 'POST', // The HTTP Method
      data: allCards,
      datatype: 'json',
      success: function(data) {
        console.log("in success");
        alert("You didn't let your dreams be dreams!");
        return false;
      },
      //error: function(xhr, ajaxOptions, thrownError){
      //  console.log("you dumb homie");
      //  console.log(xhr.status);
      //  console.log(thrownError);
      //  return false;
      //}
    });
  }

$('#doit').click(function(){
  console.log('bish');
});
//});
