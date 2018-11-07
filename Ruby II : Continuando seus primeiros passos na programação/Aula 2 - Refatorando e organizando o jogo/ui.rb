def boas_vindas
	puts
    puts "        P  /_\\  P                             "
    puts "       /_\\_|_|_/_\\                           "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|        Jogo de Forca !  "
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                             "
    puts
	puts '   Qual é o seu nome?'
	nome = gets.strip
	puts "\n Bem vindo ao jogo #{nome} :) \n"
	nome
end

def gera_palavra
	puts "\n Gerando palavra secreta ..."
	palavra_secreta = 'nunu'
	puts "A palavra secreta possui #{palavra_secreta.size} letras.. Boa sorte!"
	palavra_secreta
end

def template_chutes chutes, erros, mascara
	puts "\n\n\n\n"
	puts "Palavra secreta: #{mascara}"
	puts "Erros até agora: #{erros}"
	puts "Chutes até agora: #{chutes}"
end

def chuta chutes
	puts "Entre com uma letra"
	chute = gets.strip
	return chute if chutes.include?(chute)
	puts "Será que acertou? Você chutou ['#{chute}']"
	chute
end

def chute_por_letra palavra_secreta, chute
	total_encontrado = palavra_secreta.count chute

	if total_encontrado == 0
		puts "A letra #{chute} não foi encontrada !"
		return false
	else
		puts "A letra #{chute} foi encontrada #{total_encontrado} vezes"
		return true
	end
end

def quer_jogar?
	puts 'Deseja jogar novamente? (S/N)'
	gets.strip.upcase == 'S'
end

def chute_duplicado chute
	puts "Você já chutou ['#{chute}']!"
end

def acerto palavra_secreta
	puts 'Parabéns você acertou!'
	puts "A palavra era ['#{palavra_secreta}']."
end

def erro
	puts 'Você errou :('
end

def avisa_pontos pontos
	puts "Você ganhou #{pontos} pontos.\n"
end
