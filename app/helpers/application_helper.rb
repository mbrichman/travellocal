module ApplicationHelper

  def fancy_cap(phrase)
    phrase.split.map{|w| w.capitalize}.join(' ')
  end
end
