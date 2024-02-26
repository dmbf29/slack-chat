Chatroom.destroy_all
User.destroy_all

Chatroom.create(name: "general")
Chatroom.create(name: "1508")
User.create(email: "doug@lewagon.org", nickname: "Doug", password: "123123", username: 'dmbf29')
User.create(email: "trouni@lewagon.org", nickname: "Trouni", password: "123123", username: 'trouni')
