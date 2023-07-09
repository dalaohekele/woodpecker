<template>
  <div class="app-container">
    <el-form :model="diffParams" :rules="rules" ref="queryRef" :inline="true"  v-show="showSearch" label-width="100px"
    >
      <el-form-item label="基准流量版本" prop="version">
        <el-select
          v-model="diffParams.basicVersion"
          placeholder="请选择"
          clearable
        >
          <el-option
            v-for="item in data.versionList"
            :key="item"
            :value="item"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="对比流量版本" prop="version">
        <el-select
          v-model="diffParams.testVersion"
          placeholder="请选择"
          clearable
        >
          <el-option
            v-for="item in data.versionList"
            :key="item"
            :value="item"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="降噪字段">
        <el-input
          v-model="diffParams.noiseList"
          placeholder="使用英文,做分隔符"
          clearable
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleDiff"
          >对比</el-button
        >
      </el-form-item>
    </el-form>

    <el-table
      v-loading="loading"
      :data="replayList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column width="50" align="center" type="index" />
      <el-table-column
      width="80"
        label="基准版本"
        show-overflow-tooltip
        align="center"
        prop="basicVersion"
      />
      <el-table-column
      width="80"
        label="测试版本"
        show-overflow-tooltip
        align="center"
        prop="testVersion"
      />
      <el-table-column
        label="比对结果"
        show-overflow-tooltip
        align="center"
        prop="diffResult"
      />
      <el-table-column
        label="创建时间"
        show-overflow-tooltip
        width="120"
        align="center"
        prop="createTime"
      ></el-table-column>

      <el-table-column
      width="180"
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #default="scope">
          <el-button
            type="text"
            icon="Edit"
            @click="handleResult(scope.row)"
            v-hasPermi="['system:post:edit']"
            >生成报告</el-button
          >

        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getDiffList"
    />


  </div>
</template>

<script setup name="Diff">
import {listVersion} from "@/api/replay/replay";
import {diffList,replayDiff} from "@/api/replay/diff";

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
const noiseKey=ref("")

const data = reactive({
  form: {},
  versionForm: {},
  allMethod: ["POST", "GET", "PUT", "DELEET"],
  versionList: [],
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    testVersion: undefined,
  },
  diffParams: {
    basicVersion: undefined,
    testVersion: undefined,
    noiseList:undefined
  },
  rules: {
    basicVersion: [{ required: true, message: "基准版本不能为空", trigger: "blur" }],
    testVersion: [{ required: true, message: "对比版本不能为空", trigger: "blur" }],
  },
});

const { diffParams, queryParams,form, versionForm, rules } = toRefs(data);

/** 获取版本列表 */
function getVersionList() {
  loading.value = true;
  listVersion().then((response) => {
    data.versionList = response.data;
    loading.value = false;
  });
}

/** 查询diff列表 */
function getDiffList() {
  loading.value = true;
  diffList(queryParams.value).then((response) => {
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
/** 对比按钮操作 */
function handleDiff() {
  data.noiseKey = diffParams.value.noiseList
  diffParams.value.noiseList = data.noiseKey.split(',')
  replayDiff(diffParams.value).then((response) => {
    proxy.$modal.msgSuccess(response.msg);
  });
  getDiffList();
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

/** 生成报告 */
function handleResult(row) {
  alert("功能尚未完成！！")
}

function submitVersionForm(){
  addVersion(proxy.addDateRange(versionForm.value, dateRange.value)).then((response) => {
    proxy.$modal.msgSuccess("新增成功");
    versionDialog.value  = false;
  });
}
getVersionList();
getDiffList();
</script>
