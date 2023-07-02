package com.ruoyi.web.controller.scd;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.ScdTask;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.service.IScdTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/scd/tasks")
public class ScdTaskController extends BaseController {
        @Autowired
        private IScdTaskService taskService;

        @PreAuthorize("@ss.hasPermi('scd:tasks:list')")
        @GetMapping("/list")
        public AjaxResult list(ScdTask task) {
                return success(taskService.selectTasksList(task));
        }

        @PreAuthorize("@ss.hasPermi('scd:tasks:list')")
        @GetMapping("/{taskId}")
        public AjaxResult getTask(@PathVariable Long taskId) {
                return success(taskService.selectTaskById(taskId));
        }

        // ..implemented by other teammates?
//        @PreAuthorize("@ss.hasPermi('scd:tasks:add')")
//        @Log(title = "任务管理", businessType = BusinessType.INSERT)
//        @PostMapping("/add")
//        public AjaxResult add(@Validated @RequestBody ScdTask task) {
//                //
//
//                return toAjax(taskService.insertTask(task));
//        }

        @PreAuthorize("@ss.hasPermi('scd:tasks:edit')")
        @Log(title = "任务管理", businessType = BusinessType.UPDATE)
        @PutMapping("/edit")
        public AjaxResult edit(@Validated @RequestBody ScdTask task) {
                // ..TODO

                return toAjax(taskService.updateTask(task));
        }

        @PreAuthorize("@ss.hasPermi('scd:tasks:remove')")
        @Log(title = "任务管理", businessType = BusinessType.DELETE)
        @DeleteMapping("/remove")
        public AjaxResult remove(@Validated @RequestBody Long taskId) {
                // ..TODO

                return toAjax(taskService.deleteTaskById(taskId));
        }

        @PreAuthorize("@ss.hasPermi('scd:tasks:abort')")
        @Log(title = "任务管理", businessType = BusinessType.UPDATE)
        @PutMapping("/abort")
        public AjaxResult abort(@Validated @RequestBody Long taskId) {
                // ..TODO

                return toAjax(taskService.abortTaskById(taskId));
        }
}
