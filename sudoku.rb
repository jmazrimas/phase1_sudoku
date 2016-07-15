board = '1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--'


def board_scan(board)
  modified_board =  board.dup

  board.each_char.with_index do |cell, index|
    if cell == "-"
      possible_answers=return_possible_answers(modified_board, index)
      # if possible_answers.length == 1
        modified_board[index] = possible_answers[0]
      # end
    end
  end

  modified_board

end

def numbers_allowed?(modified_board, number_to_check, index)
  if !is_num_in_row?(modified_board, number_to_check, index) &&
  !is_num_in_col(modified_board, number_to_check, index) &&
  !is_num_in_box(modified_board, number_to_check, index)
  end
end

def return_possible_answers(modified_board, index)
    possible_answers=[]
    (1..9).each do |number_to_check|
    number_to_check = number_to_check.to_s
    # if numbers_allowed?(modified_board, number_to_check, index)
      possible_answers << number_to_check
    # end
  end
  possible_answers
end

def solve(board)
  modified_board = board
  until solved?(modified_board)

    modified_board = board_scan(board)

    break if modified_board == board

  end

  modified_board

end

def solved?(board)
  board.count('-') == 0

  #Add logic for numbers_allowed? to determine if solved
end

def pretty_board(board)
  return_str = ''
  9.times do
    return_str << (board[0..8] + "\n")
    board = board[9..-1]
  end
  return_str
end

# p board_scan(board)
print pretty_board(board_scan(board))

# p solve(board)

# THIS SHOULD BE REDUNDANT w/ THE OTHER CODE,
# JUST HERE FOR TESTING

  def return_row(board, number)
    row = []
    row_num = row(number)
    board.each_char.with_index do |num, i|
      if i / 9 == row_num
        row << num
      end
    end
    row
  end

  def return_col(board, number)
    col = []
    col_num = col(number)
    board.each_char.with_index do |num, i|
      if i % 9 == col_num
        col << num
      end
    end
    col
  end

  def col(num)
    num.to_i % 9
  end

  def row(num)
    num.to_i / 9
  end

  def box_xy(number)
    [row(number)/3, col(number)/3]
  end

  def return_box(board, number)
    box=[]
    source_box = box_xy(number)
    board.each_char.with_index do |num, i|
      if box_xy(i) == source_box
        box << num
      end
    end
    box
  end
