# Own microservice example - maven config file

## pom.xml

```
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

    <name>hello-jlupin-scala</name>
    <artifactId>hello-jlupin-scala</artifactId>
    <groupId>com.example</groupId>
    <version>1.0</version>

    <repositories>
        <repository>
            <id>jlupin-central</id>
            <name>jlupin</name>
            <url>https://support.jlupin.com/maven2/</url>
        </repository>
    </repositories>

    <pluginRepositories>
        <pluginRepository>
            <id>jlupin-central</id>
            <name>jlupin</name>
            <url>https://support.jlupin.com/maven2/</url>
        </pluginRepository>
    </pluginRepositories>

    <properties>
        <scala.version>2.12.12</scala.version>

        <scala-maven-plugin.version>3.4.6</scala-maven-plugin.version>

        <maven.compiler.source>1.8</maven.compiler.source>
        <maven.compiler.target>1.8</maven.compiler.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

    <dependencies>
        <dependency>
            <groupId>com.jlupin</groupId>
            <artifactId>jlupin-platform-native</artifactId>
        </dependency>

        <dependency>
            <groupId>org.scala-lang</groupId>
            <artifactId>scala-library</artifactId>
            <version>${scala.version}</version>
        </dependency>
    </dependencies>

    <build>
        <finalName>${project.artifactId}-app-${project.version}</finalName>

        <sourceDirectory>src/main/scala</sourceDirectory>
        <testSourceDirectory>src/test/scala</testSourceDirectory>

        <plugins>
            <plugin>
                <groupId>net.alchim31.maven</groupId>
                <artifactId>scala-maven-plugin</artifactId>
                <version>${scala-maven-plugin.version}</version>
                <executions>
                    <execution>
                        <goals>
                            <goal>compile</goal>
                            <goal>testCompile</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>

            <plugin>
                <groupId>com.jlupin</groupId>
                <artifactId>jlupin-platform-maven-plugin</artifactId>
                <executions>
                    <execution>
                        <id>jlupin-repackage</id>
                        <goals>
                            <goal>repackage</goal>
                        </goals>
                    </execution>
                    <execution>
                        <id>jlupin-zip</id>
                        <goals>
                            <goal>zip</goal>
                        </goals>
                        <configuration>
                            <additionalFilesDirectories>
                                <param>additional-files</param>
                            </additionalFilesDirectories>
                        </configuration>
                    </execution>
                    <execution>
                        <id>jlupin-deploy</id>
                        <goals>
                            <goal>deploy</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>
</project>
```