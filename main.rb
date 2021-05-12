  require '/home/marcel/Documentos/Marcel/cliente.rb'
  require '/home/marcel/Documentos/Marcel/conta_bancaria.rb'

c = ContaBancaria.new

loop do
  puts "
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - \n                                                           
   ||||| ||||| |||||| ||||| ||||| ||||| ||||| |||   || ||  ||   
   ||    || || || ||| ||    ||    || || || || ||||  || || ||    
   ||||| ||||| ||||   ||||| ||||| ||||  ||||| || || || ||||
   ||    || || || ||  ||       || || || || || ||  |||| || ||
   ||    || || ||  || ||||| ||||| ||||| || || ||   ||| ||  ||
   
    Digite a opção desejada: 
    1. Criar conta
    2. Visualizar saldo
    3. Realizar saque
    4. Realizar depósito
    5. Realizar transferência bancária
    6. Excluir contas
    7. Listar clientes
    8. Sair"

  opcao = gets.chomp.to_i
  case opcao
  when 1

    cliente = Cliente.new
    puts "Digite seu nome:"
    cliente.set_nome(gets.chomp)

    puts "\n"

    puts "Digite seu CPF:"
    cliente.set_cpf(gets.chomp.to_i)

    puts "\n"

    puts "Digite uma senha:"
    cliente.set_senha(gets.chomp.to_i)

    puts "\n"

    cliente.set_saldo (0)

    c.add(cliente)

  when 2
    puts "Digite seu CPF para continuar"
    cpf = gets.chomp.to_i

    puts "\n"

    puts "Digite sua senha:"
    senha = gets.chomp.to_i

    puts "\n"

    c.visualizar_saldo(cpf,senha)

  when 3
    puts "Digite seu CPF para continuar"
    cpf = gets.chomp.to_i

    puts "\n"

    puts "Digite sua senha:"
    senha = gets.chomp.to_i

    puts "\n"

    c.realizar_saque(cpf,senha)
          
  when 4
    puts "Digite seu CPF da conta que deseja depositar: "
    cpf = gets.chomp.to_i

    puts "\n"

    puts "Digite sua senha:"
    senha = gets.chomp.to_i

    puts "\n"

    c.depositar(cpf,senha)

  when 5
    puts "Digite seu CPF para continuar: "
    cpf = gets.chomp.to_i

    puts "\n"

    puts "Digite sua senha:"
    senha = gets.chomp.to_i

    puts "\n"

    c.transferir(cpf,senha)

  when 6
    puts "Digite o CPF do cliente:"
    cpf = gets.chomp.to_i
    c.remover_conta(cpf)

  when 7
    c.listar

  when 8
    puts "Obrigado por acessar FaresBank!"
  break

  else 
    puts "Digite um número entre 1 e 8. #{opcao.join(',')}"

  end
end

