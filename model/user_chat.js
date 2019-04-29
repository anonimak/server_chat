var db = require('../database/mysql2');

module.exports = class User_chat {

    set_User(socket_id, user_id) {
        this.socket_id = socket_id;
        this.user_id = user_id;
    }

    setSocketId(socket_id) {
        this.socket_id = socket_id;
    }

    setUserId(user_id) {
        this.user_id = user_id;
    }


    save() {
        return db.execute(
            'INSERT INTO `user_chat` (socket_id, id_user) VALUES (?,?)',
            [this.socket_id, this.user_id]
        );
    }

    deleteBySocketId(socket_id) {
        return db.execute(
            "DELETE FROM `user_chat` WHERE `socket_id` = ?",
            [socket_id]
        );
    }

    static fetchAll() {
        db.execute('Select');
    }

    static findById(id) {

    }
}