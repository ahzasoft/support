// Back to top button
$(window).scroll(function() {
    var height = $(window).scrollTop();
    if (height > 100) {
        $('#back2Top').fadeIn();
    } else {
        $('#back2Top').fadeOut();
    }
});



$('#back2Top').click(function() {
    event.preventDefault();
    $("html, body").animate({ scrollTop: 0 }, "slow");
    return false;
});

$('.default').customselect();

$(document).on('keypress','.decimal',function (event) {
    "use strict";
    if($(this).val().includes('.') && event.keyCode===46 )
        return false;
    var key = window.event ? event.keyCode : event.which;
    if (event.keyCode === 8 || event.keyCode === 46) {
        return true;
    } else if ( key < 48 || key > 57 ) {
        return false;
    } else {
        return true;
    }

});


$(document).on('keypress','.integr',function (event) {
    "use strict";
    var key = window.event ? event.keyCode : event.which;
    if (event.keyCode === 8 ) {
        return true;
    } else if ( key < 48 || key > 57 ) {
        return false;//char
    } else {
        return true;
    }

});

$(document).on('keyup','.day',function (event) {
    "use strict";
    var value = $(this).val();
    if(value>31)
        $(this).val('30');
    if(value==0)
        $(this).val('');

});






$( function() {
    $( ".date-picker" ).datepicker();
} );



$(function () {
    $('.txtDatePicker').datepicker({
        dateFormat: 'yy-mm-d',
        changeMonth: true,
        changeYear: true,
        yearRange: '2020:2030'

    });
});


$(function () {
    $('.berthdate').datepicker({
        dateFormat: 'yy/mm/d',
        changeMonth: true,
        changeYear: true,
        yearRange: '2020:2030'

    });
});


    $("#searchbox").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#datatable tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });



/*
* check box select all item in the same group eng mohamed ali
*/
$('.input-icheck').on('click', function() {
    var st=$(this).is(":checked");
    var total=0;
    var checked=0;
    $(this).closest('.check_group').find('.input-icheck').each(function() {
        total++;
        if($(this).is(":checked"))
            checked++;
    });

    var test=$(this).closest('.check_group').find('.check_all');
    if(total==checked)
        $(test).prop('checked',true);
    else
        $(test).prop('checked',false);


});



$('.check_all').on('click', function() {
    var st=$(this).is(":checked");
    $(this)
        .closest('.check_group')
        .find('.input-icheck')
        .each(function() {
            if(st){
                $(this).prop('checked', true);
            }else{
                $(this).prop('checked', false);
            }
        });
});

/* End of check all */

$(document).ready(function() {
    $('.select2').select2();
    $(document).on('click', '.close-page', function(e) {
        e.preventDefault();
         $.ajax({
            url: $(this).data('href'),
            dataType: 'html',
            success: function(result) {

            },
        });
    });
});

/*  Printing
 * https://github.com/menusal/printMe
 * $("#example").printMe();
 * $("#example").printMe({ "path": ["path_to/external.css","path_to/external2.css"] });
 * $("#example").printMe({ "title": "The title" });
 */

jQuery.fn.printMe = function(options){

    // Setup options
    var settings = $.extend({
        // Defaults options.
        path: [],
        title: "",
        head: false,
    }, options );

    // Set the properties and run the plugin
    return this.each(function(){

        // Store the object
        var $this = $(this);

        var w = window.open();
        w.document.write( "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" );
        w.document.write( "<html>" );
        w.document.write( "<head>" );
        w.document.write( "<meta charset='utf-8'>" );

        // Add the style sheets
        for(i in settings.path){
            w.document.write('<link rel="stylesheet" href="'+settings.path[i]+'">');
        }

        // Close the head
        w.document.write('</head><body>');

        // Add a header when the title not is empty
        if (settings.title != "")
            w.document.write( "<h1>" + settings.title + "<\/h1>" );

        // Add a content to print
        w.document.write( $this.html() );
        w.document.write('<script type="text/javascript">function closeme(){window.close();}setTimeout(closeme,50);window.print();</script></body></html>');
        w.document.close();
    });
}
