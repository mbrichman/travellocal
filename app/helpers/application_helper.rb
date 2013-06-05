module ApplicationHelper

  def fancy_cap(phrase)
    phrase.split.map{|w| w.capitalize}.join(' ')
  end

  def smart_truncate(text, char_limit)
    text = text.squish
    size = 0
    @array = text.split.reject do |word|
      size+=word.size
      size>char_limit
    end
    @array.join(" ").chomp(',') + '...' if @array.size > 0
  end

end
