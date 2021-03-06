Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    Article.create!(article)
  end
end

Given /the following feedback exist/ do |feedback_table|
  feedback_table.hashes.each do |feedback|
    Feedback.create!(feedback)
  end
end

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

When /^I am logged into the admin panel as "(.*)"$/ do |login|
  visit '/accounts/login'
  fill_in 'user_login', :with => login
  fill_in 'user_password', :with => login + "-pw123"
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

When /^"(.*)" should exist in the body of "(.*)"$/ do |content, title|
	Article.find_by_title(title).body.include?(content)
end

When /^I visit the the edit page for "(.*)"$/ do |title|
  visit 'admin/content/edit/' + Article.find_by_title(title).id.to_s
end

When /^I visit the the show page for "(.*)"$/ do |title|
  visit 'admin/content/' + Article.find_by_title(title).created_at.to_s + title.gsub('','-')
end

When /^I attempt to merge with "(.*)"$/ do |title|
  fill_in 'merge_with', :with => Article.find_by_title(title).id
  click_button 'Merge'
end
