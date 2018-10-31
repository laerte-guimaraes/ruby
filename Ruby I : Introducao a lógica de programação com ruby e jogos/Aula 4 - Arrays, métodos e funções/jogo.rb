def boas_vindas
	puts "Bem vindo ao jogo da adivinhação \n"
	puts "Qual é o seu nome?"
	nome = gets.strip
	puts "\n Bem vindo ao jogo #{nome} :) \n"
end

def gera_numero
	puts "\n Gerando número secreto ..."
	puts "\n Gerado com sucesso !"
	numero_gerado = 75
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

boas_vindas
numero_secreto = gera_numero
limite_de_tentativas = 5
chutes = []
total_de_chutes = 0

for tentativa in 1..limite_de_tentativas
	chute = pede_numero(tentativa, limite_de_tentativas, chutes)
	chutes << chute
	total_de_chutes += 1
	break if verifica_resultado(numero_secreto, chute)
end

puts "\n\n\n\n Você saiu do jogo !"