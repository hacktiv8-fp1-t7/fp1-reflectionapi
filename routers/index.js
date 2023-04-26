const router = require("express").Router();
const reflectionRouter = require("./reflectionRouter");
const userRouter = require("./userRouter");
const authentication = require("../middleware/authentication");

router.use("/api/v1/users", userRouter);
router.use(authentication);
router.use("/api/v1/reflections", reflectionRouter);

module.exports = router;
