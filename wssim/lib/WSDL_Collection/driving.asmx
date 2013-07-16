<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://www.ecubicle.net/webservices/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" targetNamespace="http://www.ecubicle.net/webservices/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://www.ecubicle.net/webservices/">
      <s:element name="GetDirections">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="fromAddress" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="toAddress" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="distanceUnit" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="expresswayEnabled" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetDirectionsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetDirectionsResult">
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
  <wsdl:message name="GetDirectionsSoapIn">
    <wsdl:part name="parameters" element="tns:GetDirections" />
  </wsdl:message>
  <wsdl:message name="GetDirectionsSoapOut">
    <wsdl:part name="parameters" element="tns:GetDirectionsResponse" />
  </wsdl:message>
  <wsdl:portType name="drivingSoap">
    <wsdl:operation name="GetDirections">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">&lt;h2&gt;Usage&lt;/h2&gt;&lt;br/&gt;&lt;h3&gt;fromAddress&lt;/h3&gt;&lt;br/&gt;From address in the format &lt;b&gt;Street Address, State/Province, Country&lt;/b&gt;&lt;br/&gt;&lt;h3&gt;toAddress&lt;/h3&gt;&lt;br/&gt;To address in the same format as from address&lt;br/&gt;&lt;h3&gt;distanceUnit&lt;/h3&gt;&lt;br/&gt;Specify either &lt;b&gt;miles&lt;/b&gt; or &lt;b&gt;km&lt;/b&gt;&lt;br/&gt;&lt;h3&gt;expresswayEnabled&lt;/h3&gt;&lt;br/&gt;Specify either &lt;b&gt;true&lt;/b&gt; or &lt;b&gt;false&lt;/b&gt;. The setting of false prevents highway directions.</wsdl:documentation>
      <wsdl:input message="tns:GetDirectionsSoapIn" />
      <wsdl:output message="tns:GetDirectionsSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="drivingSoap" type="tns:drivingSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetDirections">
      <soap:operation soapAction="http://www.ecubicle.net/webservices/GetDirections" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="drivingSoap12" type="tns:drivingSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetDirections">
      <soap12:operation soapAction="http://www.ecubicle.net/webservices/GetDirections" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="driving">
    <wsdl:port name="drivingSoap" binding="tns:drivingSoap">
      <soap:address location="http://www.ecubicle.net/driving.asmx" />
    </wsdl:port>
    <wsdl:port name="drivingSoap12" binding="tns:drivingSoap12">
      <soap12:address location="http://www.ecubicle.net/driving.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>