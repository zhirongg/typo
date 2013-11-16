Given /the following categories exist/ do |categories_table|
  categories_table.hashes.each do |category|
    new_category = Category.new
    new_category.name = category[:title]
    new_category.permalink = category[:permalink]
    new_category.keywords = category[:keywords]
    new_category.description = category[:description]
    new_category.save!
  end
end

When /I edit category \"(.*)\"/ do |category_name|
  category = Category.find_by_name(category_name)
  visit "/admin/categories/edit/#{category.id}"
end

Then /I should not be able to find a nonexistent category/ do
  id = 1
  id += 5 while Category.find_by_id(id) != nil
  begin
    visit "/admin/categories/edit/#{id}"
    raise RuntimeError, "Category should not have been found"
  rescue ActiveRecord::RecordNotFound
  end
end
