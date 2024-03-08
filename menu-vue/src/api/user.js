import request from '@/utils/request'

export function login(account) {
  return request({
    url: '/user/getUserByAccount?account=' + account,
    method: 'post'
  })
}
export function regist(data) {
  return request({
    url: '/user/userRegist',
    method: 'post',
    data
  })
}



