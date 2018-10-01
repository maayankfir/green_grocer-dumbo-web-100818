def consolidate_cart(cart)
  new_cart = {}
  cart.each do |element|
    element.each do |item, info|
      info.each do |k, v|
      if !new_cart.include?(item)
        new_cart[item] = {}
      end
      new_cart[item][k] = v
    end
    if new_cart[item][:count] == nil
      new_cart[item][:count] = 0
    end
    new_cart[item][:count] += 1
      end
    end
  new_cart
end

def apply_coupons(cart, coupons)
  new_cart = {}
  cart.each do |element, info|
    coupons.each do |coup|
      if element == coup[:item] && info[:count] >= coup[:num]
        info[:count] = info[:count] - coup[:num]
        if new_cart[element + "W/COUPON"] 
          new_cart[element + "W/COUPON"][:count] += 1
        else
          new_cart[element + "W/COUPON"] = {:price => coup[:cost], :clearance => info[:clearance], :count => 1}
        end
      end
      new_cart[element] = info 
    end
    new_cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
