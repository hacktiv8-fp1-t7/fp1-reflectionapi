const bcrypt = require('bcryptjs');

const hashPassword = (password) => {
const salt = bcrypt.genSaltSync(10);
const hash = bcrypt.hashSync(password, salt)
return hash
}

const comparePassword = (pass, hash) => {
return bcrypt.compareSync(pass, hash)

}

module.exports = {
    hashPassword,
    comparePassword
}