const express = require("express");
const app = express();
const routers = require("./routers");

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.json({ message: "welcome to reflection API" });
});

app.use(routers);

app.listen(3000, () => {
  console.log("server running on port 3000");
});
