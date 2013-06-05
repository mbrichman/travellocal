module ApplicationHelper

  def fancy_cap(phrase)
    phrase.split.map{|w| w.capitalize}.join(' ')
  end

def smart_truncate(text, char_limit)
  text = text.squish
  size = 0
  text.split.reject do |word|
    size+=word.size
    size>char_limit
  end.join(" ") + '...'
end

end
