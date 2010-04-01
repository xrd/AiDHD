var aidhd = {
  init : function() {
    $('.new_question').click( aidhd.add_new_question );
    $(':input[name*=type]').live( 'change', aidhd.adjust_question_type );
  },

  adjust_question_type : function( event ) {
    var name = $(event.target).val();
    $(event.target).parent().find('.extras div').hide()
    $(event.target).parent().find('.extras .'+name).show();
  },

  rewrite_form_object : function( obj ) {
    var date = new Date();
    var ms = date.getTime();
    var name = $(obj).find( ":input" ).each( function( index, item ) {
        var name = $(item).attr( 'name' );
        name = name.replace( '][', '][' + ms + '][' );
        $(item).attr( 'name', name );    
        var the_id = $(obj).attr( 'id' );
        the_id += '_' + ms;
        the_id = $(item).attr( 'id', the_id );
      });
    return obj;
  },

  add_new_question : function( event ) {
    var new_one = $('.hidden .question').clone();
    // rewrite IDs and stuff
    new_one = aidhd.rewrite_form_object( new_one );
    var new_class = ( ( $('.question').length % 2 == 0 ) ? 'odd' : 'even' );
    new_one.addClass( new_class );
    $('.questions').append( new_one );
    event.preventDefault();
  }

};

