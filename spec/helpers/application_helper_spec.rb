require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe 'navbar_item' do
    it 'should create a li with a link without active class' do
      allow(self).to receive("current_page?").and_return(false)
      expect(
        navbar_item('Home', 'http://localhost:3000/whatever')
      ).to eq(
        "<li class=\"\"><a href=\"http://localhost:3000/whatever\">Home</a></li>"
      )
    end

    it 'should create a li with a link with active class' do
      allow(self).to receive("current_page?").and_return(true)
      expect(
        navbar_item('Home', 'http://localhost:3000/whatever')
      ).to eq(
        "<li class=\"active\"><a href=\"http://localhost:3000/whatever\">Home</a></li>"
      )
    end
  end

  describe 'render_markdown' do
    let(:text) {<<END
I'm a line, but...
this one should be in a new line, always in the same paragraph.

This will be a new paragraph though, and check this out:

```ruby
#this is a ruby codeblock!
```

![pic](http://internets.com/image.png)
END
    }

    it 'renders text as markdown' do
      expect(
        render_markdown(
          text
        )
      ).to eq(
        "<p>I&#39;m a line, but...<br>\nthis one should be in a new line, always in the same paragraph.</p>\n\n<p>This will be a new paragraph though, and check this out:</p>\n<div class=\"highlight\"><pre><span></span><span class=\"c1\">#this is a ruby codeblock!</span>\n</pre></div>\n<p><img class=\"img-responsive center-block\" src=\"http://internets.com/image.png\" alt=\"pic\"></p>\n"
      )
    end
  end
end
