require 'rouge/plugins/redcarpet'

class SnadaRenderer < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
  
  def image(link, _title, content)
    doc = Nokogiri::HTML::DocumentFragment.parse('')

    Nokogiri::HTML::Builder.with(doc) do |i|
      i.img(class: 'img-responsive center-block', src: link, alt: content)
    end
    return doc.to_html
  end
end
