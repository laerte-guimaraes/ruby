puts "Bem vindo ao jogo da adivinhação \n"
puts "Qual é o seu nome?"
nome = gets

puts "\n Bem vindo ao jogo " + nome + " :) \n"

puts "\n Gerando número secreto ..."
numero_secreto = 75
puts "\n Gerado com sucesso !"

limite_de_tentativas = 5

for tentativa in 1..limite_de_tentativas
	puts "\n Tentativa " + tentativa.to_s + " de " + limite_de_tentativas.to_s + "." 
	puts "\n Escolha um número :"
	chute = gets
	puts "\n \n Você escolheu " + chute
	puts "\n \n"

	acertou = numero_secreto == chute.to_i
	maior = numero_secreto > chute.to_i

	if acertou
		puts "Parabéns, você acertou !"
		break
	else
		puts "Você errou !"
		if maior
			puts "O número secreto é MAIOR que " + chute
		else
			puts "O número secreto é MENOR que " + chute
		end
	end
end

puts "\n\n\n\n Você saiu do jogo !"