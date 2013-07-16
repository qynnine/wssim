<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tns="http://ws.fraudlabs.com/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" targetNamespace="http://ws.fraudlabs.com/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://ws.fraudlabs.com/">
      <s:element name="AreaCodeWorld">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="NPA" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="NXX" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LICENSE" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AreaCodeWorldResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="AreaCodeWorldResult" type="tns:AREACODEWORLD" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="AREACODEWORLD">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="CREDITSAVAILABLE" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="NPA" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="STATE" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CITY" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="NXX" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="COUNTRY" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="COUNTY" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="LATITUDE" type="s:float" />
          <s:element minOccurs="1" maxOccurs="1" name="LONGITUDE" type="s:float" />
          <s:element minOccurs="0" maxOccurs="1" name="TIMEZONE" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="LATA" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="OBSERVES_DST" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="COUNTY_POPULATION" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="FIPS_COUNTY_CODE" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="MSA_COUNTY_CODE" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="PMSA_COUNTY_CODE" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CBSA_COUNTY_CODE" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ZIPCODE_POSTALCODE" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ZIPCODE_COUNT" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ZIPCODE_FREQUENCY" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="NEW_NPA" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="NXX_USE_TYPE" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="NXX_INTRO_VERSION" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="OVERLAY" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="OCN" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="COMPANY" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="RATE_CENTER" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="SWITCH_CLLI" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="RC_VERTICAL" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="RC_HORIZONTAL" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="MESSAGE" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="AREACODEWORLD" nillable="true" type="tns:AREACODEWORLD" />
    </s:schema>
  </wsdl:types>
  <wsdl:message name="AreaCodeWorldSoapIn">
    <wsdl:part name="parameters" element="tns:AreaCodeWorld" />
  </wsdl:message>
  <wsdl:message name="AreaCodeWorldSoapOut">
    <wsdl:part name="parameters" element="tns:AreaCodeWorldResponse" />
  </wsdl:message>
  <wsdl:message name="AreaCodeWorldHttpGetIn">
    <wsdl:part name="NPA" type="s:string" />
    <wsdl:part name="NXX" type="s:string" />
    <wsdl:part name="LICENSE" type="s:string" />
  </wsdl:message>
  <wsdl:message name="AreaCodeWorldHttpGetOut">
    <wsdl:part name="Body" element="tns:AREACODEWORLD" />
  </wsdl:message>
  <wsdl:message name="AreaCodeWorldHttpPostIn">
    <wsdl:part name="NPA" type="s:string" />
    <wsdl:part name="NXX" type="s:string" />
    <wsdl:part name="LICENSE" type="s:string" />
  </wsdl:message>
  <wsdl:message name="AreaCodeWorldHttpPostOut">
    <wsdl:part name="Body" element="tns:AREACODEWORLD" />
  </wsdl:message>
  <wsdl:portType name="AreaCodeWorldWebServiceSoap">
    <wsdl:operation name="AreaCodeWorld">
      <wsdl:input message="tns:AreaCodeWorldSoapIn" />
      <wsdl:output message="tns:AreaCodeWorldSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="AreaCodeWorldWebServiceHttpGet">
    <wsdl:operation name="AreaCodeWorld">
      <wsdl:input message="tns:AreaCodeWorldHttpGetIn" />
      <wsdl:output message="tns:AreaCodeWorldHttpGetOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="AreaCodeWorldWebServiceHttpPost">
    <wsdl:operation name="AreaCodeWorld">
      <wsdl:input message="tns:AreaCodeWorldHttpPostIn" />
      <wsdl:output message="tns:AreaCodeWorldHttpPostOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="AreaCodeWorldWebServiceSoap" type="tns:AreaCodeWorldWebServiceSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" style="document" />
    <wsdl:operation name="AreaCodeWorld">
      <soap:operation soapAction="http://ws.fraudlabs.com/AreaCodeWorld" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="AreaCodeWorldWebServiceHttpGet" type="tns:AreaCodeWorldWebServiceHttpGet">
    <http:binding verb="GET" />
    <wsdl:operation name="AreaCodeWorld">
      <http:operation location="/AreaCodeWorld" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="AreaCodeWorldWebServiceHttpPost" type="tns:AreaCodeWorldWebServiceHttpPost">
    <http:binding verb="POST" />
    <wsdl:operation name="AreaCodeWorld">
      <http:operation location="/AreaCodeWorld" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="AreaCodeWorldWebService">
    <wsdl:port name="AreaCodeWorldWebServiceSoap" binding="tns:AreaCodeWorldWebServiceSoap">
      <soap:address location="http://ws.fraudlabs.com/areacodeworldwebservice.asmx" />
    </wsdl:port>
    <wsdl:port name="AreaCodeWorldWebServiceHttpGet" binding="tns:AreaCodeWorldWebServiceHttpGet">
      <http:address location="http://ws.fraudlabs.com/areacodeworldwebservice.asmx" />
    </wsdl:port>
    <wsdl:port name="AreaCodeWorldWebServiceHttpPost" binding="tns:AreaCodeWorldWebServiceHttpPost">
      <http:address location="http://ws.fraudlabs.com/areacodeworldwebservice.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>