Spree Ajax Cart
=============

This is a basic implementation of an Ajax shopping cart for Spree (tested on 0.40 and 0.50.99/edge). To install, add the extension to your Gemfile:

    gem 'spree_ajax_cart', :git => 'git://github.com/pogodan/spree_ajax_cart'

And `bundle install`, then:

    rake spree_ajax_cart:install:assets

Then to render an ajax cart from any view, simply:

    render :partial => 'orders/ajax_cart', :locals => {:order => current_order(true) }

Use the `add_to_cart` route to easy ajax links. Here's a simple ERB template that will render an ajax cart and a list of all your products with ajax add to cart links:

    <%= render :partial => 'orders/ajax_cart', :locals => {:order => current_order(true) } %>
    <ul>
      <% @products.each do |product| %>
        <li><%= link_to product.name, add_to_cart_path(:variant_id => product.master.id), :remote => true, :method => :put %></li>
      <% end %>
    </ul>

Click one of the links and the cart will update

Copyright
-------------

Copyright (c) 2011 Pogodan. See LICENSE.txt for further details.
