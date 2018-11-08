require_relative 'ui'
require_relative 'rank'

def pede_chute_valido chutes, erros, mascara
	template_chutes chutes, erros, mascara
	loop do
		chute = chuta chutes
		if chutes.include?(chute)
			chute_duplicado chute
		else
			return chute
		end
	end
end

def gera_palavra
	avisa_escolhendo_palavra
	texto = File.read 'dicionario.txt'
	todas_as_palavras = texto.split "\n"
	numero_escolhido = rand(todas_as_palavras.size)
	palavra_secreta = todas_as_palavras[numero_escolhido].downcase
	avisa_palavra_escolhida palavra_secreta
	palavra_secreta
end

def palavra_mascarada palavra_secreta, chutes
	mascara = ''
	for letra in palavra_secreta.chars
		if chutes.include? letra
			mascara << letra
		else
			mascara << '_'
		end
	end
	mascara
end

def jogar nome
	palavra_secreta = gera_palavra
	erros = 0
	chutes = []
	pontos_ate_agora = 100

	while erros < 5
		mascara = palavra_mascarada palavra_secreta, chutes
		if !mascara.include? '_'
			acerto palavra_secreta
			break
		end
		chute = pede_chute_valido chutes, erros, mascara
		if chutes.include?(chute)
			chute_duplicado chute
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
				acerto palavra_secreta
				break
			end
			erro
			erros += 1
			pontos_ate_agora -= 30
		end	
	end
	avisa_pontos pontos_ate_agora
	pontos_ate_agora
end

def jogo_da_forca
	nome = boas_vindas
	pontos_totais = 0
	avisa_campeao_atual le_rank

	loop do
		pontos_totais += jogar nome
		avisa_pontos_totais = pontos_totais
		if le_rank[1].to_i < pontos_totais
			salva_rank nome, pontos_totais
		end
		if !quer_jogar?
			break
		end
	end
end

