class Cliente
  def initialize
    @nome = nil
    @cpf = nil
    @senha = nil
    @saldo = nil
    @contaTransf = nil
  end
  
  def get_nome
    return @nome
  end

  def get_cpf
    return @cpf
  end

  def get_senha
    return @senha
  end

  def get_saldo
    return @saldo
  end

  def set_nome(nome)
    @nome = nome
  end

  def set_cpf(cpf)
    @cpf = cpf
  end

  def set_senha(senha)
    @senha = senha
  end

  def set_saldo (saldo)
    @saldo = saldo
  end   

end
