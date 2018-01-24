
class BankAccount
attr_accessor :opening_balance, :name, :min_balance
    @@min_balance = 200
    @@Overdraft_fee = 35
    @@transaction_history = []
  def initialize(opening_balance, name)
    @opening_balance = opening_balance
    @name = name
  if @opening_balance < @@min_balance
      raise ArgumentError
    end
  end

    def deposit(money)
      @opening_balance += money
      @@transaction_history << [money => "Deposit"]
    end

    def balance
    @opening_balance
    end

    def withdraw(money)
      @opening_balance -= money
      if @opening_balance < 0
        @opening_balance -= @@Overdraft_fee
      end
      @@transaction_history << [money => "Withdrawal"]
    end

    def transfer(amount, account_n)
      @opening_balance -= amount
      account_n.opening_balance += amount
      @@transaction_history << [amount => "Transfer"]
    end

    def self.minimum_balance
    @@min_balance
    end

    def self.minimum_balance=(num)
      @@min_balance = num
    end

    def self.transactions
      @@transaction_history
    end
end

account = BankAccount.new(500, "Sarah")
account_n = BankAccount.new(800, "Joe")
account_n.deposit(200)
account_n.withdraw(100)
account.deposit(200)
account.withdraw(100)
account.transfer(50, account_n)
# p BankAccount.transactions
# p BankAccount.transactions
# p BankAccount.transaction_history
# account.balance
# account.deposit(500)
# other_account = BankAccount.new(1000, "Todd")
# account = BankAccount.new(500, "Sarah")
# account.transfer(200, other_account)
# third_account = BankAccount.new(199, "Andres")
# account.withdraw(501)
# p BankAccount.minimum_balance
p BankAccount.transactions
