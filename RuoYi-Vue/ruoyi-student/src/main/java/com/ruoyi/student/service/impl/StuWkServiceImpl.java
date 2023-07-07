package com.ruoyi.student.service.impl;

import com.ruoyi.student.domain.StuWk;
import com.ruoyi.student.mapper.StuWkMapper;
import com.ruoyi.student.service.IStuWkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 学生任务Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-07-06
 */
@Service
public class StuWkServiceImpl implements IStuWkService 
{
    @Autowired
    private StuWkMapper stuWkMapper;

    /**
     * 查询学生任务
     * 
     * @param wkId 学生任务主键
     * @return 学生任务
     */
    @Override
    public StuWk selectStuWkByWkId(Long wkId)
    {
        return stuWkMapper.selectStuWkByWkId(wkId);
    }

    /**
     * 查询学生任务列表
     * 
     * @param stuWk 学生任务
     * @return 学生任务
     */
    @Override
    public List<StuWk> selectStuWkList(StuWk stuWk)
    {
        return stuWkMapper.selectStuWkList(stuWk);
    }

    /**
     * 新增学生任务
     * 
     * @param stuWk 学生任务
     * @return 结果
     */
    @Transactional
    @Override
    public int insertStuWk(StuWk stuWk)
    {
        int rows = stuWkMapper.insertStuWk(stuWk);
        return rows;
    }

    /**
     * 修改学生任务
     * 
     * @param stuWk 学生任务
     * @return 结果
     */
    @Transactional
    @Override
    public int updateStuWk(StuWk stuWk)
    {
        return stuWkMapper.updateStuWk(stuWk);
    }

    /**
     * 批量删除学生任务
     *
     * @param wkIds 需要删除的学生任务主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteStuWkByWkIds(Long[] wkIds)
    {
        return stuWkMapper.deleteStuWkByWkIds(wkIds);
    }

    /**
     * 删除学生任务信息
     *
     * @param wkId 学生任务主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteStuWkByWkId(Long wkId)
    {
        return stuWkMapper.deleteStuWkByWkId(wkId);
    }
}
