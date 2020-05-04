module Common
  def item
    self
  end
  
  def update_for_tomorrow
  # items.each do |item|


    if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
      if item.quality > 0
        if item.name != 'Sulfuras, Hand of Ragnaros'
          item.quality -= 1
        end
      end
    else
      if item.quality < 50
        item.quality += 1
        if item.name == 'Backstage passes to a TAFKAL80ETC concert'
          if item.sell_in < 11
            if item.quality < 50
              item.quality += 1
            end
          end
          if item.sell_in < 6
            if item.quality < 50
              item.quality += 1
            end
          end
        end
      end
    end
    if item.name != 'Sulfuras, Hand of Ragnaros'
      item.sell_in -= 1
    end
    if item.sell_in < 0
      if item.name != "Aged Brie"
        if item.name != 'Backstage passes to a TAFKAL80ETC concert'
          if item.quality > 0
            if item.name != 'Sulfuras, Hand of Ragnaros'
              item.quality -= 1
            end
          end
        else
          item.quality = item.quality - item.quality
        end
      else
        if item.quality < 50
          item.quality += 1
        end
      end
    end

    if item.name == 'Conjured Mana Cake' 
      puts "-- It's a Conjured Mana Cake, item.sell_in: " + item.sell_in.to_s + " item.quality: " + item.quality.to_s
      if  item.sell_in >= 0
        item.quality -= 1 unless item.quality == 0
      end
      if item.sell_in <= 0 # == -1
          puts "at item.sell_in == 0"
        item.quality -= 2 unless item.quality == 0
      end
      if item.sell_in <= 0
          # item.quality -= 2
        # item.quality  = 0
      end
    end

    if item.name == 'Conjured Mana Cake' && item.sell_in < 0
      # item.quality = item.quality - 1
    end
  end
  # end
  
end


module ConjuredManaCake
  def update_for_tomorrow
    # super
    item.sell_in -= 1
    if item.quality > 0
      item.quality -= 1
    end
   
    if item.sell_in < 0 && item.quality > 0
      item.quality -= 1
    end

    if item.sell_in >= 0
      item.quality -= 1 unless item.quality == 0
    end
    if item.sell_in <= 0 # == -1
      item.quality -= 2 unless item.quality == 0
    end

  end
end

module AgedBrie
  def update_for_tomorrow
    # super
    item.sell_in -= 1    
    if item.quality < 50
      item.quality += 1
      if item.sell_in < 0
        item.quality += 1
      end
    end
  end
end

module BackstagePass
  def update_for_tomorrow
    # super
    
    if item.quality < 50
      item.quality += 1
      if item.sell_in < 11
        item.quality += 1
      end
      if item.sell_in < 6 
        item.quality += 1
      end
    end
    
    item.sell_in -= 1
    if item.sell_in < 0
      item.quality = item.quality - item.quality
    end
  end
end

module Sulfuras
  def update_for_tomorrow
    # super
  end
end

def specific_item_for(item)
  item.extend Common

  if item.name == 'Conjured Mana Cake'
    item.extend ConjuredManaCake
  elsif item.name == 'Aged Brie'
    item.extend AgedBrie
  elsif item.name =~ /backstage/i
    item.extend BackstagePass
  elsif item.name == 'Sulfuras, Hand of Ragnaros'
    item.extend Sulfuras
  end

  item
end # line 364

def update_quality(items)
  items.map { |item| specific_item_for item }
       .each { |item| item.update_for_tomorrow }
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

