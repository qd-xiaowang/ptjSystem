<template>
  <div id="contentexamine" class="contentexamine">
    <el-main>
      <div class="main">
        <!-- 弹框-->
        <el-dialog title="详情" :visible.sync="dialog">
          <el-form v-if="this.pagelistquery.type == 'help'">
            <el-form-item label="标题">{{ content.help_title }}</el-form-item>
            <el-form-item label="分类">{{ content.help_lable }}</el-form-item>
            <el-form-item label="内容">
              <span v-html="content.help_content"></span>
            </el-form-item>
          </el-form>

          <el-form v-if="this.pagelistquery.type == 'activity'">
            <el-form-item label="标题">{{
              content.activity_title
            }}</el-form-item>
            <el-form-item label="分类">{{
              content.activity_lable
            }}</el-form-item>
            <el-form-item label="地点">{{
              content.activity_locale
            }}</el-form-item>
            <el-form-item label="时间"
              >{{ content.activity_statetime | dataFormat }}——{{
                content.activity_endtime | dataFormat
              }}</el-form-item
            >
            <el-form-item label="内容">
              <span v-html="content.activity_content"></span>
            </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="changestate(1)"
              >通过审核</el-button
            >
            <el-button type="danger" @click="changestate(-1)"
              >不通过审核</el-button
            >
            <el-button @click="dialog = false">取消</el-button>
          </div>
        </el-dialog>
        <!--help-->
        <el-table
          :data="tableData"
          border
          style="width: 100%;min-height:500px"
          v-loading="loading"
          element-loading-text="拼命加载中"
          element-loading-spinner="el-icon-loading"
          v-if="type == 'help'"
        >
          <el-table-column fixed prop="createtime" label="创建日期">
            <template slot-scope="scope">{{
              scope.row.createtime | dataFormat
            }}</template>
          </el-table-column>
          <el-table-column prop="nickname" label="作者"></el-table-column>
          <el-table-column prop="help_title" label="标题">
            <template slot-scope="scope">{{ scope.row.help_title }}</template>
          </el-table-column>
          <el-table-column prop="help_lable" label="分类"></el-table-column>
          <el-table-column prop="ispublic" label="状态">
            <template slot-scope="scope">
              <span style="color:#6cbb7a" v-if="scope.row.ispublic == 1"
                >审核通过</span
              >
              <span style="color:#409eff" v-if="scope.row.ispublic == 0"
                >未审核</span
              >
              <span style="color:#f60c6c" v-if="scope.row.ispublic == -1"
                >审核未通过</span
              >
            </template>
          </el-table-column>
          <el-table-column fixed="right" label="操作" width="170">
            <template slot-scope="scope">
              <el-button @click="shenhe(scope.row)" type="text" size="small"
                >审核</el-button
              >
              <el-button
                type="text"
                size="small"
                @click="del(scope.row.help_id)"
                :disabled="uinfo.username !== 'admin'"
                >删除</el-button
              >
            </template>
          </el-table-column>
        </el-table>

        <!--article-->
        <div v-if="type == 'article'">
          <el-table
            :data="tableData"
            border
            style="width: 100%;min-height:500px"
            v-loading="loading"
            element-loading-text="拼命加载中"
            element-loading-spinner="el-icon-loading"
          >
            <el-table-column fixed prop="createtime" label="发布日期">
              <template slot-scope="scope">{{
                scope.row.article_createtime | dataFormat
              }}</template>
            </el-table-column>
            <el-table-column prop="nickname" label="发布者"></el-table-column>
            <el-table-column prop="help_title" label="兼职广告标题">
              <template slot-scope="scope">{{
                scope.row.article_title
              }}</template>
            </el-table-column>
            <el-table-column prop="ispublic" label="状态">
              <template slot-scope="scope">
				<el-tag type="success" v-if="scope.row.ispublic == 1">审核通过</el-tag>

				<el-tag type="warning" v-if="scope.row.ispublic == 0">未审核</el-tag>

				<el-tag type="danger" v-if="scope.row.ispublic == -1">未审核</el-tag>
              </template>
            </el-table-column>
            <el-table-column fixed="right" label="操作" width="170">
              <template slot-scope="scope">
                <el-button @click="shenhe(scope.row)" type="primary" size="small"
                  >审核</el-button
                >
                <el-button
                  type="danger"
                  size="small"
                  @click="del(scope.row.article_id)"
                  :disabled="uinfo.username !== 'admin'"
                  >删除</el-button
                >
              </template>
            </el-table-column>
          </el-table>
        </div>

       <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :page-sizes="[10, 20, 50, 100]"
          :page-size="pagelistquery.pagesize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="pagelistquery.total"
          style="margin-top: 20px;display: flex;justify-content: flex-end;"
        ></el-pagination>
      </div>
    </el-main>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
export default {
  name: 'contentexamine',
  computed: {
    ...mapState({
      uinfo: state => state.user.uinfo
    })
  },
  data() {
    return {
      loading: false,
      dialog: false,
      pagelistquery: {
        user: '',
        admin: '',
        state: '',
        search: '',
        type: 'article',
        total: 0,
        page: 1,
        pagesize: 10
      },
      type: 'article',
      thiscontent: {},
      tableData: [],
      content: {}
    }
  },
  methods: {
    shenhe(row) {
      this.content = row
      this.dialog = true
    },
    async changestate(state) {
      let id
      if (this.pagelistquery.type == 'help') {
        id = this.content.help_id
      }
      if (this.pagelistquery.type == 'activity') {
        id = this.content.activity_id
      }
      if (this.pagelistquery.type == 'job') {
        id = this.content.job_id
      }
      if (this.pagelistquery.type == 'oldstuff') {
        id = this.content.oldstuff_id
      }
      if (this.pagelistquery.type == 'article') {
        id = this.content.article_id
      }
      let data = {
        id: id,
        type: this.pagelistquery.type,
        state: state
      }
      let res = await this.$axios.post(
        '/admin/changecontentstate',
        this.qs.stringify(data)
      )
      if (res.data.state.type === 'SUCCESS') {
        this.$message.success('操作成功')
        this.dialog = false
        this.getcontentlist()
      }
    },
    async del(id) {
        this.$confirm('确认删除吗?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          let data = {
            id: id,
            type: this.pagelistquery.type
          }
            this.$axios.post(
            '/admin/admindelete',
            this.qs.stringify(data)
          ).then((res) => {
              if (res.data.state.type === 'SUCCESS') {
                  this.$message.success('删除成功')
                  this.getcontentlist()
              }
          })
        })
    },
    handleSizeChange(val) {
      this.pagelistquery.pagesize = val
      this.getcontentlist()
    },
    handleCurrentChange(val) {
      this.pagelistquery.page = val
      this.getcontentlist()
    },
    async getcontentlist() {
      this.loading = true
      this.type = this.pagelistquery.type
      let res = await this.$axios.post(
        '/admin/contentexamine',
        this.qs.stringify(this.pagelistquery)
      )
      if (res.data.state.type === 'SUCCESS') {
        this.tableData = res.data.data
        this.pagelistquery.total = res.data.count
        this.loading = false
      }
    }
  },
  created() {
    this.getcontentlist()
  }
}
</script>
<style scoped>
.top {
  position: absolute;
  top: 0;
  left: 0;
  width: calc(100% - 35px);
  padding: 12px 16px;
  background-color: #fff;
}
.contentexamine {
  position: relative;
  width: 100%;
}
.main {
  padding: 20px;
  background-color: #fff;
}
::v-deep .el-table .cell{
	font-weight: 400;
}
</style>
