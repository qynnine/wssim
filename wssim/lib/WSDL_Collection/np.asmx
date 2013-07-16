<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tns="http://microsoft.com/webservices/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" targetNamespace="http://microsoft.com/webservices/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://microsoft.com/webservices/">
      <s:element name="GetPrimeNumbers">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="max" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetPrimeNumbersResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetPrimeNumbersResult" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="string" nillable="true" type="s:string" />
    </s:schema>
  </wsdl:types>
  <wsdl:message name="GetPrimeNumbersSoapIn">
    <wsdl:part name="parameters" element="tns:GetPrimeNumbers" />
  </wsdl:message>
  <wsdl:message name="GetPrimeNumbersSoapOut">
    <wsdl:part name="parameters" element="tns:GetPrimeNumbersResponse" />
  </wsdl:message>
  <wsdl:message name="GetPrimeNumbersHttpGetIn">
    <wsdl:part name="max" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetPrimeNumbersHttpGetOut">
    <wsdl:part name="Body" element="tns:string" />
  </wsdl:message>
  <wsdl:message name="GetPrimeNumbersHttpPostIn">
    <wsdl:part name="max" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetPrimeNumbersHttpPostOut">
    <wsdl:part name="Body" element="tns:string" />
  </wsdl:message>
  <wsdl:portType name="PrimeNumbersSoap">
    <wsdl:operation name="GetPrimeNumbers">
      <wsdl:input message="tns:GetPrimeNumbersSoapIn" />
      <wsdl:output message="tns:GetPrimeNumbersSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="PrimeNumbersHttpGet">
    <wsdl:operation name="GetPrimeNumbers">
      <wsdl:input message="tns:GetPrimeNumbersHttpGetIn" />
      <wsdl:output message="tns:GetPrimeNumbersHttpGetOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="PrimeNumbersHttpPost">
    <wsdl:operation name="GetPrimeNumbers">
      <wsdl:input message="tns:GetPrimeNumbersHttpPostIn" />
      <wsdl:output message="tns:GetPrimeNumbersHttpPostOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="PrimeNumbersSoap" type="tns:PrimeNumbersSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" style="document" />
    <wsdl:operation name="GetPrimeNumbers">
      <soap:operation soapAction="http://microsoft.com/webservices/GetPrimeNumbers" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="PrimeNumbersHttpGet" type="tns:PrimeNumbersHttpGet">
    <http:binding verb="GET" />
    <wsdl:operation name="GetPrimeNumbers">
      <http:operation location="/GetPrimeNumbers" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="PrimeNumbersHttpPost" type="tns:PrimeNumbersHttpPost">
    <http:binding verb="POST" />
    <wsdl:operation name="GetPrimeNumbers">
      <http:operation location="/GetPrimeNumbers" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="PrimeNumbers">
    <wsdl:port name="PrimeNumbersSoap" binding="tns:PrimeNumbersSoap">
      <soap:address location="http://www50.brinkster.com/vbfacileinpt/np.asmx" />
    </wsdl:port>
    <wsdl:port name="PrimeNumbersHttpGet" binding="tns:PrimeNumbersHttpGet">
      <http:address location="http://www50.brinkster.com/vbfacileinpt/np.asmx" />
    </wsdl:port>
    <wsdl:port name="PrimeNumbersHttpPost" binding="tns:PrimeNumbersHttpPost">
      <http:address location="http://www50.brinkster.com/vbfacileinpt/np.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>