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
		move_inimigos mapa
	end
end

def move_inimigos mapa
	enemy = 'F'
	mapa.each_with_index do |linha_atual, linha|
		# A linha_atual é uma string. Nesse caso, o each_with_index não funcionaria por ser
		# específico para arrays.
		# É possível utilizar .chars para converter uma string em um array de caracteres
		linha_atual.chars.each_with_index do |caractere_atual, coluna|
			if caractere_atual == enemy
				move_inimigo mapa, linha, coluna
			end
		end
	end
end

def move_inimigo mapa, linha, coluna
	posicao = [linha, coluna + 1]
	if posicao_valida? mapa, posicao
		mapa[linha][coluna] = ' '
		mapa[posicao[0]][posicao[1]] = 'F'
	end
end

def calcula_nova_posicao hero_pos, direcao
	direcoes = {
	  'w' => [-1, 0],
	  's' => [ 1, 0],
	  'a' => [ 0,-1],
		'd' => [ 0, 1]
	}

	movimento = direcoes[direcao]
	hero_pos[0] += movimento[0]
	hero_pos[1] += movimento[1]
	hero_pos
end

def posicao_valida? mapa, posicao
	return false if posicao[0] < 0 ||
	posicao[1] < 0 ||
	posicao[0] >= mapa.size ||
	posicao[1] >= mapa.size ||
	mapa[posicao[0]][posicao[1]] == 'X' ||
	mapa[posicao[0]][posicao[1]] == 'F'
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