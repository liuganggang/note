visit('/projects')
visit(post_comments_path(post))

expect(page).to have_current_path(post_comments_path(post))


click_link('id-of-link')
click_link('Link Text')
click_button('Save')
click_on('Link Text') # clicks on either links or buttons
click_on('Button Value')

fill_in('First Name', :with => 'John')
fill_in('Password', :with => 'Seekrit')
fill_in('Description', :with => 'Really Long Text...')
choose('A Radio Button')
check('A Checkbox')
uncheck('A Checkbox')
attach_file('Image', '/path/to/image.jpg')
select('Option', :from => 'Select Box')

page.has_selector?('table tr')
page.has_selector?(:xpath, '//table/tr')

page.has_xpath?('//table/tr')
page.has_css?('table tr.foo')
page.has_content?('foo')

find_field('First Name').value
find_link('Hello', :visible => :all).visible?
find_button('Send').click

find(:xpath, "//table/tr").click
find("#overlay").find("h1").click
all('a').each { |a| a[:href] }

within("li#employee") do
  fill_in 'Name', :with => 'Jimmy'
end

within(:xpath, "//li[@id='employee']") do
  fill_in 'Name', :with => 'Jimmy'
end

within_fieldset('Employee') do
  fill_in 'Name', :with => 'Jimmy'
end

within_table('Employee') do
  fill_in 'Name', :with => 'Jimmy'
end


# Actions
find('div.note-insert.btn-group').click
attach_file("qa-img-file","#{Rails.root}/test/integration/test.jpg")

page.check('German')

page.choose('Male')


page.current_window.resize_to(1_200, 800)

Capybara::Selenium::Driver.new(app, browser: :chrome, service_log_path: '/tmp/t.log', args: ["--verbose", "--window-size=1920,1080"])





















