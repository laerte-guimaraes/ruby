require_relative 'ui'

def joga nome
	mapa = carrega_mapa 1

	while true
		desenha mapa
		direcao = pede_movimento
		hero_man = encontra_jogador mapa

		# O hero_man.dup nesse caso serve para não realizar modificações na variável principal
		# Quando o .dup é utilizado, o ruby cria uma cópia da variável com os mesmos valores :) 
		nova_posicao = calcula_nova_posicao hero_man.dup, direcao

		next if !posicao_valida? mapa, nova_posicao
        mapa[hero_man[0]][hero_man[1]] = ' '
		mapa[nova_posicao[0]][nova_posicao[1]] = 'H'
				
	end
end

def calcula_nova_posicao hero_pos, direcao
	case direcao
		when 'w'
			hero_pos[0] -= 1
		when 's'
			hero_pos[0] += 1
		when 'a'
			hero_pos[1] -= 1
		when 'd'
			hero_pos[1] += 1
	end
	hero_pos
end

def posicao_valida? mapa, posicao
	return false if posicao[0] < 0 ||
					posicao[1] < 0 ||
					posicao[0] >= mapa.size ||
					posicao[1] >= mapa.size ||
					mapa[posicao[0]][posicao[1]] == 'X'
	true
end

def inicia_jogo
	nome = boas_vindas
	joga nome
end

def carrega_mapa (numero)
	texto = File.read "mapa#{numero}.txt"
	mapa = texto.split "\n"
end

def encontra_jogador mapa
	hero_man = 'H'
	mapa.each_with_index do |linha_atual , linha|
		coluna = linha_atual.index hero_man
		if coluna
			return [linha, coluna]
		end
	end
	# não achou
end