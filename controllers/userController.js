const db = require("../database")
const { hashPassword, comparePassword } = require("../helpers/bcrypt")
const { generateToken } = require("../helpers/jwt")


class userController {

    static async register(req,res){
        try{
            const{
                email, password
            } = req.body

            await db.query(`insert into users (email, password) values($1, $2);`,
            [email, hashPassword(password)])
              
            res.status(201).json({message: "user created"})

        }catch(error){
            console.log(error)
        }
    }

    static async login(req,res){ 
        try {
            const {
              email,
              password
            } = req.body
            
            

            const { rows } =  await db.query(`select id, email from users where email = $1;`, [email])

            const user = rows[0]

            if (!user) {
              throw {
                code: 404,
                message: "User not found",
                rows: rows
              }
            }
      
            // compare password
            const isCorrect = comparePassword(password, hashPassword(password))
      
            if (!isCorrect) {
              throw {
                code: 401,
                message: "Incorrect password"
              }
            }
      
            const response = {
              id: user.id,
              email: user.email,
            }
      
            const access_token = generateToken(user)
      
            res.status(200).json({
              access_token,
              user
            })
      
          } catch (error) {
            console.log(error);
            
          }
    }
}

module.exports = userController