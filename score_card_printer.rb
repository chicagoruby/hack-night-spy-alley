class ScoreCardPrinter

  def initialize(identities, spy_items)
    @identities = identities
    @spy_items = spy_items
    @empty_space = "\u2606"
    @filled_space = "\u2605"
  end

  def to_s
    headers = join_headers
    item_grid = create_item_grid
    headers + item_grid
  end

  def join_headers
    item_width = 12
    spies = @identities.map do |spy|
      " #{'%-8.8s' % spy}|"
    end.join
    "#{' ' * item_width}|" + spies + "\n"
  end

  def create_item_grid
    max_width = 12
    peg_value = @empty_space.encode('utf-8')
    @spy_items.map do |item|
      "#{"%-#{max_width}.#{max_width}s" % item}|" + ("    #{peg_value}    |" * @identities.count) + "\n"
    end.join
  end
end
