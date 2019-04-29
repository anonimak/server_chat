var db = require('../database/mysql2');

module.exports = class Room_detail_cs {

    set_room(id_cs, room_id, status_cs) {
        this.id_cs = id_cs;
        this.room_id = room_id;
        this.status_cs = status_cs;
    }

    setIdCs(id_cs) {
        this.id_cs = id_cs;
    }

    setRoomId(room_id) {
        this.room_id = room_id;
    }

    setStatusCs(status_cs) {
        this.status_cs = status_cs;
    }

    getBy_idcs(id_cs) {
        return db.execute(
            `SELECT a.*, b.name, b.email, b.telp, b.status_room FROM room_detail_cs AS a
                LEFT JOIN room AS b
                ON a.room_id = b.room_id WHERE id_cs = ?`,
            [id_cs]
        );
    }

    save() {
        return db.execute(
            "INSERT INTO room_detail_cs (id_cs, room_id, status_cs) SELECT * FROM (SELECT '" + this.id_cs + "', '" + this.room_id + "', '" + this.status_cs + "') as TMP WHERE NOT EXISTS ( SELECT id FROM room_detail_cs a WHERE a.room_id = '" + this.room_id + "' )"
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