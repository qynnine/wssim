<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tns="http://ws.fraudlabs.com/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" targetNamespace="http://ws.fraudlabs.com/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://ws.fraudlabs.com/">
      <s:element name="IP2Proxy">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="IP" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LICENSE" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="IP2ProxyResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="IP2ProxyResult" type="tns:IP2PROXY" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="IP2PROXY">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="IPADDRESS" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CREDITSAVAILABLE" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ANONYMOUSPROXY" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="MESSAGE" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="IP2PROXY" nillable="true" type="tns:IP2PROXY" />
    </s:schema>
  </wsdl:types>
  <wsdl:message name="IP2ProxySoapIn">
    <wsdl:part name="parameters" element="tns:IP2Proxy" />
  </wsdl:message>
  <wsdl:message name="IP2ProxySoapOut">
    <wsdl:part name="parameters" element="tns:IP2ProxyResponse" />
  </wsdl:message>
  <wsdl:message name="IP2ProxyHttpGetIn">
    <wsdl:part name="IP" type="s:string" />
    <wsdl:part name="LICENSE" type="s:string" />
  </wsdl:message>
  <wsdl:message name="IP2ProxyHttpGetOut">
    <wsdl:part name="Body" element="tns:IP2PROXY" />
  </wsdl:message>
  <wsdl:message name="IP2ProxyHttpPostIn">
    <wsdl:part name="IP" type="s:string" />
    <wsdl:part name="LICENSE" type="s:string" />
  </wsdl:message>
  <wsdl:message name="IP2ProxyHttpPostOut">
    <wsdl:part name="Body" element="tns:IP2PROXY" />
  </wsdl:message>
  <wsdl:portType name="IP2ProxyWebServiceSoap">
    <wsdl:operation name="IP2Proxy">
      <wsdl:input message="tns:IP2ProxySoapIn" />
      <wsdl:output message="tns:IP2ProxySoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="IP2ProxyWebServiceHttpGet">
    <wsdl:operation name="IP2Proxy">
      <wsdl:input message="tns:IP2ProxyHttpGetIn" />
      <wsdl:output message="tns:IP2ProxyHttpGetOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="IP2ProxyWebServiceHttpPost">
    <wsdl:operation name="IP2Proxy">
      <wsdl:input message="tns:IP2ProxyHttpPostIn" />
      <wsdl:output message="tns:IP2ProxyHttpPostOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="IP2ProxyWebServiceSoap" type="tns:IP2ProxyWebServiceSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" style="document" />
    <wsdl:operation name="IP2Proxy">
      <soap:operation soapAction="http://ws.fraudlabs.com/IP2Proxy" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="IP2ProxyWebServiceHttpGet" type="tns:IP2ProxyWebServiceHttpGet">
    <http:binding verb="GET" />
    <wsdl:operation name="IP2Proxy">
      <http:operation location="/IP2Proxy" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="IP2ProxyWebServiceHttpPost" type="tns:IP2ProxyWebServiceHttpPost">
    <http:binding verb="POST" />
    <wsdl:operation name="IP2Proxy">
      <http:operation location="/IP2Proxy" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="IP2ProxyWebService">
    <wsdl:port name="IP2ProxyWebServiceSoap" binding="tns:IP2ProxyWebServiceSoap">
      <soap:address location="http://ws.fraudlabs.com/ip2proxywebservice.asmx" />
    </wsdl:port>
    <wsdl:port name="IP2ProxyWebServiceHttpGet" binding="tns:IP2ProxyWebServiceHttpGet">
      <http:address location="http://ws.fraudlabs.com/ip2proxywebservice.asmx" />
    </wsdl:port>
    <wsdl:port name="IP2ProxyWebServiceHttpPost" binding="tns:IP2ProxyWebServiceHttpPost">
      <http:address location="http://ws.fraudlabs.com/ip2proxywebservice.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>