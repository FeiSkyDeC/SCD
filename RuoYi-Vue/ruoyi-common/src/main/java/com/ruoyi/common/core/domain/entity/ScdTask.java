package com.ruoyi.common.core.domain.entity;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

public class ScdTask extends BaseEntity {
        private static final long serialVersionUID = 1L;

        private Long taskId;

        // 任务名称
        private String title;

        // 任务说明
        private String description;

        // 任务发布日期
        private Long publishDate;

        // 任务截止日期
        private Long deadline;

        // 任务状态
        @Excel(name = "任务状态", readConverterExp = "0=已完成,1=待处理")
        private String taskStatus;

        // 老师ID
        private Long teacherId;

        private SysUser teacher;

        // 参与学生ID集合
        private Long[] participantsId;

        // 参与学生SysUser结构集合
        private List<SysUser> participants;

        // 使用base64编码后的附件集合
        private String[] base64Assets;

        public Long getTaskId() {
                return taskId;
        }

        public String getTitle() {
                return title;
        }

        public void setTitle(String title) {
                this.title = title;
        }

        public String getDescription() {
                return description;
        }

        public void setDescription(String description) {
                this.description = description;
        }

        public Long getPublishDate() {
                return publishDate;
        }

        public void setPublishDate(Long publishDate) {
                this.publishDate = publishDate;
        }

        public Long getDeadline() {
                return deadline;
        }

        public void setDeadline(Long deadline) {
                this.deadline = deadline;
        }

        public String getTaskStatus() {
                return taskStatus;
        }

        public void setTaskStatus(String taskStatus) {
                this.taskStatus = taskStatus;
        }

        public Long getTeacherId() {
                return teacherId;
        }

        public void setTeacherId(Long teacherId) {
                this.teacherId = teacherId;
        }

        public SysUser getTeacher() {
                return teacher;
        }

        public void setTeacher(SysUser teacher) {
                this.teacher = teacher;
        }

        public Long[] getParticipantsId() {
                return participantsId;
        }

        public void setParticipantsId(Long[] participantsId) {
                this.participantsId = participantsId;
        }

        public List<SysUser> getParticipants() {
                return participants;
        }

        public void setParticipants(List<SysUser> participants) {
                this.participants = participants;
        }

        public String[] getBase64Assets() {
                return base64Assets;
        }

        public void setBase64Assets(String[] base64Assets) {
                this.base64Assets = base64Assets;
        }
}
