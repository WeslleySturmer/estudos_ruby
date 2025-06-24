def dar_boas_vindas
  puts "Bem vindo ao jogo da adivinhação!"
  puts "Qual seu nome?"
  nome = gets.strip
  puts "Começaremos o jogo para você #{nome}\n\n"
end

def define_numero_secreto
  puts "Escolhendo um número secreto entre 0 e 200..."
  numero_secreto = rand(201)
  sleep(2)
  puts "Decidi meu número secreto!"
  return numero_secreto
end

def pede_numero(tentativas, limite_tentativas)
  puts "Tentativa #{tentativas} de #{limite_tentativas}"
  puts "Qual seu chute?"
  chute = gets.strip
  puts "Seu chute foi #{chute}"
  return chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
  if chute > numero_secreto
    puts "O número secreto é menor que seu chute \n\n"
    return false
  elsif chute < numero_secreto
    puts "O número secreto é maior que seu chute \n\n"
    return false
  else
    puts "Parabéns, você acertou! \n\n"
    return true
  end
end

# Código principal
dar_boas_vindas

numero_secreto = define_numero_secreto
pontos = 1000
limite_tentativas = 5
numeros_anteriores = []
venceu = false

for tentativas in 1..limite_tentativas
  chute = pede_numero(tentativas, limite_tentativas)

  if verifica_se_acertou(numero_secreto, chute)
    venceu = true
    break
  end

  pontos -= (chute - numero_secreto).abs / 2.0

  numeros_anteriores << chute
  puts "Seus chutes anteriores foram: #{numeros_anteriores}"
end

unless venceu
  puts "Você perdeu!"
  puts "O número secreto era o #{numero_secreto}"
end

puts "Sua pontuação foi de #{pontos} pontos"
