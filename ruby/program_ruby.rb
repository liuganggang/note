# fixnum
0  #八进制
0d #十进制
0x #十六进制
0b #二进制

'ruby' =~ %r{ub}
$&   #=> 'ub'
$`   #=> 'r'
$'   #=> 'y'

"12:56am" =~ /(\d\d):(\d\d)(..)/
$1   #=> "12"   1234 代表括号组
$2   #=> "56"
$3   #=> "am"

"12:56am" =~ /((\d\d):(\d\d))(..)/
$1   #=> "12:56"
$2   #=> "12"
$3   #=> "56"
$4   #=> "am"

"mark john".gsub(/\b\w/) { |w| w.upcase } #=> "Mark John"
"mark:john".gsub(/(\w+):(\w+)/, '\2, \1')


def who_says_what
 yield("Dave", "hello")
 yield("Andy", "goodbye")
end
who_says_what {|person, phrase| puts "#{person} says #{phrase}"}

puts 对象会返回string  #<BookInStock:0x0a3764>
p 会返回信息           #<BookInStock:0x0a37f0 @isbn="isbn1", @price=3.0>
如果需要puts 返回有效的信息 需要定义 to_s
def to_s
  "ISBN: #{@isbn}, price: #{@price}"
end

require_relative 用于加载同目录下的rb库
require 'csv'
require_relative 'book_in_stock'

aray[1..3] 包括3
aray[1...3] 不包括3

array = [ 1, 2, 3, 4, 5, 6, 7 ]
p array.first(4)
p array.last(4)

# The same string scanninng for | only returns the matched |
"a|delimited|string".scan("|")
# Prints: ["|", "|"]

["H", "A", "L"].collect {|x| x.succ } # => ["I", "B", "M"]

[1,3,5,7].inject(:+) # => 16
[1,3,5,7].inject(:*) # => 105

"cat".each_char

enum = "cat".enum_for(:each_char)
enum.to_a

enum_good = (1..10).enum_for(:each_slice, 3)

[1,3,5,7].all? { |e| e > 3 }
[1,3,5,7].any? { |e| e > 3 }

is_a? #=> 判断是否是这个类,包括所有父级类
kind_of? 等同于 is_a?

#closures block
def n_things(thing)
  lambda { |params| params * 2 }
end

aa = n_things(2)
aa.call(5)

module Trig
  PI = 30
  def self.sin(x)
    x / 2
  end

  def self.cos(x)
    x * 2
  end
end

require 'trig'
Trig.sin(100) => 50

def surround(word, pad_width=word.length/2)
  "[" * pad_width + word + "]" * pad_width
end


# $!   latest error message
# $@   location of error
# $_   string last read by gets
# $.   line number last read by interpreter
# $&   string last matched by regexp
# $~   the last regexp match, as an array of subexpressions
# $n   the nth subexpression in the last match (same as $~[n])
# $=   case-insensitivity flag
# $/   input record separator
# $\   output record separator
# $0   the name of the ruby script file
# $*   the command line arguments
# $$   interpreter's process ID
# $?   exit status of last executed child process


def [](offset)
  @projects[offset]
end
list[1] #return offset

map { |e| e.downcase  } == map(&:downcase)

a, (b, c), d = 1,2,3,4       # a=1, b=2, c=nil, d=3
a, (b, c), d = [1,2,3,4]        # a=1, b=2, c=nil, d=3
a, (b, c), d = 1,[2,3],4        # a=1, b=2, c=3, d=4
a, (b, c), d = 1,[2,3,4],5        # a=1, b=2, c=3, d=5
a, (b,*c), d = 1,[2,3,4],5       # a=1, b=2, c=[3, 4], d=5


.eql? # True if the receiver and argument have both the same type and equal values. 1 == 1.0 returns true, but 1.eql?(1.0) is false.
.equal? # True if the receiver and argument have the same object ID.

if artist == "John Coltrane"
 artist = "'Trane"
end unless use_nicknames == "no"

a=1
a*=2 while a<100
a #=> 128
a -= 10 until a < 100
a #=> 98

0.step(12, 3) {|x| print x, " " } #A loop from 0 to 12 by 3 can be written as follows:
0 3 6 9 12

=======

Proc & lambda

p = Proc.new {|x| puts x*2 }
#Proc是把block 变成一个实例方法,存起来给别人用
p.call(1)

[1,2,3].each(&p) #需要提取Proc实例方法,只需要在p这个Proc实例前加 &符号,就能把P的block调出来用.

# lambda跟Proc类似,区别在于lambda 会check参数的数量, proc不会
lambda = lambda {|x| puts x*2}
lambda.call(1)
lambda.call(1,2) #=>ArgumentError: wrong number of arguments (2 for 1)

proc = proc {|x| puts x*2}
proc.call(1)
proc.call(1,2) #=>只取地域个参数1,后面的忽略掉

# lambda中的 return只调出该lambda语句,继续执行后面的, Proc则会调出当前method

def lambda_call
  p = lambda {|x| return puts "出来继续#{x}"}
  p.call('liugang')
  puts "还在里面"
end

def proc_call
  p = proc {|x| return puts "出来#{x}"}
  p.call('liugang')
  puts "还在里面"
end

======

## File处理
fb = "/Users/liugang/work/pm/Gemfile"
FileTest.exist? fb  #=> true
FileTest.exists? fb  #=> true
FileTest.size? fb
FileTest.size fb
FileTest.zero? fb #=> false

# 文件的三种时间戳
File.mtime fb #=>  最后一次修改时间
File.atime fb #=>  最后一次读取时间
File.ctime fb #=>  创建时间

File.utime(Time.now, Time.now, fb) #=>  修改文件的最后修改时间和最后读取时间

file = File.new(fb)
file = File.new(fb, 'r')     #=> 只读的方式打开
file = File.new(fb, 'r+')    #=> 读写的方式打开
file = File.new(fb, 'w')     #=> 只写方式打开,清空内容
file = File.new(fb, 'w+')    #=> 读写方式打开,清空内容
file = File.new(fb, 'a')     #=> 只写方式打开,追加内容
file = File.new(fb, 'a+')    #=> 读写方式打开,周家内容

file = File.open(fb, 'r+')
file.readlines.each do |line|
  puts line
end

File.delete(fb)
File.unlink(fb)
File.rename(fb, '/asdfasdfa')
File.dirname fb
File.basename(fb, '.rb')
File.expend_path fb
File.join('/Users','liugang') #=> "/Users/liugang"

Dir.chdir('/Users/liugang/work')
Dir.foreach(Dir.pwd).each {|x| p x}
list = Dir.entries(Dir.pwd)   #=> [".DS_Store", ".metadata", "aceweb"]
Dir.glob("#{folder}/**/*.pdf")



cookies[:user] = {value: @users, expires: Time.now+3600, path: '/', domain: '', secure: true}
cookies.delete(:user)

aa = ["liugang", "nihao", "sdfa", "asdfwqw", "wjsosdfw", "sddf"]
aa.select {|x| x.length > 5 } # 返回结果真的集合
aa.reject {|x| x.length > 5 } # 返回结果假的集合
aa.partition {|x| x.length >5} # 真假结果 分组返回 #=> [["liugang", "asdfwqw", "wjsosdfw"], ["nihao", "sdfa", "sddf"]]










