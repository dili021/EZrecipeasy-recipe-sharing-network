module ApplicationHelper
  def full_title(page_title = '')
    main_title = 'EZrecipeasy'
    page_title.empty? ? main_title : main_title + ' | ' + page_title
  end
end
