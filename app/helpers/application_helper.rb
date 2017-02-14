module ApplicationHelper
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  def vote_link_classes(post, action_string)

    method_name = "#{action_string}_vote?"
    
    "glyphicon glyphicon-chevron-#{action_string} #{(current_user.voted(post) && current_user.voted(post).send(method_name)) ? 'voted' : '' }"
  end

end