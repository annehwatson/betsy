module ReviewsHelper

  # TODO make this a loop
  def ratings_options
    return options_for_select([['⭐', 1], ['⭐⭐', 2],['⭐⭐⭐', 3], ['⭐⭐⭐⭐',4],['⭐⭐⭐⭐⭐',5]])
  end

end
