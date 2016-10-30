require_relative 'parse_navbar'

class Filter
	
	parse = ParseNavbar.new
	parse.main
	
	f_js = open('new.js', 'a+')
	
	f_js.puts "/* ATUALIZAR LINKS POSICIONANDO-OS EM ORDEM ALFABÉTICA */
	var links = {
	r7 vc: "
	
	f_link = open('links_home.html', 'a+')
	f_name = open('links_name.html', 'a+')
	
	dic_mineiro = {}
	array_name = []
	
	f_name.each_line do |fn|
		array_name << fn
	end
	
	i = 0
	
	f_link.each_line do |fl|
		dic_mineiro[array_name[0]] = fl
		i += 1
	end
	f_name.close
	f_link.close
	
	dic_mineiro.each_key do |key|
		puts "#{key} => #{dic_mineiro[key]}"
		if key.downcase == "notícias" 
				f_js.puts ",\n"
				f_js.puts "#{key.downcase.chomp}: \t'<li><a href=\"#{dic_mineiro[key]}\">#{key.capitalize}</a></li>\'+ "
		elsif key.downcase == "entretenimento" 
				f_js.puts ",\n"
				f_js.puts "#{"entrete"}: \t'<li><a href=\"#{dic_mineiro[key]}\">#{key.capitalize}</a></li>\'+ "
		elsif key.downcase == "esportes" 
				f_js.puts ",\n"
				f_js.puts "#{key.downcase.chomp}: \t'<li><a href=\"#{dic_mineiro[key]}\">#{key.capitalize}</a></li>\'+ "
		elsif key.downcase == "record" 
				f_js.puts ",\n"
				f_js.puts "#{key.downcase.chomp}: \t'<li><a href=\"#{dic_mineiro[key]}\">#{key.capitalize}</a></li>\'+ "
		elsif key.downcase == "serviços" 
				f_js.puts ",\n"
				f_js.puts "#{key.downcase.chomp}: \t'<li><a href=\"#{dic_mineiro[key]}\">#{key.capitalize}</a></li>\'+ "
		else
				f_js.puts "'<li><a href=\"#{dic_mineiro[key]}\">#{key.capitalize}</a></li>\'+ "
		end
	end

	f_js.close
	
end
