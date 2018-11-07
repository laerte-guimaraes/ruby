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
	puts 'Qual é o seu nome?'
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

def chuta(chutes, erros)
	puts "\n\n\n\n"
	puts "Erros até agora: #{erros}"
	puts "Chutes até agora: #{chutes}"
	puts "Entre com uma letra"
	chute = gets.strip
	puts "Será que acertou? Você chutou #{chute}"
	chute
end

def chute_por_letra(palavra_secreta, chute)
	total_encontrado = palavra_secreta.count chute

	if total_encontrado == 0
		puts "A letra #{chute} não foi encontrada !"
		return false
	else
		puts "A letra #{chute} foi encontrada #{total_encontrado} vezes"
		return true
	end
end

def jogar
	palavra_secreta = gera_palavra
	erros = 0
	chutes = []
	pontos_ate_agora = 100

	while erros < 5
		chute = chuta chutes, erros
		if chutes.include?(chute)
			puts "Você já chutou #{chute}!"
			next
		end
		chutes << chute

		if chute.size == 1
			acertos = chute_por_letra palavra_secreta, chute
			if !acertos
				erros += 1
				pontos_ate_agora -= 30
			end
		else
			if chute == palavra_secreta
				puts 'Parabéns você acertou!'
				break
			end
			puts 'Você errou :('
			erros += 1
			pontos_ate_agora -= 30
		end	
	end
	puts "Você ganhou #{pontos_ate_agora} pontos.\n"
end

def quer_jogar?
	puts 'Deseja jogar novamente? (S/N)'
	gets.strip.upcase == 'S'
end

nome = boas_vindas

loop do
	jogar
	if !quer_jogar?
		break
	end
end

