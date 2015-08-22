#Rails4 concern用法

如果我们有2个需要concern的module.

```
app/models/concerns/schedule.rb

app/models/concerns/trader/schedule.rb
```

需要引入module的 model:

```
app/models/trader.rb

class Trader
  include Schedule
end
```
他会去找最底层的app/models/concerns/trader/schedule.rb
而app/models/concerns/schedule.rb会被忽略掉.

如果把底层的删除掉, 他就会向上级目录查找schedule.rb

所以我们需要是用namespace引入正确module:

```
app/models/trader.rb
class Trader
  include Shared::Schedule
end
```

```
app/models/concerns/shared/schedule.rb

module Shared::Schedule
  extend ActiveSupport::Concern
  ...
end
```