module ShirtsHelper
  def size_list_item(size, selected_sizes)
  	if !selected_sizes.nil? and selected_sizes.include?(size.name)
  		checked = true
		else
			checked = false
		end
		 
		
  	ret = "<li>"
  	ret += check_box_tag('sizes[]', size.name, checked) 
  	ret += size.name
  	ret += "</li>"
  	
  end
end
