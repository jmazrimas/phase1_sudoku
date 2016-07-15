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

def number_allowed(modified_board, number_to_check, index)
  if !is_num_in_row?(modified_board, number_to_check, index) &&
  !is_num_in_col(modified_board, number_to_check, index) &&
  !is_num_in_box(modified_board, number_to_check, index)
  end
end

def return_possible_answers(modified_board, index)
    possible_answers=[]
    (1..9).each do |number_to_check|
    number_to_check = number_to_check.to_s
    # if number_allowed(modified_board, number_to_check, index)
      possible_answers << number_to_check
    # end
  end
  possible_answers
end


def pretty_board(board)
  return_str = ''
  9.times do
    return_str << (board[0..8] + "\n")
    board = board[9..-1]
  end
  return_str
end

p board_scan(board)
print pretty_board(board_scan(board))
