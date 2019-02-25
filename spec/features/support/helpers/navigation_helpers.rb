# frozen_string_literal: true

# module contain methods for navigation on pages
module NavigationHelpers
  def goto(url)
    url = @cucumber_host + url
    @browser.goto(url)
  end

  def url_for(page_name)
    Routes::Mapper.path_for(page_name)
  end

  def page_for(page_name)
    Routes::Mapper.page_class_for(page_name).new(@browser)
  end

  # TO DO add to this method OAUTH authentication
  def login(email, password)
    goto url_for(:login)
    current_page = page_for(:login)
    current_page.fill_form(email, password)
  end
end
