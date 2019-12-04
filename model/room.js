var db = require('../database/mysql2');

module.exports = class Room {

    set_room(room_id, name, email, telp, status_room, product_id) {
        this.room_id = room_id;
        this.name = name;
        this.email = email;
        this.telp = telp;
        this.status_room = status_room;
        this.product_id = product_id;
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

    setProductId(product_id) {
        this.product_id = product_id;
    }

    save() {
        return db.execute(
            'INSERT INTO `room` (id, room_id, name, email, telp, status_room, product_id) VALUES (NULL,?,?,?,?,?,?)',
            [this.room_id, this.name, this.email, this.telp, this.status_room, this.product_id]
        );
    }

    getStatus() {
        return this.status_room;
    }

    // getRoomByStatusRoom(status_room) {
    //     return db.execute(
    //         "SELECT a.* FROM `room` AS `a` WHERE `a`.status_room = ? AND `a`.room_id NOT IN (SELECT `room_id` FROM `room_detail_cs` WHERE `room_id` = `a`.room_id)",
    //         [status_room]
    //     );
    // }

    getRoomByRoomId(room_id){
        return db.execute(
            `SELECT *
                FROM room
                WHERE room_id = ?`,
            [room_id]
        );
    }

    getRooms(status_room) {
        return db.execute(
            `SELECT * 
                FROM room 
                WHERE status_room = ?`,
            [status_room]
        );
    }


    getRoomTaked(status_room){
        return db.execute(
            `SELECT * 
                FROM room 
                WHERE status_room = ?`,
            [status_room]
        );
    }

    getRoomByProduct(status_room, product_id) {
        return db.execute(
            `SELECT * 
                FROM room 
                WHERE status_room = ?
                AND product_id = ?`,
            [status_room, product_id]
        );
    }

    getRoomByProductTaked(status_room, product_id){
        return db.execute(
            `SELECT * 
                FROM room 
                WHERE status_room = ? 
                AND product_id = ?`,
            [status_room, product_id]
        );
    }

    getRoomByIdCs(id){
        return db.execute(
            `SELECT a.room_id FROM room AS a 
            LEFT JOIN m_product AS b
            ON a.product_id = b.product_id
            LEFT JOIN cs AS c
            ON b.id = c.id
            WHERE a.status_room = 'taked'
            OR a.status_room = 'deleted'
            AND c.id = ?`,
            [id]
        );
    }

    updateStatusRoom(status_room, room_id) {
        return db.execute(
            `UPDATE room SET status_room = ? WHERE room_id = ?`,
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