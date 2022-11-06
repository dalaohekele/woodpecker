import request from '@/utils/request'

// 查询流量列表
export function listReplay(query) {
  return request({
    url: '/replay/gor/list',
    method: 'get',
    params: query
  })
}
// 版本列表
export function listVersion() {
    return request({
      url: '/replay/gor/version',
      method: 'get',
    })
}
// 流量详情
export function getReplay(id) {
    return request({
      url: '/replay/gor/' +id,
      method: 'get',
    })
  }
  export function delReplay(ids) {
    return request({
      url: '/replay/gor/delReplay/'+ ids,
      method: 'delete'
    })
  }

  