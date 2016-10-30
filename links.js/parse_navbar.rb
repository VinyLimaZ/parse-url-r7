class ParseNavbar

		system('clear')
		
		file = open('links.html')
		#file_link = open('links_home.html', 'w')
		#file_name = open('links_name.html', 'w')
		
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
		
		a_link2 = []
		
		a_link.each do |a|
			a = a.split
			a = a[1]
			a.gsub!(/href="/, "")
			a.gsub!(/"/, "")
			a_link2 << a unless a.chomp.empty?
		end

		dict_mineiro = {}
		i = 0
		
		a_name.each do |a|
			dict_mineiro[a] = a_link2[i]
			i = i + 1
		end
		
	#file_link.close
	#file_name.close
	
	#dict_mineiro.each_key do |k|
	#	puts "#{k.chomp} => #{dict_mineiro[k].chomp}"
	#end
	
	######
	
	f_js = open('links.js', 'a+')
	f_js.puts "/* ATUALIZAR LINKS POSICIONANDO-OS EM ORDEM ALFABÉTICA */

var links = {"
	dict_mineiro.each_key do |key|
		#puts "#{key} => #{dict_mineiro[key].downcase.chomp}"
		
		if key.downcase.chomp == "r7 tv" 
				f_js.puts "#{key.downcase.chomp}:   '<li><a href=\"#{dict_mineiro[key].downcase.chomp}\">#{key.chomp}</a></li>\'+ ".chomp			
		elsif key.downcase.chomp == "notícias" 
				f_js.puts ",".chomp
				f_js.puts "#{key.downcase.chomp}:   '<li><a href=\"#{dict_mineiro[key].downcase.chomp}\">#{key.chomp}</a></li>\'+ ".chomp
		elsif key.downcase.chomp == "entretenimento" 
				f_js.print ",".chomp
				f_js.puts "#{"entrete".chomp}:   '<li><a href=\"#{dict_mineiro[key].downcase.chomp}\">#{key.chomp}</a></li>\'+ ".chomp
		elsif key.downcase.chomp == "esportes" 
				f_js.puts ",".chomp
				f_js.puts "#{key.downcase.chomp}:   '<li><a href=\"#{dict_mineiro[key].downcase.chomp}\">#{key.chomp}</a></li>\'+ ".chomp
		elsif key.downcase.chomp == "record" 
				f_js.puts ",".chomp
				f_js.puts "#{key.downcase.chomp}:   '<li><a href=\"#{dict_mineiro[key].downcase.chomp}\">#{key.chomp}</a></li>\'+ ".chomp
		else
			if key.downcase.chomp == "serviços" 
				f_js.puts ",".chomp
				f_js.puts "#{key.downcase.chomp}:   '<li><a href=\"#{dict_mineiro[key].downcase.chomp}\">#{key.chomp}</a></li>\'+ ".chomp
			end
		end
		
		f_js.puts "'<li><a href=\"#{dict_mineiro[key].downcase.chomp}\">#{key.chomp}</a></li>\'+ ".chomp
	end
	f_js.puts '}'
	
	f_js.close
	
end