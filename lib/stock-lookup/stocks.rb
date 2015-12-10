class StockLookup::Stocks


  def self.all 
    @@all ||= read_stocks_from_csv
  end

  def self.read_stocks_from_csv
    CSV.foreach("portfolio.csv").collect{ |stock| stock }
  end

  def create_stocks
    binding.pry
    open(url) do |csv|
      CSV.parse(csv) do |row|
        binding.pry
      end
    end
  end
end






