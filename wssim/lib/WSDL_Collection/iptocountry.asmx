<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://www.ecubicle.net/webservices/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" targetNamespace="http://www.ecubicle.net/webservices/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://www.ecubicle.net/webservices/">
      <s:element name="FindCountryAsString">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="V4IPAddress" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="FindCountryAsStringResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="FindCountryAsStringResult" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="FindCountryAsXml">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="V4IPAddress" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="FindCountryAsXmlResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="FindCountryAsXmlResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any />
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
    </s:schema>
  </wsdl:types>
  <wsdl:message name="FindCountryAsStringSoapIn">
    <wsdl:part name="parameters" element="tns:FindCountryAsString" />
  </wsdl:message>
  <wsdl:message name="FindCountryAsStringSoapOut">
    <wsdl:part name="parameters" element="tns:FindCountryAsStringResponse" />
  </wsdl:message>
  <wsdl:message name="FindCountryAsXmlSoapIn">
    <wsdl:part name="parameters" element="tns:FindCountryAsXml" />
  </wsdl:message>
  <wsdl:message name="FindCountryAsXmlSoapOut">
    <wsdl:part name="parameters" element="tns:FindCountryAsXmlResponse" />
  </wsdl:message>
  <wsdl:portType name="iptocountrySoap">
    <wsdl:operation name="FindCountryAsString">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This returns a string value</wsdl:documentation>
      <wsdl:input message="tns:FindCountryAsStringSoapIn" />
      <wsdl:output message="tns:FindCountryAsStringSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="FindCountryAsXml">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Returns XML Document&lt;br/&gt;</wsdl:documentation>
      <wsdl:input message="tns:FindCountryAsXmlSoapIn" />
      <wsdl:output message="tns:FindCountryAsXmlSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="iptocountrySoap" type="tns:iptocountrySoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="FindCountryAsString">
      <soap:operation soapAction="http://www.ecubicle.net/webservices/FindCountryAsString" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="FindCountryAsXml">
      <soap:operation soapAction="http://www.ecubicle.net/webservices/FindCountryAsXml" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="iptocountrySoap12" type="tns:iptocountrySoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="FindCountryAsString">
      <soap12:operation soapAction="http://www.ecubicle.net/webservices/FindCountryAsString" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="FindCountryAsXml">
      <soap12:operation soapAction="http://www.ecubicle.net/webservices/FindCountryAsXml" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="iptocountry">
    <wsdl:port name="iptocountrySoap" binding="tns:iptocountrySoap">
      <soap:address location="http://www.ecubicle.net/iptocountry.asmx" />
    </wsdl:port>
    <wsdl:port name="iptocountrySoap12" binding="tns:iptocountrySoap12">
      <soap12:address location="http://www.ecubicle.net/iptocountry.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>