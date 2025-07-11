puts "digite seu nome: "
nome = gets.strip

puts "digite sua idade: "
idade = gets.to_i

puts "digite sua cidade: "
cidade = gets.strip

cadastro = {nome: nome, idade: idade, cidade: cidade}

cadastro.each do |chave, valor|
    puts "#{chave}: #{valor}"
end