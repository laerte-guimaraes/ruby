def boas_vindas
    puts '/****************/'
    puts '/ Jogo de Forca */'
    puts '/****************/'
    puts
	puts '   Qual é o seu nome?'
	nome = gets.strip
	puts "\n Bem vindo ao jogo #{nome} :) \n"
	nome
end

def desenha_forca erros
    cabeca = "   "
    corpo = " "
    pernas = "   "
    bracos = "   "
    if erros >= 1
        cabeca = "(_)"
    end
    if erros >= 2
        bracos = " | "
        corpo = "|"
    end
    if erros >= 3
        bracos = "\\|/"
    end
    if erros >= 4
        pernas = "/ \\"
    end

    puts "  _______       "
    puts " |/      |      "
    puts " |      #{cabeca}  "
    puts " |      #{bracos}  "
    puts " |       #{corpo}  "
    puts " |      #{pernas}  "
    puts " |              "
    puts "_|___           "
    puts
end

def avisa_campeao_atual dados
	puts "Nosso campeão atual é #{dados[0]} com #{dados[1]} pontos."
end

def avisa_escolhendo_palavra
	puts "\n Gerando palavra secreta ..."
end

def avisa_pontos_totais pontos_totais
	puts "Você possui #{pontos_totais} pontos."
end

def avisa_palavra_escolhida palavra_secreta
	puts "A palavra secreta possui #{palavra_secreta.size} letras.. Boa sorte!"
end

def template_chutes chutes, erros, mascara
	puts "\n\n\n\n"
	desenha_forca erros
	puts "Palavra secreta: #{mascara}"
	puts "Erros até agora: #{erros}"
	puts "Chutes até agora: #{chutes}"
end

def chuta chutes
	puts "Entre com uma letra"
	chute = gets.strip.downcase
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
    puts "       ___________      "
    puts "      '._==_==_=_.'     "
    puts "      .-\\\\:      /-.    "
    puts "     | (|:.     |) |    "
    puts "      '-|:.     |-'     "
    puts "        \\\\::.    /      "
    puts "         '::. .'        "
    puts "           ) (          "
    puts "         _.' '._        "
    puts "        '-------'       "
    puts

end

def erro
	puts 'Você errou :('
end

def avisa_pontos pontos
	puts "Você ganhou #{pontos} pontos.\n"
end
