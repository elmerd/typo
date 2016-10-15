Given /the following articles exist/ do |articles_table|
    Article.delete_all
    articles_table.hashes.each do |article|
        Article.create!(article)
    end
end

When /^I fill in "(.*?)" with converted value of "(.*?)"$/ do |field, value|
  fill_in(field, :with => Article.find_by_title(value).id)
end

And /^I am logged in as a non-admin$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'joe'
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end