 <template>
  <div class="adminhome">
<div v-title data-title="发布兼职"></div>

    <div class="min">
      <el-container style="min-height: 700px; border: 1px solid #eee">
        <el-aside width="200px" style="">
          <el-menu router default-active="2" class="el-menu-vertical-demo">
            <el-menu-item index="/admin/myself" >
              <span slot="title">个人信息设置</span>
            </el-menu-item>
			<el-menu-item index="/admin/articlelist">
              <span slot="title">发布兼职信息</span>
            </el-menu-item>
          </el-menu>
        </el-aside>

        <el-container>
          <el-main>
            <router-view />
          </el-main>
        </el-container>
      </el-container>
    </div>
  </div>
</template>
<script>
import { mapState, mapActions } from "vuex";

export default {
  data() {
    return {
      tableData:[]
    };
  },
  computed: {
  ...mapState({
      userinfo: state => state.user.userinfo,
    })
  },
};
</script>
<style scoped>
.el-header {
  background-color: #b3c0d1;
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;
  border-right: 1px solid #eee;
}
.min {
  width: 70%;
  min-height: 500px;
  margin-left: 15%;
}

::v-deep .el-menu{
	border-right:0px;
}
</style>
