package com.printmanagement.component.executor;

import java.time.Clock;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.function.Consumer;
import java.util.function.Supplier;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cronutils.model.CronType;
import com.cronutils.model.definition.CronDefinitionBuilder;
import com.cronutils.model.time.ExecutionTime;
import com.cronutils.parser.CronParser;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;

@Component
public class CronTaskExecutor {

    private static final Logger logger = LogManager.getLogger();
    private static final CronParser parser = new CronParser(
            CronDefinitionBuilder.instanceDefinitionFor(CronType.SPRING));
    private boolean hasPostInit;
    private final List<CronFuture<?>> futures = new CopyOnWriteArrayList<>();

    @Autowired
    private ScheduledThreadPoolExecutor scheduledExecutor; 
    @Autowired
    private Clock clock;

	@PostConstruct
    void postInit() {
        hasPostInit = true;
        futures.forEach(CronFuture::start);
    }

    @PreDestroy
    void preDestroy() {
        futures.forEach(future -> future.cancel(false));
    }

    public ScheduledFuture<?> schedule(final Runnable task, final String cronExpression) {
        final CronFuture<?> future = scheduleTask(createTask(task), cronExpression);
//        if (hasPostInit) {
//            future.start();
//        }

        future.start();
        
        return future;
    }

    public ScheduledFuture<?> schedule(final Consumer<Supplier<Boolean>> task, final String cronExpression) {
        final CronFuture<?> future = scheduleTask(createTask(task), cronExpression);
//        if (hasPostInit) {
//            future.start();
//        }
        
        future.start();

        return future;
    }

    private CronFuture<?> scheduleTask(final Runnable command, final String cronExpression) {
        final CronFuture<?> future = new CronFuture<>(scheduledExecutor, command,
                ExecutionTime.forCron(parser.parse(cronExpression)), clock);

        futures.add(future);
        return future;
    }

    private Runnable createTask(final Runnable task) {
        return () -> {
            try {
                task.run();
            } catch (final Exception e) {
                logger.error("Error in cron task", e);
            }
        };
    }

    private Runnable createTask(final Consumer<Supplier<Boolean>> task) {
        return () -> {
            task.accept(() -> true);
        };
    }
}
