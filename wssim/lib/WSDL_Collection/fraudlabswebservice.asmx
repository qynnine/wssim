<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tns="http://ws.fraudlabs.com/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" targetNamespace="http://ws.fraudlabs.com/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://ws.fraudlabs.com/">
      <s:element name="FraudLabs">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="IP" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="CITY" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="REGION" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="POSTAL" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="COUNTRY" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="DOMAIN" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="PHONE" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="BIN" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="BINNAME" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="BINPHONE" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LICENSE" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="SHIPADDR" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="SHIPCITY" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="SHIPREGION" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="SHIPPOSTAL" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="SHIPCOUNTRY" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="QUERYID" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="FraudLabsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="FraudLabsResult" type="tns:FRAUDLABS" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="FRAUDLABS">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="COUNTRYMATCH" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="COUNTRY" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="HIGHRISKCOUNTRY" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="DISTANCE" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="IP2COUNTRY" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IP2REGION" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IP2CITY" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="IP2LATITUDE" type="s:float" />
          <s:element minOccurs="1" maxOccurs="1" name="IP2LONGITUDE" type="s:float" />
          <s:element minOccurs="0" maxOccurs="1" name="IP2ISP" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ANONYMOUSPROXY" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="FREEMAIL" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="BINCOUNTRYMATCH" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="BINNAMEMATCH" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="BINPHONEMATCH" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="BINCOUNTRY" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="BINBANKNAME" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="BINBANKPHONE" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="POSTALCITYMATCH" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="PHONECITYMATCH" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="SHIPFORWARD" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="CREDITSAVAILABLE" type="s:int" />
          <s:element minOccurs="1" maxOccurs="1" name="FRAUDSCORE" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="QUERYID" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="MESSAGE" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="FRAUDLABS" nillable="true" type="tns:FRAUDLABS" />
    </s:schema>
  </wsdl:types>
  <wsdl:message name="FraudLabsSoapIn">
    <wsdl:part name="parameters" element="tns:FraudLabs" />
  </wsdl:message>
  <wsdl:message name="FraudLabsSoapOut">
    <wsdl:part name="parameters" element="tns:FraudLabsResponse" />
  </wsdl:message>
  <wsdl:message name="FraudLabsHttpGetIn">
    <wsdl:part name="IP" type="s:string" />
    <wsdl:part name="CITY" type="s:string" />
    <wsdl:part name="REGION" type="s:string" />
    <wsdl:part name="POSTAL" type="s:string" />
    <wsdl:part name="COUNTRY" type="s:string" />
    <wsdl:part name="DOMAIN" type="s:string" />
    <wsdl:part name="PHONE" type="s:string" />
    <wsdl:part name="BIN" type="s:string" />
    <wsdl:part name="BINNAME" type="s:string" />
    <wsdl:part name="BINPHONE" type="s:string" />
    <wsdl:part name="LICENSE" type="s:string" />
    <wsdl:part name="SHIPADDR" type="s:string" />
    <wsdl:part name="SHIPCITY" type="s:string" />
    <wsdl:part name="SHIPREGION" type="s:string" />
    <wsdl:part name="SHIPPOSTAL" type="s:string" />
    <wsdl:part name="SHIPCOUNTRY" type="s:string" />
    <wsdl:part name="QUERYID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="FraudLabsHttpGetOut">
    <wsdl:part name="Body" element="tns:FRAUDLABS" />
  </wsdl:message>
  <wsdl:message name="FraudLabsHttpPostIn">
    <wsdl:part name="IP" type="s:string" />
    <wsdl:part name="CITY" type="s:string" />
    <wsdl:part name="REGION" type="s:string" />
    <wsdl:part name="POSTAL" type="s:string" />
    <wsdl:part name="COUNTRY" type="s:string" />
    <wsdl:part name="DOMAIN" type="s:string" />
    <wsdl:part name="PHONE" type="s:string" />
    <wsdl:part name="BIN" type="s:string" />
    <wsdl:part name="BINNAME" type="s:string" />
    <wsdl:part name="BINPHONE" type="s:string" />
    <wsdl:part name="LICENSE" type="s:string" />
    <wsdl:part name="SHIPADDR" type="s:string" />
    <wsdl:part name="SHIPCITY" type="s:string" />
    <wsdl:part name="SHIPREGION" type="s:string" />
    <wsdl:part name="SHIPPOSTAL" type="s:string" />
    <wsdl:part name="SHIPCOUNTRY" type="s:string" />
    <wsdl:part name="QUERYID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="FraudLabsHttpPostOut">
    <wsdl:part name="Body" element="tns:FRAUDLABS" />
  </wsdl:message>
  <wsdl:portType name="FraudLabsWebServiceSoap">
    <wsdl:operation name="FraudLabs">
      <wsdl:input message="tns:FraudLabsSoapIn" />
      <wsdl:output message="tns:FraudLabsSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="FraudLabsWebServiceHttpGet">
    <wsdl:operation name="FraudLabs">
      <wsdl:input message="tns:FraudLabsHttpGetIn" />
      <wsdl:output message="tns:FraudLabsHttpGetOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="FraudLabsWebServiceHttpPost">
    <wsdl:operation name="FraudLabs">
      <wsdl:input message="tns:FraudLabsHttpPostIn" />
      <wsdl:output message="tns:FraudLabsHttpPostOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="FraudLabsWebServiceSoap" type="tns:FraudLabsWebServiceSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" style="document" />
    <wsdl:operation name="FraudLabs">
      <soap:operation soapAction="http://ws.fraudlabs.com/FraudLabs" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="FraudLabsWebServiceHttpGet" type="tns:FraudLabsWebServiceHttpGet">
    <http:binding verb="GET" />
    <wsdl:operation name="FraudLabs">
      <http:operation location="/FraudLabs" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="FraudLabsWebServiceHttpPost" type="tns:FraudLabsWebServiceHttpPost">
    <http:binding verb="POST" />
    <wsdl:operation name="FraudLabs">
      <http:operation location="/FraudLabs" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="FraudLabsWebService">
    <wsdl:port name="FraudLabsWebServiceSoap" binding="tns:FraudLabsWebServiceSoap">
      <soap:address location="http://ws.fraudlabs.com/fraudlabswebservice.asmx" />
    </wsdl:port>
    <wsdl:port name="FraudLabsWebServiceHttpGet" binding="tns:FraudLabsWebServiceHttpGet">
      <http:address location="http://ws.fraudlabs.com/fraudlabswebservice.asmx" />
    </wsdl:port>
    <wsdl:port name="FraudLabsWebServiceHttpPost" binding="tns:FraudLabsWebServiceHttpPost">
      <http:address location="http://ws.fraudlabs.com/fraudlabswebservice.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>