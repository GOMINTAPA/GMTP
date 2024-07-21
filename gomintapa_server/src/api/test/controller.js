//test

const courses = [
    {id:1, name:"courses1"},
    {id:2, name:"courses2"},
    {id:3, name:"courses3"},
];

exports.test1 = (req, res) => {
    const course = courses.find(c=>c.id===parseInt(req.params.id));
    if(!course) res.status(404).send('아이디를 못 찾습니다');
    res.send(course);
}
exports.test2 = (req, res) => {
    const course = {
        id: req.body.id,
        name: req.body.name
    };
    courses.push(course);
    res.send(course);
}
exports.test3 = (req, res) => {
    res.send(courses);
}