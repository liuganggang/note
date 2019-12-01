
re = RestClient.post('http://localhost:5000/api/v1/create_work', {public_key: '123',nonce: '123', signature: '123'})

re = RestClient.post('http://localhost:3000/api/v1/upload_cv_logo',
  {public_key: '123',nonce: '123', signature: '123',
    file: File.new('/Users/liugang/Desktop/ali.jpg', 'rb')})




