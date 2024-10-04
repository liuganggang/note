# 
  validates :end_date, comparison: { greater_than: :start_date }

  has_many :books, before_add: :check_credit_limit
  before_remove

  















