package com.ruoyi.student.mapper;

import java.util.List;
import com.ruoyi.student.domain.StuWk;
import com.ruoyi.student.domain.TmStu;

/**
 * 学生任务Mapper接口
 * 
 * @author ruoyi
 * @date 2023-07-06
 */
public interface StuWkMapper 
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
     * 删除学生任务
     * 
     * @param wkId 学生任务主键
     * @return 结果
     */
    public int deleteStuWkByWkId(Long wkId);

    /**
     * 批量删除学生任务
     * 
     * @param wkIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStuWkByWkIds(Long[] wkIds);

    /**
     * 批量删除学生信息
     * 
     * @param wkIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTmStuByStuIds(Long[] wkIds);
    
    /**
     * 批量新增学生信息
     * 
     * @param tmStuList 学生信息列表
     * @return 结果
     */
    public int batchTmStu(List<TmStu> tmStuList);
    

    /**
     * 通过学生任务主键删除学生信息信息
     * 
     * @param wkId 学生任务ID
     * @return 结果
     */
    public int deleteTmStuByStuId(Long wkId);
}
