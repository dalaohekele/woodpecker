import request from '@/utils/request'

// 查询流量列表
export function diffList(query) {
    return request({
      url: '/replay/diff/list',
      method: 'get',
      params: query
    })
  }

export function replayDiff(data){
    return request({
        url: '/replay/diff',
        method: 'post',
        data: data
      })
}