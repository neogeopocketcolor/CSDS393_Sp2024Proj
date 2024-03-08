<template>
    <div class="user-container">
      <el-table v-loading="loading" element-loading-text="loading..." border 
      :data="paginationTableData" style="width: 100%"
        highlight-current-row>
        <el-table-column type="index" width="80" label="num"></el-table-column>
        <el-table-column prop="userName" label="name" width="100"></el-table-column>
        <el-table-column prop="bankName" label="category" min-width="70"></el-table-column>
        <el-table-column prop="createdTime" label="createdTime" width="204"></el-table-column>
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
  import { spliceUrl} from "@/utils/urlUtil";
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

    },
    methods: {
      handleCurrentChange(currentPage) {
        this.paginationForm.currentPage = currentPage;
     
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
  
  
  
  </style>
  