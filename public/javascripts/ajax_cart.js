(function($){
  $(document).ready(function(){
		$("form#updatecart a.delete").live("click", function(){
      $(this).parents('tr').find('input.line_item_quantity').val(0);
      $(this).parents('form').submit();
      return false;
    });
  });
})(jQuery);
