const {pool} = require('../../database')

exports.create = async (name, path, size) => {
    const query = 'insert into files (original_name, file_path, file_size) values (?,?,?)'
    return await pool.query(query, [name, path, size]);
}

exports.show = async (id) => {
    const query = 'select * from files where id = ?';
    const result = await pool.query(query, [id]);

    return (result.length<0) ? null : result[0];
}