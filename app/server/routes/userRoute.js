const Router = require('express')
const router = new Router()
const userController = require('../controller/userController')

router.post('/add', userController.createUser)



module.exports = router