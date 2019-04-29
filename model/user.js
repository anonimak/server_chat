var db = require('../database/mysql2');

module.exports = class User {

    constructor() {
        this.table = "cs";
    }

    set_Cs(name, nickname, email, pass, status, role) {
        this.name = name;
        this.nickname = nickname;
        this.email = email;
        this.pass = pass;
        this.status = status;
        this.role = role;
    }

    setStatus(status) {
        this.status = status;
    }

    setId(id) {
        this.id = id;
    }

    save() {
        return db.execute(
            "INSERT INTO `" + this.table + "` (id, name, nick_name, email, pass, status, role) VALUES (NULL,?,?,?,?,?,?)",
            [this.name, this.nickname, this.email, this.pass, this.status, this.role]
        );
    }

    updateStatus() {
        return db.execute(
            "UPDATE " + this.table + " SET `status` = ? WHERE `id` = ?",
            [this.status, this.id]
        );
    }

    findByStatus() {
        return db.execute(
            "SELECT id, name,status,role FROM " + this.table + " WHERE status = ?",
            [this.status]
        )
    }
}