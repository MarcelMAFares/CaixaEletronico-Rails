
class ContaBancaria

#Variáveis

  def initialize
    @clientes = []

  end

#Validação de acesso

  def validar(cpf,senha)
    cliente = self.procurar_cliente(cpf)
    if cliente !=nil
    
      if cliente[1].get_senha == senha
        return true

      else
        puts "CPF ou senha inválido."

      end
    end
  end

#Método auxiliar para procurar clientes

  def procurar_cliente (cli)
    out = nil
    posicao = 0

    @clientes.each do |cliente|
    
    if cliente.get_cpf == cli
      out = [posicao, cliente]

      break
    end

    posicao += 1 

    end
    return out
  end

#Opção 1 - criando cadastro

  def add(obj)
    existe = self.procurar_cliente (obj.get_cpf)
    if existe == nil
      obj.class == Cliente
      @clientes << obj
      puts "Cliente cadastrado com sucesso!"

    else
      puts "CPF já cadastrado em nosso sistema."

    end 
  end

#Opção 2 - Visualizar saldo  

  def visualizar_saldo(cpf,senha)
    validacao = self.validar(cpf,senha)
    if validacao == true
      cliente = self.procurar_cliente(cpf)
      puts "Seu saldo é de R$ #{cliente[1].get_saldo}"

    end
  end

#Opção 3 - realizar saque

  def realizar_saque (cpf,senha)
    validacao = self.validar(cpf,senha)
    if validacao == true
      cliente = self.procurar_cliente(cpf)

      puts "Seu saldo é de R$ #{cliente[1].get_saldo}. Quanto deseja sacar?"
      saque = gets.chomp.gsub(',','.').to_f

    if saque <0
      puts "Digite um valor acima de R$ 0,00"

    elsif saque >= cliente[1].get_saldo
      puts "saldo insuficiente"

    else
      cliente[1].set_saldo (cliente[1].get_saldo - saque)
      puts "Saque realizado com sucesso. Seu novo saldo é de R$ #{cliente[1].get_saldo}"
    end
    end
  end

#Opção 4 - realizar depósito

  def depositar(cpf,senha)
    validacao = self.validar(cpf,senha)
    if validacao == true
      cliente = self.procurar_cliente(cpf)

      puts "Seu saldo atual é de R$ #{cliente[1].get_saldo}. Quanto deseja depositar?"
      deposito = gets.chomp.to_f
    
    if deposito <=0
      puts "Digite um valor acima de R$ 0,00"

    else
      cliente[1].set_saldo (cliente[1].get_saldo + deposito)
      puts "Deposito de R$ #{deposito} realizado com sucesso. Seu saldo atual é de R$ #{cliente[1].get_saldo}."
    
    end
    end

  end

  #Opção 5 - realizar transferência bancária

  def transferir (cpf,senha)
    validacao = self.validar(cpf,senha)
    if validacao == true
      cliente = self.procurar_cliente(cpf)

      puts "Quanto deseja transferir?"
      valorTransf = gets.chomp.gsub(',','.').to_f

    if valorTransf <= 0

      puts "Digite um valor acima de R$ 0,00"  

    else    

    if cliente[1].get_saldo >= valorTransf
      puts "Digite o CPF que gostaria de transferir"
      cpfDestino = gets.chomp.to_i

      contaDestino = self.procurar_cliente(cpfDestino)

    if contaDestino != nil
      cliente[1].set_saldo (cliente[1].get_saldo - valorTransf)
      contaDestino[1].set_saldo (contaDestino[1].get_saldo + valorTransf)
      puts "Transferência bancária no valor de #{valorTransf} realizada com sucesso. Seu novo saldo é de: R$ #{cliente[1].get_saldo}"

    else
      puts "CPF não localizado em nosso sistema. "    
    end    

    else
      puts "Saldo insuficiente"  
    end
    end     
    end
  end

#Opção 6 - excluindo contas + método auxiliar para remover

  def remover_conta (obj)
    existe = self.procurar_cliente (obj)

    if existe != nil
      self.remover (existe)
      puts "Conta removida com sucesso."
    else
      puts "Conta não localizada."

    end
  end



#Opção 7 - Listando clientes  

  def listar
    if @clientes.size == 0
      puts "Não temos clientes cadastrados.... \n"

    else
      puts '=[Clientes]================================================='
      @clientes.each do |cliente|
      puts "Nome: #{cliente.get_nome}, CPF: #{cliente.get_cpf}, Senha: ***** , Saldo: #{cliente.get_saldo} " 
    end
      puts '============================================================'

    end
  end

  private
  def remover(e)
    puts "Removendo o cliente: #{e[1].get_nome}"
    @clientes.delete_at (e[0])

  end

end



=begin

------------------------ Pendencias ------------------------
- Adicionar conta poupança
- Aprimorar sistema de login
- Listar dinheiro total do banco para realização de empréstimo
- Limitar tipo de caracteres
- Limitar quantidade de caracteres
=end

      



    

      

