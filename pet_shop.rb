def pet_shop_name(name)
  return name[:name]
end

def total_cash(name)
  return name[:admin][:total_cash]
end

def add_or_remove_cash(name, amount)
  amount_change = name[:admin][:total_cash] + amount
  name[:admin][:total_cash] = amount_change
  return amount_change
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, pets_sold)
  amount_sold = pet_shop[:admin][:pets_sold] + pets_sold
  pet_shop[:admin][:pets_sold] = amount_sold
  return amount_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  total = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
    total << pet
    end
  end
    return total
end

def find_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
for pet_name in pet_shop[:pets]
  if pet_name[:name] == name
    return pet_shop[:pets].delete(pet_name)
  end
end
return nil
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_cash(name)
  return name[:cash]
end

def remove_customer_cash(name, amount)
  updated_amount = name[:cash] - amount
  name[:cash] = updated_amount
  return updated_amount
end

def customer_pet_count(name)
  name[:pets].length
end

def add_pet_to_customer(customer, pet)
  customer[:pets] << pet
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  end
  return false
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil && customer_can_afford_pet(customer, pet) == true
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop, 1)
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(pet_shop, pet[:price])
  end
end
