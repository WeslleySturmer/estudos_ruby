require 'json'

if File.exist?("dados.json") && !File.zero?("dados.json")
  pessoas = JSON.parse(File.read("dados.json"), symbolize_names: true)
else
  pessoas = []
end

loop do
    puts "Deseja cadastrar uma nova pessoa? (S/N)"
    resposta = gets.strip.upcase

    if resposta == 'S'
        pessoa = {}

        puts "Digite o nome da pessoa: "
        pessoa[:nome] = gets.strip.capitalize
        puts "Digite a idade da pessoa: "
        pessoa[:idade] = gets.to_i
        puts "Digite o telefone da pessoa: "
        pessoa[:telefone] = gets.to_s.strip

        pessoas << pessoa
        File.write("dados.json", pessoas.to_json)

        pessoas.each_with_index do |pessoa, i|
            puts "Pessoa #{i+1} - nome: #{pessoa[:nome]}, idade: #{pessoa[:idade]}, telefone: #{pessoa[:telefone]}"
        end

    puts "-----------------------------------------"

    else 
        if resposta == 'N'
            puts "-----------------------------------------"
            puts "Deseja pesquisar um cadastro? (S/N)"
            resposta = gets.strip.upcase

            if resposta == 'S'
                puts "Digite o nome do cadastro: "
                nome_a_procurar = gets.strip.capitalize

                achei = false

                pessoas.each_with_index do |pessoa, i|
                    if pessoa[:nome] == nome_a_procurar
                        puts "Nome: #{pessoa[:nome]}, idade: #{pessoa[:idade]}, telefone: #{pessoa[:telefone]}"
                        achei = true
                    end
                end

                if achei == false
                    puts "Não temos registro desse cadastro"
                end
                puts "-----------------------------------------"
            elsif resposta == 'N'
                break
            else
                puts "Resposta inválida"
            end
        else 
            puts "Resposta inválida!"
        end
    end
end