module ApplicationHelper
  include ERB::Util

  def auth_token
    '<input 
      type="hidden"
      name="authenticity_token"
      value="#{form_authenticity_token}">'.html_safe
  end

  def ugly_lyrics(lyrics)
    lyrics_lines = lyrics.split("\n")

    lyrics_string = ""
    lyrics_lines = lyrics_lines.each do |line|
      lyrics_string += "&#9835; #{h(line)}\n"
    end

    "<pre>#{lyrics_string}</pre>".html_safe
  end
end
