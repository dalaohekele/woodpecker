<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryRef"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="gorId" prop="gorId">
        <el-input
          v-model="queryParams.gorId"
          placeholder="请输入gorid"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="版本号" prop="version">
        <el-select
          v-model="queryParams.version"
          placeholder="请选择版本号"
          clearable
        >
          <el-option
            v-for="item in data.versionList"
            :key="item"
            :value="item"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <!-- <el-button type="primary" plain icon="Plus" @click="handleAdd"
          >新增</el-button
        > -->
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:post:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Upload" @click="handleAddVersion"
          >流量打标</el-button
        >
      </el-col>
      <right-toolbar
        v-model:showSearch="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="replayList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" width="60" align="center" prop="id" />
      <el-table-column
        label="gorId"
        show-overflow-tooltip
        align="center"
        prop="gorId"
      />
      <el-table-column
        label="请求路径"
        show-overflow-tooltip
        align="center"
        prop="reqPath"
      />
      <el-table-column
        label="入参"
        show-overflow-tooltip
        align="center"
        prop="reqParam"
      />
      <el-table-column
        label="出参"
        show-overflow-tooltip
        width="240"
        align="center"
        prop="respData"
      ></el-table-column>
      <el-table-column
        label="版本"
        show-overflow-tooltip
        width="60"
        align="center"
        prop="version"
      >
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #default="scope">
          <el-button
            type="text"
            icon="Edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:post:edit']"
            >修改</el-button
          >
          <el-button
            type="text"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:post:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />
    <el-dialog
      :title="title"
      v-model="versionDialog"
      width="500px"
      append-to-body
    >
      <el-form ref="versionRef" :model="versionForm" label-width="80px">
        <el-form-item label="版本" prop="reqUrl">
          <el-input v-model="versionForm.version" placeholder="请输入版本号" />
        </el-form-item>
        <el-form-item label="创建时间" style="width: 308px">
          <el-date-picker
            v-model="dateRange"
            value-format="YYYY-MM-DD"
            type="daterange"
            range-separator="-"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
          ></el-date-picker>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitVersionForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
    <!-- 添加或修改流量数据 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="postRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="URL" prop="reqUrl">
          <el-input v-model="form.reqUrl" placeholder="请输入请求URL" />
        </el-form-item>
        <el-form-item label="资源路径" prop="reqPath">
          <el-input v-model="form.reqPath" placeholder="请输资源路径" />
        </el-form-item>
        <el-form-item label="请求类型" prop="reqMethod">
          <el-select v-model="form.reqMethod" placeholder="请求类型" clearable>
            <el-option
              v-for="method in data.allMethod"
              :key="method"
              :value="method"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="请求头" prop="reqCookies">
          <el-input v-model="form.reqCookies" placeholder="请输入请求头" />
        </el-form-item>
        <el-form-item label="请求参数" prop="reqParam">
          <el-input v-model="form.reqParam" placeholder="请输入请求参数" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Post">
import {listReplay,listVersion,getReplay,delReplay,addVersion} from "@/api/replay/replay";
const { proxy } = getCurrentInstance();

const replayList = ref([]);
const open = ref(false);
const versionDialog = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const dateRange = ref([]);

const data = reactive({
  form: {},
  versionForm: {},
  allMethod: ["POST", "GET", "PUT", "DELEET"],
  versionList: [],
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    gorId: undefined,
    version: undefined,
  },
  rules: {
    reqMethod: [
      { required: true, message: "请求参数不能为空", trigger: "blur" },
    ],
    reqUrl: [{ required: true, message: "请求url不能为空", trigger: "blur" }],
    reqPath: [
      { required: true, message: "请求资源路径不能为空", trigger: "blur" },
    ],
  },
});

const { queryParams, form, versionForm, rules } = toRefs(data);
/** 获取版本列表 */
function getVersionList() {
  loading.value = true;
  listVersion().then((response) => {
    data.versionList = response.data;
    loading.value = false;
  });
}

/** 查询列表 */
function getList() {
  loading.value = true;
  listReplay(queryParams.value).then((response) => {
    replayList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}
/** 取消按钮 */
function cancel() {
  open.value = false;
  reset();
}
/** 表单重置 */
function reset() {
  form.value = {
    reqUrl: undefined,
    reqPath: undefined,
    reqMethod: undefined,
    reqCookies: undefined,
    reqParam: undefined,
  };
  proxy.resetForm("postRef");
}
/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}
/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}
/** 多选框选中数据 */
function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}
/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加请求数据";
}

/** 流量添加标签 */
function handleAddVersion() {
  versionDialog.value = true;
  title.value = "流量添加标签";
}
/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const id = row.id || ids.value;
  getReplay(id).then((response) => {
    form.value = response.data;
    open.value = true;
    title.value = "修改流量";
  });
}

function submitVersionForm(){
  addVersion(proxy.addDateRange(versionForm.value, dateRange.value)).then((response) => {
    proxy.$modal.msgSuccess("新增成功");
    versionDialog.value  = false;
  });
}
/** 提交按钮 */
// function submitForm() {
//   proxy.$refs["postRef"].validate((valid) => {
//     if (valid) {
//       if (form.value.id != undefined) {
//         updatePost(form.value).then((response) => {
//           proxy.$modal.msgSuccess("修改成功");
//           open.value = false;
//           getList();
//         });
//       } else {
//         addPost(form.value).then((response) => {
//           proxy.$modal.msgSuccess("新增成功");
//           open.value = false;
//           getList();
//         });
//       }
//     }
//   });
// }
/** 删除按钮操作 */
function handleDelete(row) {
  const replayIds = row.id || ids.value;
  proxy.$modal
    .confirm('是否确认删除流量编号为"' + replayIds + '"的数据项？')
    .then(function () {
      return delReplay(replayIds);
    })
    .then(() => {
      getList();
      proxy.$modal.msgSuccess("删除成功");
    })
    .catch(() => {});
}


getList();
getVersionList();
</script>
