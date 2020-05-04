require 'nokogiri'

def process_placemark(node)
  puts "------ in process_placemark"
  node.children.each do |child|
    
    puts "------ child is #{child.class}, ------ child.children.length: #{child.children.length}"
    puts "------ child: #{child}"
    if child.type == 1 # TEXT
      text = child.children
      puts "-------- child.name (text): #{child.name}"
      puts "-------- text.children.length: #{text.children.length}"
      # puts "-------- element.name: #{text.name}"
      puts "-------- text.text: #{text.text}"
    elsif child.type == 3 # ELEMENT 
      puts "-------- child.name (element): #{child.name}"
      element = child.children
      puts "-------- element.children.length: #{element.children.length}"
      puts "-------- element.children.length: #{element.children.length}"
    end
  end
end

def main_sub

  f = File.open(ARGV[0])
  doc = Nokogiri::XML(f)
  f.close
  root = doc.root

  puts "root.class: #{root.class}"
  puts "root.values: #{root.values}"

  children = root.children
  puts "children.class: #{children.class}"
  puts "children.length: #{children.length}"
  x = 0
  children.each do |node|
    x += 1
    puts "node.class for #{x}: #{node.class} which is of type #{node.type}"
    if node.type == 1 # element
      n_children = node.children
      puts "-- element has children: #{n_children.length}"
      n_children.each do |n_child|
        puts "---- n_child is a #{n_child.class}"
        if n_child.type == 3 # TEXT
           puts "---- it's text: #{n_child}"
        elsif n_child.type == 1
          puts "---- It's element: #{n_child}"
          puts "---- n_child.children.length: #{n_child.children.length}"
          process_placemark(n_child)
        end
      end
    end
    # puts "node.text: #{node.text}"
  end

  puts "Nokogiri::XML::Node.ELEMENT_NODE: #{Nokogiri::XML::Node::ELEMENT_NODE}"
  puts "Nokogiri::XML::Node.TEXT_NODE: #{Nokogiri::XML::Node::TEXT_NODE}"
end

main_sub
