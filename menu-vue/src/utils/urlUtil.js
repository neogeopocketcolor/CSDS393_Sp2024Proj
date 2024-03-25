
/**
 * 将url和参数拼接成完整地址
 * @param {string} url url地址
 * @param {Json} data json对象
 * @returns {string}
 */
export function spliceUrl(url, data) {
  //看原始url地址中开头是否带?，然后拼接处理好的参数
  return url += (url.indexOf('?') < 0 ? '?' : '') + getParam(data)
}
export function picPath(url) {
  //看原始url地址中开头是否带?，然后拼接处理好的参数
  return 'http://localhost:8088/imgs/' + url
}
/**
 * 传入对象返回url参数
 * @param {Object} data {a:1}
 * @returns {string}
 */
function getParam(data) {
  let url = '';
  for (var k in data) {
    let value = data[k] !== undefined ? data[k] : '';
    url += `&${k}=${encodeURIComponent(value)}`
  }
  return url ? url.substring(1) : ''
}

export function getFormData(params) {
  const formData = new FormData();
  Object.keys(params).forEach((key) => {
    formData.append(key, params[key]);
  });
  return formData;
}
