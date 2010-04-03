var aidhd = {
  init : function() {
    $('.new_question').click( aidhd.add_new_question );
    $(':input[name*=type]').live( 'change', aidhd.adjust_question_type );
    $('a.delete').click( aidhd.handle_delete );      
    $('a.add_choice').live('click', aidhd.add_choice );      
  },

  handle_delete : function( event ) {
    var path = $(event.target).attr('href');
      $.ajax( { url : path, type : 'DELETE', async : false } );
      $(event.target).parent('.inquiry').fadeOut( 'slow', function() { $(this).remove(); } );
    event.preventDefault();  
  },

    add_choice : function( event ) {
        var new_choice = $('.extras .choice:first').clone();
        $('.extras .choice:last').insertAfter( new_choice );
        $(new_choice).show();
        event.preventDefault();
    },

  adjust_question_type : function( event ) {
      var name = $(event.target).val();
      if( name.substr(0,'choice'.length) == 'choice' ) {
          // show the choices.
          $(event.target).parents('.question').find('.extras .choice').show();
          
      }
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

