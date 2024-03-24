<template>
  <div class="user-container">
    <div class="header-wrapper">

      <el-button type="primary" @click="addMenu">Add</el-button>
    </div>


    <el-table v-loading="loading" element-loading-text="loading..." border :data="paginationTableData"
      style="width: 100%" highlight-current-row>
      <el-table-column type="index" width="80" label="num"></el-table-column>
      <el-table-column prop="name" label="name" width="100"></el-table-column>
      <el-table-column prop="sort" label="category" min-width="70"></el-table-column>
      <el-table-column prop="info" label="info" min-width="70"></el-table-column>
      <el-table-column prop="createTime" label="createTime" width="204"></el-table-column>
      <el-table-column fixed="right" label="operation" width="240">

      </el-table-column>
    </el-table>
    <div class="clearfix">
      <el-pagination @current-change="handleCurrentChange" :current-page="paginationForm.currentPage"
        :page-sizes="paginationPageSizes" :page-size="paginationForm.pageSize" :pager-count="paginationPagerCount"
        :layout="paginationLayout" :total="paginationForm.totalcount">
      </el-pagination>
    </div>
  </div>
</template>

<script>

import request from '@/utils/request'
import { spliceUrl } from "@/utils/urlUtil";
import { paginationMixin } from '@/utils/myMixin'
import { mapGetters } from 'vuex'
export default {
  name: 'MineMenuList',
  mixins: [paginationMixin],
  computed: {
    ...mapGetters([
      'userId',
      'role'
    ])
  },
  data() {
    return {
      loading: false,
      paginationTableData: [],
    }
  },
  created() {
    this.handleCurrentChange(1)
  },
  methods: {
    addMenu() {
      this.$router.push({ path: '/menu-add' })
    },
    async handleCurrentChange(currentPage) {
      this.paginationForm.currentPage = currentPage;
      this.loading = true;
      let params = {
        page: currentPage,
        pagesize: this.paginationForm.pageSize
      }
      let res = await request({
        url: spliceUrl('/menu/pageList', params),
        method: 'get'
      }).catch(er => -1);
      this.loading = false;
      if (res == 1) return;
      let menu = res.data || [];
      this.paginationTableData = menu;
      this.paginationForm.totalcount = res.count || 0;

    },



  }
}
</script>

<style lang="scss" scoped>
.clearfix {
  padding-top: 10px;
}

.user-container {
  padding: 15px;
}

.handle .el-button {
  width: 100px;
  font-size: 14px;
}

.header-wrapper {
  padding-bottom: 10px;
  text-align: right;
}
</style>