const { pool } = require('../../database')
exports.register = async (identifier, password, nick_name) => {
    const query = `INSERT INTO user (identifier, password, nick_name) VALUES (?,?,?)`;
    return await pool.query(query, [identifier, password, nick_name]);
}
exports.login = async (identifier, password) => {
    const query = `SELECT * FROM user WHERE identifier = ? AND password = ?`;
    let result = await pool.query(query, [identifier, password]);
    return (result.length < 0) ? null : result[0];
}
exports.findByIdentifier = async (identifier) => {
    let result = await pool.query(`SELECT count(*) count FROM user where identifier = ?`, [identifier]);
    return (result.length < 0) ? null : result[0];
}

exports.findId = async (id) => {
    const result = await pool.query(`SELECT id, nick_name, identifier, created_at FROM user WHERE id = ?`, [id]);
    return (result.length < 0) ? null : result[0];
}

exports.update = async (id, nick_name, image) => {
    const profileId = image === undefined ? null : image;
    const query = `UPDATE user SET nick_name = ?, profile_id = ? WHERE id = ?`;
    return await pool.query(query, [nick_name, profileId, id]);
}