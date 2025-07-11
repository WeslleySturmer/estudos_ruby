moeda_origem = ''
moeda_destino = ''
valor_inicial = 0
valor_final = 0


while moeda_origem != 'BRL' && moeda_origem != 'USD' && moeda_origem != 'EUR'
    puts "Qual a moeda de origem?"
    moeda_origem = gets.strip.upcase

    puts "Quanto deseja converter"
    valor_inicial = gets.to_f
end

while moeda_destino != 'BRL' && moeda_destino != 'USD' && moeda_destino != 'EUR'
    puts "Qual a moeda de destino?"
    moeda_destino = gets.strip.upcase
end

case moeda_origem
    when 'BRL'
        valor_real = valor_inicial
        valor_dolar = valor_inicial * 0.18
        valor_euro = valor_inicial  * 0.16

    when 'USD'
        valor_dolar = valor_inicial
        valor_real = valor_inicial * 5.50
        valor_euro = valor_inicial * 0.85

    when 'EUR'
        valor_euro = valor_inicial
        valor_dolar = valor_inicial * 1.17 
        valor_real = valor_inicial * 6.41
end

case moeda_destino
    when 'BRL'
        puts "O valor em real é de #{valor_real}"
        
    when 'USD'
        puts "O valor em dolar é de #{valor_dolar}"

    when 'EUR'
        puts "O valor em euro é de #{valor_euro}"
end