const repository = require('./repository')

exports.index = async (req, res) => {
    const userId = req.user.id;
    const { page = 1, size = 10, keyword = '' } = req.query;

    // 사용자 입력에서 불필요한 공백을 제거하고, 대소문자 구분 없이 검색하기 위해 소문자로 변환
    const trimmedKeyword = keyword.trim().toLowerCase();
    
    const items = await repository.index(page, size, trimmedKeyword);
    
    const modifiedItems = items.map(item => ({
        ...item,
        is_me: (userId == item.user_id)
    }));

    res.json({ result: 'ok', data: modifiedItems });
}

// exports.store = (req, res) => {
//     res.send('피드 생성');
// }

exports.store = async (user, title, content, price, image) => {
    const query = 'insert into feed (user_id, title, content, price, image_id) values (?,?,?,?,?)';

    const imageId = image === undefined ? null : image;

    return await pool.query(query, [user, title, content, price, imageId]);
}

exports.show = async (id) => {
    const query = `SELECT feed.*, u.name user_name, u.profile_id user_profile, image_id FROM feed LEFT JOIN user u on u.id = feed.user_id LEFT JOIN files f1 on feed.image_id = f1.id LEFT JOIN files f2 on u.profile_id = f2.id WHERE feed.id = ?`
    
    let result = await pool.query(query, [id]);
    return (result.length < 0) ? null : result[0];
}

exports.update = async (title, content, price, imgid, id) => {
    const query = `UPDATE feed SET title = ? ,content = ?, price = ?, image_id = ? WHERE id = ?`;
    return await pool.query(query, [title, content, price, imgid, id]);
}

exports.delete = async id => {
    return await pool.query(`DELETE FROM feed WHERE id = ?`, [id]);
}
