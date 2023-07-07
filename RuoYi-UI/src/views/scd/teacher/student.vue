<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学生ID" prop="stuId">
        <el-input
          v-model="queryParams.stuId"
          placeholder="请输入学生ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="任务名称" prop="wkName">
        <el-input
          v-model="queryParams.wkName"
          placeholder="请输入任务名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        <el-button
          type="warning"
          plain
          icon="el-icon-close"
          size="mini"
          @click="handleClose"
        >关闭
        </el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="wkList" @selection-change="handleSelectionChange">
      <el-table-column label="任务序号" align="center" prop="wkId"/>
      <el-table-column label="学生ID" align="center" prop="stuId"/>
      <el-table-column label="任务名称" align="center" prop="wkName"/>
      <el-table-column label="审核状态" align="center" prop="wkExStau"/>
      <el-table-column label="编辑" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['taskmgr:wk:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleView(scope.row)"
            v-hasPermi="['taskmgr:wk:query']"
          >任务内容
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleCommit(scope.row)"
          >下载提交
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改任务一览对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="审核状态" prop="wkExStau">
          <el-select v-model="form.wkExStau" placeholder="请选择审核状态" :style="{width: '100%'}">
            <el-option v-for="(item, index) in wkExStauOptions" :key="index" :label="item.label"
                       :value="item.value" :disabled="item.disabled"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <!-- 查看任务描述 -->
    <el-dialog title="查看任务内容" :visible.sync="opens" width="700px" append-to-body>
      <el-form ref="form" :model="form" label-width="100px" size="mini">
        <el-row>
          <el-col :span="24">
            <el-form-item label="任务内容：" prop="wkDes">{{ form.wkDes }}</el-form-item>
          </el-col>
        </el-row>
        <div slot="footer" class="dialog-footer">
          <el-button @click="cancel">关 闭</el-button>
        </div>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import {listTask, getTask, delTask, addTask, updateTask} from "@/api/scd/task";

export default {
  name: "Wk",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 任务一览表格数据
      wkList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        stuId: null,
        wkName: null,
        wkStau: null,
        wkExStau: null,
        wkDes: null
      },
      opens: false,
      wkExStauOptions: [{
        "label": "通过",
        "value": "通过"
      }, {
        "label": "未通过",
        "value": "未通过"
      }],
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        wkId: [
          {required: true, message: "任务序号不能为空", trigger: "blur"}
        ],
        stuId: [
          {required: true, message: "学生唯一标识符不能为空", trigger: "blur"}
        ],
        stuName: [
          {required: true, message: "学生姓名不能为空", trigger: "blur"}
        ],
        teaId: [
          {required: true, message: "教师唯一标识符不能为空", trigger: "blur"}
        ],
        teaName: [
          {required: true, message: "教师姓名不能为空", trigger: "blur"}
        ],
        wkName: [
          {required: true, message: "任务名称不能为空", trigger: "blur"}
        ],
        wkStart: [
          {required: true, message: "任务发布日期不能为空", trigger: "blur"}
        ],
        wkEnd: [
          {required: true, message: "任务截至日期不能为空", trigger: "blur"}
        ],
        wkStau: [
          {required: true, message: "任务状态不能为空", trigger: "blur"}
        ],
        wkExStau: [
          {required: true, message: "审核状态不能为空", trigger: "change"}
        ],
        wkDes: [
          {required: true, message: "任务描述不能为空", trigger: "blur"}
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询任务一览列表 */
    getList() {
      const stuId = this.$route.params["userId"];
      this.loading = true;
      this.queryParams.stuId = stuId;
      listTask(this.queryParams).then(response => {
        this.wkList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        wkId: null,
        stuId: null,
        stuName: null,
        teaId: null,
        teaName: null,
        wkName: null,
        wkStart: null,
        wkEnd: null,
        wkStau: [],
        wkExStau: null,
        wkDes: null
      };
      this.resetForm("form");
    },
    handleCommit(row) {
      if (row.wkComm == null || row.wkComm == "" || row.wkComm == undefined) {
        this.$modal.msgError("该学生没有提交任务");

        return;
      }

      this.$download.resource(row.wkComm);
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.wkId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加任务一览";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const wkId = row.wkId || this.ids
      getTask(wkId).then(response => {
        this.form = response.data;
        this.form.wkStau = this.form.wkStau.split(",");
        this.open = true;
        this.title = "修改任务";
      });
    },
    /** 任务状态查看操作 */
    onOpen() {
    },
    onClose() {
      this.$refs['elForm'].resetFields()
    },
    close() {
      this.$emit('update:visible', false)
    },
    handleView(row) {
      this.opens = true;
      this.form = row;
    },
    handleClose() {
      const obj = {path: "/scd/teacher"};
      this.$tab.closeOpenPage(obj);
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.wkStau = this.form.wkStau.join(",");
          if (this.form.wkId != null) {
            updateTask(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTask(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const wkIds = row.wkId || this.ids;
      this.$modal.confirm('是否确认删除任务一览编号为"' + wkIds + '"的数据项？').then(function () {
        return delTask(wkIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('scd/task/export', {
        ...this.queryParams
      }, `wk_${new Date().getTime()}.xlsx`)
    },
  }
};

</script>
