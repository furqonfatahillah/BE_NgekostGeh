const express = require("express");
const {
  postRegisterPencariKos,
  getRegisterPencariKos,
  deleteRegisterPencariKos,
} = require("../controllers/pencariKos.js");
const router = express.Router();

router.post("/registerPencariKos", postRegisterPencariKos);
router.get("/registerPencariKos", getRegisterPencariKos);
router.delete("/registerPencariKos/:id_pencariKos", deleteRegisterPencariKos);

module.exports = {
  router,
};
