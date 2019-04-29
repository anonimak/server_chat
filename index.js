// Setup basic express server
var express = require('express');
var app = express();
var path = require('path');
var server = require('http').createServer(app);
var io = require('socket.io')(server);
var port = process.env.PORT || 3000;

const Room = require('./model/room');
const Room_detail_cs = require('./model/room_detail_cs');
const User = require('./model/user');


// caching
const NodeCache = require("node-cache");
const Cache = new NodeCache();

var room = new Room;
var room_detail = new Room_detail_cs;
var user = new User;

server.listen(port, () => {
  console.log('Server listening at port %d', port);
});

// Routing
app.use(express.static(path.join(__dirname, 'public')));

// Chatroom

var numUsers = 0;
var map_cs = new Map();
var map_conversation = new Map();

io.on('connection', (socket) => {
  var addedUser = false;

  // when the client emits 'new message', this listens and executes
  socket.on('new message', (data) => {

    if (socket.level == 'visitor') {
      console.log('visitor send to ' + socket.id);
      // we tell the client to execute 'new message'
      socket.broadcast.to(socket.id).emit('new message', {
        id: socket.id,
        username: socket.username,
        message: data,
        timestamp: Date.now()
      });

      save_conversation(socket.id, {
        username: socket.username,
        message: data,
        timestamp: Date.now()
      });

      try {
        value = Cache.get(socket.id, true);
        console.log(value);
      } catch (err) {
        console.log(err);
      }

    } else if (socket.level == 'cs') {
      console.log('cs send to ' + socket.room_id);

      // save to session chat
      socket.broadcast.to(socket.room_id).emit('new message', {
        id: socket.id,
        username: socket.username,
        nick_name: socket.nick_name,
        message: data,
        timestamp: Date.now()
      });

      // save to cache
      // obj = { from: "from", message:"blah", timestamp:"dd/mm/yyyy hh:ii:ss" };
      save_conversation(socket.room_id, {
        username: socket.username,
        nick_name: socket.nick_name,
        message: data,
        timestamp: Date.now()
      });

      try {
        value = Cache.get(socket.room_id, true);
        console.log(value);
      } catch (err) {
        console.log(err);
      }
    }
  });

  // when the client emits 'add user', this listens and executes
  socket.on('add user', (data) => {
    if (addedUser) return;

    // we store the username in the socket session for this client
    socket.level = data.level;

    ++numUsers;
    addedUser = true;

    socket.username = data.username;

    // if level visitor
    if (socket.level == 'visitor') {

      // join room
      socket.join(socket.id);
      console.log('user ' + socket.level + socket.username + ' join room ' + socket.id);

      // insert to database
      room.set_room(socket.id, socket.username, data.email, data.telp, 'opened');
      room.save()
        .then(() => {
          console.log("success add room");
          // 


        })
        .catch(err => console.log(err));

      get_visitor();

      // send notification
      socket.broadcast.emit('notification');

    } else if (socket.level == 'cs') {
      socket.room_id = data.room;
      socket.user_id = data.user_id;
      socket.nick_name = data.nick_name;
      socket.role = data.role;

      // join room visitor
      // socket.join(socket.room_id);
      console.log('user ' + socket.level + socket.username + ' join room ' + socket.room_id);

      // insert into array user live
      // var obj_user = {
      //   "user_id": data.user_id,
      //   "username": data.username,
      //   "role": data.role
      // };

      // map_cs.set(socket.id, obj_user);

      // var cs = map_cs.get(socket.id);
      // console.log(Array.from(map_cs));

      // update status cs to online
      user.setStatus(1);
      user.setId(socket.user_id);
      user.updateStatus()
        .then(() => {
          console.log("success update status user online");
        })
        .catch(err => console.log(err));

    }

    socket.emit('login', {
      numUsers: numUsers
    });
    // echo globally (all clients) that a person has connected
    socket.broadcast.emit('user joined', {
      username: socket.username,
      numUsers: numUsers
    });
  });

  // when the client emits 'typing', we broadcast it to others
  socket.on('typing', () => {
    socket.broadcast.emit('typing', {
      username: socket.username
    });
  });

  // when the client emits 'stop typing', we broadcast it to others
  socket.on('stop typing', () => {
    socket.broadcast.emit('stop typing', {
      username: socket.username
    });
  });




  // TAMBAHANKU

  // load conversation from cache
  socket.on('load conversation', (key) => {
    try {
      value = Cache.get(key.room_id, true);
      socket.emit('load conversation', value);
    } catch (err) {
      console.log(err);
    }
  });

  // save conversation to cache
  const save_conversation = (key, obj) => {
    // obj = { from: "from", msg:"blah", timestamp:"dd/mm/yyyy hh:ii:ss" };

    // check apakah ada atau tidak conversation
    try {
      value = Cache.get(key, true);
    } catch (err) {
      console.log(err);
      value = [];
    }

    value.push(obj);

    Cache.set(key, value, function (err, success) {
      if (!err && success) {
        console.log(success);
      }
    });
  };

  socket.on('delete conversation', (key) => {
    Cache.del(key, function (err, count) {
      if (!err) {
        console.log(count); // 1
        // ... do something ...
      }
    });
  });

  // Ketika cs join ke room visitor
  socket.on('cs join room', (room) => {
    // join room visitor
    socket.join(room.room_id);
    socket.room_id = room.room_id;
    console.log('user ' + socket.level + socket.username + ' join room ' + room.room_id);
    data = 'admin join chat';
    room.updateStatusRoom('taked', room.room_id);
    // socket.broadcast.to(room.room_id).emit('new message', {
    //   // do something
    //   username: socket.username,
    //   level: socket.level
    // });
  });


  // show list cs online
  socket.on('user online', () => {
    //cs = map_cs.get(socket.id);
    user.setStatus(1)
    user.findByStatus().then(([rows, fieldData]) => {
      // console.log(rows);
      socket.emit('show user', rows);
    });
    // console.log(JSON.stringify(map_cs));
    // socket.emit('show user', Array.from(map_cs));
  });

  // get user handled by id_cs
  socket.on('chat list', (id_cs) => {
    room_detail.getBy_idcs(id_cs)
      .then(([rows, fieldData]) => {
        // console.log(rows);
        socket.emit('chat list', rows);
      })
      .catch(err => console.log(err));
  });


  socket.on('visitor online', () => {
    get_visitor();
  });

  // when the user disconnects.. perform this
  socket.on('disconnect', () => {
    --numUsers;
    if (socket.level == 'visitor') {
      if (addedUser) {

        socket.leave(socket.id);
        console.log('user ' + socket.username + ' leave room ' + socket.id);

        var room = new Room;
        room.updateStatusRoom('deleted', socket.id)
          .then(() => {
            console.log("success remove room");

          })
          .catch(err => console.log(err));

        // echo globally that this client has left
        // socket.broadcast.emit('user left', {
        //   username: socket.username,
        //   numUsers: numUsers
        // });
        socket.broadcast.to(socket.room_id).emit('user left', {
          username: socket.username,
          numUsers: numUsers
        });
        // echo cs status
        socket.emit('user left', {
          //   username: socket.username,
          //   numUsers: numUsers
        });

        get_visitor();

      }
    } else if (socket.level == 'cs') {
      user.setStatus(0);
      user.setId(socket.user_id);
      user.updateStatus()
        .then(() => {
          console.log("success update status user offline");
        })
        .catch(err => console.log(err));
      // var user_chat = new User_chat;
      // user_chat.deleteBySocketId(socket.id)
      //   .then(() => {
      //     console.log("success remove user chat");
      //   })
      //   .catch(err => console.log(err));
    }
  });

  const get_visitor = () => {
    var status = "opened";

    // get data room from db
    room.getRoomByStatusRoom(status)
      .then(([rows, fieldData]) => {
        // console.log(rows);
        io.emit('show visitor', rows);
      })
      .catch(err => console.log(err));
  };

});