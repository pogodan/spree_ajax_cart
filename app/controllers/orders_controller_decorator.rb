OrdersController.class_eval do
  def add
    @order = current_order(true)
    variant = Variant.find(params[:variant_id])
    
    @order.add_variant(variant, 1)
    flash[:notice] = "Added #{variant.name} to cart"

    respond_to do | format |
      format.js {render :action => 'edit', :layout => false}  
    end
  end
end