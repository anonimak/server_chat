// Setup basic express server
var express = require('express');
var app = express();
var path = require('path');
var server = require('http').createServer(app);
var io = require('socket.io')(server);
var port = process.env.PORT || 3000;

const Room = require('./model/room');
const User = require('./model/user');


// caching
const NodeCache = require("node-cache");
const Cache = new NodeCache({
  // stdTTL: 86400,
  stdTTL:18000,
  checkperiod: 0
});

var room = new Room;
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
  var addedUser = [];

  // when the client emits 'new message', this listens and executes
  socket.on('new message', (data) => {

    if (socket.level == 'visitor') {
      console.log('visitor send to ' + data.room_id);
      // we tell the client to execute 'new message'
      socket.broadcast.to(data.room_id).emit('new message', {
        id: data.room_id,
        username: socket.username,
        message: data.msg,
        timestamp: Date.now()
      });

      save_conversation(data.room_id, {
        username: socket.username,
        message: data.msg,
        timestamp: Date.now()
      });

      try {
        value = Cache.get(data.room_id, true);
        console.log(value);
      } catch (err) {
        console.log(err);
      }

    } else if (socket.level == 'cs') {
      console.log('cs send to ' + data.room_id);

      // save to session chat
      socket.broadcast.to(data.room_id).emit('new message', {
        id: data.room_id,
        username: socket.username,
        nick_name: socket.nick_name,
        message: data.msg,
        timestamp: Date.now()
      });

      // save to cache
      // obj = { from: "from", message:"blah", timestamp:"dd/mm/yyyy hh:ii:ss" };
      save_conversation(data.room_id, {
        username: socket.username,
        nick_name: socket.nick_name,
        message: data.msg,
        timestamp: Date.now()
      });

      try {
        value = Cache.get(data.room_id, true);
        console.log(value);
      } catch (err) {
        console.log(err);
      }
    }
  });

  // when the client emits 'add user', this listens and executes
  socket.on('add user', (data) => {

    // we store the username in the socket session for this client
    socket.level = data.level;

    // ++numUsers;
    statususer = false;

    socket.username = data.username;
    socket.product_id = data.product_id;

    // if level visitor
    if (socket.level == 'visitor') {

      // create room
      let room_id = data.product_id + data.username;
      
      socket.room_id = room_id;

      // join room
      socket.join(room_id);
      console.log('user ' + socket.level + socket.username + ' join room ' + room_id);


      get_visitor(data.product_id);

      // check user already added.
      if(addedUser.length > 0){
        addedUser.forEach(function(v){
          if(v == room_id){
            console.log('visitor:',`${socket.username} telah ter add.`);
            statususer = true;
          }
        });
      }

      if (statususer) {
        return;
      }

      // send notification
      socket.broadcast.emit('notification', data.product_id);

      // TO DO
      // check if exist room
      room.getRoomByRoomId(room_id)
      .then(([results, fieldData]) => {
        if(typeof results !== 'undefined' && results.length > 0){
          // update status room
          console.log(results);
          room.updateStatusRoom('opened',room_id).then(() => {
            console.log("success update status to opened room "+ room_id);
          }).catch(err => console.log(err));
        } else {
          // insert to room
          room.set_room(room_id, socket.username, data.email, data.telp, 'opened', data.product_id);
          room.save()
            .then(() => {
              console.log("success add room");
              // 
            })
            .catch(err => console.log(err));
        }
      })
      .catch(err => console.log(err));

      // push to addedUser
      addedUser.push(room_id);

    } else if (socket.level == 'cs') {
      socket.user_id = data.user_id;
      socket.nick_name = data.nick_name;
      socket.role = data.role;
      // join room visitor
      // socket.join(socket.room_id);
      room.getRoomByIdCs(data.user_id).then(([rows, fields]) => {
          rows.forEach(function(row){
            console.log(row.room_id);
            socket.join(row.room_id);
          });
      }).catch(err => console.log(err));

      // update status cs to online and status
      console.log(socket.id);
      user.setStatus(1);
      user.setId(socket.user_id);
      // user.setSocketId(socket.id);
      user.updateStatusSocket()
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
      Cache.get(key.room_id,function( err, value ){
        if( !err ){
          if(value == undefined){
            socket.emit('load conversation', {});
          }else{
            console.log('load conversation', value);
            socket.emit('load conversation', value);
          } 
        }
      });
    } catch (err) {
      console.log(err);
    }
  });

  socket.on('customer product online', (data) => {
    // console.log(id);
    // get customer by product where status = opened
    getRoomByProduct(data.id);
  });

  // save conversation to cache
  const save_conversation = (key, obj) => {
    // obj = { from: "from", msg:"blah", timestamp:"dd/mm/yyyy hh:ii:ss" };

    // check apakah ada atau tidak conversation
    try {
      value = Cache.get(key, true);
    } catch (err) {
      // console.log(err);
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
        console.log(count); 
        room.deleteByRoomId(key).then(() => {
          console.log(`room ${key} deleted.`);
          socket.emit('delete conversation');
        }).catch(err => console.log(err));

        addedUser = [];
      }
    });
  });

  // Ketika cs join ke room visitor
  socket.on('cs join room', (data) => {
    // join room visitor

    socket.join(data.room_id);
    socket.room_id = data.room_id;
    console.log('user ' + socket.level + socket.username + ' join room ' + data.room_id);
    // data = 'admin join chat';
    room_id = data.room_id;
    room.updateStatusRoom('taked', room_id)
      .then(() => {
        console.log("success update status cs");
      })
      .catch(err => console.log(err));

    // socket.broadcast.to(room.room_id).emit('log', {
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
  socket.on('chat list', (id_product) => {
    room.getRoomByProductTaked('taked', id_product)
      .then(([rows, fieldData]) => {
        console.log('chat list',rows);
        socket.emit('chat list', {
          id_product: id_product,
          data: rows
        });
      })
      .catch(err => console.log(err));
  });


  socket.on('visitor online', () => {
    get_visitor(socket.product_id);
  });

  // when the user disconnects.. perform this
  socket.on('disconnect', () => {
    --numUsers;
    if (socket.level == 'visitor') {
        socket.leave(socket.room_id);
        console.log('user ' + socket.username + ' leave room ' + socket.room_id);

        var room = new Room;
        room.updateStatusRoom('deleted', socket.room_id)
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
          username: socket.username
        });
        // echo cs status
        // socket.emit('user left', {
        //     username: socket.username,
        //     numUsers: numUsers
        // });

        get_visitor(socket.product_id);

    } else if (socket.level == 'cs') {
      user.setStatus(0);
      user.setId(socket.user_id);
      user.setSocketId(socket.id);
      user.updateStatusSocket()
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

  const get_visitor = (id_product) => {
    var status = "opened";

    // get data room from db
    room.getRoomByProduct(status, id_product)
      .then(([rows, fieldData]) => {
        // console.log(rows);
        io.emit('show visitor', rows);
      })
      .catch(err => console.log(err));
  };

  const getRoomByProduct = (product_id) => {
    room.getRoomByProduct(`opened`, product_id)
      .then(([rows, fieldData]) => {
        // socket.emit('chat list', rows);
        result = {
          id: product_id,
          data: rows
        };

        socket.emit('customer product list', result);
        console.log(result);
      })
      .catch(err => console.log(err));
  }
});