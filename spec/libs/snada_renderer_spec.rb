require 'rails_helper'
require 'snada_renderer'

RSpec.describe SnadaRenderer do
  let(:renderer) {
    SnadaRenderer.new
  }

  context 'block_code' do
    it 'should render a rouge version of a code block' do
      formatter = Rouge::Formatters::HTML.new
      lexer = Rouge::Lexers::Ruby.new
      expect(
        renderer.block_code('code', 'ruby')
      ).to eq("<div class=\"highlight\"><pre class=\"highlight ruby\"><code>" + formatter.format(lexer.lex('code')) + "</code></pre></div>")
    end
  end

  context 'image' do
    it 'should render a responsive centered image' do
      expect(
        renderer.image('link', 'title', 'content')
      ).to eq(
        "<img class=\"img-responsive center-block\" src=\"link\" alt=\"content\">"
      )
    end
  end
end
