var ready = function() {
  $("#class-cards").on("click", ".pagination a", function() {
    $.getScript(this.href);
    return false;
  });

  $("body").on("click", ".sort-icon", function() {
    var c_class = this.id;
    $.ajax({
      url: '/collection',
      type: 'get',
      data: {current_class: c_class},
      dataType: "script",
    });
    return false;
  });

  $("body").on("click", ".next-icon", function() {
    var card_classes = ["Druid", "Hunter", "Mage", "Paladin", "Priest", "Rogue", "Shaman", "Warlock", "Warrior", "Neutral"];
    var next_class_idx = card_classes.indexOf(gon.current_class) + 1;
    var next_class = card_classes[next_class_idx];
    $.ajax({
      url: '/collection',
      type: 'get',
      data: {prev_or_next_class: "next", current_class: next_class},
      dataType: "script",
    });
    return false;
  });
};
$(document).ready(ready);
$(document).on('page:load', ready);
