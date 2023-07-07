import request from '@/utils/request'

// 查询学生任务列表
export function listTask(query) {
  return request({
    url: '/scd/task/list',
    method: 'get',
    params: query
  })
}

// 查询学生任务详细
export function getTask(wkId) {
  return request({
    url: '/scd/task/' + wkId,
    method: 'get'
  })
}

// 新增学生任务
export function addTask(data) {
  return request({
    url: '/scd/task',
    method: 'post',
    data: data
  })
}

// 修改学生任务
export function updateTask(data) {
  return request({
    url: '/scd/task',
    method: 'put',
    data: data
  })
}

// 删除学生任务
export function delTask(wkId) {
  return request({
    url: '/scd/task' + wkId,
    method: 'delete'
  })
}
