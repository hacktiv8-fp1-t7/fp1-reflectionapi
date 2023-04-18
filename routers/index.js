const router = require("express").Router()
const reflectionRouter = require("./reflectionRouter")
const userRouter = require("./userRouter")
const authentication = require("../middlewares/authentication")

router.use("/users", userRouter)
router.use(authentication)
router.use("reflection", reflectionRouter)

module.exports = router
