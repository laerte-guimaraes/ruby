require_relative 'ui'
require_relative 'heroi'

def joga nome
	mapa = carrega_mapa 1

	while true
		desenha mapa
		direcao = pede_movimento
		hero_man = encontra_jogador mapa
		nova_posicao = hero_man.calcula_nova_posicao direcao

		next if nova_posicao and !posicao_valida? mapa, nova_posicao.to_array
		hero_man.remove_do mapa
		if mapa[nova_posicao.linha][nova_posicao.coluna] == '*'
			explode mapa, nova_posicao
		end
		nova_posicao.coloca_no mapa
		mapa = move_inimigos mapa
		if !encontra_jogador mapa
			desenha mapa
			game_over
			break
		end
	end
end

def explode mapa, posicao
	explode_cima mapa, posicao, 4
	explode_baixo mapa, posicao, 4
	explode_esquerda mapa, posicao, 4
	explode_direita mapa, posicao, 4
end

def explode_cima mapa, casas, quantidade
  return unless quantidade > 0

  inicio = casas.dup

  posicao = inicio
  posicao = casas.cima
  return if mapa[posicao.linha][posicao.coluna] == 'X'
  posicao.remove_do mapa

  explode_cima mapa, posicao, quantidade - 1
end

def explode_baixo mapa, casas, quantidade
  return unless quantidade > 0

  inicio = casas.dup

  posicao = inicio
  posicao = casas.baixo
  return if mapa[posicao.linha][posicao.coluna] == 'X'
  posicao.remove_do mapa

  explode_baixo mapa, posicao, quantidade - 1
end

def explode_direita mapa, casas, quantidade
    return unless quantidade > 0

    inicio = casas.dup

    posicao = inicio
    posicao = casas.direita
    return if mapa[posicao.linha][posicao.coluna] == 'X'
    posicao.remove_do mapa

    explode_direita mapa, posicao, quantidade - 1
end

def explode_esquerda mapa, casas, quantidade
    return unless quantidade > 0

    inicio = casas.dup

    posicao = inicio
    posicao = casas.esquerda
    return if mapa[posicao.linha][posicao.coluna] == 'X'
    posicao.remove_do mapa

    explode_esquerda mapa, posicao, quantidade - 1
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
			jogador = Heroi.new
			jogador.linha = linha
			jogador.coluna = coluna
			return jogador
		end
	end
	# Não encontrou o jogador no Mapa
	nil
end