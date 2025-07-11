def boas_vindas
    puts "Seja bem vindo ao jogo da forca!"
    puts "Qual seu nome?"
    nome = gets.strip
    puts "Começarei o jogo para você, #{nome}"
    nome
end

def nao_quer_jogar
    puts "Deseja jogar novamente? (S/N)"
    quer_jogar = gets.strip
    nao_quer_jogar = quer_jogar.upcase == "N" 
end

def cabecalho_de_tentativa(chutes, erros, mascara)
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes}"
    puts "Palavra secreta: #{mascara}"
end

def pede_chute
    puts "Entre com uma letra ou palavra"
    chute = gets.strip.downcase
    puts "Você chutou #{chute}"
    chute
end

def avisa_chute_efetuado(chute)
    puts "Você já chutou #{chute}"
end

def avisa_letra_nao_encontrada
    puts "Letra não encontrada"
end

def avisa_letra_encontrada(total_encontrado)
    puts "Letra encontrada #{total_encontrado} vezes"
end

def avisa_acertou_palavra
    puts "Parabéns você acertou!"
end

def avisa_errou_palavra
    puts "Puts que pena, você errou"
end

def avisa_pontos(pontos_ate_agora)
    puts "Você ganhou #{pontos_ate_agora} pontos!"
end

def avisa_escolhendo_palavra_secreta
    puts "Escolhendo palavra secreta..."
end

def avisa_palavra_escolhida(palavra_secreta)
    puts "Palavra escolhida! Ela tem um total de #{palavra_secreta.size} letras"
    palavra_secreta
end

def avisa_pontos_totais(pontos_totais)
    puts "Seus pontos totais são #{pontos_totais}"
end

def avisa_campeao_atual(dados)
    puts "O campeão atual é #{dados[0]} com #{dados[1]} pontos"
end