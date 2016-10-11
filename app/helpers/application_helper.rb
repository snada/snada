module ApplicationHelper
  def navbar_item(body, url, html_options = {})
    active = current_page?(url) ? 'active' : ''
    content_tag :li, class: active do
      link_to body, url, html_options
    end
  end

  def render_markdown(text)
    markdown = Redcarpet::Markdown.new(SnadaRenderer.new(hard_wrap: true), disable_indented_code_blocks: true, fenced_code_blocks: true)
    markdown.render(text).html_safe
  end
end
