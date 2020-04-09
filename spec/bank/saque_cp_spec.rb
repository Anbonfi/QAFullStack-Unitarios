require_relative '../../app/bank'

describe ContaPoupanca do

    describe 'Saque' do
        context 'quando o valor é positivo' do
            before(:all) do
                @cp = ContaPoupanca.new(1000.00)
                @cp.saca(200.00)
            end
            it 'entao atualiza saldo' do
                expect(@cp.saldo).to eql 798.00
            end

        end

        context 'quando não tem saldo' do
            before(:all) do
                @cp = ContaPoupanca.new(0.00)
                @cp.saca(500.00)
            end
            it 'entao exibe mensagem' do
                 expect(@cp.mensagem).to eql "Saldo insuficiente para Saque"                
            end
            it 'e saldo permanece' do    
                expect(@cp.saldo).to eql 0.00
            end
        end

        context 'quando saldo insuficiente' do
            before(:all) do
                @cp = ContaPoupanca.new(500.00)
                @cp.saca(501.00)
            end

            it 'entao exibe mensagem' do
                expect(@cp.mensagem).to eql "Saldo insuficiente para Saque"    
            end
            
            it 'e saldo permanece' do    
                expect(@cp.saldo).to eql 500.00
            end

        end

        context 'quando saque superior ao limite permitido' do
            before(:all) do
                @cp = ContaPoupanca.new(1000.00)
                @cp.saca(701.00)
            end
            it 'entao exibe mensagem' do
                expect(@cp.mensagem).to eql "Limite máximo por saque é de R$ 500"
            end

            it 'e saldo permanece' do    
                expect(@cp.saldo).to eql 1000.00
            end

        end

    end
end