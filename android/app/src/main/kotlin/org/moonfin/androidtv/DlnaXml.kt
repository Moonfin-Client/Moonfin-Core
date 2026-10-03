package org.moonfin.androidtv

import java.io.StringReader
import javax.xml.parsers.DocumentBuilderFactory
import org.w3c.dom.Document
import org.xml.sax.InputSource
import org.xml.sax.SAXException

/** Parses untrusted device descriptions, SOAP replies and GENA events. */
internal object DlnaXml {
    fun parse(xml: String): Document {
        // Android's DocumentBuilderFactory rejects the Xerces/SAX entity
        // feature flags with ParserConfigurationException. Reject DTDs before
        // parsing instead: UPnP messages do not need declarations or entities.
        // XML's DOCTYPE keyword is case-sensitive and cannot contain whitespace.
        if (xml.contains("<!DOCTYPE")) {
            throw SAXException("DOCTYPE is not allowed in DLNA XML")
        }
        val builder = DocumentBuilderFactory.newInstance().apply {
            isNamespaceAware = true
        }.newDocumentBuilder()
        builder.setEntityResolver { _, _ ->
            throw SAXException("External entities are not allowed in DLNA XML")
        }
        return builder.parse(InputSource(StringReader(xml)))
    }
}
