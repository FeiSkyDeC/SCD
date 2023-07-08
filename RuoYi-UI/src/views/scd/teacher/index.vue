<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学生ID" prop="stuId">
        <el-input
          v-model="queryParams.stuId"
          placeholder="请输入学生唯一标识符"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学生姓名" prop="stuName">
        <el-input
          v-model="queryParams.stuName"
          placeholder="请输入学生姓名"
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
      <el-form-item label="任务发布日期" prop="wkStart">
        <el-date-picker clearable
                        v-model="queryParams.wkStart"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择任务发布日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="任务截至日期" prop="wkEnd">
        <el-date-picker clearable
                        v-model="queryParams.wkEnd"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择任务截至日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="任务状态" prop="wkStau">
        <el-select v-model="queryParams.wkStau" placeholder="请选择任务状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_stuwk_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="审核状态" prop="wkExStau">
        <el-input
          v-model="queryParams.wkExStau"
          placeholder="请输入审核状态"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <!--        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>-->
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['ruoyi-stu_wk:stu_wk:add']"
        >分配任务
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['ruoyi-stu_wk:stu_wk:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['ruoyi-stu_wk:stu_wk:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ruoyi-stu_wk:stu_wk:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="stu_wkList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="序号" width="55" align="center" prop="wkId"/>
      <el-table-column label="学生ID" align="center" prop="stuId"/>
      <el-table-column label="学生姓名" align="center" prop="stuName"/>
      <el-table-column label="学生信息" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handlexxx(scope.row)"
            v-hasPermi="['ruoyi-stu_wk:stu_wk:edit']"
          >查看
          </el-button>
        </template>
      </el-table-column>
      <!--      <el-table-column label="学生姓名" align="center" prop="stuName" />
            <el-table-column label="教师唯一标识符" align="center" prop="teaId" />
            <el-table-column label="教师姓名" align="center" prop="teaName" />-->
      <el-table-column label="任务名称" align="center" prop="wkName"/>
      <!--      <el-table-column label="任务发布日期" align="center" prop="wkStart" width="180">
              <template slot-scope="scope">
                <span>{{ parseTime(scope.row.wkStart, '{y}-{m}-{d}') }}</span>
              </template>
            </el-table-column>
            <el-table-column label="任务截至日期" align="center" prop="wkEnd" width="180">
              <template slot-scope="scope">
                <span>{{ parseTime(scope.row.wkEnd, '{y}-{m}-{d}') }}</span>
              </template>
            </el-table-column>-->
      <el-table-column label="任务状态" align="center" prop="wkStau">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_stuwk_status" :value="scope.row.wkStau"/>
        </template>
      </el-table-column>
      <el-table-column label="审核状态" align="center" prop="wkExStau"/>
      <!--      <el-table-column label="任务下载路径" align="center" prop="wkAdd" />
            <el-table-column label="任务描述" align="center" prop="wkDes" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <router-link :to="'/scd/teacher-stu/index/' + scope.row.stuId" class="link-type">
            <el-button
              type="text"
              icon="el-icon-plus"
              size="mini"
            >任务详细
            </el-button>
          </router-link>
          <el-button
            size="mini"
            type="text"
            style="color: rgb(113, 226, 163)"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ruoyi-stu_wk:stu_wk:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            style="color: rgb(255, 146, 169)"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ruoyi-stu_wk:stu_wk:remove']"
          >删除
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

    <el-dialog :title="title2" :visible.sync="open2" width="500px" append-to-body :destroy-on-close="true"
               :show-close="false" :close-on-click-modal="false"
               :close-on-press-escape="false">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
        <el-form-item label="请确认您的教师ID" prop="teaId">
          <el-input
            v-model="queryParams.teaId"
            placeholder="请输入教师ID"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handletcqd">确定</el-button>
        </el-form-item>
        <el-divider content-position="center" >提示：只有点确定才能关闭弹窗</el-divider>
      </el-form>
    </el-dialog>


    <el-dialog :title="title1" :visible.sync="open1" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-divider content-position="center">学生信息信息</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeleteTmStu">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="tmStuList" :row-class-name="rowTmStuIndex" @selection-change="handleTmStuSelectionChange"
                  ref="tmStu">
          <el-table-column type="selection" width="50" align="center"/>
          <el-table-column label="学生姓名" prop="stuName" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.stuName" placeholder="请输入学生姓名" readonly/>
            </template>
          </el-table-column>
        </el-table>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel1">取 消</el-button>
      </div>
    </el-dialog>
    <!-- 添加或修改学生任务对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="学生唯一标识符" prop="stuId">
          <el-input v-model="form.stuId" placeholder="请输入学生唯一标识符"/>
        </el-form-item>
        <el-form-item label="学生ID" prop="stuId">
          <el-input v-model="form.stuName" placeholder="请输入学生ID"/>
        </el-form-item>
        <el-form-item label="任务名称" prop="wkName">
          <el-input v-model="form.wkName" placeholder="请输入任务名称"/>
        </el-form-item>
        <el-form-item label="任务发布日期" prop="wkStart">
          <el-date-picker clearable
                          v-model="form.wkStart"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择任务发布日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="任务截至日期" prop="wkEnd">
          <el-date-picker clearable
                          v-model="form.wkEnd"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择任务截至日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="任务状态" prop="wkStau">
          <el-radio-group v-model="form.wkStau">
            <el-radio
              v-for="dict in dict.type.sys_stuwk_status"
              :key="dict.value"
              :label="dict.value"
            >{{ dict.label }}
            </el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="审核状态" prop="wkExStau">
          <el-input v-model="form.wkExStau" placeholder="请输入审核状态"/>
        </el-form-item>
        <el-form-item label="任务下载路径" prop="wkAdd">
          <file-upload v-model="form.wkAdd" :file-type="['doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'pdf', 'png', 'jpg']"/>
        </el-form-item>
        <el-form-item label="任务描述" prop="wkDes">
          <el-input v-model="form.wkDes" type="textarea" placeholder="请输入内容"/>
        </el-form-item>
        <el-divider content-position="center">学生信息信息</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAddTmStu">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeleteTmStu">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="tmStuList" :row-class-name="rowTmStuIndex" @selection-change="handleTmStuSelectionChange"
                  ref="tmStu">
          <el-table-column type="selection" width="50" align="center"/>
          <el-table-column label="学生姓名" prop="stuName" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.stuName" placeholder="请输入学生姓名"/>
            </template>
          </el-table-column>
        </el-table>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {listTask, getTask, delTask, addTask, updateTask} from "@/api/scd/task";

export default {
  name: "Stu_wk",
  dicts: ['sys_stuwk_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedTmStu: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 学生任务表格数据
      stu_wkList: [],
      // 学生信息表格数据
      tmStuList: [],
      // 弹出层标题
      title: "",
      title1: "",
      title2: "",
      // 是否显示弹出层
      open: false,
      open1: false,
      open2: true,
      readonly: true,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        stuId: null,
        stuName: null,
        teaId: null,
        /*teaName: null,*/
        wkName: null,
        wkStart: null,
        wkEnd: null,
        wkStau: null,
        wkExStau: null,
        wkAdd: null,
        wkDes: null
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
          {required: true, message: "任务状态不能为空", trigger: "change"}
        ],
        wkExStau: [
          {required: true, message: "审核状态不能为空", trigger: "blur"}
        ],
        wkAdd: [
          {required: true, message: "任务下载路径不能为空", trigger: "blur"}
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
    /** 查询学生任务列表 */
    getList() {
      this.loading = true;
      listTask(this.queryParams).then(response => {
        this.stu_wkList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    cancel1() {
      this.open1 = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        wkId: null,
        stuId: null,
        stuName: null,
        /*teaId: null,
        teaName: null,*/
        wkName: null,
        wkStart: null,
        wkEnd: null,
        wkStau: null,
        wkExStau: null,
        wkAdd: null,
        wkDes: null
      };
      this.tmStuList = [];
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },

    /*弹窗确定按钮*/
    handletcqd() {
      this.queryParams.pageNum = 1;
      this.getList();
      this.open2 = false;
      this.reset();
    },
    lay() {
      this.$router.push({path: "/user/profile", query: {}});

    },
    /** 重置按钮操作 */
    /*resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },*/
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
      this.title = "添加学生任务";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const wkId = row.wkId || this.ids
      getTask(wkId).then(response => {
        this.form = response.data;
        this.tmStuList = response.data.tmStuList;
        this.open = true;
        this.title = "修改学生任务";
      });
    },
    handlexxx(row) {
      this.reset();
      const wkId = row.wkId || this.ids
      getTask(wkId).then(response => {
        this.form = response.data;
        this.tmStuList = response.data.tmStuList;
        this.open1 = true;
        this.title1 = "查看学生信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.tmStuList = this.tmStuList;
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
      this.$modal.confirm('是否确认删除学生任务编号为"' + wkIds + '"的数据项？').then(function () {
        return delTask(wkIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 学生信息序号 */
    rowTmStuIndex({row, rowIndex}) {
      row.index = rowIndex + 1;
    },
    /** 学生信息添加按钮操作 */
    handleAddTmStu() {
      let obj = {};
      obj.stuName = "";
      this.tmStuList.push(obj);
    },
    /** 学生信息删除按钮操作 */
    handleDeleteTmStu() {
      if (this.checkedTmStu.length == 0) {
        this.$modal.msgError("请先选择要删除的学生信息数据");
      } else {
        const tmStuList = this.tmStuList;
        const checkedTmStu = this.checkedTmStu;
        this.tmStuList = tmStuList.filter(function (item) {
          return checkedTmStu.indexOf(item.index) == -1
        });
      }
    },
    /** 复选框选中数据 */
    handleTmStuSelectionChange(selection) {
      this.checkedTmStu = selection.map(item => item.index)
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('ruoyi-stu_wk/stu_wk/export', {
        ...this.queryParams
      }, `stu_wk_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
