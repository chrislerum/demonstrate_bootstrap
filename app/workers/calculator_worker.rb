class CalculatorWorker
  include Sidekiq::Worker

  def perform(num_1, num_2)
    puts 'Doing hard work'
    puts num_1 + num_2
  end
end
