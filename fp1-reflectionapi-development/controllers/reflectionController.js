class reflectionController {
  static getReflections(req, res) {
  //   res.send("ok");
  //   try{
  //     const result = conection.query('select * from "Reflections" order by id', (error, result, field) => {
  //       if (result.rowCount === 0) {
  //         return res.status (404).json({message: "data not found"});
  //       } else {
  //         return res.status(201).json(result)
  //       }
  //     })
  //   }catch (error){
  //     console.log(error?.code || 500).json(error);
  //   }
  }
  static createReflections(req, res) {
    res.send("ok");
    // try{
    //   const {succes, low_point, take_away} = req.body;
    //   const result = conection.query('insert into "Reflections" (succes, low_point, take_away) Values ($1, $2, $3) returning *', [succes, low_point, take_away], (error, result, field) => {
    //     if (result.rowCount === 0) {
    //       return res.status (404).json({message: "data not found"});
    //     } else {
    //       return res.status(201).json(result)
    //     }
    //   }) 
    // }catch (error) {
    //   console.log(error?.code || 500).json(error);
    // }
  }

  static updateReflectionsById(req, res) {
    res.send("ok");
    // try {
    //   const { succes, low_point, take_away } = req.body;
    //   const { id } = req.params;
    //   connection.query(``, (err, result, field) => {
    //     const { id: UserId } = req.UserData;
    //     connection.query(`select * from "Reflections" where id=${id} and "UserId"=${UserId};`, (err, result, field) => {
    //       console.log(result.rowCount);

    //       if (result.rowCount === 0) {
    //         return res.status(404).json({ message: "data not found" });
    //       } else {
    //         connection.query(`update "Reflections" set succes='${succes}', low_point=${low_point}, take_away= '${take_away}' where id=${id}`, (err, result, field) => {
    //           return res.status(201).json({ message: "succes update data" });
    //         });
    //       }
    //     });
    //   });
    // } catch (error) {
    //   console.log(error?.code || 500).json(error);
    // }
  }
  static deleteReflectionsById(req, res) {
    res.send("ok");
    // try {
    //   const { id } = req.params;
    //   connection.query(`select * from "Reflections" where id=${id}`, (err, result, field) => {
    //     console.log(result.rowCount);
    //     if (result.rowCount === 0) {
    //       return res.status(404).json({ message: "data not found" });
    //     } else {
    //       connection.query(`delete from "Reflections" where id=${id}`, (err, result, field) => {
    //         return res.status(201).json({ message: "succes delete data" });
    //       });
    //     }
    //   });
    // } catch (error) {
    //   console.log(error?.code || 500).json(error);
    // }
  }
}

module.exports = reflectionController;
