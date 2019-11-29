package springboot.demos.config;

import org.omg.CosNaming.NamingContextPackage.NotEmpty;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.NotNull;

/***
 * 配置属性类
 */

@Component //该注解作用：springboot　启动时会将该类作为一个javabean 注入ｉｏｃ容器中
@ConfigurationProperties(prefix = "demo.book")//表明该类是一个配置属性类
@Validated
public class BookComponant {

    private String name;
    @NotNull
    private String writer;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }
}
