<template>
  <div class="dashboard-container">
    <div class="dashboard-text">Welcome to the recipe system</div>
    <div class="submit-text">{{ name }}</div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'Dashboard',
  computed: {
    ...mapGetters([
      'name'
    ])
  },
  mounted(){
    console.log(this.$router)
  }
}
</script>

<style lang="scss" scoped>
.dashboard {
  &-container {
    margin: 30px;
  }
  &-text {
    font-size: 30px;
    line-height: 46px;
  }
}
.submit-text {
  margin-top: 30px;
  font-size: 16px;
}
</style>
