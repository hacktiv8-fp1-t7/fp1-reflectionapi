const { verifyToken } = require("../helpers/jwt");
const db = require("../database");

const authentication = async (req, res, next) => {
  try {
    const { access_token } = req.headers;

    if (!access_token) {
      throw {
        code: 401,
        message: "Token not provided",
      };
    }

    const decode = verifyToken(access_token);
    const loadId = decode.id;
    const loadEmail = decode.email;
    // console.log(loadEmail, loadId);
    let user;
    // console.log(decode, "ini decode");
    // const user = await db.query(`select id, user from users where id =$1 and email = $2`, [decode.id, decode.email]);
    await db.query(`select id, email from users where id=${loadId} and email= '${loadEmail}'`, (err, result, field) => {
      // console.log(result.rows, "ini user");
      // user = result.rows.find((item) => item.id === loadId && item.email === loadEmail);
      // console.log(user, "ini user");

      // console.log(result.rows[0]), "resultttt";
      user = result.rows[0];

      req.UserData = {
        id: user.id,
        email: user.email,
      };
      // console.log(req.UserData, "ini payload");
      if (!user) {
        throw {
          code: 401,
          message: "user not found",
        };
      }
      return next();
    });
  } catch (error) {
    res.status(error?.code || 500).json(error);
  }
};

module.exports = authentication;
