const express = require('express');
const router = express.Router();

const multer = require('multer');
const upload = multer({dest: 'storage/'});

const apiTestController = require('./api/test/controller');

const {logRequestTime} = require('./middleware/log');

router.use(logRequestTime);

router.post('/file', upload.single('file'), (req, res)=> {
    console.log(req.file)
    res.json(req.file);
});

//test
router.get('/api/courses/:id', apiTestController.test1);
router.post('/api/courses', apiTestController.test2);
router.get('/api/courses', apiTestController.test3);

module.exports = router;