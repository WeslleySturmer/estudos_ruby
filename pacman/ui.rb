def boas_vindas
    puts "Seja bem vindo"
    puts "Qual seu nome"
    nome = gets.strip
    nome
end

def desenha_mapa(mapa)
    puts mapa
end

def pede_movimento
    puts "Para onde deseja ir?"
    direcao = gets.strip
    return direcao
end