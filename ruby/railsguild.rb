
rake db:migrate VERSION=20080906120000

验证是否接受条款，无需保存数据库的字段
validates :terms_of_service, :acceptance => true
validates :terms_of_service, :acceptance => {:accept => "yes"}

class Library < ActiveRecord::Base
  has_many :books
  validates_associated :books         #用于如果保存library会同时执行关联的Book的验证的validate
end

class Comment < ActiveRecord::Base
  has_many :replys, :class_name => "Comment"
  belongs_to :manager, :class_name => "Comment",
    :foreign_key => "manager_id"
end
#@comment.replys取出所有子回复, @comment.manager去除父级管理者

class Customer < ActiveRecord::Base
  has_many :latest_orders, :class_name => "Order",
    :conditions => proc { ["orders.created_at > ?", 10.hours.ago] }
end

validates :subdomain, :exclusion => { :in => %w(www us ca jp),
    :message => "Subdomain %{value} is reserved." }
#exclusin 校验通过 :in 选项来指定一个集合，用来验证属性的取值不包含在该集合中。你也可以使用 :in 选项的别名 :within。

validates :size, :inclusion => { :in => %w(small medium large),
    :message => "%{value} is not a valid size" }
#该校验用来验证属性的值是否包含在给定的集合中。该集合可以是任何实现了enumerable 接口的对象。

exclusin and inclusion diff -------------------------------------------------------------??

validates :legacy_code, :format => { :with => /\A[a-zA-Z]+\z/,
    :message => "Only letters allowed" }
#该校验用来验证该属性值是否匹配通过 :with 选项指定的正则表达式

validates :field_name, :inclusion => { :in => [true, false] }。
#验证一个boolean值是否存在

validates :name, :uniqueness => { :scope => :year,} #可以通过 :scope 选项来指定其他的属性来限制惟一性校验
validates :name, :uniqueness => { :case_sensitive => false } #:case_sensitive 选项来指定唯一性约束是否是大小写敏感的，默认为 true

validates :card_number, :presence => true, :if => :paid_with_card?

  def paid_with_card?
    payment_type == "card"
  end

validates :surname, :presence => true, :if => "name.nil?"

validates :password, :confirmation => true,
    :unless => Proc.new { |a| a.password.blank? }

with_options :if => :is_admin? do |admin|
    admin.validates :password, :length => { :minimum => 10 }
    admin.validates :email, :presence => true
  end

validates :mouse, :presence => true,
                    :if => ["market.retail?", :desktop?]
                    :unless => Proc.new { |c| c.trackpad.present? }

#Find 方法

  client = Client.find([1, 10]) 找一个ID数组

  User.find_each(:start => 2000, :batch_size => 5000) do |user|
    NewLetter.weekly_deliver(user)
  end

  Client.where("orders_count = ? AND locked = ?", params[:orders], false)

  Client.where("created_at >= :start_date AND created_at <= :end_date",
  {:start_date => params[:start_date], :end_date => params[:end_date]})

  Post.where('id > 10').limit(20).order('id asc').expect(:order)

  Post.where('id > 10').limit(20).order('id desc').only(:order, :where)

  Client.unscoped.all 取消所有作用域

  Client.where(:active => true).pluck(:id)

  Client.pluck(:id) == Client.select(:id).map(&:id)

  Client.exists?(1,2,3)   #true or false
  # 或者
  Client.exists?([1,2,3]}

  Client.where(:first_name => 'Ryan').exists?

  Post.joins(comments: :guest)
  SELECT posts.* FROM posts
  INNER JOIN comments ON comments.post_id = posts.id
  INNER JOIN guests ON guests.comment_id = comments.id

  Category.joins(posts: [{comments: :guest}, :tags])
  SELECT categories.* FROM categories
  INNER JOIN posts ON posts.category_id = categories.id
  INNER JOIN comments ON comments.post_id = posts.id
  INNER JOIN guests ON guests.comment_id = comments.id
  INNER JOIN tags ON tags.post_id = posts.id

  Client.joins(:orders).where(orders: {created_at: time_range})

  Category.includes(posts: [{comments: :guest}, :tags]).find(1)

  scope :created_before, ->(time) { where("created_at < ?", time) }

  User.active.merge(User.inactive)
  SELECT "users".* FROM "users" WHERE "users"."state" = 'inactive'

  default_scope  { where state: 'pending' }

  Client.unscoped { Client.created_before(Time.zone.now) } #unscope then scope

  Client.average("orders_count")
  Client.minimum(:age)
  Client.maximum(:age)
  Client.sum(:age)

  Rack::Utils.parse_query "name=fred&phone=0123456789"
  Rack::Utils.escape_html '<p>asdfasdf</p>'   #=> "&lt;p&gt;asdfasdf&lt;&#x2F;p&gt;"

#routing
  #如果你想要把路由 /posts (不以 /admin 作前缀) 匹配到 Admin::PostsController
  scope :module => "admin" do
    resources :posts, :comments
  end
  == resources :posts, :module => "admin"

  #而你如果想要把路由：/admin/posts 给匹配到 PostsController
  #(控制器中没有 Admin:: 这个模块作为前缀)
  scope "/admin" do
    resources :posts, :comments
  end
  == resources :posts, :path => "/admin/posts"

  match "/stories" => redirect("/posts")
  match "/stories/:name" => redirect("/posts/%{name}")

#controller 中的文件传输 流文件没有看懂，下次看

  render json: @post, location: photo_url(photo)
  #http location 没有看懂


  #will use public/javascripts
    javascript_include_tag :all
  #will includes public/javascripts/../.. 包含所有子文件夹
    javascript_include_tag :all, :recursive => true

   javascript_include_tag "main", "columns", :cache => true

   javascript_include_tag "application" unless controller_name.eql?('home')

   javascript_include_tag "main", "columns",:cache => 'cache/main/display'

   image_tag "home.gif", :onmouseover => "menu/home_highlight.gif"

   render :partial => "link_area", :layout => "graybar"

   <%= render :partial => 'products', :collection => @products,
           :as => :item, :locals => {:title => "Products Page"} %>

  #Form helper

  options_from_collection_for_select(City.all, :id, :name)
   collection_select(:person, :city_id, City.all, :id, :name)

   time_zone_select(:user, :time_zone)
   select_date Date.today, :prefix => :start_date

  #Rails中使用缓存
  #页面缓存
  config.action_controller.perform_caching = true
  caches_page :index # in controller
  expire_page :action => :index #reflash index after create if cache index.
  caches_page :index, :gzip => false

  #action 缓存
  caches_action :index
  expire_action :action => :index

  #片段缓存
  <%= cache(:action => 'list', :part => 'comment') do %>
    <% @comments.each do |c| %>
      <p>
        <%= c.content %>
      </p>
    <% end %>
  <%- end %>

  expire_fragment(:action => 'list', :part => 'comment')

  <% cache('all_available_products') do %>
    All available products:
  <% end %>

  expire_fragment('all_available_products')

  unless read_fragment(:action => 'list')
    @post = Post.find(:all, :order => 'created_on desc', :limit => 10)
  end

  #最新更新
    latest_images = Rails.cache.fetch("data-model-latest_1000_images", expires_in: 7.days) do
      DesignImage.order("created_at desc").available.audited_with_colors.limit(1000)
    end
    @latest_month_images = latest_images.sample(4)

    expires_in 7.days, 'max-stale' => 8.days, :public => true

  #存储方式
  Rails.cache.read(:site => "mysite", :owners => [owner_1, owner_2])

  未明白

  if stale?(:last_modified => @product.updated_at.utc, :etag => @product)

  fresh_when :last_modified => @product.published_at.utc, :etag => @product


  def smart_fetch(name, options = {}, &blk)
    in_cache = Rails.cache.fetch(name)
    return in_cache if in_cache
    if block_given?
      val = yield
      Rails.cache.write(name, val, options)
      return val
    end
  end

  @foo = smart_fetch("some_key") do
    some stuff
  end







