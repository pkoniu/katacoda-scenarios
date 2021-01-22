# Writing microservice for JLupin platform

<pre class="file" data-filename="hello-jlupin/implementation/src/main/java/com/example/SpringBootApplicationStarter.java" data-target="replace">
package com.example;

import com.example.configuration.HelloWorldSpringConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringBootApplicationStarter {
    public static void main(String[] args) throws Exception {
        SpringApplication.run(HelloWorldSpringConfiguration.class, args);
    }
}
</pre>


<!-- <pre class="file" data-target="clipboard">
&#x3C;?xml version="1.0" encoding="UTF-8"?&#x3E;
&#x3C;project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd"&#x3E;
    &#x3C;modelVersion&#x3E;4.0.0&#x3C;/modelVersion&#x3E;
    &#x3C;parent&#x3E;
        &#x3C;artifactId&#x3E;jlupin-platform-parent&#x3C;/artifactId&#x3E;
        &#x3C;groupId&#x3E;com.jlupin&#x3C;/groupId&#x3E;
        &#x3C;version&#x3E;1.6.1.0&#x3C;/version&#x3E;
    &#x3C;/parent&#x3E;

    &#x3C;groupId&#x3E;com.example&#x3C;/groupId&#x3E;
    &#x3C;artifactId&#x3E;hello-world&#x3C;/artifactId&#x3E;
    &#x3C;packaging&#x3E;pom&#x3C;/packaging&#x3E;
    &#x3C;version&#x3E;1.0-SNAPSHOT&#x3C;/version&#x3E;

    &#x3C;repositories&#x3E;
        &#x3C;repository&#x3E;
            &#x3C;id&#x3E;jlupin-central&#x3C;/id&#x3E;
            &#x3C;name&#x3E;jlupin&#x3C;/name&#x3E;
            &#x3C;url&#x3E;http://support.jlupin.com/maven2/&#x3C;/url&#x3E;
        &#x3C;/repository&#x3E;
    &#x3C;/repositories&#x3E;

    &#x3C;pluginRepositories&#x3E;
        &#x3C;pluginRepository&#x3E;
            &#x3C;id&#x3E;jlupin-central&#x3C;/id&#x3E;
            &#x3C;name&#x3E;jlupin&#x3C;/name&#x3E;
            &#x3C;url&#x3E;http://support.jlupin.com/maven2/&#x3C;/url&#x3E;
        &#x3C;/pluginRepository&#x3E;
    &#x3C;/pluginRepositories&#x3E;

    &#x3C;modules&#x3E;
        &#x3C;module&#x3E;common-pojo&#x3C;/module&#x3E;
        &#x3C;module&#x3E;common-util&#x3C;/module&#x3E;
        &#x3C;module&#x3E;hello-world/implementation&#x3C;/module&#x3E;
        &#x3C;module&#x3E;integration-test&#x3C;/module&#x3E;
    &#x3C;/modules&#x3E;

    &#x3C;properties&#x3E;
        &#x3C;main.dir&#x3E;${project.basedir}/&#x3C;/main.dir&#x3E;
        &#x3C;jlupin.deploy.skip&#x3E;true&#x3C;/jlupin.deploy.skip&#x3E;

        &#x3C;spring.boot.version&#x3E;2.1.2.RELEASE&#x3C;/spring.boot.version&#x3E;

        &#x3C;maven.war.plugin.version&#x3E;3.2.2&#x3C;/maven.war.plugin.version&#x3E;
        &#x3C;maven.failsafe.plugin.version&#x3E;2.20&#x3C;/maven.failsafe.plugin.version&#x3E;
        &#x3C;maven.surefire.plugin.version&#x3E;2.20&#x3C;/maven.surefire.plugin.version&#x3E;
        &#x3C;maven.compiler.source&#x3E;1.8&#x3C;/maven.compiler.source&#x3E;
        &#x3C;maven.compiler.target&#x3E;1.8&#x3C;/maven.compiler.target&#x3E;
        &#x3C;project.build.sourceEncoding&#x3E;UTF-8&#x3C;/project.build.sourceEncoding&#x3E;

        &#x3C;jlupin.repackage.output.fileName&#x3E;${project.artifactId}-${project.version}.${project.packaging}
        &#x3C;/jlupin.repackage.output.fileName&#x3E;
    &#x3C;/properties&#x3E;
&#x3C;/project&#x3E;
</pre> -->

