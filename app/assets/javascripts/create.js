$(document).ready(){
  var allCards = [];

  //AJAX call to gather cards
  $.ajax({
    url: 'https://omgvamp-hearthstone-v1.p.mashape.com/cards',
    type: 'GET', 
    data: {}, 
    datatype: 'json',
    success: function(data) {
      $.each(data, function() {
        $.each(this, function(name, value) {
          card = {}; 

          //Check to see if a card is a Minion type, if not then no health or attack is required
          if(value.type == "Minion"){
            card.attack = value.attack;
            card.health = value.health;
          }
          card.name = value.name;
          card.cardSet = value.cardSet;
          card.rarity = value.rarity;
          card.image = value.img;
          //If playerClass is undefined that means it's a neutral card
          if(value.playerClass == undefined){
            card.class = "Neutral"
          }
          else{
            card.class = value.playerClass;
          }
          card.type = value.type;
          card.cost = value.cost;
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
      JSON.stringify(allCards);
    },
    beforeSend: function(xhr) {
      xhr.setRequestHeader("X-Mashape-Authorization", "c2jSkrNBF3mshpDCWI8SrnQZRmtcp1zPeq1jsnm4B3QaYiemF5"); 
      }
  });

  //AJAX call to post to database
  $.ajax({
        url: '/cards',
        type: 'POST',
        data: allCards,
        datatype: 'json',
        success: function(data) {
          console.log("in success");
          alert("You didn't let your dreams be dreams!");
          return false;
        }
      });
    }