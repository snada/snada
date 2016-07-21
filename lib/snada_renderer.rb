class SnadaRenderer < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, lexer: language)
  end

  def image(link, title, content)
    doc = Nokogiri::HTML::DocumentFragment.parse('')

    Nokogiri::HTML::Builder.with(doc) do |_|
      _.div(class: 'text-center') {
        _.img(class: 'img-responsive', src: link, alt: content)
      }
    end
    return doc.to_html
  end
end
