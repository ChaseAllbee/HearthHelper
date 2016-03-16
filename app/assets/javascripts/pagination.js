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
      data: {card_class: c_class},
      dataType: "script",
    });
    return false;
  });
};
$(document).ready(ready);
$(document).on('page:load', ready);
