class TicTacToe

  def initialize(input=$stdin, output=$stdout)
    @input = input
    @output = output
  end

  def get_coordinates(available_spaces:)
    row = Presenter::Action.ask_for_coordinate(input: @input, output: @output, axis: 'Linha', values: available_spaces.map(&:row).uniq)
    spaces_with_selected_row = available_spaces.select { |space| space.row == row }
    column = Presenter::Action.ask_for_coordinate(input: @input, output: @output, axis: 'Coluna', values: spaces_with_selected_row.map(&:column).uniq)
    spaces_with_selected_row.detect { |space| space.column == column }
  end

  def run
    prepare
    shift until @match.a_winner? || @match.tied?
    print_outcome
  end

  private

  def prepare
    clear_screen
    setup_match
  end

  def shift
    announce_shift(match: @match)
    @match.take_turn
    Presenter::Board.draw(output: @output, board: @match.board)
  end

  def create_player(marker:)
    player_type = choose_player_type
    klass = player_class(player_type: player_type)
    klass.new(marker: marker, shell: self)
  end

  def player_class_name(player_type:)
    'Model::Player::' + player_type
  end

  def player_class(player_type:)
    Object.const_get(player_class_name(player_type: player_type))
  end

  def choose_player_type
    player_types = Model::Player.constants.select { |k| Model::Player.const_get(k).instance_of? Class }
    Presenter::Player.ask_for_type(input: @input, output: @output, options: player_types)
  end

  def setup_match
    markers = %w[X O]
    players = markers.map { |marker| create_player(marker: marker) }
    @match = Model::Match.new(players: players)
  end

  def print_outcome
    @match.a_winner? ? Presenter::Match.announce_winner(output: @output, match: @match) : Presenter::Match.tied(output: @output)
  end

  def announce_shift(match:)
    Presenter::Match.announce_shift(output: @output, match: match)
  end

  def clear_screen
    Presenter::Match.clear_screen(output: @output)
  end
end
