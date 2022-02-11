const express = require('express')
const userRouter = require('./routes/userRoute')
const PORT = process.env.PORT || 3000

const app = express()

app.use(express.json())
app.use('/api', userRouter)

app.listen(PORT, () => console.log(`Server has been started on port ${PORT}`))