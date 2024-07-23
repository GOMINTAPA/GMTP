const generateToken = require('./jwt');
const repository = require('./repository');
const crypto = require('crypto');

exports.register = async (req, res) => {
    const { identifier, password, nick_name } = req.body;

    let { count } = await repository.findByIdentifier(identifier);
    
    if (count > 0) {
        return res.send({ result: "fail", message: '중복된 아이디가 존재합니다.' });
    }

    const result = await crypto.pbkdf2Sync(password, process.env.SALT_KEY, 50, 100, 'sha512')

    const { affectedRows, insertId } = await repository.register(identifier, result.toString('base64'), nick_name);

    if (affectedRows > 0) {
        const data = await generateToken({ id: insertId, nick_name });
        res.send({ result: 'ok', access_token: data })
    } else {
        res.send({ result: 'fail', message: '알 수 없는 오류' });
    }
}

exports.show = async (req, res) => {
    const user = req.user; // 미들웨어에서 추가된 사용자 정보
    // 데이터베이스에서 사용자 정보 조회
    const item = await repository.findId(user.id);
    // 사용자 정보가 없을 경우
    if (item == null) {
        res.send({ result: 'fail', message: '회원을 찾을 수 없습니다.' });
    } else {
    // 사용자 정보가 있을 경우
        res.send({ result: 'ok', data: item });
    }
}
    
exports.update = async (req, res) => {
    const { nick_name, profile_id } = req.body;
    const user = req.user;
    const result = await repository.update(user.id, nick_name, profile_id);
    if (result.affectedRows > 0) {
        const item = await repository.findId(user.id);
        res.send({ result: 'ok', data: item });
    } else {
        res.send({ result: 'fail', message: '오류가 발생하였습니다.' });
    }
}

exports.login = async (req, res) => {
    const {identifier, password} = req.body;

    const result = await crypto.pbkdf2Sync(password, process.env.SALT_KEY, 50, 100, 'sha512')

    const item = await repository.login(identifier, result.toString('base64'));

    if(item == null) {
        res.send({result:'fail', message: '휴대폰 번호 혹은 비밀번호를 확인해 주세요'})
    } else {
        const data = await generateToken({id:item.id, nick_name: item.nick_name});
        res.send({result:'ok', access_token: data})
    }

}