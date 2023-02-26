
const express = require('express')
const router = express.Router()
const service = require('./service')//相关操作逻辑s


router.post('/web/setcomment', service.setcomment)
router.post('/web/getcomment', service.getcomment)
router.post('/web/setreply', service.setreply)
router.post('/web/getreply', service.getreply)

router.post('/web/webgetwebactivitylist', service.webgetwebactivitylist)

router.post('/web/webgetweboldstufflist', service.webgetweboldstufflist)

router.post('/web/webgetjoblist', service.webgetjoblist)
router.post('/web/getjobcontent', service.getjobcontent)

router.post('/web/getarticlelist', service.getarticlelist)
router.post('/web/getarticlecontent', service.getarticlecontent)

router.post('/web/webgetcompanylist', service.webgetcompanylist)
router.post('/web/getcompanycontent', service.getcompanycontent)

router.post('/web/getoldstuffcontent', service.getoldstuffcontent)
router.post('/web/getactivitycontent', service.getactivitycontent)
router.post('/web/setjoin', service.setjoin)
router.post('/web/search', service.search)


router.post('/web/getnotice', service.getnotice)
router.post('/web/changenotice', service.changenotice)

// 收藏文章
router.post('/web/collection',service.collection)
router.post('/web/getcollectionlist',service.getcollectionlist)
router.post('/web/cancelcollection',service.cancelcollection)





















module.exports = router
