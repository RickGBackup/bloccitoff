module ItemsHelper
  def time_remaining(item)
    # return time diff between now and 7 days from when item was created.
    distance_of_time_in_words(item.created_at + (60*60*24*7), Time.now )+" left"
  end
end
