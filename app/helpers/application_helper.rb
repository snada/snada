module ApplicationHelper
  def render_markdown(text)
    markdown = Redcarpet::Markdown.new(SnadaRenderer.new(hard_wrap: true), disable_indented_code_blocks: true, fenced_code_blocks: true)
    markdown.render(text).html_safe
  end
end
