<template>
	<el-table :data="tableData" style="width: 100%">
		<el-table-column prop="article_title" label="新闻名" >
		</el-table-column>
		<el-table-column prop="author" label="作者">
		</el-table-column>

	</el-table>
</template>

<script>
	export default {
		data() {
			return {
				tableData: [
					{
					username:'',
					article_title: '',
					author:'',
					// name: '王小虎',
				},
				]
			};
		},
		methods: {
			async getcollectionlist(){
				let {data:{data}} = await this.$axios.post("/webadmin/getuser");
				console.log(data.nickname);
				if(data.nickname){
					let info = {username:data.nickname}
					let res = await this.$axios.post(
					'/web/getcollectionlist',this.qs.stringify(info)
					)
					// 返回一个数组
					console.log(res.data)
					this.tableData = res.data
					
				}
			}
		},
		created() {
			this.getcollectionlist();
		}

	};
</script>

<style>
</style>
