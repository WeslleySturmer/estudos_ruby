puts "Bem vindo ao jogo da adivinhação!"
puts "Qual seu nome?"

nome = gets

puts "Começaremos o jogo para você " + nome + "\n\n"
puts "Escolhendo um número secreto entre 0 e 200..."
numero_secreto = 122
sleep(2)
puts "Decidi meu número secreto!"

limite_tentativas = 5

for tentativas in 1..limite_tentativas
    puts "Tentativa " + tentativas.to_s + ' de ' + limite_tentativas.to_s
    puts "qual seu chute? "
    chute = gets

    puts "Seu chute foi " + chute

    if chute.to_i > numero_secreto
        puts "O número secreto é menor que seu chute \n\n"
    else 
        if chute.to_i < numero_secreto
            puts "O número secreto é maior que seu chute \n\n"
        else 
            puts "Parabéns você acertou! \n\n" 
            break
        end
    end
    
    if tentativas = limite_tentativas
        puts "Você perdeu!"
        puts "O número secreto era o " + numero_secreto.to_s
    end
end

