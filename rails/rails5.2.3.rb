ruby 2.6.3
rails 5.2.3

User.update_all "max_login_attempts = 3, must_change_password = 'true'"

bin/rails generate migration AddUserRefToProducts user:references

add_reference :products, :user, foreign_key: true

# 指定context验证
validates :age, numericality: true, on: :account_setup

person.valid?(:account_setup)
person.save(context: :account_setup)


person.errors.details[:name]
# => [{error: :invalid_characters}]

Client.where(locked: true).or(Client.where(orders_count: [1,3,5]))


Client.create_with(locked: false).find_or_create_by(first_name: 'Andy')


prepend_view_path "app/views/#{request.subdomain}"

append_view_path "app/views/direct"


# 测试页面渲染时间
<% benchmark "Process data files" do %>
  <%= expensive_files_operation %>
<% end %>
%>

distance_of_time_in_words

sanitize @article.body


strip_links('<a href="http://rubyonrails.org">Ruby on Rails</a>')
# => Ruby on Rails

strip_tags("Strip <i>these</i> tags!")
# => Strip these tags!


# /acticles => Admin::Acticles_controller
scope module: 'admin' do
  resources :articles
end


# /admin/acticles => Acticles_controller
scope '/admin' do
  resources :articles
end

# 返回所有直接继承User的基类
User.subclasses
=> [Teacher, Student]

# 返回所有继承User的后代
User.descendants
=> [Teacher, Xiaozhang, Banzhuren, Student, Banzhang]

# 双等号 相当于raw
<%= raw @user.desc %>
<%== @user.desc %>

# squish 去除空白 占位符
" \n  foo\n\r \t bar \n".squish # => "foo bar"


# 字符串询问bool值
"production".inquiry.production? # => true
"active".inquiry.inactive?       # => false

# 字符串添加indent
"  foo".indent(2)        # => "    foo"
"foo\n\t\tbar".indent(2) # => "\t\tfoo\n\t\t\t\tbar"
"foo".indent(2, "\t")    # => "\t\tfoo"


# 返回model名称
"Product".demodulize                        # => "Product"
"Backoffice::UsersController".demodulize    # => "UsersController"
"::Inflections".demodulize                  # => "Inflections"


"User".foreign_key           # => "user_id"
"User".foreign_key(false) # => "userid"


["David", "Rafael", "Aaron", "Todd"].without("Aaron", "Todd")
 # => ["David", "Rafael"]


# 改变hash的 key value
{"a" => 1, a: 2}.transform_keys { |key| key.to_s.upcase }
# The result could either be
# => {"A"=>2}
# or
# => {"A"=>1}


{ nil => nil, 1 => 1, :x => :a }.transform_values { |value| value.to_s.upcase }
# => {nil=>"", 1=>"1", :x=>"A"}


(1..10).cover?(3..7)  # => true


(1..10).overlaps?(7..11)  # => true
(1..10).overlaps?(0..7)   # => true
(1..10).overlaps?(11..27) # => false


I18n.t :missing, default: 'Not here'
# => 'Not here'
I18n.t :missing, default: [:also_missing, 'Not here']
# => 'Not here'

# active jobs
before_enqueue
around_enqueue
after_enqueue
before_perform
around_perform
after_perform

 before_enqueue { |job| $statsd.increment "#{job.name.underscore}.enqueue" }


class RemoteServiceJob < ApplicationJob
  retry_on CustomAppException # defaults to 3s wait, 5 attempts

  discard_on ActiveJob::DeserializationError

  rescue_from(ActiveRecord::RecordNotFound) do |exception|
    # Do something with the exception
  end

  def perform(*args)
    # Might raise CustomAppException or ActiveJob::DeserializationError
  end
end

rails g system_test Articles
rake test:system

# dev环境 开启/关闭缓存
rails dev:cache

ActiveRecord::Base.connection.execute("update industries set cls_cn_name = coalesce(industries.cn, industries.name);");

















