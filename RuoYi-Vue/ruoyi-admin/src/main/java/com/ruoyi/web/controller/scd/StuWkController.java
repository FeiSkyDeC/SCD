package com.ruoyi.web.controller.scd;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.student.domain.StuWk;
import com.ruoyi.student.service.IStuWkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 学生任务Controller
 * 
 * @author ruoyi
 * @date 2023-07-06
 */
@RestController
@RequestMapping("/scd/task")
public class StuWkController extends BaseController
{
    @Autowired
    private IStuWkService stuWkService;

    /**
     * 查询学生任务列表
     */
    @PreAuthorize("@ss.hasRole('teacher')")
    @GetMapping("/list")
    public TableDataInfo list(StuWk stuWk)
    {
        startPage();
        List<StuWk> list = stuWkService.selectStuWkList(stuWk);
        return getDataTable(list);
    }

    /**
     * 导出学生任务列表
     */
    @PreAuthorize("@ss.hasRole('teacher')")
    @Log(title = "学生任务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, StuWk stuWk)
    {
        List<StuWk> list = stuWkService.selectStuWkList(stuWk);
        ExcelUtil<StuWk> util = new ExcelUtil<StuWk>(StuWk.class);
        util.exportExcel(response, list, "学生任务数据");
    }

    /**
     * 获取学生任务详细信息
     */
    @PreAuthorize("@ss.hasRole('teacher')")
    @GetMapping(value = "/{wkId}")
    public AjaxResult getInfo(@PathVariable("wkId") Long wkId)
    {
        return success(stuWkService.selectStuWkByWkId(wkId));
    }

    /**
     * 新增学生任务
     */
    @PreAuthorize("@ss.hasRole('teacher')")
    @Log(title = "学生任务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StuWk stuWk)
    {
        return toAjax(stuWkService.insertStuWk(stuWk));
    }

    /**
     * 修改学生任务
     */
    @PreAuthorize("@ss.hasRole('teacher')")
    @Log(title = "学生任务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StuWk stuWk)
    {
        return toAjax(stuWkService.updateStuWk(stuWk));
    }

    /**
     * 删除学生任务
     */
    @PreAuthorize("@ss.hasRole('teacher')")
    @Log(title = "学生任务", businessType = BusinessType.DELETE)
	@DeleteMapping("/{wkIds}")
    public AjaxResult remove(@PathVariable Long[] wkIds)
    {
        return toAjax(stuWkService.deleteStuWkByWkIds(wkIds));
    }
}
