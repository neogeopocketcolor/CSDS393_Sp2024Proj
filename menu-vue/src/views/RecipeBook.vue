<template>
  <div class="list-container">
    <el-table v-loading="loading" element-loading-text="loading..." border :data="paginationTableData"
      style="width: 100%" highlight-current-row>
      <el-table-column type="index" width="80" label="num" />
      <el-table-column prop="category" label="category" width="100">
        <template slot-scope="{ row }">
          <el-image class="icon-class" :src="getImagePath(row.icon)" />
        </template> 
      </el-table-column>
      <el-table-column prop="category" label="category" width="100" :formatter="categoryFormatter" />
      <el-table-column prop="name" label="name" min-width="200" show-overflow-tooltip/>
      <el-table-column prop="info" label="info" min-width="400" show-overflow-tooltip/>
      <el-table-column prop="createdTime" label="createdTime" width="160" />
      <el-table-column  label="operation" width="150">
        <template slot-scope="{ row }">
            <div class="operation-btn-wrapper">
              <el-button icon="el-icon-view" type="info"   @click="detail(row)" >detail</el-button>
            </div>
        </template>
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
import { spliceUrl,picPath } from "@/utils/urlUtil";
import { paginationMixin } from '@/utils/myMixin'
import { footCategorys,footUnits } from "@/utils/enmu";
export default {
  name: 'RecipeBook',
  mixins: [paginationMixin],
  data() {
    return {
      loading: false,
      paginationTableData: [],
    }
  },
  created() {
    this.getDataListRequest()
  },
  methods: {
    detail:function(row){
      this.$router.push({ path: '/recipe-detail',query:{id:row.id} })
    },
    categoryFormatter:function(row){
      let categoryObj =  footCategorys.find(item =>item.value == row.category);
      return categoryObj.label;
    },
    getImagePath:function(path){
      let absolutePath = picPath(path);
      return absolutePath;
   },
   async handleCurrentChange(currentPage) {
     this.paginationForm.currentPage = currentPage;
     this.getDataListRequest();
    },
    getDataListRequest:async function(){
      this.loading = true;
      let params = {
        page: this.paginationForm.currentPage,
        pagesize: this.paginationForm.pageSize
      }
      let res = await request({
        url: spliceUrl('recipe/pageList', params),
        method: 'get'
      }).catch(er => -1);
      this.loading = false;
      if (res == 1) return;
      let menu = res.data || [];
      this.paginationTableData = menu;
      this.paginationForm.totalcount = res.count || 0;
    }


  }
}
</script>

<style lang="scss" scoped>
.clearfix {
  padding-top: 10px;
}
.icon-class {
  height: 50px;
}
.list-container {
  padding: 15px;
}
.operation-btn-wrapper {
  display: flex;
  justify-content: center;
}
</style>