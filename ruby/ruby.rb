
.ruby-version

File.basename('/Users/liugang/liugang.rb', '.*')
File.dirname('/Users/liugang/liugang.rb') => "/Users/liugang"
File.extname('liugang.rb') => '.rb'
File.file?('liugang.rb')
File.join('123','liu','gang') => '123/liu/gang'

"users".classify.constantize.where(id: 123)

 [1,2,3].detect { true } #=> 1
 [1,2,3].detect { false } #=> nil
 [1,2,3].detect { |x| x % 2 == 0 } #=> 2

#正则表达式
  /...../   或者  %R{.....}
  /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
    邮箱的一个正则/A[w+-.]+@[a-zd-.]+.[a-z]+z/i
/                            正则的开始
A                         匹配以字符串开始
[w+-.]+          至少有一个单字字符，加号，连字符，或者 .
[a-zd-.]+        至少含有一个a-z组成的单词，数字，连字符，或者 .
.                          字面顿号
[a-z]+                 至少含有一个单词
z                         以字符串结束
/                           正则结束
i                            不区分大小写

   if line =~ /p(ert|art)/
   		doing sth
   end

  /ab+c/  /ab*c/  . a开头 b+是1个或多个b最后是c,*是零个或多个b
  \d 匹配任意数字 \s匹配任意空白字符 \w匹配任意包括字母与数字

  '13246-391' =~ /\d{3,5}-\d{1,3}/  3~5 个数字, 1~3个数字

  " " 等于 %{} 字符串的2种写法

  string = "asdfg"
  string.chop!  => "asdf"
  string.chomp 删除最后的换行符

  hash = {}
  hash[:name] = 'liu'
  hash[:email] = '123@qq.com'
  hash.has_key?(:name) 					=> true
  hash.include?(:name) 					=> true
  hash.keys 					 					=> [:name,:email]
  hash.delete(:name)   					=> {:email => '123@qq.com'}
  hash.values 									=> ["liu", "123@qq.com"]

  aa= [1,2]
  aa.unshift(0) 								=> [0,1,2]
  aa.shift											=> [1,2]
  aa.pop												=> [1]

  private(:check, :fly)					=> 方法只能被当前类里面的方法来调用
  protected(:check, :fly)				=> 在当前类的范围可以被调用


  module Mood
  	def say
  		p "hello"
  	end
  end

  class Person
  	include Mood      					=> aa = Person.new;  aa.say => 'hello'
  end

  class post
  	extend Mood									=> bb = Post.new;   bb.extend(Mood); bb.say => 'hello' #必须使用extend()方法引入module
  end

  module ImageUser
    def find()
    end
  end

  include ImageUser  #这个是引入ImageUser里面的方法,只能给市里变量用 如 user.find().
  extend ImageUser   #这个是类方法, User.find().

#Mood 里面自己混入Son为类方法.
  module Mood
    def say
      p "hello"
    end

    module Son
      def find_all
        p "find_all"
      end
    end

    def self.included(receiver)
      receiver.extend(Son)
    end
  end

  ActiveSupport::concern 用法不太懂,混入


  def new_block(&block)
    block.call
  end

  begin

  rescue Exception => e
    puts "程序出现异常"
    puts "#{e.to_s}"
    puts "#{e.message}"
    puts "#{e.backtrace}"
  end

#处理时间问题计算
  design_time = story_user.design_time
  now_time = Time.now
  expired_time = 15.day - 1.day
  future_time = design_time + expired_time


  if future_time > now_time
   number_of_day = ((future_time - now_time) / 1.day).round
   result = "倒计时<i class='i_icon i_icon_big icon_day'>#{number_of_day}</i>天"
  end


image = Image.first
image.title => "123"
image.title_changed?
image.changes => {}
image.changed?
image.title_change

#判断方法石头传递block, 如果有,就把f对象传递到block里面去,并接受返回
if block_given?
  yield f
end

user.name == user.send(:name) == user.send("name") # send方法会发送所有方法 包括private和protected
user.public_send("name")

@destination.reload.attributes = params[:destination].reject do |attrb, value|
   attrb.to_sym == :lock_version
end



#元编程

星期一

1.打开类技术

猴子补丁

self的用法

星期二

1.动态方法
obj.send(:method, arg)

星期三

1.代码块
local_variables

define_method :method { puts local_variables} #是用define_method来拟写方法,直接是用外部变量


星期四

1.类定义

self.class_eval { define_method('method1') {p 'mydefine'} }

instance_eval 只修改self 不管他是不是类
class_eval 希望打开类来修改,通常用这种比较好

class Myclass
  @value = 1

  def self.read
    @value
  end

  def write
    @value = 2
  end

  def read
    @value
  end
end
obj = Myclass.new
Myclass.read #=> 1
obj.write    #=> 2
obj.read    #=> 2


singleton_methods
def self.singleton_method
  #累方法
end

def obj.singleton_method
  #对象方法
end

Gm.singleton_class.class_eval {define_method('liug'){ p 'singleton liu'}}

# Liugang.top
class Liugang
  class << self
    define_method('top') {p 'top'}
  end
end

alias :real_length :length
alias_method :real_length, :length

星期五









































