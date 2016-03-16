var ready = function() {
  $("#class-cards").on("click", ".pagination a", function() {
    $.getScript(this.href);
    return false;
  });
};
$(document).ready(ready);
$(document).on('page:load', ready);
