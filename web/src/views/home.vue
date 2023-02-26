<template>
  <div class="home">
    <div v-title data-title="校园兼职平台"></div>
    <div class="page-container">
      <div class="container">
        <div class="row">
          <div class="span8 page-content">
            <news />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import news from '@/components/news.vue'

export default {
  name: 'home',
  components: {
    news,
  }
}
</script>
<style>
.guomore {
  float: right;
}
</style>
