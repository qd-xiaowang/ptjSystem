
const express = require('express')
const router = express.Router()
const service = require('./service')//相关操作逻辑
const jwt = require('../../plugins/jwt')//引入jwt
router.use(jwt)//express-jwt中间件
router.use(function (err, req, res, next) {
  if (err) {
    console.log(err)
  }
  if (err.name === 'UnauthorizedError') {
    //  这个需要根据自己的业务逻辑来处理（ 具体的err值 请看下面）
    res.send({    
        state:{
          "type": 'ERROE',
          "msg": "操作失败"
      },
        code:401});
  }
});
//上传中间件
const multer = require('multer')//上传npm i multer
const MAO = require('multer-aliyun-oss');//npm install --save multer-aliyun-oss

const uplod = multer({ dest: __dirname + '/../../uplodes' })//上传本地
//图片图片上传
router.post('/uplod', uplod.single('file'), service.uplod)
//注册
router.post('/webadmin/registered', service.registered)
//登录
router.post('/webadmin/login', service.login)
//用户信息
router.post('/webadmin/getuser', service.getuser)
router.post('/webadmin/updatauser', service.updatauser)




router.post('/webadmin/createhelp', service.createhelp)
router.post('/webadmin/getwebhelplist', service.getwebhelplist)
router.post('/webadmin/gethelpdetails', service.gethelpdetails)
router.post('/webadmin/updateehelp', service.updateehelp)
router.post('/webadmin/deletehelp', service.deletehelp)
router.post('/webadmin/createactivity', service.createactivity)
router.post('/webadmin/getwebactivitylist', service.getwebactivitylist)

router.post('/webadmin/getactivitydetails', service.getactivitydetails)

router.post('/webadmin/updateactivity', service.updateactivity)
router.post('/webadmin/deleteactivity', service.deleteactivity)
router.post('/webadmin/getwebjoinslist', service.getwebjoinslist)
router.post('/webadmin/joinslist', service.joinslist)



router.post('/webadmin/createoldstuff', service.createoldstuff)
router.post('/webadmin/getweboldstufflist', service.getweboldstufflist)
router.post('/webadmin/getwebcompany', service.getwebcompany)
router.post('/webadmin/changewebcompany', service.changewebcompany)
router.post('/webadmin/createjob', service.createjob)
router.post('/webadmin/deletejob', service.deletejob)
router.post('/webadmin/createarticle', service.createarticle)
router.post('/webadmin/articlelist', service.articlelist)

router.post('/webadmin/getarticledetails', service.getarticledetails)
router.post('/webadmin/getoldstuffdetails', service.getoldstuffdetails)
router.post('/webadmin/updatearticle', service.updatearticle)
router.post('/webadmin/updateoldstuff', service.updateoldstuff)
router.post('/webadmin/createfankui', service.createfankui)
router.post('/webadmin/createjubao', service.createjubao)
router.post('/webadmin/jubaocontent', service.jubaocontent)
router.post('/webadmin/createshensu', service.createshensu)
router.post('/webadmin/getusernumbering', service.getusernumbering)
router.post('/webadmin/deletejoin', service.deletejoin)
router.post('/webadmin/deleteoldstuff', service.deleteoldstuff)































module.exports = router
