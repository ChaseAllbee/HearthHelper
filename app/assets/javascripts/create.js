console.log("out of doit");
//$('#doit').click(function() {
  //console.log("in doit");
  var doit = function(){
    console.log("in doit");
      $.ajax({
      url: '/cards',
      type: 'POST', // The HTTP Method
      data: {
        tester: {
          name: 'Leeeerooooy Jenkins',
          text: 'a'
        }
      },
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
