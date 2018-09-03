class ServiceDecorator < Draper::Decorator
  delegate_all

  def hover_title
    "Category: #{category.name} #{10.chr}#{13.chr} Description: #{description}"
  end
end
