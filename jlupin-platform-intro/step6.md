# Implementation - src

## src/main/scala/com/example/configuration/ScalaHelloWorldJLupinConfiguration.scala

```scala
package com.example.configuration

import com.jlupin.impl.container.application.spring.{JLupinAbstractSpringApplicationContainer}
import com.jlupin.interfaces.configuration.microservice.container.application.{JLupinAbstractApplicationContainerProducer}
import org.springframework.context.annotation.{AnnotationConfigApplicationContext}
import org.springframework.context.support.{AbstractApplicationContext}

class ScalaHelloWorldJLupinConfiguration extends JLupinAbstractApplicationContainerProducer {
  def produceJLupinApplicationContainer = new JLupinAbstractSpringApplicationContainer {
    def getAbstractApplicationContext = {
      new AnnotationConfigApplicationContext(classOf[ScalaHelloWorldSpringConfiguration]).asInstanceOf[AbstractApplicationContext]
    }
  }
}
```

## src/main/scala/com/example/configuration/ScalaHelloWorldSpringConfiguration.scala

```scala
package com.example.configuration

import org.springframework.context.annotation.{Bean, ComponentScan, Configuration}
import scala.collection.JavaConverters._

@Configuration
@ComponentScan(Array("com.example"))
class ScalaHelloWorldSpringConfiguration {
  @Bean(name = Array("jLupinRegularExpressionToRemotelyEnabled"))
  def getRemotelyBeanList = {
    val list = List(
      "exampleService"
    )
    list.asJava
  }
}
```

## src/main/scala/com/example/service/interfaces/ExampleService.scala

```scala
package com.example.service.interfaces

trait ExampleService {
  def hello(name : String): String
}
```

## 