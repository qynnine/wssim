<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://ws.fraudlabs.com/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" targetNamespace="http://ws.fraudlabs.com/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://ws.fraudlabs.com/">
      <s:element name="MailBoxValidator">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="EMAIL" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LICENSE" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="MailBoxValidatorResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="MailBoxValidatorResult" type="tns:MAILBOX_VALIDATOR" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="MAILBOX_VALIDATOR">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="IS_SYNTAX" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IS_DOMAIN" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IS_SMTP" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IS_LEVEL" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CREDITSAVAILABLE" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="MESSAGE" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="MAILBOX_VALIDATOR" nillable="true" type="tns:MAILBOX_VALIDATOR" />
    </s:schema>
  </wsdl:types>
  <wsdl:message name="MailBoxValidatorSoapIn">
    <wsdl:part name="parameters" element="tns:MailBoxValidator" />
  </wsdl:message>
  <wsdl:message name="MailBoxValidatorSoapOut">
    <wsdl:part name="parameters" element="tns:MailBoxValidatorResponse" />
  </wsdl:message>
  <wsdl:message name="MailBoxValidatorHttpGetIn">
    <wsdl:part name="EMAIL" type="s:string" />
    <wsdl:part name="LICENSE" type="s:string" />
  </wsdl:message>
  <wsdl:message name="MailBoxValidatorHttpGetOut">
    <wsdl:part name="Body" element="tns:MAILBOX_VALIDATOR" />
  </wsdl:message>
  <wsdl:message name="MailBoxValidatorHttpPostIn">
    <wsdl:part name="EMAIL" type="s:string" />
    <wsdl:part name="LICENSE" type="s:string" />
  </wsdl:message>
  <wsdl:message name="MailBoxValidatorHttpPostOut">
    <wsdl:part name="Body" element="tns:MAILBOX_VALIDATOR" />
  </wsdl:message>
  <wsdl:portType name="mailboxvalidatorSoap">
    <wsdl:operation name="MailBoxValidator">
      <wsdl:input message="tns:MailBoxValidatorSoapIn" />
      <wsdl:output message="tns:MailBoxValidatorSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="mailboxvalidatorHttpGet">
    <wsdl:operation name="MailBoxValidator">
      <wsdl:input message="tns:MailBoxValidatorHttpGetIn" />
      <wsdl:output message="tns:MailBoxValidatorHttpGetOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="mailboxvalidatorHttpPost">
    <wsdl:operation name="MailBoxValidator">
      <wsdl:input message="tns:MailBoxValidatorHttpPostIn" />
      <wsdl:output message="tns:MailBoxValidatorHttpPostOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="mailboxvalidatorSoap" type="tns:mailboxvalidatorSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="MailBoxValidator">
      <soap:operation soapAction="http://ws.fraudlabs.com/MailBoxValidator" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="mailboxvalidatorSoap12" type="tns:mailboxvalidatorSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="MailBoxValidator">
      <soap12:operation soapAction="http://ws.fraudlabs.com/MailBoxValidator" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="mailboxvalidatorHttpGet" type="tns:mailboxvalidatorHttpGet">
    <http:binding verb="GET" />
    <wsdl:operation name="MailBoxValidator">
      <http:operation location="/MailBoxValidator" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="mailboxvalidatorHttpPost" type="tns:mailboxvalidatorHttpPost">
    <http:binding verb="POST" />
    <wsdl:operation name="MailBoxValidator">
      <http:operation location="/MailBoxValidator" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="mailboxvalidator">
    <wsdl:port name="mailboxvalidatorSoap" binding="tns:mailboxvalidatorSoap">
      <soap:address location="http://ws2.fraudlabs.com/mailboxvalidator.asmx" />
    </wsdl:port>
    <wsdl:port name="mailboxvalidatorSoap12" binding="tns:mailboxvalidatorSoap12">
      <soap12:address location="http://ws2.fraudlabs.com/mailboxvalidator.asmx" />
    </wsdl:port>
    <wsdl:port name="mailboxvalidatorHttpGet" binding="tns:mailboxvalidatorHttpGet">
      <http:address location="http://ws2.fraudlabs.com/mailboxvalidator.asmx" />
    </wsdl:port>
    <wsdl:port name="mailboxvalidatorHttpPost" binding="tns:mailboxvalidatorHttpPost">
      <http:address location="http://ws2.fraudlabs.com/mailboxvalidator.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>