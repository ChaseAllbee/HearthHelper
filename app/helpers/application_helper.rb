module ApplicationHelper

  # Dynamic title based on page
  def full_title(page_title = '')
    base_title = "Hearth Helper"
    if page_title.empty?
      base_title
    else
      page_title + " - " + base_title
    end
  end
end
