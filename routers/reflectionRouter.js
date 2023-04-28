const express = require("express");
const router = express.Router();
const ReflectionsController = require("../controllers/reflectionController");

router.get("/", ReflectionsController.getReflections);
router.post("/", ReflectionsController.createReflections);
router.put("/:id", ReflectionsController.updateReflectionsById);
router.delete("/:id", ReflectionsController.deleteReflectionsById);

module.exports = router;
