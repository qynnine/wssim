<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tns="http://www.serviceobjects.com/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" targetNamespace="http://www.serviceobjects.com/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://www.serviceobjects.com/">
      <s:element name="ValidateNameEmailIP">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="Name" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Email" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="IPAddress" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ValidateNameEmailIPResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ValidateNameEmailIPResult" type="tns:Validation" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="Validation">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="NameStatusCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="NameStatus" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="NameScore" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="NameError" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ZipStatusCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ZipStatus" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ZipScore" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ZipError" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="NameAppendStatusCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="NameAppendStatus" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="NameAppendScore" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="NameAppendError" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="EmailStatusCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="EmailStatus" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="EmailScore" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="EmailError" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IPStatusCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IPStatus" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IPScore" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IPNetworkCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IPNetworkStatus" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IPNetworkScore" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="IPError" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ZIPToIPStatusCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ZIPToIPStatus" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ZIPToIPScore" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ZIPToIPError" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Score" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Timers" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Error" type="tns:Err" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="Err">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Desc" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Number" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Location" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="ValidateZipEmailIP">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="Zip" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Email" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="IPAddress" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ValidateZipEmailIPResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ValidateZipEmailIPResult" type="tns:Validation" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ReturnAllOutcomes">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ReturnAllOutcomesResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ReturnAllOutcomesResult" type="tns:ArrayOfValidation" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfValidation">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="Validation" nillable="true" type="tns:Validation" />
        </s:sequence>
      </s:complexType>
      <s:element name="Validation" nillable="true" type="tns:Validation" />
      <s:element name="ArrayOfValidation" nillable="true" type="tns:ArrayOfValidation" />
    </s:schema>
  </wsdl:types>
  <wsdl:message name="ValidateNameEmailIPSoapIn">
    <wsdl:part name="parameters" element="tns:ValidateNameEmailIP" />
  </wsdl:message>
  <wsdl:message name="ValidateNameEmailIPSoapOut">
    <wsdl:part name="parameters" element="tns:ValidateNameEmailIPResponse" />
  </wsdl:message>
  <wsdl:message name="ValidateZipEmailIPSoapIn">
    <wsdl:part name="parameters" element="tns:ValidateZipEmailIP" />
  </wsdl:message>
  <wsdl:message name="ValidateZipEmailIPSoapOut">
    <wsdl:part name="parameters" element="tns:ValidateZipEmailIPResponse" />
  </wsdl:message>
  <wsdl:message name="ReturnAllOutcomesSoapIn">
    <wsdl:part name="parameters" element="tns:ReturnAllOutcomes" />
  </wsdl:message>
  <wsdl:message name="ReturnAllOutcomesSoapOut">
    <wsdl:part name="parameters" element="tns:ReturnAllOutcomesResponse" />
  </wsdl:message>
  <wsdl:message name="ValidateNameEmailIPHttpGetIn">
    <wsdl:part name="Name" type="s:string" />
    <wsdl:part name="Email" type="s:string" />
    <wsdl:part name="IPAddress" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ValidateNameEmailIPHttpGetOut">
    <wsdl:part name="Body" element="tns:Validation" />
  </wsdl:message>
  <wsdl:message name="ValidateZipEmailIPHttpGetIn">
    <wsdl:part name="Zip" type="s:string" />
    <wsdl:part name="Email" type="s:string" />
    <wsdl:part name="IPAddress" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ValidateZipEmailIPHttpGetOut">
    <wsdl:part name="Body" element="tns:Validation" />
  </wsdl:message>
  <wsdl:message name="ReturnAllOutcomesHttpGetIn">
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ReturnAllOutcomesHttpGetOut">
    <wsdl:part name="Body" element="tns:ArrayOfValidation" />
  </wsdl:message>
  <wsdl:message name="ValidateNameEmailIPHttpPostIn">
    <wsdl:part name="Name" type="s:string" />
    <wsdl:part name="Email" type="s:string" />
    <wsdl:part name="IPAddress" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ValidateNameEmailIPHttpPostOut">
    <wsdl:part name="Body" element="tns:Validation" />
  </wsdl:message>
  <wsdl:message name="ValidateZipEmailIPHttpPostIn">
    <wsdl:part name="Zip" type="s:string" />
    <wsdl:part name="Email" type="s:string" />
    <wsdl:part name="IPAddress" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ValidateZipEmailIPHttpPostOut">
    <wsdl:part name="Body" element="tns:Validation" />
  </wsdl:message>
  <wsdl:message name="ReturnAllOutcomesHttpPostIn">
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ReturnAllOutcomesHttpPostOut">
    <wsdl:part name="Body" element="tns:ArrayOfValidation" />
  </wsdl:message>
  <wsdl:portType name="DOTSFraudProtectionLiteSoap">
    <wsdl:operation name="ValidateNameEmailIP">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Validates small input forms and returns a score which indicates likelihood of false information.</documentation>
      <wsdl:input message="tns:ValidateNameEmailIPSoapIn" />
      <wsdl:output message="tns:ValidateNameEmailIPSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="ValidateZipEmailIP">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Validates small input forms and returns a score which indicates likelihood of false information.</documentation>
      <wsdl:input message="tns:ValidateZipEmailIPSoapIn" />
      <wsdl:output message="tns:ValidateZipEmailIPSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="ReturnAllOutcomes">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Returns a list of possible outcomes with their codes, descriptions and scores.</documentation>
      <wsdl:input message="tns:ReturnAllOutcomesSoapIn" />
      <wsdl:output message="tns:ReturnAllOutcomesSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="DOTSFraudProtectionLiteHttpGet">
    <wsdl:operation name="ValidateNameEmailIP">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Validates small input forms and returns a score which indicates likelihood of false information.</documentation>
      <wsdl:input message="tns:ValidateNameEmailIPHttpGetIn" />
      <wsdl:output message="tns:ValidateNameEmailIPHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="ValidateZipEmailIP">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Validates small input forms and returns a score which indicates likelihood of false information.</documentation>
      <wsdl:input message="tns:ValidateZipEmailIPHttpGetIn" />
      <wsdl:output message="tns:ValidateZipEmailIPHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="ReturnAllOutcomes">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Returns a list of possible outcomes with their codes, descriptions and scores.</documentation>
      <wsdl:input message="tns:ReturnAllOutcomesHttpGetIn" />
      <wsdl:output message="tns:ReturnAllOutcomesHttpGetOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="DOTSFraudProtectionLiteHttpPost">
    <wsdl:operation name="ValidateNameEmailIP">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Validates small input forms and returns a score which indicates likelihood of false information.</documentation>
      <wsdl:input message="tns:ValidateNameEmailIPHttpPostIn" />
      <wsdl:output message="tns:ValidateNameEmailIPHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="ValidateZipEmailIP">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Validates small input forms and returns a score which indicates likelihood of false information.</documentation>
      <wsdl:input message="tns:ValidateZipEmailIPHttpPostIn" />
      <wsdl:output message="tns:ValidateZipEmailIPHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="ReturnAllOutcomes">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Returns a list of possible outcomes with their codes, descriptions and scores.</documentation>
      <wsdl:input message="tns:ReturnAllOutcomesHttpPostIn" />
      <wsdl:output message="tns:ReturnAllOutcomesHttpPostOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="DOTSFraudProtectionLiteSoap" type="tns:DOTSFraudProtectionLiteSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" style="document" />
    <wsdl:operation name="ValidateNameEmailIP">
      <soap:operation soapAction="http://www.serviceobjects.com/ValidateNameEmailIP" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ValidateZipEmailIP">
      <soap:operation soapAction="http://www.serviceobjects.com/ValidateZipEmailIP" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReturnAllOutcomes">
      <soap:operation soapAction="http://www.serviceobjects.com/ReturnAllOutcomes" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="DOTSFraudProtectionLiteHttpGet" type="tns:DOTSFraudProtectionLiteHttpGet">
    <http:binding verb="GET" />
    <wsdl:operation name="ValidateNameEmailIP">
      <http:operation location="/ValidateNameEmailIP" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ValidateZipEmailIP">
      <http:operation location="/ValidateZipEmailIP" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReturnAllOutcomes">
      <http:operation location="/ReturnAllOutcomes" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="DOTSFraudProtectionLiteHttpPost" type="tns:DOTSFraudProtectionLiteHttpPost">
    <http:binding verb="POST" />
    <wsdl:operation name="ValidateNameEmailIP">
      <http:operation location="/ValidateNameEmailIP" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ValidateZipEmailIP">
      <http:operation location="/ValidateZipEmailIP" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReturnAllOutcomes">
      <http:operation location="/ReturnAllOutcomes" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="DOTSFraudProtectionLite">
    <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">For more information on our web services, visit us at &lt;a href='http://www.serviceobjects.com/products/default.asp' target='new'&gt;our website&lt;/a&gt;&lt;br/&gt;&lt;br/&gt;&lt;a href='http://www.serviceobjects.com' target='new'&gt;&lt;img src='http://www.serviceobjects.com/images/so_logo_2_inside.gif' border='0'/&gt;&lt;/a&gt;</documentation>
    <wsdl:port name="DOTSFraudProtectionLiteSoap" binding="tns:DOTSFraudProtectionLiteSoap">
      <soap:address location="http://trial.serviceobjects.com/fpl/FraudProtectionLite.asmx" />
    </wsdl:port>
    <wsdl:port name="DOTSFraudProtectionLiteHttpGet" binding="tns:DOTSFraudProtectionLiteHttpGet">
      <http:address location="http://trial.serviceobjects.com/fpl/FraudProtectionLite.asmx" />
    </wsdl:port>
    <wsdl:port name="DOTSFraudProtectionLiteHttpPost" binding="tns:DOTSFraudProtectionLiteHttpPost">
      <http:address location="http://trial.serviceobjects.com/fpl/FraudProtectionLite.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>