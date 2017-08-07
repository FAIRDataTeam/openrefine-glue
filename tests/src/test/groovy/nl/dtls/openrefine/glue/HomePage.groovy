package nl.dtls.openrefine.glue

import geb.Module
import geb.Page

class HomePage extends Page {
    static url = "/"
    
    static at = { title == "OpenRefine" }
    
    static content = {
        createOptions { $("#create-project-ui-source-selection-tabs").module(CreateOptionsModule) }
        form { $(".create-project-ui-source-selection-tab-body.selected form") }
        next { $(".create-project-ui-source-selection-tab-body.selected form button") }
    }
}

class CreateOptionsModule extends Module {
    static content = { 
        thisComputer { $(".create-project-ui-source-selection-tab", 0) }
        webAddress { $(".create-project-ui-source-selection-tab", 1) }
        clipboard { $(".create-project-ui-source-selection-tab", 2) }
        googleData { $(".create-project-ui-source-selection-tab", 3) }
    }
}
