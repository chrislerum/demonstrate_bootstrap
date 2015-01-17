class Bottle < ActiveRecord::Base
  validates :name, :color, presence: true


  def self.do_the_work(num1, num2)
    CalculatorWorker.perform_async(num1, num2)
  end
end
