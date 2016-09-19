module PicsHelper
  def pics_list
    content_tag(:ul, class: 'category_list slide') do
      Pic.all.collect { |pic|
        concat(
          content_tag(:li) do
            image_tag(pic.upload.url(:thumb)) +

            content_tag(:div, class: 'btn-group') do
              button_tag(class: 'btn btn-2', 'data-clipboard-text': "![Add alt here](#{pic.upload.url})") do
                content_tag(:div, '', class: 'fa fa-picture-o fa-3x')
              end +
              button_tag(class: 'btn btn-2', 'data-clipboard-text': "![Add alt here](#{pic.upload.url(:medium)})") do
                content_tag(:div, '', class: 'fa fa-picture-o fa-2x')
              end +
              button_tag(class: 'btn btn-2', 'data-clipboard-text': "![Add alt here](#{pic.upload.url(:thumbnail)})") do
                content_tag(:div, '', class: 'fa fa-picture-o')
              end
            end
          end
        )
      }
    end.html_safe
  end
end
