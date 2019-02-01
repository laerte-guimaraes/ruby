def boas_vindas
	puts "Bem vindo ao jogo da adivinhação \n"
	puts "Qual é o seu nome?"
	nome = gets.strip
	puts "\n Bem vindo ao jogo #{nome} :) \n"
end

def gera_numero
	puts "\n Gerando número secreto ..."
	puts "\n Gerado com sucesso !"
	numero_gerado = rand(200)
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
		puts "Parabéns, você acertou !"
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
	puts "\n Você perdeu TODOS os pontos :'("
	exit
end

boas_vindas
numero_secreto = gera_numero
limite_de_tentativas = 50
chutes = []
total_de_chutes = 0
pontuacao = 1000

for tentativa in 1..limite_de_tentativas
	chute = pede_numero(tentativa, limite_de_tentativas, chutes)
	chutes << chute if !chutes.include?(chute)
	total_de_chutes += 1
	break if verifica_resultado(numero_secreto, chute)
	pontuacao -= (((chute - numero_secreto).abs / 2.0) * tentativa)
	game_over if pontuacao <= 0
end
puts "\n Você obteve #{pontuacao} !"