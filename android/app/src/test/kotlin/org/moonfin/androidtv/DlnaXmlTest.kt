package org.moonfin.androidtv

import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test
import org.xml.sax.SAXException

class DlnaXmlTest {
    @Test
    fun `reads renderer discovery metadata without unsupported parser flags`() {
        val doc = DlnaXml.parse("""
            <root xmlns="urn:schemas-upnp-org:device-1-0">
              <device>
                <friendlyName>Samsung AU7170 &amp; TV</friendlyName>
                <serviceList><service>
                  <serviceType>urn:schemas-upnp-org:service:AVTransport:1</serviceType>
                  <controlURL>/upnp/control/AVTransport1</controlURL>
                </service></serviceList>
              </device>
            </root>
        """.trimIndent())
        assertEquals("Samsung AU7170 & TV", doc.getElementsByTagName("friendlyName").item(0).textContent)
        assertEquals("/upnp/control/AVTransport1", doc.getElementsByTagName("controlURL").item(0).textContent)
    }

    @Test
    fun `reads SOAP transport status`() {
        val doc = DlnaXml.parse("""
            <s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">
              <s:Body><u:GetTransportInfoResponse xmlns:u="urn:schemas-upnp-org:service:AVTransport:1">
                <CurrentTransportState>PLAYING</CurrentTransportState>
              </u:GetTransportInfoResponse></s:Body>
            </s:Envelope>
        """.trimIndent())
        assertEquals("PLAYING", doc.getElementsByTagName("CurrentTransportState").item(0).textContent)
    }

    @Test
    fun `reads escaped LastChange as a second XML document`() {
        val outer = DlnaXml.parse("""
            <e:propertyset xmlns:e="urn:schemas-upnp-org:event-1-0"><e:property>
              <LastChange>&lt;Event&gt;&lt;TransportState val="PLAYING"/&gt;&lt;/Event&gt;</LastChange>
            </e:property></e:propertyset>
        """.trimIndent())
        val inner = DlnaXml.parse(outer.getElementsByTagName("LastChange").item(0).textContent)
        assertEquals("PLAYING", inner.getElementsByTagName("TransportState").item(0).attributes.getNamedItem("val").textContent)
    }

    @Test
    fun `rejects external DTDs and entity declarations before parsing`() {
        for (xml in listOf(
            "<!DOCTYPE root SYSTEM 'http://127.0.0.1:9/external.dtd'><root/>",
            "<!DOCTYPE root [<!ENTITY secret SYSTEM 'file:///etc/passwd'>]><root>&secret;</root>",
            "<!DOCTYPE root [<!ENTITY % external SYSTEM 'http://127.0.0.1:9/entity'>%external;]><root/>",
            "<!DOCTYPE root [<!ENTITY a 'expansion'>]><root>&a;</root>",
        )) {
            val error = assertThrows(SAXException::class.java) { DlnaXml.parse(xml) }
            assertEquals("DOCTYPE is not allowed in DLNA XML", error.message)
        }
    }

    @Test
    fun `rejects DTDs hidden in the escaped LastChange document`() {
        val outer = DlnaXml.parse("""
            <LastChange>&lt;!DOCTYPE Event SYSTEM 'http://127.0.0.1:9/evil'&gt;&lt;Event/&gt;</LastChange>
        """.trimIndent())
        assertThrows(SAXException::class.java) {
            DlnaXml.parse(outer.documentElement.textContent)
        }
    }

    @Test
    fun `rejects malformed device descriptions`() {
        assertThrows(SAXException::class.java) { DlnaXml.parse("<root><device></root>") }
    }
}
