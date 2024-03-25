var defaultParams = { confirmButtonText: "confirm", cancelButtonText: "cancel" };
export function modal(message, title = "tip", params = {}) {
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
export function confirmModal(message, title = "tip", params = {}) {
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