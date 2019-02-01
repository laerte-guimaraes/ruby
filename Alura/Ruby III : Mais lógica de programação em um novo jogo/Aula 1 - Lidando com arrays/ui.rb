def boas_vindas
	puts 'Bem vindo ao PACMAN'
	puts 'Qual é o seu nome?'
	nome = gets.strip
	puts = "\n\n\n\n\n\n"
	puts 'Vamos lá :D'
	nome
end

def desenha mapa
	puts mapa
end

def pede_movimento
	puts 'Para onde deseja ir? [ W | A | S | D ]'
	movimento = gets.strip.downcase
end