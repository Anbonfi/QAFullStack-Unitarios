class Conta

    attr_accessor :saldo
    attr_accessor :mensagem

    def initialize (saldo) 
        self.saldo = saldo
    end

    def saca(valor, max, taxa)
        if self.saldo > 0
            if self.saldo < valor
                self.mensagem = "Saldo insuficiente para Saque"
            
            elsif valor > max
                self.mensagem = "Limite máximo por saque é de R$ #{max}"
            else   
                self.saldo -= valor + taxa
            end
        elsif self.saldo == 0
                self.mensagem = "Saldo insuficiente para Saque"
        end
    end

end

class ContaCorrente < Conta
    
    def saca(valor, max = 700, taxa = 5.00)
        super
    end

end

class ContaPoupanca < Conta
    
    def saca(valor, max = 500, taxa = 1.99)
        super
    end

end