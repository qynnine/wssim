<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tns="http://ws.fraudlabs.com/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" targetNamespace="http://ws.fraudlabs.com/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://ws.fraudlabs.com/">
      <s:element name="BrowserObject">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="USERAGENTSTRING" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LICENSE" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="BrowserObjectResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="BrowserObjectResult" type="tns:BROWSEROBJECT" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="BROWSEROBJECT">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="CREDITSAVAILABLE" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ActiveXControls" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Alpha" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="AOL" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="AOLVersion" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="AuthenticodeUpdate" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="BackgroundSounds" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Beta" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Browser" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CDF" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CharHeightAvail" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CharWidthAvail" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CLRVersion" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CompressGZIP" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CookiesSupported" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Crawler" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CSSVersion" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="EmailCrawler" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="FileUpload" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="FontColor" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="FontSize" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Frames" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Gecko" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="NetscapeGold" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="HDML" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IFrames" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IsBanned" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IsMobileDevice" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IsSyndicationReader" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="JavaAppletsSupported" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="JavaScriptSupported" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="MajorVersion" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="MinorVersion" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="MinorVersionLetter" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="MouseOver" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="MSN" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="NETCLR" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="OSInformation" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="PNGSupported" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Platform" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IsProxy" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="SSLSupported" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="SSLActive" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="SSLCipherSuite" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="TableBackgroundColor" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="TableBackgroundImage" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Tables" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="UserLanguage" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="VBScriptSupported" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="WAPDeviceModel" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="WAPGateway" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="WAPMaximumDeckSize" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="WAPSubscriberID" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="WAP" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Win16" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Win32" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Win64" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="XMLSupported" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="UserAgent" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Version" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="MESSAGE" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="BROWSEROBJECT" nillable="true" type="tns:BROWSEROBJECT" />
    </s:schema>
  </wsdl:types>
  <wsdl:message name="BrowserObjectSoapIn">
    <wsdl:part name="parameters" element="tns:BrowserObject" />
  </wsdl:message>
  <wsdl:message name="BrowserObjectSoapOut">
    <wsdl:part name="parameters" element="tns:BrowserObjectResponse" />
  </wsdl:message>
  <wsdl:message name="BrowserObjectHttpGetIn">
    <wsdl:part name="USERAGENTSTRING" type="s:string" />
    <wsdl:part name="LICENSE" type="s:string" />
  </wsdl:message>
  <wsdl:message name="BrowserObjectHttpGetOut">
    <wsdl:part name="Body" element="tns:BROWSEROBJECT" />
  </wsdl:message>
  <wsdl:message name="BrowserObjectHttpPostIn">
    <wsdl:part name="USERAGENTSTRING" type="s:string" />
    <wsdl:part name="LICENSE" type="s:string" />
  </wsdl:message>
  <wsdl:message name="BrowserObjectHttpPostOut">
    <wsdl:part name="Body" element="tns:BROWSEROBJECT" />
  </wsdl:message>
  <wsdl:portType name="BrowserObjectWebServiceSoap">
    <wsdl:operation name="BrowserObject">
      <wsdl:input message="tns:BrowserObjectSoapIn" />
      <wsdl:output message="tns:BrowserObjectSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="BrowserObjectWebServiceHttpGet">
    <wsdl:operation name="BrowserObject">
      <wsdl:input message="tns:BrowserObjectHttpGetIn" />
      <wsdl:output message="tns:BrowserObjectHttpGetOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="BrowserObjectWebServiceHttpPost">
    <wsdl:operation name="BrowserObject">
      <wsdl:input message="tns:BrowserObjectHttpPostIn" />
      <wsdl:output message="tns:BrowserObjectHttpPostOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="BrowserObjectWebServiceSoap" type="tns:BrowserObjectWebServiceSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" style="document" />
    <wsdl:operation name="BrowserObject">
      <soap:operation soapAction="http://ws.fraudlabs.com/BrowserObject" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="BrowserObjectWebServiceHttpGet" type="tns:BrowserObjectWebServiceHttpGet">
    <http:binding verb="GET" />
    <wsdl:operation name="BrowserObject">
      <http:operation location="/BrowserObject" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="BrowserObjectWebServiceHttpPost" type="tns:BrowserObjectWebServiceHttpPost">
    <http:binding verb="POST" />
    <wsdl:operation name="BrowserObject">
      <http:operation location="/BrowserObject" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="BrowserObjectWebService">
    <wsdl:port name="BrowserObjectWebServiceSoap" binding="tns:BrowserObjectWebServiceSoap">
      <soap:address location="http://ws.fraudlabs.com/browserobjectwebservice.asmx" />
    </wsdl:port>
    <wsdl:port name="BrowserObjectWebServiceHttpGet" binding="tns:BrowserObjectWebServiceHttpGet">
      <http:address location="http://ws.fraudlabs.com/browserobjectwebservice.asmx" />
    </wsdl:port>
    <wsdl:port name="BrowserObjectWebServiceHttpPost" binding="tns:BrowserObjectWebServiceHttpPost">
      <http:address location="http://ws.fraudlabs.com/browserobjectwebservice.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>