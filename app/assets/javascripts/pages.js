$( function() {
  $( "#slider" ).slider({
    range: true,
    min: <%= @minPreparationTime %>,
    max: <%= @maxPreparationTime %>,
    values: [ <%= @minPreparationTimeSelected %>, <%= @maxPreparationTimeSelected %> ],
    slide: function( event, ui ) {
      // When slider is changed
      // Update label
      $( "#preparation_time" ).val( ui.values[ 0 ] + "min - " + ui.values[ 1 ] + "min");
      // Update hidden fields
      $("#preparation_time_min").val(ui.values[0]);
      $("#preparation_time_max").val(ui.values[1]);
      // Send ajax request
      var data = $(search_form).serializeArray();
      $.ajax({
        type: 'post',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: '/pages/search',
        data: data,
        dataType: 'script'
      });
    }
  });

  // Initialize slider
  // Set label
  $( "#preparation_time" ).val( $( "#slider" ).slider( "values", 0 ) +
    "min - " + $( "#slider" ).slider( "values", 1 ) + "min");
  // Set hidden fields
  $("#preparation_time_min").val( $( "#slider" ).slider( "values", 0 ) );
  $("#preparation_time_max").val( $( "#slider" ).slider( "values", 1 ) );

  // Send ajax request when something is typed in the name field
  $('#name').keyup(function () {
    var data = $(search_form).serializeArray();
    $.ajax({
      type: 'post',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: '/pages/search',
      data: data,
      dataType: 'script'
    });
  });

  // Send ajax request when a category is selected
  $('#category_id').change(function () {
    var data = $(search_form).serializeArray();
    $.ajax({
      type: 'post',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: '/pages/search',
      data: data,
      dataType: 'script'
    });
  });
} );
