require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe 'render_markdown' do
    let(:text) {<<END
I'm a line, but...
this one should be in a new line, always in the same paragraph.

This will be a new paragraph though, and check this out:

```ruby
#this is a ruby codeblock!
```

![pic](http:://internets.com/image.png)
END
    }

    it 'renders text as markdown' do
      expect(
        render_markdown(
          text
        )
      ).to eq(
        "<p>I&#39;m a line, but...<br>\nthis one should be in a new line, always in the same paragraph.</p>\n\n<p>This will be a new paragraph though, and check this out:</p>\n<div class=\"highlight\"><pre><span class=\"c1\">#this is a ruby codeblock!</span>\n</pre></div>\n<p><div class=\"text-center\"><img class=\"img-responsive\" src=\"http:://internets.com/image.png\" alt=\"pic\"></div></p>\n"
      )
    end
  end
end
