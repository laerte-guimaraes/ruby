class Heroi
  attr_accessor :linha, :coluna

  def calcula_nova_posicao direcao
    # O .dup nesse caso serve para não realizar modificações no objeto principal
    # Quando o .dup é utilizado, o ruby cria uma cópia da variável com os mesmos valores :)
    hero_pos = self.dup

    direcoes = {
      'w' => [-1, 0],
      's' => [ 1, 0],
      'a' => [ 0,-1],
      'd' => [ 0, 1]
    }

    if movimento = direcoes[direcao]
      hero_pos.linha += movimento[0]
      hero_pos.coluna += movimento[1]
      hero_pos
    end
  end

  def to_array
    [linha, coluna]
  end

  def remove_do mapa
    mapa[linha][coluna] = ' '
  end

  def coloca_no mapa
    mapa[linha][coluna] = 'H'
  end

end