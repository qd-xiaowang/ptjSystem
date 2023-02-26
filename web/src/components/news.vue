<template>
	<div class="help">
		<div style='width:1200px'>
			<div style="color: #777777;
			text-align: center;
			font-size: 20px;
			background-color: #e8e7e3;
			height: 40px;
			line-height: 40px;">兼职广告列表  勤工俭学  家教辅导</div>
			<div tag="div" class="page-header" style="position:relative;">
			</div>
			<article class="format-standard type-post hentry clearfix" v-for="(item, id) in tableData" :key="id">
				<header class="clearfix">
					<div class="post-meta clearfix">
						<div>
						<router-link :to="'/newscontent/' + item.article_id" style="font-size: 20px;">招聘信息：{{item.article_title}}</router-link>
						</div>
						<div class="category" style="font-size: 20px;">
							<div>招聘个体：{{item.nickname}}</div>
						</div>
						<div class="date" style="font-size: 20px;">发布日期：{{ item.article_createtime | dataFormat }}</div>
					</div>
					<!-- end of post meta -->
				</header>

			</article>
		</div>
	</div>
</template>

<script>
	export default {
		name: 'help',
		data() {
			return {
				smallttle: '',
				pagelistquery: {
					lable: '',
					tag: '',
					total: 0,
					pagesize: 3,
					page: 1
				},
				tableData: {}
			}
		},

		methods: {
			async getarticlelist() {
				let res = await this.$axios.post(
					'/web/getarticlelist',
					this.qs.stringify(this.pagelistquery)
				)
				if (res.data.state.type === 'SUCCESS') {
					this.tableData = res.data.data
					this.pagelistquery.total = res.data.count
				}
			}
		},
		created() {
			this.getarticlelist()
		}
	}
</script>
<style>
	.help {
		min-height: 200px;
	}
</style>
