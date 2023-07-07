package com.ruoyi.student.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 学生任务对象 stu_wk
 * 
 * @author ruoyi
 * @date 2023-07-06
 */
public class StuWk extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 任务序号 */
    private Long wkId;

    /** 学生唯一标识符 */
    @Excel(name = "学生唯一标识符")
    private Long stuId;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
    private String stuName;

    /** 教师唯一标识符 */
    @Excel(name = "教师唯一标识符")
    private Long teaId;

    /** 教师姓名 */
    @Excel(name = "教师姓名")
    private String teaName;

    /** 任务名称 */
    @Excel(name = "任务名称")
    private String wkName;

    /** 任务发布日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "任务发布日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date wkStart;

    /** 任务截至日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "任务截至日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date wkEnd;

    /** 任务状态 */
    @Deprecated
    @Excel(name = "任务状态")
    private Boolean wkStau;

    /** 审核状态 */
    @Excel(name = "审核状态")
    private Boolean wkExStau;

    /** 任务下载路径 */
    @Excel(name = "任务下载路径")
    private String wkAdd;

    /** 任务描述 */
    @Excel(name = "任务描述")
    private String wkDes;

    public void setWkId(Long wkId) 
    {
        this.wkId = wkId;
    }

    public Long getWkId() 
    {
        return wkId;
    }
    public void setStuId(Long stuId) 
    {
        this.stuId = stuId;
    }

    public Long getStuId() 
    {
        return stuId;
    }
    public void setStuName(String stuName)
    {
        this.stuName = stuName;
    }

    public String getStuName()
    {
        return stuName;
    }
    public void setTeaId(Long teaId) 
    {
        this.teaId = teaId;
    }

    public Long getTeaId() 
    {
        return teaId;
    }
    public void setTeaName(String teaName)
    {
        this.teaName = teaName;
    }

    public String getTeaName()
    {
        return teaName;
    }
    public void setWkName(String wkName) 
    {
        this.wkName = wkName;
    }

    public String getWkName() 
    {
        return wkName;
    }
    public void setWkStart(Date wkStart) 
    {
        this.wkStart = wkStart;
    }

    public Date getWkStart() 
    {
        return wkStart;
    }
    public void setWkEnd(Date wkEnd) 
    {
        this.wkEnd = wkEnd;
    }

    public Date getWkEnd() 
    {
        return wkEnd;
    }
    public void setWkStau(Boolean wkStau)
    {
        this.wkStau = wkStau;
    }

    public Boolean getWkStau()
    {
        return wkStau;
    }
    public void setWkExStau(Boolean wkExStau)
    {
        this.wkExStau = wkExStau;
    }

    public Boolean getWkExStau()
    {
        return wkExStau;
    }
    public void setWkAdd(String wkAdd) 
    {
        this.wkAdd = wkAdd;
    }

    public String getWkAdd() 
    {
        return wkAdd;
    }
    public void setWkDes(String wkDes) 
    {
        this.wkDes = wkDes;
    }

    public String getWkDes() 
    {
        return wkDes;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("wkId", getWkId())
            .append("stuId", getStuId())
            .append("stuName", getStuName())
            .append("teaId", getTeaId())
            .append("teaName", getTeaName())
            .append("wkName", getWkName())
            .append("wkStart", getWkStart())
            .append("wkEnd", getWkEnd())
            .append("wkStau", getWkStau())
            .append("wkExStau", getWkExStau())
            .append("wkAdd", getWkAdd())
            .append("wkDes", getWkDes())
            .toString();
    }
}
