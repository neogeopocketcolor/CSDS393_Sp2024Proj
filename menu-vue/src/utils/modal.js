var defaultParams = { confirmButtonText: "确定", cancelButtonText: "取消" };
export function modal(message, title = "温馨提示", params = {}) {
  for (var attr in defaultParams) {
    var defaultValue = defaultParams[attr];
    var value = params[attr];
    if (value == undefined) {
      params[attr] = defaultValue;
    }
  }
  params.showCancelButton = false;
  params.dangerouslyUseHTMLString = true;
  return this.$confirm(message, title, params);
}
export function confirmModal(message, title = "温馨提示", params = {}) {
  for (var attr in defaultParams) {
    var defaultValue = defaultParams[attr];
    var value = params[attr];
    if (value == undefined) {
      params[attr] = defaultValue;
    }
  }
  params.dangerouslyUseHTMLString = true;
  return this.$confirm(message, title, params);
}