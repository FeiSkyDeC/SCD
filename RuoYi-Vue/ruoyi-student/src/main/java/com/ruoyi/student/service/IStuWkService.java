package com.ruoyi.student.service;

import java.util.List;
import com.ruoyi.student.domain.StuWk;

/**
 * 学生任务Service接口
 * 
 * @author ruoyi
 * @date 2023-07-06
 */
public interface IStuWkService 
{
    /**
     * 查询学生任务
     * 
     * @param wkId 学生任务主键
     * @return 学生任务
     */
    public StuWk selectStuWkByWkId(Long wkId);

    /**
     * 查询学生任务列表
     * 
     * @param stuWk 学生任务
     * @return 学生任务集合
     */
    public List<StuWk> selectStuWkList(StuWk stuWk);

    /**
     * 新增学生任务
     * 
     * @param stuWk 学生任务
     * @return 结果
     */
    public int insertStuWk(StuWk stuWk);

    /**
     * 修改学生任务
     * 
     * @param stuWk 学生任务
     * @return 结果
     */
    public int updateStuWk(StuWk stuWk);

    /**
     * 批量删除学生任务
     * 
     * @param wkIds 需要删除的学生任务主键集合
     * @return 结果
     */
    public int deleteStuWkByWkIds(Long[] wkIds);

    /**
     * 删除学生任务信息
     * 
     * @param wkId 学生任务主键
     * @return 结果
     */
    public int deleteStuWkByWkId(Long wkId);
}
