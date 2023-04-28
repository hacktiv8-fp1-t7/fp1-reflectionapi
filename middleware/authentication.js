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
    // global var
    let user;
    // query data validation
    await db.query(`select id, email from users where id=${loadId} and email= '${loadEmail}'`, (err, result, field) => {
      user = result.rows[0];
      // payload using for reflection controller
      req.UserData = {
        id: user.id,
        email: user.email,
      };

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
