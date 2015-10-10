$(document).ready(function() {
  $("#doit").click(function() {
    var allCards = [];
    var counter = 0;

    //AJAX call to gather cards
    $.ajax({
      url: 'https://omgvamp-hearthstone-v1.p.mashape.com/cards',
      type: 'GET',
      data: {},
      dataType: 'json',
      success: function(data) {
        $.each(data, function() {
          $.each(this, function(name, value) {
            card = {};

            //Check to see if a card is a Minion type, if not then no health or attack is required
            if(value.type == "Minion"){
              card.attack = value.attack;
              card.health = value.health;
            }
            else{
              card.attack = -1;
              card.health = -1;
            }
            card.name = value.name;
            card.card_set = value.cardSet;
            card.rarity = value.rarity;
            card.image = value.img;
            //If playerClass is undefined that means it's a neutral card
            if(value.playerClass == undefined){
              card.card_class = "Neutral";
            }
            else{
              card.card_class = value.playerClass;
            }
            if(value.cost == undefined){
              card.cost = -1;
            }
            else{
              card.cost = value.cost;
            }
            card.card_type = value.type;
            allCards[counter] = card;
            //This check is to eliminate extra results from the list, some cards taken from the API weren't cards you could actually play
            //So, if the rarity is undefined that means it's not ownable and thus shouldn't be in the database
            if (typeof card.rarity != 'undefined'){
              counter++;
            }
            else{
            }
          });
        });

        //AJAX call to post to database
        $.ajax({
          url: '/cards',
          type: 'POST',
          data: JSON.stringify(allCards),
          dataType: 'json',
          contentType: 'application/json',
          success: function(data) {
            console.log("in success");
            alert("You didn't let your dreams be dreams!");
            return false;
          }
        });
      },
      beforeSend: function(xhr) {
        xhr.setRequestHeader("X-Mashape-Authorization", "c2jSkrNBF3mshpDCWI8SrnQZRmtcp1zPeq1jsnm4B3QaYiemF5");
        }
    });
  });
});
