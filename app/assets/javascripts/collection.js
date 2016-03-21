var ready = function() {
  // Gets next or previous page
  $("#class-cards").on("click", ".pagination a", function() {
    $.getScript(this.href);
    return false;
  });

  // Changes card class to selected option
  $("body").on("click", ".sort-icon", function() {
    var c_class = this.id;
    $.ajax({
      url: '/collection',
      type: 'get',
      data: {page: 1, current_class: c_class},
      dataType: "script",
    });
    return false;
  });

  // Changes current class to next class
  $("body").on("click", ".next-icon", function() {
    var card_classes = ["Druid", "Hunter", "Mage", "Paladin", "Priest", "Rogue", "Shaman", "Warlock", "Warrior", "Neutral"];
    var next_class_idx = card_classes.indexOf(gon.current_class) + 1;
    var next_class = card_classes[next_class_idx];
    $.ajax({
      url: '/collection',
      type: 'get',
      data: {current_class: next_class},
      dataType: "script",
    });
    return false;
  });

  // Changes current class to previous class
  $("body").on("click", ".prev-icon", function() {
    var card_classes = ["Druid", "Hunter", "Mage", "Paladin", "Priest", "Rogue", "Shaman", "Warlock", "Warrior", "Neutral"];
    var prev_class_idx = card_classes.indexOf(gon.current_class) - 1;
    var prev_class = card_classes[prev_class_idx];
    $.ajax({
      url: '/collection',
      type: 'get',
      data: {prev: true, current_class: prev_class},
      dataType: "script",
    });
    return false;
  });

  // Searches cards upon each keystroke
  $("#cards-search input").keyup(function() {
    $.get($("#cards_search").attr("action"), $(this).serialize(), null, "script");
    return false;
  });

  // Increments or decrements card quantity
  $("body").on("submit", ".incr_or_decr", function() {
    if (gon.current_page == null) {
      gon.current_page = 1;
    }
    var id = $(this).children("#card_id").val();
    $.ajax({
      url: '/collection',
      type: 'get',
      data: {page: gon.current_page, current_class: gon.current_class, increment_or_decrement: this.id, card_id: id},
      dataType: "script",
    });
    return false;
  });
};
$(document).ready(ready);
$(document).on('page:load', ready);
