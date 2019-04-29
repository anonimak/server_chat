var db = require('../database/mysql2');

module.exports = class Room {

    set_room(room_id, name, email, telp, status_room) {
        this.room_id = room_id;
        this.name = name;
        this.email = email;
        this.telp = telp;
        this.status_room = status_room;
    }

    setRoomId(room_id) {
        this.room_id = room_id;
    }

    setRoomName(name) {
        this.name = name;
    }

    setRoomEmail(email) {
        this.email = email;
    }

    setRoomTelp(telp) {
        this.telp = telp;
    }

    setStatus(status_room) {
        this.status_room = status_room;
    }

    save() {
        return db.execute(
            'INSERT INTO `room` (id, room_id, name, email, telp, status_room) VALUES (NULL,?,?,?,?,?)',
            [this.room_id, this.name, this.email, this.telp, this.status_room]
        );
    }

    getRoomByStatusRoom(status_room) {
        return db.execute(
            "SELECT a.* FROM `room` AS `a` WHERE `a`.status_room = ? AND `a`.room_id NOT IN (SELECT `room_id` FROM `room_detail_cs` WHERE `room_id` = `a`.room_id)",
            [status_room]
        );
    }

    updateStatusRoom(status_room, room_id) {
        return db.execute(
            'UPDATE `room` SET `status_room` = ? WHERE `room_id` = ?',
            [status_room, room_id]
        );
    }

    deleteByRoomId(room_id) {
        return db.execute(
            "DELETE FROM `room` WHERE `room_id` = ?",
            [room_id]
        );
    }

    static fetchAll() {
        db.execute('Select');
    }

    static findById(id) {

    }
}