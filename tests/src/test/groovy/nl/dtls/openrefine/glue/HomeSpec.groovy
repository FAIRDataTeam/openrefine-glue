package nl.dtls.openrefine.glue

import geb.spock.GebReportingSpec

class HomeSpec extends GebReportingSpec {
    def "Create a new project using the clipboard"() {
        given:
        to HomePage
        
        when: "the clipboard option is opened"
        createOptions.clipboard.click()
        
        and: "dummy data is pasted into the textarea"
        form.clipboard = "a,b\n1,2"
        
        and: "the next button is clicked"
        next.click()
        
        then: "the parsing options page is shown"
        at ParsingOptionsPage
    }
}
