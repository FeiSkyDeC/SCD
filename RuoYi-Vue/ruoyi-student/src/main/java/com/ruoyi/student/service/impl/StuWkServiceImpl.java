package com.ruoyi.student.service.impl;

import java.util.List;

import com.ruoyi.student.service.IStuWkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.student.domain.TmStu;
import com.ruoyi.student.mapper.StuWkMapper;
import com.ruoyi.student.domain.StuWk;
import com.ruoyi.student.service.IStuWkService;

/**
 * 学生任务Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-07-06
 */
@Service
public class StuWkServiceImpl implements IStuWkService
{
    @Autowired(required=false)
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
        insertTmStu(stuWk);
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
        stuWkMapper.deleteTmStuByStuId(stuWk.getWkId());
        insertTmStu(stuWk);
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
        stuWkMapper.deleteTmStuByStuIds(wkIds);
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
        stuWkMapper.deleteTmStuByStuId(wkId);
        return stuWkMapper.deleteStuWkByWkId(wkId);
    }

    /**
     * 新增学生信息信息
     * 
     * @param stuWk 学生任务对象
     */
    public void insertTmStu(StuWk stuWk)
    {
        List<TmStu> tmStuList = stuWk.getTmStuList();
        Long stuId = stuWk.getStuId();
        if (StringUtils.isNotNull(tmStuList))
        {
            List<TmStu> list = new ArrayList<>();
            for (TmStu tmStu : tmStuList)
            {
                tmStu.setUserId(stuId);
                list.add(tmStu);
            }
            if (list.size() > 0)
            {
                stuWkMapper.batchTmStu(list);
            }
        }
    }
}
