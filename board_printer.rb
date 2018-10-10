class BoardPrinter
  def initialize(board_spaces)
    @board_spaces = board_spaces
    @board_width = 97
    @wide_space_width = 15
    @narrow_space_width = 11
  end

  def to_s
    row_1 = create_full_row(row_1_spaces)
    row_2 = create_perimeter_row_with_blanks(row_2_spaces)
    row_3 = create_spy_alley_embassy_row(row_3_spaces)
    row_4 = create_spy_alley_row(row_4_spaces, top_border_embassy_row)
    row_5 = create_spy_alley_row(row_5_spaces, top_border_spy_alley_row)
    row_6 = create_spy_alley_row(row_6_spaces, top_border_spy_alley_row)
    row_7 = create_spy_alley_row(row_7_spaces, top_border_spy_alley_row)
    row_8 = create_full_row(row_8_spaces)
    row_1 + row_2 + row_3 + row_4 + row_5 + row_6 + row_7 + row_8 + top_border
  end

  def create_full_row(row_spaces)
    total_spaces = 6
    buffer = '|' + (((' ' * @wide_space_width) + '|') * total_spaces) + "\n"
    max = @wide_space_width - 1
    spots = row_spaces.map do |space|
      " #{"%-#{max}.#{max}s" % space["name"]}|"
    end.join
    top_border + buffer + '|' + spots + "\n" + buffer
  end

  def create_perimeter_row_with_blanks(row_spaces)
    blanks_between_spaces = (' ' * 63) + '|'
    buffer = '|' + buffer_wide + blanks_between_spaces + buffer_wide + "\n"
    max = @wide_space_width - 1
    spots = " #{"%-#{max}.#{max}s" % row_spaces.first["name"]}|" +
            blanks_between_spaces +
            " #{"%-#{max}.#{max}s" % row_spaces.last["name"]}|"
    top_border + buffer + '|' + spots + "\n" + buffer
  end

  def create_spy_alley_embassy_row(row_spaces)
    number_of_embassys = 4
    buffer = ('|' + buffer_wide) + (buffer_narrow * number_of_embassys) + buffer_wide + buffer_wide + "\n"
    max_wide = @wide_space_width - 1
    max_narrow = @narrow_space_width - 1
    spots = row_spaces.each_with_index.map do |space, i|
      if i == 0
        " #{"%-#{max_wide}.#{max_wide}s" % space["name"]}|"
      elsif i == 5
       "#{buffer_wide} #{"%-#{max_wide}.#{max_wide}s" % space["name"]}|"
      else
        " #{"%-#{max_narrow}.#{max_narrow}s" % space["name"]}|"
      end
    end.join
    top_border_embassy_row + buffer + '|' + spots + "\n" + buffer
  end

  def create_spy_alley_row(row_spaces, top_border)
    buffer = '|' + buffer_wide + spy_alley_buffer + buffer_narrow + buffer_wide + buffer_wide + "\n"
    max = @wide_space_width - 1
    max_narrow = @narrow_space_width - 1
    spots = row_spaces.each_with_index.map do |space, i|
      if i == 0
        " #{"%-#{max}.#{max}s" % space["name"]}|"
      elsif i == 1
        spy_alley_buffer + " #{"%-#{max_narrow}.#{max_narrow}s" % space["name"]}|"
      elsif i == 2
        "#{buffer_wide} #{"%-#{max}.#{max}s" % space["name"]}|"
      else
        " #{"%-#{max}.#{max}s" % space["name"]}|"
      end
    end.join
    top_border + buffer + '|' + spots + "\n" + buffer
  end

  def top_border
    '-' * @board_width + "\n"
  end

  def top_border_embassy_row
    ('-' * 65) + (' ' * @wide_space_width) + top_border_wide + "\n"
  end

  def top_border_spy_alley_row
    top_border_wide + (' ' * 35) + top_border_narrow + (' ' * @wide_space_width) + top_border_wide + "\n"
  end

  def top_border_wide
    '-' * 17
  end

  def top_border_narrow
    '-' * 13
  end

  def buffer_wide
    (' ' * @wide_space_width) + '|'
  end

  def buffer_narrow
    (' ' * @narrow_space_width) + '|'
  end

  def spy_alley_buffer
    (' ' * 35) + '|'
  end

  def create_row_2
    s24 = @board_spaces.select {|space| space["position" == 24]}
    s24 = @board_spaces.select {|space| space["position" == 24]}
  end

  def row_1_spaces
    positions = [1,2,3,4,5,6]
    compose_full_perimeter_row(positions)
  end

  def row_2_spaces
    positions = [24,7]
    @board_spaces.select {|space| (positions.include? space["position"]) && (space["inSpyAlley"] == false)}
  end

  def row_3_spaces
    perimeter_positions = [23,8]
    spy_alley_positions = [8,7,6,5]
    compose_spy_alley_row(perimeter_positions, spy_alley_positions)
  end

  def row_4_spaces
    perimeter_positions = [22,9]
    spy_alley_positions = [4]
    compose_spy_alley_row(perimeter_positions, spy_alley_positions)
  end

  def row_5_spaces
    perimeter_positions = [21,10]
    spy_alley_positions = [3]
    compose_spy_alley_row(perimeter_positions, spy_alley_positions)
  end

  def row_6_spaces
    perimeter_positions = [20,11]
    spy_alley_positions = [2]
    compose_spy_alley_row(perimeter_positions, spy_alley_positions)
  end

  def row_7_spaces
    perimeter_positions = [19,12]
    spy_alley_positions = [1]
    compose_spy_alley_row(perimeter_positions, spy_alley_positions)
  end

  def row_8_spaces
    positions = [18,17,16,15,14,13]
    compose_full_perimeter_row(positions).reverse
  end

  def compose_full_perimeter_row(positions)
    @board_spaces.select {|space| (positions.include? space["position"]) && (space["inSpyAlley"] == false)}
  end

  def compose_spy_alley_row(perimeter_positions, spy_alley_positions)
    perimeter = @board_spaces.select {|space| (perimeter_positions.include? space["position"]) &&
                                              (space["inSpyAlley"] == false)}
    spy_alley = @board_spaces.select {|space| (spy_alley_positions.include? space["position"]) &&
                                              (space["inSpyAlley"] == true)}
    perimeter.insert(1, spy_alley).flatten
  end
end
