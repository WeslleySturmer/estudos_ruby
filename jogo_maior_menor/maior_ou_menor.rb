def dar_boas_vindas
    puts "Bem vindo ao jogo da adivinhação!"
    puts "Qual seu nome?"
    nome = gets.strip
    puts "Começaremos o jogo para você " + nome + "\n\n"
end

def define_numero_secreto
    puts "Escolhendo um número secreto entre 0 e 200..."
    numero_secreto = 122
    sleep(2)
    puts "Decidi meu número secreto!"
    return numero_secreto
end

def pede_numero(tentativas, limite_tentativas)
    puts "Tentativa " + tentativas.to_s + ' de ' + limite_tentativas.to_s
    puts "qual seu chute? "
    chute = gets.strip

    puts "Seu chute foi " + chute
    return chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
    if chute > numero_secreto
        puts "O número secreto é menor que seu chute \n\n"
        return false
    else 
        if chute < numero_secreto
            puts "O número secreto é maior que seu chute \n\n"
            return false
        else 
            puts "Parabéns você acertou! \n\n" 
            return true
        end
    end
    
    if tentativas = limite_tentativas
        puts "Você perdeu!"
        puts "O número secreto era o " + numero_secreto.to_s
    end
end

dar_boas_vindas

numero_secreto = define_numero_secreto

limite_tentativas = 5
numeros_anteriores = []

for tentativas in 1..limite_tentativas
    chute = pede_numero(tentativas, limite_tentativas)

    if verifica_se_acertou(numero_secreto, chute)
        break
    end

    numeros_anteriores << chute
    puts "Seus chutes anteriores foram " + numeros_anteriores.to_s
end

