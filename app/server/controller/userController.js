const db = require('../db')

class UserController {
    async createUser(req, res) {
        const {number, name} = req.body
        const newUser = await db.query(`INSERT INTO dash (number, name) values ($1, $2) RETURNING *`, [number, name])
        res.json(newUser.rows[0])
    }
}

module.exports = new UserController()