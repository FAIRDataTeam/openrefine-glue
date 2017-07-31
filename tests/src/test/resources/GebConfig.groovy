import org.openqa.selenium.Dimension
import org.openqa.selenium.phantomjs.PhantomJSDriver

driver = {
    def phantomjs = new PhantomJSDriver()
    phantomjs.manage().window().size = new Dimension(1280, 1024)
    phantomjs
}