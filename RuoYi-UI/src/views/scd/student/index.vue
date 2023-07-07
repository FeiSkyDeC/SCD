<template>


  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学号" prop="stuName">
        <el-input
          readonly
          v-model="queryParams.stuId"
          v-text="queryParams.stuId"
        />
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="wkList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="任务序号" align="center" prop="wkId"/>
      <el-table-column label="任务名称" align="center" prop="wkName"/>
      <el-table-column label="任务发布日期" align="center" prop="wkStart" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.wkStart, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="任务截至日期" align="center" prop="wkEnd" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.wkEnd, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="审核状态" align="center" prop="wkExStau"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <file-upload v-model="form.wkDes"/>
        <template slot-scope="scope">
          <el-button
            type="text"
            icon="el-icon-download"
            size="mini"
            @click="handleExport(scope.row)"
          >接收
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-upload2"
            @click="handleImport(scope.row)"
          >上传
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

    <!-- 用户导入对话框 -->
    <el-dialog :title="upload.title" :visible.sync="upload.open" width="400px">
      <el-upload
        ref="upload"
        :limit="20"
        :file-type="['doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'pdf']"
        :headers="upload.headers"
        :action="upload.url"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :auto-upload="false"
        drag
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">
          将文件拖到此处，或
          <em>点击上传</em>
        </div>
        <div class="el-upload__tip" slot="tip">
          <el-link type="info" style="font-size:12px" @click="importTemplate">下载模板</el-link>
        </div>
        <div class="el-upload__tip" style="color:red" slot="tip">提示：文件大小不超过 20 MB，可上传文件类型: .doc, .docx, .xls, .xlsx, .ppt, .pptx, .txt, .pdf</div>
      </el-upload>

      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFileForm">确 定</el-button>
        <el-button @click="upload.open = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {listTask, getTask, delTask, addTask, updateTask} from "@/api/scd/task";
import {getToken} from "@/utils/auth";
import {getUserProfile} from "@/api/system/user";

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
      // 【请填写功能名称】表格数据
      wkList: [],
      wkId: null,
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        stuId: null,
        stuName: null,
        teaId: null,
        teaName: null,
        wkName: null,
        wkStart: null,
        wkEnd: null,
        wkStau: null,
        wkExStau: null,
        wkDes: null,
        userName: undefined
      },

      // 表单参数
      form: {},
      // 表单校验
      rules: {
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
          {required: true, message: "审核状态不能为空", trigger: "blur"}
        ],
        wkDes: [
          {required: true, message: "任务描述不能为空", trigger: "blur"}
        ]
      },
      upload: {
        // 是否显示弹出层（用户导入）
        open: false,
        // 弹出层标题（用户导入）
        title: "",
        // 是否禁用上传
        isUploading: false,
        // 是否更新已经存在的用户数据
        updateSupport: 0,
        // 设置上传的请求头部
        headers: {Authorization: "Bearer " + getToken()},
        // 上传的地址
        url: process.env.VUE_APP_BASE_API + "/common/upload"
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询【请填写功能名称】列表 */
    async getList() {
      this.loading = true;
      const userRes = await getUserProfile();
      const user = userRes.data;
      this.queryParams.stuId = user["userId"];
      this.queryParams.stuId = 30007; // debug
      const taskRes = await listTask(this.queryParams);
      this.wkList = taskRes.rows;
      this.total = taskRes.total;
      this.loading = false;
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
        wkStau: null,
        wkExStau: null,
        wkDes: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.stuId = 1;
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
      this.title = "添加【请填写功能名称】";
      this.upload.fileList = [];
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const wkId = row.wkId || this.ids
      getTask(wkId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改【请填写功能名称】";
        this.upload.fileList = [{name: this.form.wkName, url: this.form.wkComm}];
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
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
      this.$modal.confirm('是否确认删除【请填写功能名称】编号为"' + wkIds + '"的数据项？').then(function () {
        return delTask(wkIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    async handleExport(row) {
      const queryParams = this.queryParams;
      await this.$confirm('是否确认接受任务?', "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
      this.$download.resource(row.wkAdd)
    },

    /** 导入按钮操作 */
    handleImport(row) {
      this.upload.title = "任务提交";
      this.wkId = row.wkId;
      this.upload.open = true;
    },
    /** 下载模板操作 */
    importTemplate() {
      importTemplate().then(response => {
        this.download(response.msg);
      });
    },
// 文件上传中处理
    handleFileUploadProgress(event, file, fileList) {
      this.upload.isUploading = true;
    },
// 文件上传成功处理
    handleFileSuccess(response, file, fileList) {
      this.upload.open = false;
      this.upload.isUploading = false;
      const path = file.response.fileName;
      getTask(this.wkId).then(response => {
        this.form = response.data;
        this.form.wkComm = path;
        console.log(this.form);
        updateTask(this.form).then(response => {
          this.$modal.msgSuccess("上传成功");
          this.open = false;
          this.getList();
          this.$refs.upload.clearFiles();
          this.wkId = null;
        });
      });
    },
// 提交上传文件
    submitFileForm() {
      this.$refs.upload.submit();
    },
  }
};
</script>
