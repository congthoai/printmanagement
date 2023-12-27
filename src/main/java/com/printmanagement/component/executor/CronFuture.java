package com.printmanagement.component.executor;

import java.time.Clock;
import java.time.Duration;
import java.time.ZonedDateTime;
import java.util.concurrent.Delayed;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import com.cronutils.model.time.ExecutionTime;


public class CronFuture<V> implements ScheduledFuture<V> {

    private final Runnable command;
    private final ScheduledThreadPoolExecutor scheduledExecutor;
    private final ExecutionTime executionTime;
    private final Clock clock;

    private ScheduledFuture<?> future;
    private boolean isCancelled;

    public CronFuture(final ScheduledThreadPoolExecutor scheduledExecutor, final Runnable command,
            final ExecutionTime executionTime, final Clock clock) {
        this.command = command;
        this.scheduledExecutor = scheduledExecutor;
        this.executionTime = executionTime;
        this.clock = clock;
    }

    @SuppressWarnings("PMD.AvoidSynchronizedAtMethodLevel")
    public synchronized void start() {
        if (future == null) {
            next();
        }
    }

    private void next() {
        future = scheduledExecutor.schedule(this::execute, getDelay(TimeUnit.MILLISECONDS), TimeUnit.MILLISECONDS);
    }

    private void execute() {
        if (isCancelled()) {
            return;
        }

        command.run();

        next();
    }

    @Override
    public boolean cancel(final boolean mayInterruptIfRunning) {
        isCancelled = true;
        future.cancel(mayInterruptIfRunning);

        return true;
    }

    @Override
    public boolean isCancelled() {
        return isCancelled;
    }

    @Override
    public boolean isDone() {
        return false;
    }

    @Override
    public V get() throws InterruptedException, ExecutionException {
        return null;
    }

    @Override
    public V get(final long timeout, final TimeUnit unit)
            throws InterruptedException, ExecutionException, TimeoutException {
        return null;
    }

    @Override
    public long getDelay(TimeUnit unit) {
        final ZonedDateTime now = ZonedDateTime.now(clock);
        final Duration duration = executionTime.timeToNextExecution(now)
                .orElse(null);

        long sourceDuration = 0;
        switch (unit) {
        case  NANOSECONDS:
        case  MICROSECONDS:
			sourceDuration = duration.toNanos();
			break;
        case  MILLISECONDS:
			sourceDuration = duration.toMillis();
			break;
		case  SECONDS:
			sourceDuration = duration.getSeconds();
			break;
		case  MINUTES:
			sourceDuration = duration.toMinutes();
			break;
		case  HOURS:
			sourceDuration = duration.toHours();
			break;
		case  DAYS:
			sourceDuration = duration.toDays();
			break;
		}
        
        return unit.convert(sourceDuration, unit);
    }

    @Override
    public int compareTo(final Delayed other) {
        if (!(other instanceof CronFuture)) {
            return 0;
        }

        return (int) (getDelay(TimeUnit.MILLISECONDS) - other.getDelay(TimeUnit.MILLISECONDS));
    }
    
//    public static void main(String[] args) {
//    	CronParser parser = new CronParser(
//                CronDefinitionBuilder.instanceDefinitionFor(CronType.SPRING));
//    	ExecutionTime executionTime = ExecutionTime.forCron(parser.parse("0/5 * * * * ? "));
//    	Clock clock = Clock.systemUTC();
//    	final ZonedDateTime now = ZonedDateTime.now(clock);
//        final Duration duration = executionTime.timeToNextExecution(now)
//                .orElse(null);
//        
//        TimeUnit unit = TimeUnit.MILLISECONDS;
//        
//        final CronFuture<?> future = new CronFuture<>(null, ()->{},
//                executionTime, clock);
//        
//        long a = unit.convert(duration);
//        long b = future.getDelay(unit);
//        
//        System.out.println(a);
//        System.out.println(b);
//	}
}