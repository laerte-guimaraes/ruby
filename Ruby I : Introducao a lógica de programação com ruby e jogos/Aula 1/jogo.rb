puts "Bem vindo ao jogo da adivinhação \n"
puts "Qual é o seu nome?"
nome = gets

puts "\n Bem vindo ao jogo " + nome + " :) \n"

puts "\n Gerando número secreto ..."
numero_secreto = 75
puts "\n Gerado com sucesso !"

puts "\n Escolha um número :"
chute = gets
puts "\n \n Você escolheu " + chute
puts "\n \n"


if chute.to_i == numero_secreto.to_i
	puts "Parabéns, você acertou !"
else
	puts "Você errou !"
end

puts "Você saiu do jogo !"