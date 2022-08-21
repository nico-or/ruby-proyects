class BoardPrinter
  attr_accessor :board

  def show
    puts divisor
    board.each do |row|
      puts "|#{format_row(row)}|"
      puts divisor
    end
  end

  private

  def row_size
    board.first.length
  end

  def divisor
    n = row_size + 1
    n.times.map { '+' }
           .join('---')
  end

  def format_cell(cell)
    cell.nil? ? ' ' : cell
  end

  def format_row(row)
    tmp = row.map { format_cell(_1) }
             .join(' | ')
    " #{tmp} "
  end
end