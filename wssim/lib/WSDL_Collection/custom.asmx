<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://service.ecocoma.com/rss/custom" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" targetNamespace="http://service.ecocoma.com/rss/custom" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Cocoma Rss Custom Web Services.</wsdl:documentation>
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://service.ecocoma.com/rss/custom">
      <s:element name="GetRSS">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="KeyID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="DomainID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Encoding" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="RssUrl1" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="RssUrl2" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="RssUrl3" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="RssUrl4" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="RssUrl5" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetRSSResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetRSSResult" type="tns:rss" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="rss">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="channel" type="tns:ArrayOfItem" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfItem">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="item" nillable="true" type="tns:item" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="item">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="title" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="link" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="description" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="pubDate" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetExtendedRSS">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="KeyID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="DomainID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Encoding" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="RssUrl1" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="RssUrl2" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="RssUrl3" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="RssUrl4" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="RssUrl5" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Include" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Exclude" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetExtendedRSSResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetExtendedRSSResult" type="tns:rss" />
          </s:sequence>
        </s:complexType>
      </s:element>
    </s:schema>
  </wsdl:types>
  <wsdl:message name="GetRSSSoapIn">
    <wsdl:part name="parameters" element="tns:GetRSS" />
  </wsdl:message>
  <wsdl:message name="GetRSSSoapOut">
    <wsdl:part name="parameters" element="tns:GetRSSResponse" />
  </wsdl:message>
  <wsdl:message name="GetExtendedRSSSoapIn">
    <wsdl:part name="parameters" element="tns:GetExtendedRSS" />
  </wsdl:message>
  <wsdl:message name="GetExtendedRSSSoapOut">
    <wsdl:part name="parameters" element="tns:GetExtendedRSSResponse" />
  </wsdl:message>
  <wsdl:portType name="Custom_ServiceSoap">
    <wsdl:operation name="GetRSS">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Combine multi-RSS feeds and create your own custom RSS feed.</wsdl:documentation>
      <wsdl:input message="tns:GetRSSSoapIn" />
      <wsdl:output message="tns:GetRSSSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetExtendedRSS">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Combine and filter multi-RSS feeds and create your own custom RSS feed.</wsdl:documentation>
      <wsdl:input message="tns:GetExtendedRSSSoapIn" />
      <wsdl:output message="tns:GetExtendedRSSSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="Custom_ServiceSoap" type="tns:Custom_ServiceSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetRSS">
      <soap:operation soapAction="http://service.ecocoma.com/rss/custom/GetRSS" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetExtendedRSS">
      <soap:operation soapAction="http://service.ecocoma.com/rss/custom/GetExtendedRSS" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="Custom_ServiceSoap12" type="tns:Custom_ServiceSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetRSS">
      <soap12:operation soapAction="http://service.ecocoma.com/rss/custom/GetRSS" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetExtendedRSS">
      <soap12:operation soapAction="http://service.ecocoma.com/rss/custom/GetExtendedRSS" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="Custom_Service">
    <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Cocoma Rss Custom Web Services.</wsdl:documentation>
    <wsdl:port name="Custom_ServiceSoap" binding="tns:Custom_ServiceSoap">
      <soap:address location="http://service.ecocoma.com/rss/custom.asmx" />
    </wsdl:port>
    <wsdl:port name="Custom_ServiceSoap12" binding="tns:Custom_ServiceSoap12">
      <soap12:address location="http://service.ecocoma.com/rss/custom.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>