const db = require("../database");
const { hashPassword, comparePassword } = require("../helpers/bcrypt");
const { generateToken } = require("../helpers/jwt");

class userController {
  static async register(req, res) {
    try {
      const { email, password } = req.body;

      await db.query(`insert into users (email, password) values($1, $2);`, [email, hashPassword(password)]);

      const result = await db.query(`insert into users (email, password) values($1, $2);`, [email, hashPassword(password)]);

      console.log(result);

      const id = result.rows[0].id;

      console.log(id);
      res.status(201).json({ message: "user created", id, email });
    } catch (error) {
      console.log(error);
    }
  }
  static async login(req, res) {
    try {
      const { email, password } = req.body;

      const { rows } = await db.query(`select id, email from users where email = $1;`, [email]);

      const user = rows[0];

      if (!user) {
        throw {
          code: 404,
          message: "User not found",
          rows: rows,
        };
      }

      // compare password
      const isCorrect = comparePassword(password, hashPassword(password));

      if (!isCorrect) {
        throw {
          code: 401,
          message: "Incorrect password",
        };
      }

      const access_token = generateToken(user);

      res.status(200).json({
        access_token,
        user,
      });
    } catch (error) {
      console.log(error);
    }
  }
}

module.exports = userController;
