# Implementation - additional-files

## additional-files/configuration.yml

This is the file containing jlupin configuration values:

```yml
SERVERS:
  JLRMC: #JLupin Remote Method Calls Fast Protocol:
    readTimeout: 480000
    isWaitForFinishExecuteAllRequests: true
    waitToShutdownThreadsOnStop: 60000
    backlog: 256
    receiveBufferSize: 256
    isReuseAddress: false
    threadPoolSize: 8
    isLogPeriodicOnDebug: true
    isDestroyThreadOnTimeout: false
    threadExecutingTimeOut: 240000
    isStartOnMainServerInitialize: true
  TRANSMISSION:
    readTimeout: 480000
    isWaitForFinishExecuteAllRequests: false
    waitToShutdownThreadsOnStop: 60000
    backlog: 0
    receiveBufferSize: 0
    isReuseAddress: false
    threadPoolSize: 2
    isLogPeriodicOnDebug: true
    isDestroyThreadOnTimeout: false
    threadExecutingTimeOut: 3600000
    isStartOnMainServerInitialize: true
  QUEUE:
    readTimeout: 480000
    isWaitForFinishExecuteAllRequests: true
    waitToShutdownThreadsOnStop: 60000
    backlog: 256
    receiveBufferSize: 256
    isReuseAddress: false
    threadPoolSize: 8
    isLogPeriodicOnDebug: true
    isDestroyThreadOnTimeout: false
    threadExecutingTimeOut: 240000
    isStartOnMainServerInitialize: true
ENTRY_POINTS:
  QUEUE:
    threadAmount: 8
    howOftenCheckingServerInMillis: 5000
    repeatsAmount: 4
    timeToWaitBetweenRepeatProbeInMillis: 1000
TRANSMISSION:
  MICROSERVICES_GRANT_ACCESS:
    MICROSERVICES_LIST:
    #- microserviceName: 'sampleMicroservice'
    #  serviceName: 'sampleServiceName'
    #  methodName: 'sampleMethodName'
    #- microserviceName: 'sampleMicroservice2'
    #  serviceName: 'sampleServiceName2'
    #  methodName: 'sampleMethodName2'
PROPERTIES:
  platformVersion: '1.6.0.0'
  #jvmOptions1: '-Xms128M -Xmx256M -Dlog4j.configurationFile=${sys:microservice.dir}/log4j2.xml -agentlib:jdwp=transport=dt_socket,address=12998,server=y,suspend=n'
  jvmOptions1: '-Xms128M -Xmx256M -Dlog4j.configurationFile=${sys:microservice.dir}/log4j2.xml' #jvmOptions_2 - default the same as jvmOptions_1
  #jvmOptions2: '-Xms128M -Xmx256M -Dlog4j.configurationFile=${sys:microservice.dir}/log4j2.xml'
  externalPort: '8000'
  version: '1.0-SNAPSHOT'
  switchDelayTime: 0
  connectionSocketTimeoutInMillis: 1000
  readTimeoutInMillis: 30000
  isKeepAlive: false
  isOOBInline: false
  isTcpNoDelay: false
  isReuseAddress: false
  sendBufferSize: 0
  receiveBufferSize: 0
  soLinger: 0
  trafficClass: 0
  #javaExecutablePath: 'c:\\jvm\\bin\\java.exe'
  #additionalClassPath: 'c:\\temp\\*'
  isStartOnMainServerInitialize: true
  priorityStartOnMainServerInitialize: 4
  waitForProcessInitResponseTimeInMillis: 90000
  waitForProcessStartResponseTimeInMillis: 90000
  waitForProcessDestroyResponseTimeInMillis: 30000
  isAllFilesToJVMAppClassLoader: false
  isArchiveOnStart: false
  startLogMode: INFO
  isInitErrorCauseWithNetworkInformation: true
  isJmxEnabled: true
  jmxOptions: '-Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false'
  jmxPrimaryPort: -1
  jmxSecondaryPort: -1
  checkAvailableScript: 'function isAvailable(checkResponseTimeInMillis, jrmcActiveThreads, jrmcMaxThreads,
                                              queueActiveThreads, queueMaxThreads, servletActiveThreads, servletMaxThreads,
                                              jvmMaxMemoryInBytes, jvmTotalMemoryInBytes, jvmFreeMemoryInBytes,
                                              jvmProcessCpuLoadInPercentage, userAvailableFlag) {
                           var isAvailableByUser = Boolean(userAvailableFlag);
                           if(checkResponseTimeInMillis > 20000 || !isAvailableByUser) {
                             return false;
                           }
                           return true;
                         }'
APPLICATION:
  applicationContainerProducerClassName: 'com.example.configuration.ScalaHelloWorldJLupinConfiguration
INITIALIZING_LOGGER:
  #directoryPath: '/logs/server'
  #fileName: 'file_name'
  fileExtension: 'log'
  fileSizeInMB: 20
  maxFiles: 10
MEMORY_ERRORS:
  isRestartOnError: true
  howManyTimes: 4
  percentageGrowth: 15
  isHeapDump: true
THREAD_POOLS:
#THREAD_POOL_1:
#  size: 8
#  waitingTimeForTasksCompletionInMillis: 10000
#THREAD_POOL_2:
#  size: 8
#  waitingTimeForTasksCompletionInMillis: 10000
```

## additional-files/log4j2.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- ===================================================================== -->
<!--                                                                       -->
<!--  Log4j2 Configuration                                                  -->
<!--                                                                       -->
<!-- ===================================================================== -->

<!--
   | For more configuration information and examples see the Apache Log4j2
   | website: https://logging.apache.org/log4j/2.x/index.html
-->

<Configuration status="WARN" dest="errors/hello-jlupin-scala_log4j2_status.log">
    <!-- Extract log directory and file name into variables -->
    <Properties>
        <Property name="logDirectory">${sys:microservice.dir}/../../logs/microservice/hello-jlupin-scala</Property>
        <Property name="logFileName">microservice</Property>
    </Properties>

    <Appenders>
        <!-- RollingFileAppender configured to role every day -->
        <RollingFile name="FILE">
            <FileName>${logDirectory}/${logFileName}.log</FileName>
            <FilePattern>${logDirectory}/${logFileName}.%d{yyyy-MM-dd}.log</FilePattern>

            <!-- Compress log files to gzip -->
            <!-- More configuration https://logging.apache.org/log4j/2.x/manual/appenders.html#DefaultRolloverStrategy -->
            <!-- <FilePattern>/.%d{yyyy-MM-dd}.log.gz</FilePattern> -->

            <!-- Do not truncate file -->
            <Append>true</Append>

            <!-- The default pattern: Date Priority [Category] (Thread) Message\n -->
            <PatternLayout pattern="%d %-5p [%c] (%t) %m%n"/>

            <Policies>
                <!-- Rollover every microservice start - very useful for debugging -->
                <!-- <OnStartupTriggeringPolicy /> -->

                <!-- Rollover at the top of each day -->
                <TimeBasedTriggeringPolicy interval="1" modulate="true"/>

                <!-- Rollover if file size is greater than 200 MB -->
                <!-- <SizeBasedTriggeringPolicy size="200 MB"/> -->
            </Policies>
            <CreateOnDemand>true</CreateOnDemand>

            <!-- Keep last 10 log files -->
            <!-- More configuration https://logging.apache.org/log4j/2.x/manual/appenders.html#DefaultRolloverStrategy -->
            <!-- <DefaultRolloverStrategy max="10" /> -->
        </RollingFile>

        <!-- AsyncAppender for high performance -->
        <Async name="ASYNC_FILE">
            <BufferSize>1000</BufferSize>
            <AppenderRef ref="FILE"/>
        </Async>

        <Console name="STDOUT" target="SYSTEM_OUT">
            <PatternLayout pattern="%d %-5p [%c] (%t) %m%n"/>
        </Console>

        <Async name="ASYNC_STDOUT">
            <BufferSize>1000</BufferSize>
            <AppenderRef ref="STDOUT"/>
        </Async>
    </Appenders>

    <Loggers>
        <!-- Setup for root logger with AsyncAppender -->
        <Root level="info">
            <AppenderRef ref="ASYNC_FILE"/>
        </Root>
    </Loggers>
</Configuration>
```