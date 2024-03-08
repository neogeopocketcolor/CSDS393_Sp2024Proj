export const paginationMixin = {
  data() {
    return {
      paginationForm: {
        totalcount: 0,
        pageSize: 10,
        currentPage: 1
      },
      paginationPagerCount: 5, //大于等于5小于等于21的奇数
      paginationPageSizes: [10],
      paginationLayout: "total, sizes, prev, pager, next, jumper"
    };
  },
  methods: {
    startRequestAfterPaginationFormChanged() {
      console.log("重载该方法-加载网络数据");
    },
    handleSizeChange(val) {
      console.log(`每页 ${val} 条`);
      this.paginationForm.pageSize = val;
      this.startRequestAfterPaginationFormChanged();
    },
    handleCurrentChange(currentPage) {
      this.paginationForm.currentPage = currentPage;
      this.startRequestAfterPaginationFormChanged();
    },
    handlePaginationTableDataUseMixin(datas) {
      return this.handlePaginationTableDatasUseAllParams(datas, this.paginationForm.currentPage, this.paginationForm.pageSize);
    },
    handlePaginationTableDatasUseAllParams(datas, currentPage, pageSize) {
      if (datas == undefined || currentPage == undefined || currentPage == 0) {
        return [];
      }
      let start = pageSize * (currentPage - 1);
      let end = pageSize * currentPage;
      return datas.slice(start, end);
    }
  }
}
