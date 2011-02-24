OrdersController.class_eval do
  def add
    @order = current_order(true)
    variant = Variant.find(params[:variant_id])
    
    @order.add_variant(variant, 1)
    flash[:notice] = "Added #{variant.name} to cart"

    respond_to do | format |
      format.js { render :action => 'edit' }  
    end
  end
  
  def update
    @order = current_order
    if @order.update_attributes(params[:order])
      @order.line_items = @order.line_items.select {|li| li.quantity > 0 }
      respond_to do |format|
        format.html { redirect_to cart_path }
        format.js   { render :action => 'edit' }  
      end
    else
      render :edit
    end
  end
end