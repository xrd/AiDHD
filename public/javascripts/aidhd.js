var aidhd = {
  init : function() {
    $('.new_question').click( aidhd.add_new_question );
  },

  add_new_question : function( event ) {
    $('.questions').append( $('.hidden .question').clone() );
    event.preventDefault();
  }

};

