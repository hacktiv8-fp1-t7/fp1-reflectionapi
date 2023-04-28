const db = require("../database");
const { hashPassword, comparePassword } = require("../helpers/bcrypt");
const { generateToken } = require("../helpers/jwt");

class userController {
  static async register(req, res) {
    try {
      console.log("test");
      const { email, password } = req.body;

      const result = await db.query(`insert into users (email, password) values($1, $2);`, [email, hashPassword(password)]);

      // console.log(result);

      if (result.rowCount === 1) {
        res.status(201).json({ message: "user created", email });
      }
    } catch (error) {
      console.log(error);
    }
  }

  static async login(req, res) {
    try {
      let access_token;
      const { email, password } = req.body;

      const { rows } = await db.query(`select * from users where email = $1;`, [email]);

      const user = {
        id: rows[0].id,
        email: rows[0].email,
      };

      if (!user) {
        res.status(404).json({
          code: 404,
          message: "User not found",
        });
      } else {
        access_token = generateToken(user);
      }

      // compare password
      const isCorrect = comparePassword(password, rows[0].password);

      if (!isCorrect) {
        res.status(404).json({
          code: 401,
          message: "Incorrect password",
        });
      }

      res.status(200).json({
        access_token,
      });
    } catch (error) {
      console.log(error);
    }
  }
}

module.exports = userController;
