class ParseNavbar
	def main
		system('clear')
		
		file = open('links.html')
		f_link = open('links_home.html', 'w')
		f_name = open('links_name.html', 'w')
		
		array_ancora = []
		
		file.each_line do |f|
			array_ancora << f
		end
		a_link = []
		a_name = []
		
		array_ancora.each do |a|
			a_link << a.chomp if a.include?("<a href")
			a_name << a if !a.include?("<") && !a.include?(">")
		end
						
		a_link.each do |a|
			a = a.split
			a = a[1]
			a.gsub!(/href="/, "")
			a.gsub!(/"/, "")
			f_link.puts a unless a.chomp.empty?
		end
		
		a_name.each do |a|
			f_name << a
		end
	f_link.close
	f_name.close
	end
end