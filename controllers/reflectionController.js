const db = require("../database");

class reflectionController {
  static getReflections(req, res) {
    try {
      db.query(`select * from reflection`, (err, result, field) => {
        if (result.rowCount === 0) {
          return res.status(400).json({ message: "data not found" });
        } else {
          return res.status(201).json(result.rows);
        }
      });
    } catch (error) {
      console.log(error?.code || 500).json(error);
    }
  }
  static createReflections(req, res) {
    try {
      const { success, low_point, take_away } = req.body;
      const { id: UserId } = req.UserData;

      db.query(`INSERT INTO reflection (success, low_point, take_away, userid, createdat, updatedat) VALUES ('${success}', ${low_point}, '${take_away}', ${UserId}, NOW(), NOW());`, (error, result, field) => {
        if (result.rowCount === 0) {
          return res.status(400).json({ message: "error" });
        } else {
          return res.status(201).json({ message: "Create data reflection" });
        }
      });
    } catch (error) {
      console.log(error?.code || 500).json(error);
    }
  }
  static updateReflectionsById(req, res) {
    try {
      const { success, low_point, take_away } = req.body;

      // for validation succes field
      const validEnum = ["success", "failed"];
      //empty validation
      if (!success || !low_point || !take_away) {
        res.status(400).json({
          message: "please provide success, low_point, and take_away data",
        });
        return;
        // int validation
      } else if (isNaN(parseInt(low_point))) {
        res.status(400).json({ message: "low_point data must be a number." });
        return;
        // enum validation
      } else if (!validEnum.includes(success)) {
        res.status(400).json({ message: "please input 'success' or 'failed' in success field" });
        return;
        // string validation
      } else if (typeof take_away !== "string") {
        return res.status(400).json({ message: "take_away field must be a string." });
      }
      db.query(`select * from reflection ;`, (err, result, field) => {
        // this query is for pick up req.UserData data, bcs its render lately
        db.query(`select * from reflection ;`, (err, result, field) => {
          const { id } = req.params;
          const { id: UserId } = req.UserData;
          //query for find data target
          db.query(`select * from reflection where id=${id} and userid=${UserId};`, (err, result, field) => {
            if (result.rowCount === 0) {
              return res.status(404).json({ message: "data not found" });
            } else {
              const { id } = req.params;
              const { id: UserId } = req.UserData;
              // query for update data
              db.query(`update reflection set success='${success}', low_point=${low_point}, take_away= '${take_away}',createdat=NOW(),updatedat=NOW() where id=${id}`, (err, result, field) => {
                if (result.rowCount === 1) {
                  return res.status(201).json({ message: "success update data" });
                }
              });
            }
          });
        });
      });
    } catch (error) {
      console.log(error?.code || 500).json(error);
    }
  }
  static deleteReflectionsById(req, res) {
    try {
      db.query(``, (err, result, field) => {
        // this query is for pick up req.UserData data, bcs its render lately
        db.query(`select * from reflection ;`, (err, result, field) => {
          const { id } = req.params;
          const { id: UserId } = req.UserData;
          //query for find data target
          db.query(`select * from reflection where id=${id} and userid=${UserId};`, (err, result, field) => {
            if (result.rowCount === 0) {
              return res.status(404).json({ message: "data not found" });
            } else {
              const { id } = req.params;
              const { id: UserId } = req.UserData;
              // query for delete data target
              db.query(`delete from reflection where id=${id}`, (err, result, field) => {
                if (result.rowCount === 1) {
                  return res.status(201).json({ message: "success delete data" });
                } else {
                  return res.status(201).json({ message: "failed delete data" });
                }
              });
            }
          });
        });
      });
    } catch (error) {
      console.log(error?.code || 500).json(error);
    }
  }
}

module.exports = reflectionController;
