package com.ruoyi.system.mapper;

import com.ruoyi.common.core.domain.entity.ScdTask;

import java.util.List;

public interface ScdTaskMapper {
        public List<ScdTask> selectTasksList(ScdTask task);

        public ScdTask selectTaskById(Long taskId);

        public int insertTask(ScdTask task);

        public int updateTask(ScdTask task);

        public int deleteTaskById(Long taskId);

        public int abortTaskById(Long taskId);
}
