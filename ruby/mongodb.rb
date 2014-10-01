db.testData.find()
db.testData.findOne()
post = {title: 'asdf', name: 'liugna', age: 20, counts: [1,2,3], author: {name: 'liu', age: 25}}
post.username = post.name
post.age++
delete post.name

db.testData.update({title: 'title'}, post)
db.testData.remove({title: 'title'})

db.getCollection('testData')

db.testData.update({url: 'www.baidu.com', {'$inc': {'pageviews': 2}} })

db.testData.update({title: 'asdf'}, {'$set' : {city: 'beijing'} })

db.testData.update({title: 'asdf'}, {'$set' : {city: ['beijing', 'tianjing']} })

db.testData.update({title: 'asdf'}, {'$unset' : {city: 1} })

db.testData.update({'author.name': 'liu'}, {'$set' : {'author.name': 'gang'} })

db.testData.update({title: 'asdf'}, {'$inc' : {'score': 50} })

db.testData.update({title: 'asdf'}, {'$addToSet' : {counts: 5} })

db.testData.update({title: 'asdf'}, {'$addToSet' : {counts: {'$each': [4,5,6,7]}} })

db.testData.update({title: 'asdf'}, {'$pull' : {counts: 1})

db.testData.update({count: 25}, {'$inc' : {count: 1}, true)

db.testData.save(post)























