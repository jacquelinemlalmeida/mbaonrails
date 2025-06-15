class SalesReport
  include Enumerable

  def initialize(sales)
    @sales = sales
  end

  def each(&block)
    @sales.each(&block)
  end

  def total_by_category
    @sales.each_with_object(Hash.new(0)) do |sale, totals|
      totals[sale[:category]] += sale[:amount]
    end
  end

  def top_sales(n)
    @sales.sort_by { |sale| -sale[:amount] }.first(n)
  end

  def grouped_by_category
    @sales.group_by { |sale| sale[:category] }
  end

  def above_average_sales
    avg = @sales.sum { |s| s[:amount] } / @sales.size.to_f
    @sales.select { |s| s[:amount] > avg }
  end
end

# Testes

sales = [
  { product: "Notebook", category: "Eletrônicos", amount: 3000 },
  { product: "Celular", category: "Eletrônicos", amount: 1500 },
  { product: "Cadeira", category: "Móveis", amount: 500 },
  { product: "Mesa", category: "Móveis", amount: 1200 },
  { product: "Headphone", category: "Eletrônicos", amount: 300 },
  { product: "Armário", category: "Móveis", amount: 800 },
  { product: "Gaveteiro", category: "Móveis", amount: 1200 }
]

report = SalesReport.new(sales)

puts "Total por categoria:"
p report.total_by_category

puts "\nTop 2 vendas:"
p report.top_sales(3)

puts "\nProdutos agrupados por categoria:"
p report.grouped_by_category

puts "\nVendas acima da média:"
p report.above_average_sales
