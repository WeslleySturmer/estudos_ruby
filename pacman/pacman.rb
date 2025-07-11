require_relative 'ui'

def le_mapa(numero)
    texto = File.read("mapa#{numero}.txt")
    mapa = texto.split "\n"
end

def encontra_jogador(mapa)

    caractere_do_heroi = "H"

    mapa.each_with_index do |linha_atual, linha|
        coluna_do_heroi = linha_atual.index caractere_do_heroi
        if coluna_do_heroi
            return [linha, coluna_do_heroi]
        end
    end
    #NÃO ENCONTROU
end

def calcula_nova_posicao(heroi, direcao)
    heroi = heroi.dup

    movimentos = {
        "W" => [-1, 0],
        "S" => [+1, 0],
        "A" => [0, -1],
        "D" => [0, +1]
    }

    movimento = movimentos[direcao]
    heroi[0] += movimento[0]
    heroi[1] += movimento[1]

    heroi
end

def posicao_valida(mapa, nova_posicao)
    if nova_posicao[0] < 0 || nova_posicao[0] >= mapa.size
        return false
    end
    if nova_posicao[1] < 0 || nova_posicao[1] >= mapa[0].size
        return false
    end
    if mapa[nova_posicao[0]][nova_posicao[1]] == "X" || mapa[nova_posicao[0]][nova_posicao[1]] == "F" 
        return false
    end
    true
end

def posicoes_validas_a_partir_de(mapa, posicao)
    posicoes = []
    baixo = [posicao[0] + 1, posicao[1]]
    if posicao_valida mapa, baixo
        posicoes << baixo
    end
    cima = [posicao[0] - 1, posicao[1]]
    if posicao_valida mapa, cima
        posicoes << cima
    end
    esquerda = [posicao[0], posicao[1] - 1]
    if posicao_valida mapa, esquerda
        posicoes << esquerda
    end
    direita = [posicao[0], posicao[1] + 1]
    if posicao_valida mapa, direita
        posicoes << direita
    end

    posicoes
end

def move_fantasma(mapa, linha, coluna)
    posicoes = posicoes_validas_a_partir_de mapa, [linha, coluna]
    if posicoes.empty?
        return
    end

    posicao = posicoes[0]

    mapa[linha][coluna] = " "
    mapa[posicao[0]][posicao[1]] = "F"

end

def copia_mapa(mapa)
    
end

def move_fantasmas(mapa)
    caractere_do_fantasma = "F"
    mapa.each_with_index do |linha_atual, linha|
        linha_atual.chars.each_with_index do |caracter_atual, coluna|
            if caracter_atual == caractere_do_fantasma
                move_fantasma mapa, linha, coluna
            end
        end
    end
end

def joga(nome)
    mapa = le_mapa 2

    while true
        desenha_mapa mapa
        direcao = pede_movimento
        heroi = encontra_jogador mapa
        nova_posicao = calcula_nova_posicao heroi, direcao
        
        if !posicao_valida mapa, nova_posicao
            next
        end

        mapa[heroi[0]][heroi[1]] = " "
        mapa[nova_posicao[0]][nova_posicao[1]] = "H"

        move_fantasmas(mapa)
    end
end

def inicia_pacman
    nome = boas_vindas

    joga nome
end
