module ApplicationHelper
# #def method which takes two arguments
  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-error' if errors.any?
# #method used to build HTML and CSS to display form element and errors
    content_tag :div, capture(&block), class: css_class
  end
end
