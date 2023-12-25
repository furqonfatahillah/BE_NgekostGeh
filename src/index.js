require("dotenv").config();
const express = require("express");
const { router } = require("./routes/pencariKos.js");
const cookieParser = require("cookie-parser");
const PORT = process.env.PORT;

const app = express();

app.use(cookieParser());
app.use(express.json());
app.use(router);
app.listen(PORT, () => {
  console.log(`server di running pada port ${PORT}`);
});
