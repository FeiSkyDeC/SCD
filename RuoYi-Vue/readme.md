# 数据表 stu_wk 结构

| column     | type                                          | comment        |
| ---------- | --------------------------------------------- | -------------- |
| wk_id      | mediumint not null AUTO_INCREMENT primary key | 任务序号       |
| stu_id     | mediumint not null                            | 学生唯一标识符 |
| tea_id     | mediumint not null                            | 教师唯一标识符 |
| wk_name    | nvarchar(12) not null                         | 任务名称       |
| wk_start   | datetime not null                             | 任务发布日期   |
| wk_end     | datetime not null                             | 任务截至日期   |
| wk_stau    | boolean not null                              | 任务状态       |
| wk_ex_stau | boolean not null                              | 审核状态       |
| wk_addr    | text not null                                 | 任务下载地址   |
| wk_des     | text not null                                 | 任务描述       |

# GET /scd/task/list

### 参数：

无

### 返回结果:

| param    | type    | comment                  |
| -------- | ------- | ------------------------ |
| wkId     | integer | 任务ID                   |
| stuId    | integer | 分配学生ID               |
| stuName  | string  | 学生姓名                 |
| teaId    | integer | 老师ID                   |
| teaName  | string  | 老师姓名                 |
| wkName   | string  | 任务名                   |
| wkStart  | string  | 任务开始日期             |
| wkEnd    | string  | 任务截止日期             |
| wkStau   | boolean | 任务分配状态(deprecated) |
| wkExStau | boolean | 任务通过状态             |
| wkAdd    | string  | 任务附件下载地址         |
| wkDes    | string  | 任务描述                 |

### 返回样例：

```json
{
  "total": 2,
  "rows": [
    {
      "createBy": null,
      "createTime": null,
      "updateBy": null,
      "updateTime": null,
      "remark": null,
      "wkId": 1,
      "stuId": 101,
      "stuName": "李四",
      "teaId": 104,
      "teaName": "毛博",
      "wkName": "完成前端设计",
      "wkStart": "2023-07-07",
      "wkEnd": "2024-07-07",
      "wkStau": true,
      "wkExStau": false,
      "wkAdd": "/extra.pdf",
      "wkDes": "前端真tm难"
    },
    {
      "createBy": null,
      "createTime": null,
      "updateBy": null,
      "updateTime": null,
      "remark": null,
      "wkId": 2,
      "stuId": 102,
      "stuName": "王五",
      "teaId": 104,
      "teaName": "毛博",
      "wkName": "完成后端设计",
      "wkStart": "2023-07-07",
      "wkEnd": "2024-07-07",
      "wkStau": true,
      "wkExStau": false,
      "wkAdd": "/extra.pdf",
      "wkDes": "后端真tm难"
    }
  ],
  "code": 200,
  "msg": "查询成功"
}
```

# GET /scd/task/{wkId}

### 参数：

无

### 返回结果：

同上，但只返回一个特定wkId结果

### 返回样例：

```json
{
  "msg": "操作成功",
  "code": 200,
  "data": {
    "createBy": null,
    "createTime": null,
    "updateBy": null,
    "updateTime": null,
    "remark": null,
    "wkId": 1,
    "stuId": 101,
    "stuName": "李四",
    "teaId": 104,
    "teaName": "毛博",
    "wkName": "完成前端设计",
    "wkStart": "2023-07-07",
    "wkEnd": "2024-07-07",
    "wkStau": true,
    "wkExStau": false,
    "wkAdd": "/extra.pdf",
    "wkDes": "前端真tm难"
  }
}
```

# PUT /scd/task

### 参数：

| param    | type    | comment                  |
| -------- | ------- | ------------------------ |
| wkId     | integer | 任务ID                   |
| stuId    | integer | 分配学生ID               |
| teaId    | integer | 老师ID                   |
| wkName   | string  | 任务名                   |
| wkStart  | string  | 任务开始日期             |
| wkEnd    | string  | 任务截止日期             |
| wkStau   | boolean | 任务分配状态(deprecated) |
| wkExStau | boolean | 任务通过状态             |
| wkAdd    | string  | 任务附件下载地址         |
| wkDes    | string  | 任务描述                 |

### 返回结果：

无

### 输入样例：

```json
{
  "wkId": 1,
  "stuId": 30001,
  "teaId": 60001,
  "wkName": "完成前端设计",
  "wkStart": "2023-07-04T20:13:19.000+08:00",
  "wkEnd": "2023-07-09T20:13:19.000+08:00",
  "wkStau": true,
  "wkExStau": false,
  "wkDes": "正常完成前端任务"
}
```

### 返回样例：

```json
{
  "msg": "操作成功",
  "code": 200
}
```

# POST /scd/task

### 参数：

| param    | type    | comment                  |
| -------- | ------- | ------------------------ |
| stuId    | integer | 分配学生ID               |
| teaId    | integer | 老师ID                   |
| wkName   | string  | 任务名                   |
| wkStart  | string  | 任务开始日期             |
| wkEnd    | string  | 任务截止日期             |
| wkStau   | boolean | 任务分配状态(deprecated) |
| wkExStau | boolean | 任务通过状态             |
| wkAdd    | string  | 任务附件下载地址         |
| wkDes    | string  | 任务描述                 |

### 返回结果：

无

### 输入样例：

```json
{
  "stuId": 100,
  "teaId": 104,
  "wkName": "完成测试报告",
  "wkStart": "2023-07-07",
  "wkEnd": "2024-07-07",
  "wkStau": true,
  "wkExStau": false,
  "wkAdd": "/extra.pdf",
  "wkDes": "ruoyi真看不懂啊"
}
```

### 返回样例：

```json
{
  "msg": "操作成功",
  "code": 200
}
```

