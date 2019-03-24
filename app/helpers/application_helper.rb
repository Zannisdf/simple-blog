module ApplicationHelper
  def creation_date(resource)
    resource.created_at.strftime('%B %d, %Y')
  end
end
