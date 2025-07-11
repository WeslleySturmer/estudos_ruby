lista = File.read('lista.txt')

puts "Bem vindo a sua lista de tarefas!"

loop do 
    puts "------------------------------------"
    puts "O que deseja fazer?"
    puts "1. Mostrar lista de tarefas"
    puts "2. Criar nova tarefa"
    puts "3. Marcar como concluída uma tarefa"
    puts "4. Sair"

    resposta = gets.to_i

    if resposta == 1
        puts lista
    end

    if resposta == 2
        puts "Descreva sua tarefa: "
        nova_tarefa = "[ ] #{gets.strip}\n"
        lista << nova_tarefa
        File.write('lista.txt', lista)
        puts lista
    end

    if resposta == 3
        puts "Qual tarefa deseja marcar como concluída?"
        puts lista
        tarefa_concluida = gets.to_i - 1
        linhas = IO.readlines('lista.txt')
        linhas[tarefa_concluida] = linhas[tarefa_concluida].sub('[ ]', '[X]')
        puts linhas
        File.write('lista.txt', linhas*'')
    end

    if resposta == 4
        break
    end
end
