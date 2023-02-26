<template>
	<div class="myself">
		<el-form ref="form" :model="form" label-width="150px" size="medium " style="width: 380px;">
			<el-form-item label="昵称">
				<el-input v-model="form.nickname"></el-input>
			</el-form-item>
			<el-form-item>
				<div class='wra'>
				<el-button type="primary" @click="onSubmit">确定</el-button>
				</div>
			</el-form-item>
		</el-form>
	</div>
</template>
<script>
	import {
		mapActions
	} from "vuex";
	export default {
		data() {
			return {
				student: {
					m: "student",
					realname: "",
					studentid: "",
					studentcard: []
				},
				company: {
					m: "company",
					companyname: "",
					companyimg: []
				},
				form: {
					m: "user",
					avatar: "",
					nickname: "",
					qq: "",
					mail: "",
					phone: "",
					synopsis: ""
				},
				dataform: {}
			};
		},
		methods: {
			...mapActions("user", ["setUserInfo"]),
			//文件上传成功时的钩子
			uplogsuccess(res) {
				this.form.avatar = res.url;
			},
			//
			studentuploadsuccess(res) {
				this.student.studentcard.push({
					url: res.url
				});
			},
			//文件列表移除文件时的钩子
			studenthandleRemove(file, fileList) {
				let b = this.student.studentcard.indexOf(file);
				this.student.studentcard.splice(b, 1);
			},
			//
			companyuploadsuccess(res) {
				this.company.companyimg.push({
					url: res.url
				});
			},
			//文件列表移除文件时的钩子
			companyhandleRemove(file, fileList) {
				let b = this.company.companyimg.indexOf(file);
				this.company.companyimg.splice(b, 1)
			},
			//信息认证
			async studentandcompany() {
				const res = await this.$axios.post(
					"/webadmin/updatauser",
					this.qs.stringify(this.dataform)
				);
				if (res.data.state.type === "SUCCESS") {
					this.$message.success("信息提交成功等待审核");
				}
			},
			//用户信息修改
			async onSubmit() {
				const res = await this.$axios.post(
					"/webadmin/updatauser",
					this.qs.stringify(this.form)
				);
				let data = res.data.data;
				if (res.data.state.type === "SUCCESS") {
					this.$message.success("成功");
					this.setUserInfo(data.userinfo);
				}
			},
			//获取用户信息
			async getuser() {
				let res = await this.$axios.post("/webadmin/getuser");
				this.form = res.data.data;
				this.form.realstate = this.form.realstate * 1;
				this.student = {
					m: "student",
					realname: this.form.realname,
					studentid: this.form.studentid,
					studentcard: JSON.parse(this.form.studentcard)
				};
				if (this.form.studentcard == null) this.student.studentcard = [];
				this.company = {
					m: "company",
					companyname: this.form.companyname,
					companyimg: JSON.parse(this.form.companyimg)
				};
				if (this.form.companyimg == null) this.company.companyimg = [];
				this.form.m = "user"
			}
		},
		created() {
			this.getuser();
		}
	};
</script>
<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409eff;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avata {
		width: 178px;
		height: 178px;
		display: block;
	}
	.wra{
		display: flex;
		justify-content: flex-end;
	}
</style>
