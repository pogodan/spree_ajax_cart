class SpreeAjaxCartHooks < Spree::ThemeSupport::HookListener
  insert_after :inside_head, 'shared/ajax_cart_head'
end