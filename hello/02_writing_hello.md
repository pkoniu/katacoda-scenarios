# Writing microservice for JLupin platform

<pre class="file" data-target="clipboard">
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <artifactId>jlupin-platform-parent</artifactId>
        <groupId>com.jlupin</groupId>
        <version>1.6.1.0</version>
    </parent>

    <groupId>com.example</groupId>
    <artifactId>hello-world</artifactId>
    <packaging>pom</packaging>
    <version>1.0-SNAPSHOT</version>

    <repositories>
        <repository>
            <id>jlupin-central</id>
            <name>jlupin</name>
            <url>http://support.jlupin.com/maven2/</url>
        </repository>
    </repositories>

    <pluginRepositories>
        <pluginRepository>
            <id>jlupin-central</id>
            <name>jlupin</name>
            <url>http://support.jlupin.com/maven2/</url>
        </pluginRepository>
    </pluginRepositories>

    <modules>
        <module>common-pojo</module>
        <module>common-util</module>
        <module>hello-world/implementation</module>
        <module>integration-test</module>
    </modules>

    <properties>
        <main.dir>${project.basedir}/</main.dir>
        <jlupin.deploy.skip>true</jlupin.deploy.skip>

        <spring.boot.version>2.1.2.RELEASE</spring.boot.version>

        <maven.war.plugin.version>3.2.2</maven.war.plugin.version>
        <maven.failsafe.plugin.version>2.20</maven.failsafe.plugin.version>
        <maven.surefire.plugin.version>2.20</maven.surefire.plugin.version>
        <maven.compiler.source>1.8</maven.compiler.source>
        <maven.compiler.target>1.8</maven.compiler.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>

        <jlupin.repackage.output.fileName>${project.artifactId}-${project.version}.${project.packaging}
        </jlupin.repackage.output.fileName>
    </properties>

</project>
</pre>

