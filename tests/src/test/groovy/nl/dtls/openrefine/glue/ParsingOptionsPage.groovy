package nl.dtls.openrefine.glue

import geb.Page

class ParsingOptionsPage extends Page {
    static at = {
        waitFor { $("table.data-table") }
    }
}
