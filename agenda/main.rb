require 'json'

if File.exist?("dados.json") && !File.zero?("dados.json")
  contatos = JSON.parse(File.read("dados.json"), symbolize_names: true)
else
  contatos = []
end

puts "Bem vindo a sua agenda, o que deseja fazer?"

loop do
    puts "1. Listar todos os contatos"
    puts "2. Adicionar um novo contato"
    puts "3. Excluir um contato"
    puts "4. Sair"

    resposta = gets.to_i

    case resposta
    when 1
        if contatos == []
            puts "--------------------------------------------------"
            puts "Você não tem nenhum contato cadastrado"
            puts "--------------------------------------------------"
        else
            puts "--------------------------------------------------"
            contatos.each_with_index do |pessoa, i|
                puts "Contato #{i+1}: #{pessoa[:nome]} - #{pessoa[:telefone]}"
            end
            puts "--------------------------------------------------"
        end

    when 2
        loop do
            puts "--------------------------------------------------"
            puts "Digite o nome do contato a ser cadastrado: "
            nome = gets.strip.capitalize

            puts "Digite o número de telefone: "
            telefone = gets.strip

            contato_existe = contatos.any? { |pessoa| pessoa[:nome] == nome}

            if contato_existe == true
                puts "Essa pessoa já está cadastrada, gostaria de adicionar outro cadastro?"
                resposta = gets.strip.upcase
                if resposta == 'S'
                    next
                else resposta == 'N'
                    break
                end
            else
                pessoa = {nome: nome, telefone: telefone}
                contatos << pessoa

                puts "Contato adicionado com sucesso!"
                puts "--------------------------------------------------"
                contatos.each_with_index do |pessoa, i|
                        puts "Contato #{i+1}: #{pessoa[:nome]} - #{pessoa[:telefone]}"
                end
                puts "--------------------------------------------------"
                File.write("dados.json", contatos.to_json)
                break
            end
        end

    when 3
        if contatos == []
            puts "--------------------------------------------------"
            puts "Você não tem contatos para excluir"
        else
            puts "--------------------------------------------------"
            puts "Qual contato deseja excluir?"
            contatos.each_with_index do |pessoa, i|
                puts "Contato #{i+1}: #{pessoa[:nome]} - #{pessoa[:telefone]}"
            end
            contato_excluir = gets.strip.capitalize

                contatos.delete_if { |pessoa| pessoa[:nome] == contato_excluir}
        end

        puts "--------------------------------------------------"
        contatos.each_with_index do |pessoa, i|
            puts "Contato #{i+1}: #{pessoa[:nome]} - #{pessoa[:telefone]}"
        end
        puts "--------------------------------------------------"
        File.write("dados.json", contatos.to_json)

    when 4
        break
    else
        puts "--------------------------------------------------"
        puts "Opção inválida!"
        puts "--------------------------------------------------"
    end
end