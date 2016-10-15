module PageHelper
  DEFAULT_TITLE = "Stefano Nada | snada.it"
  DEFAULT_DESCRIPTION = "Stefano Nada's personal blog"

  FIXED_KEYWORDS = "stefano nada, snada, blog"
  DEFAULT_KEYWORDS = "programming, ruby, rails, javascript, node.js, .net, java"

  def page_title
    if @post
      "#{@post.title} | #{DEFAULT_TITLE}"
    else
      @page_title ? "#{@page_title} | #{DEFAULT_TITLE}" : DEFAULT_TITLE
    end
  end

  def page_description
    if @post
      "#{@post.description}"
    else
      @page_description ? @page_description : DEFAULT_DESCRIPTION
    end
  end

  def page_keywords
    if @post
      keys = "#{@post.keywords}"
    else
      keys = @page_keywords ? @page_keywords : DEFAULT_KEYWORDS
    end

    "#{FIXED_KEYWORDS}, #{keys}"
  end
end
