// Add recipe to shopping list
var $shopping_list = new Array();

function addRecipe( $item, $weekday ) {
  $item.fadeOut();
  $recipe_id = $item.attr('id');

  $shopping_list.push($recipe_id);

  $weekday.append($item.find('.ui-widget-header').text()+'<br>');

  $.ajax({
    type: 'post',
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    url: '/pages/weekplanner/update_shopping_list',
    data: { shopping_list: $shopping_list },
    dataType: 'script'
  });
}
