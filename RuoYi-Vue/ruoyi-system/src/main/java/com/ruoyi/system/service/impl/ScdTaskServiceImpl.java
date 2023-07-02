package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.ScdTask;
import com.ruoyi.system.mapper.ScdTaskMapper;
import com.ruoyi.system.service.IScdTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScdTaskServiceImpl implements IScdTaskService {
        @Autowired
        private ScdTaskMapper taskMapper;

        @Override
        public List<ScdTask> selectTasksList(ScdTask task) {
                return taskMapper.selectTasksList(task);
        }

        @Override
        public ScdTask selectTaskById(Long taskId) {
                return taskMapper.selectTaskById(taskId);
        }

        @Override
        public int insertTask(ScdTask task) {
                // implemented by other teammates

                return 0;
        }

        @Override
        public int updateTask(ScdTask task) {
                // TODO

                return taskMapper.updateTask(task);
        }

        @Override
        public int deleteTaskById(Long taskId) {
                // TODO

                return taskMapper.deleteTaskById(taskId);
        }

        @Override
        public int abortTaskById(Long taskId) {
                // TODO

                return taskMapper.abortTaskById(taskId);
        }
}
