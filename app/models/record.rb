class Record < ActiveRecord::Base
  validates :date, :title, :amount, presence: true
end

public
def get_balance
  Record.where("amount > 0").sum(:amount)
end

def get_debt
  Record.where("amount < 0").sum(:amount)
end

def get_total
  Record.sum(:amount)
end
