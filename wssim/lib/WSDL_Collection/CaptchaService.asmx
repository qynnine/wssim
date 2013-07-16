<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tns="http://www.textdisguise.com/TextDisguise/CaptchaService/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" targetNamespace="http://www.textdisguise.com/TextDisguise/CaptchaService/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://www.textdisguise.com/TextDisguise/CaptchaService/">
      <s:element name="GetNewWord">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="cam" type="tns:ClientAuthModel" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ClientAuthModel">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Guid" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Password" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetNewWordResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetNewWordResult" type="tns:CaptchaImageWordModel" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="CaptchaImageWordModel">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="CaptchaImageGuid" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Url" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="ValidateImageWord">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="cam" type="tns:ClientAuthModel" />
            <s:element minOccurs="0" maxOccurs="1" name="captchaImageGuid" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="word" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ValidateImageWordResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="ValidateImageWordResult" type="s:boolean" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AbandonImageWord">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="cam" type="tns:ClientAuthModel" />
            <s:element minOccurs="0" maxOccurs="1" name="captchaImageGuid" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AbandonImageWordResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="AbandonImageWordResult" type="s:boolean" />
          </s:sequence>
        </s:complexType>
      </s:element>
    </s:schema>
  </wsdl:types>
  <wsdl:message name="GetNewWordSoapIn">
    <wsdl:part name="parameters" element="tns:GetNewWord" />
  </wsdl:message>
  <wsdl:message name="GetNewWordSoapOut">
    <wsdl:part name="parameters" element="tns:GetNewWordResponse" />
  </wsdl:message>
  <wsdl:message name="ValidateImageWordSoapIn">
    <wsdl:part name="parameters" element="tns:ValidateImageWord" />
  </wsdl:message>
  <wsdl:message name="ValidateImageWordSoapOut">
    <wsdl:part name="parameters" element="tns:ValidateImageWordResponse" />
  </wsdl:message>
  <wsdl:message name="AbandonImageWordSoapIn">
    <wsdl:part name="parameters" element="tns:AbandonImageWord" />
  </wsdl:message>
  <wsdl:message name="AbandonImageWordSoapOut">
    <wsdl:part name="parameters" element="tns:AbandonImageWordResponse" />
  </wsdl:message>
  <wsdl:portType name="CaptchaServiceSoap">
    <wsdl:operation name="GetNewWord">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the GUID of a specific image.  Images can only be retrieved one time from the URL specified in the returned CaptchaImageWordModel.</documentation>
      <wsdl:input message="tns:GetNewWordSoapIn" />
      <wsdl:output message="tns:GetNewWordSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="ValidateImageWord">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the GUID of a specific image.  Words can only be validated one time; in the case of a failure, a new Image GUID must be generated.</documentation>
      <wsdl:input message="tns:ValidateImageWordSoapIn" />
      <wsdl:output message="tns:ValidateImageWordSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="AbandonImageWord">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Abandons a specific image as specified by the GUID.  This should be used when you can control the cancellation and avoid leaving hanging images.</documentation>
      <wsdl:input message="tns:AbandonImageWordSoapIn" />
      <wsdl:output message="tns:AbandonImageWordSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="CaptchaServiceHttpGet" />
  <wsdl:portType name="CaptchaServiceHttpPost" />
  <wsdl:binding name="CaptchaServiceSoap" type="tns:CaptchaServiceSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" style="document" />
    <wsdl:operation name="GetNewWord">
      <soap:operation soapAction="http://www.textdisguise.com/TextDisguise/CaptchaService/GetNewWord" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ValidateImageWord">
      <soap:operation soapAction="http://www.textdisguise.com/TextDisguise/CaptchaService/ValidateImageWord" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AbandonImageWord">
      <soap:operation soapAction="http://www.textdisguise.com/TextDisguise/CaptchaService/AbandonImageWord" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="CaptchaServiceHttpGet" type="tns:CaptchaServiceHttpGet">
    <http:binding verb="GET" />
  </wsdl:binding>
  <wsdl:binding name="CaptchaServiceHttpPost" type="tns:CaptchaServiceHttpPost">
    <http:binding verb="POST" />
  </wsdl:binding>
  <wsdl:service name="CaptchaService">
    <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Web service that allows users to create CAPTCHA-like ("Completely Automated Public Turing test to Tell Computers and Humans Apart") images and validate the response entered. Current version is v1.0.0. Release Date: 2005-12-22</documentation>
    <wsdl:port name="CaptchaServiceSoap" binding="tns:CaptchaServiceSoap">
      <soap:address location="http://www.textdisguise.com/TextDisguise/CaptchaService/CaptchaService.asmx" />
    </wsdl:port>
    <wsdl:port name="CaptchaServiceHttpGet" binding="tns:CaptchaServiceHttpGet">
      <http:address location="http://www.textdisguise.com/TextDisguise/CaptchaService/CaptchaService.asmx" />
    </wsdl:port>
    <wsdl:port name="CaptchaServiceHttpPost" binding="tns:CaptchaServiceHttpPost">
      <http:address location="http://www.textdisguise.com/TextDisguise/CaptchaService/CaptchaService.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>