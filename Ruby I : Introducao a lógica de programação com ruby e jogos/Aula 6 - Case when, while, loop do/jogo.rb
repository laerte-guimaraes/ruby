def boas_vindas
	puts
    puts "        P  /_\\  P                             "
    puts "       /_\\_|_|_/_\\                           "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                             "
    puts
	puts "Qual é o seu nome?"
	nome = gets.strip
	puts "\n Bem vindo ao jogo #{nome} :) \n"
	nome
end

def gera_numero(dificuldade)
	puts "\n Gerando número secreto ..."
	puts "\n Gerado com sucesso !"
	numero_gerado = rand(dificuldade)
end

def pede_numero(tentativa, limite_de_tentativas, chutes)
	puts "\n Tentativa #{tentativa} de #{limite_de_tentativas}."
	puts "Chutes até agora: #{chutes}" if !chutes.empty?
	puts "\n Escolha um número :"
	numero = gets.strip
	puts "\n \n Você escolheu #{numero}"
	puts "\n \n"
	numero.to_i
end

def verifica_resultado(numero_secreto, chute)
	acertou = numero_secreto == chute

	if acertou
		ganhou
		return true
	end

	puts "Você errou !"
	maior = numero_secreto > chute
	if maior
		puts "O número secreto é MAIOR que #{chute}"
	else
		puts "O número secreto é MENOR que #{chute}"
	end
	false
end

def game_over
	perdeu
	exit
end

def pede_dificuldade
    puts "Qual o nível de dificuldade?"
    puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
    puts "Escolha: "
	case gets.to_i
	when 1
		return 30
	when 2
		return 60
	when 3
		return 100
	when 4
		return 150
	else
		return 200
	end
end

def jogar(nome, dificuldade)

	numero_secreto = gera_numero(dificuldade)
	limite_de_tentativas = 5 * dificuldade
	chutes = []
	total_de_chutes = 0
	pontuacao = 1000

	for tentativa in 1..limite_de_tentativas
		chute = pede_numero(tentativa, limite_de_tentativas, chutes)
		chutes << chute if !chutes.include?(chute)
		total_de_chutes += 1
		if nome == 'laerte'
			ganhou
			break
		end
		break if verifica_resultado(numero_secreto, chute)
		pontuacao -= (((chute - numero_secreto).abs / 2.0) * tentativa)
		game_over if pontuacao <= 0
	end
	puts "\n Você obteve #{pontuacao} !"
end

def quer_jogar
	puts 'Deseja jogar novamente? (S/N)'
	gets.strip.upcase == 'S'
end

def ganhou
	puts
	puts "             OOOOOOOOOOO               "
	puts "         OOOOOOOOOOOOOOOOOOO           "
	puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
	puts "    OOOOOO      OOOOO      OOOOOO      "
	puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
	puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
	puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
	puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
	puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
	puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
	puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
	puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
	puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
	puts "         OOOOOO         OOOOOO         "
	puts "             OOOOOOOOOOOO              "
	puts
	puts "               Acertou!                "
	puts
end

def perdeu
	puts
	puts "             OOOOOOOOOOO               "
	puts "         OOOOOOOOOOOOOOOOOOO           "
	puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
	puts "    OOOOOO      OOOOO      OOOOOO      "
	puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
	puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
	puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
	puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO0 "
	puts "OOOOOOOOOOOO              OOOOOOOOOOOO "
	puts "OOOOOOOOO    OOOOOOOOOOOO   OOOOOOOOOO "
	puts "OOOOOOOOO  OOOOOOOOOOOOOOOO   OOOOOOOO "
	puts "OOOOOO   OOOOOOOOOOOOOOOOOOOO  OOOOOO  "
	puts " OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO   "
	puts "   OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO     "
	puts "      OOOOOOOOOOOOOOOOOOOOOOOOOOO      "
	puts "         OOOOOOOOOOOOOOOOOOOOO         "
	puts "             OOOOOOOOOOOO              "
	puts
	puts "              GAME OVER!               "
	puts
end

nome = boas_vindas
dificuldade = pede_dificuldade

loop do
	jogar(nome, dificuldade)
	if !quer_jogar
		break
	end
end