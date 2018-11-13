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

		next if nova_posicao and !posicao_valida? mapa, nova_posicao
		mapa[hero_man[0]][hero_man[1]] = ' '
		mapa[nova_posicao[0]][nova_posicao[1]] = 'H'
		mapa = move_inimigos mapa
		if !encontra_jogador mapa
			desenha mapa
			game_over
			break
		end
	end
end

def soma_vetor vetor1, vetor2
	[vetor1[0] + vetor2[0], vetor1[1] + vetor2[1]]
end

def posicoes_validas mapa, novo_mapa, posicao
	posicoes = []
	movimentos = [[+1, 0], [0, +1], [-1, 0], [0, -1]]
	movimentos.each do |movimento|
		nova_posicao = soma_vetor movimento, posicao
		if posicao_valida? mapa, nova_posicao and posicao_valida? novo_mapa, nova_posicao
			posicoes << nova_posicao
		end
	end
	posicoes
end

def move_inimigos mapa
	enemy = 'F'
	novo_mapa = copia_mapa mapa
	mapa.each_with_index do |linha_atual, linha|
		# A linha_atual é uma string. Nesse caso, o each_with_index não funcionaria por ser
		# específico para arrays.
		# É possível utilizar .chars para converter uma string em um array de caracteres
		linha_atual.chars.each_with_index do |caractere_atual, coluna|
			if caractere_atual == enemy
				move_inimigo mapa, novo_mapa, linha, coluna
			end
		end
	end
	novo_mapa
end

def copia_mapa mapa
	mapa.join("\n").tr('F', ' ').split("\n")
end

def move_inimigo mapa, novo_mapa, linha, coluna
	posicoes = posicoes_validas mapa, novo_mapa, [linha, coluna]
	return if posicoes.empty?
	posicao = posicoes[rand 0..posicoes.size-1]
	if posicao_valida? mapa, posicao
		mapa[linha][coluna] = ' '
		novo_mapa[posicao[0]][posicao[1]] = 'F'
	end
end

def calcula_nova_posicao hero_pos, direcao
	direcoes = {
	  'w' => [-1, 0],
	  's' => [ 1, 0],
	  'a' => [ 0,-1],
		'd' => [ 0, 1]
	}

	if movimento = direcoes[direcao]
		hero_pos[0] += movimento[0]
		hero_pos[1] += movimento[1]
		hero_pos
	end
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
	# Não encontrou o jogador no Mapa
	nil
end