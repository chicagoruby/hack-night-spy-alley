require 'json'
require_relative 'board_printer'
require_relative 'score_card_printer'

board_spaces = JSON.load(File.new(__dir__ + '/data/board_spaces.json'), symbolize_names: true)

board_printer = BoardPrinter.new(board_spaces)

identities = ['French', 'German', 'Spanish', 'Italian', 'American', 'Russian']
spy_items = ['Passwords', 'Disguises', 'Code Books', 'Keys']
score_card_printer = ScoreCardPrinter.new(identities, spy_items)

puts board_printer.to_s
puts
puts score_card_printer.to_s
