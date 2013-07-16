<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://www.serviceobjects.com/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" targetNamespace="http://www.serviceobjects.com/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">For more information on our web services, visit us at &lt;a href='http://www.serviceobjects.com/products/default.asp' target='new'&gt;our website&lt;/a&gt;&lt;br/&gt;&lt;br/&gt;&lt;a href='http://www.serviceobjects.com' target='new'&gt;&lt;img src='http://www.serviceobjects.com/images/so_logo_2_inside.gif' border='0'/&gt;&lt;/a&gt;</wsdl:documentation>
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://www.serviceobjects.com/">
      <s:element name="ValidateLead">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="Name" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Address1" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Address2" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="City" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="State" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Zip" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Country" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Phone1" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Phone2" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Email" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="IP" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="TestType" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ValidateLeadResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ValidateLeadResult" type="tns:Contact" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="Contact">
        <s:complexContent mixed="false">
          <s:extension base="tns:ResultContainer">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="NameIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Address1In" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Address2In" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="CityIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="StateIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="ZipIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="CountryIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Phone1In" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Phone2In" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="EmailAddressIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="IPAddressIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="FirstNameOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="LastNameOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="GenderOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Address1Out" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Address2Out" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="CityOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="StateOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="ZipOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Phone1LineOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Phone1TypeOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Phone2LineOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Phone2TypeOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="EmailOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="AlternativePhone" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="AlternativeName" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="AlternativeAddress" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="TestType" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="OverallCertainty" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="OverallQuality" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="NameQuality" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="EmailQuality" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="IPQuality" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="PhoneQuality" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="AddressQuality" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="PhoneContacts" type="tns:PhoneContacts" />
              <s:element minOccurs="0" maxOccurs="1" name="WarningDesc1" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="WarningCode1" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="WarningDesc2" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="WarningCode2" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="WarningDesc3" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="WarningCode3" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="DEBUG" type="s:string" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="ResultContainer">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Error" type="tns:Error" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="Error">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Type" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="TypeCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Desc" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="DescCode" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="PhoneContacts">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="PhoneContact" type="tns:PhoneContact" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="PhoneContact">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Name" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Address" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="City" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="State" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Zip" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Type" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="ValidateLead_V2">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="Name" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="BusinessName" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Address1" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Address2" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="City" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="State" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Zip" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Country" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Phone1" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Phone2" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Email" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="IP" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Gender" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="DateOfBirth" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="UTCCaptureTime" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="TestType" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ValidateLead_V2Response">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ValidateLead_V2Result" type="tns:Contact_V2" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="Contact_V2">
        <s:complexContent mixed="false">
          <s:extension base="tns:ResultContainer">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="NameIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="BusinessNameIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Address1In" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Address2In" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="CityIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="StateIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="ZipIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="CountryIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Phone1In" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Phone2In" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="EmailAddressIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="IPAddressIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="GenderIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="DateOfBirthIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="UTCCaptureTimeIn" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="FirstNameOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="LastNameOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="GenderOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Address1Out" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Address2Out" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="CityOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="StateOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="ZipOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="IsDeliverableOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Phone1LineOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Phone1TypeOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Phone2LineOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Phone2TypeOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="EmailOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="IPCountryOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="LeadTypeOut" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="AlternativePhone" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="AlternativeName" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="AlternativeAddress" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="TestType" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="OverallCertainty" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="OverallQuality" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="NameQuality" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="EmailQuality" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="IPQuality" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="PhoneQuality" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="AddressQuality" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="BusinessQuality" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="PhoneContacts" type="tns:PhoneContacts" />
              <s:element minOccurs="0" maxOccurs="1" name="WarningDesc1" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="WarningCode1" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="WarningDesc2" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="WarningCode2" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="WarningDesc3" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="WarningCode3" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="DEBUG" type="s:string" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:element name="Contact" nillable="true" type="tns:Contact" />
      <s:element name="Contact_V2" nillable="true" type="tns:Contact_V2" />
    </s:schema>
  </wsdl:types>
  <wsdl:message name="ValidateLeadSoapIn">
    <wsdl:part name="parameters" element="tns:ValidateLead" />
  </wsdl:message>
  <wsdl:message name="ValidateLeadSoapOut">
    <wsdl:part name="parameters" element="tns:ValidateLeadResponse" />
  </wsdl:message>
  <wsdl:message name="ValidateLead_V2SoapIn">
    <wsdl:part name="parameters" element="tns:ValidateLead_V2" />
  </wsdl:message>
  <wsdl:message name="ValidateLead_V2SoapOut">
    <wsdl:part name="parameters" element="tns:ValidateLead_V2Response" />
  </wsdl:message>
  <wsdl:message name="ValidateLeadHttpGetIn">
    <wsdl:part name="Name" type="s:string" />
    <wsdl:part name="Address1" type="s:string" />
    <wsdl:part name="Address2" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="State" type="s:string" />
    <wsdl:part name="Zip" type="s:string" />
    <wsdl:part name="Country" type="s:string" />
    <wsdl:part name="Phone1" type="s:string" />
    <wsdl:part name="Phone2" type="s:string" />
    <wsdl:part name="Email" type="s:string" />
    <wsdl:part name="IP" type="s:string" />
    <wsdl:part name="TestType" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ValidateLeadHttpGetOut">
    <wsdl:part name="Body" element="tns:Contact" />
  </wsdl:message>
  <wsdl:message name="ValidateLead_V2HttpGetIn">
    <wsdl:part name="Name" type="s:string" />
    <wsdl:part name="BusinessName" type="s:string" />
    <wsdl:part name="Address1" type="s:string" />
    <wsdl:part name="Address2" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="State" type="s:string" />
    <wsdl:part name="Zip" type="s:string" />
    <wsdl:part name="Country" type="s:string" />
    <wsdl:part name="Phone1" type="s:string" />
    <wsdl:part name="Phone2" type="s:string" />
    <wsdl:part name="Email" type="s:string" />
    <wsdl:part name="IP" type="s:string" />
    <wsdl:part name="Gender" type="s:string" />
    <wsdl:part name="DateOfBirth" type="s:string" />
    <wsdl:part name="UTCCaptureTime" type="s:string" />
    <wsdl:part name="TestType" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ValidateLead_V2HttpGetOut">
    <wsdl:part name="Body" element="tns:Contact_V2" />
  </wsdl:message>
  <wsdl:message name="ValidateLeadHttpPostIn">
    <wsdl:part name="Name" type="s:string" />
    <wsdl:part name="Address1" type="s:string" />
    <wsdl:part name="Address2" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="State" type="s:string" />
    <wsdl:part name="Zip" type="s:string" />
    <wsdl:part name="Country" type="s:string" />
    <wsdl:part name="Phone1" type="s:string" />
    <wsdl:part name="Phone2" type="s:string" />
    <wsdl:part name="Email" type="s:string" />
    <wsdl:part name="IP" type="s:string" />
    <wsdl:part name="TestType" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ValidateLeadHttpPostOut">
    <wsdl:part name="Body" element="tns:Contact" />
  </wsdl:message>
  <wsdl:message name="ValidateLead_V2HttpPostIn">
    <wsdl:part name="Name" type="s:string" />
    <wsdl:part name="BusinessName" type="s:string" />
    <wsdl:part name="Address1" type="s:string" />
    <wsdl:part name="Address2" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="State" type="s:string" />
    <wsdl:part name="Zip" type="s:string" />
    <wsdl:part name="Country" type="s:string" />
    <wsdl:part name="Phone1" type="s:string" />
    <wsdl:part name="Phone2" type="s:string" />
    <wsdl:part name="Email" type="s:string" />
    <wsdl:part name="IP" type="s:string" />
    <wsdl:part name="Gender" type="s:string" />
    <wsdl:part name="DateOfBirth" type="s:string" />
    <wsdl:part name="UTCCaptureTime" type="s:string" />
    <wsdl:part name="TestType" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ValidateLead_V2HttpPostOut">
    <wsdl:part name="Body" element="tns:Contact_V2" />
  </wsdl:message>
  <wsdl:portType name="DOTSLeadValidationSoap">
    <wsdl:operation name="ValidateLead">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This operation is still supported for legacy users. Not recommended for new applications.</wsdl:documentation>
      <wsdl:input message="tns:ValidateLeadSoapIn" />
      <wsdl:output message="tns:ValidateLeadSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="ValidateLead_V2">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This operation validates business and residential leads using new datasets and the latest validation algorithms.  This is the recommend operation for DOTS Lead Validation.</wsdl:documentation>
      <wsdl:input message="tns:ValidateLead_V2SoapIn" />
      <wsdl:output message="tns:ValidateLead_V2SoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="DOTSLeadValidationHttpGet">
    <wsdl:operation name="ValidateLead">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This operation is still supported for legacy users. Not recommended for new applications.</wsdl:documentation>
      <wsdl:input message="tns:ValidateLeadHttpGetIn" />
      <wsdl:output message="tns:ValidateLeadHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="ValidateLead_V2">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This operation validates business and residential leads using new datasets and the latest validation algorithms.  This is the recommend operation for DOTS Lead Validation.</wsdl:documentation>
      <wsdl:input message="tns:ValidateLead_V2HttpGetIn" />
      <wsdl:output message="tns:ValidateLead_V2HttpGetOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="DOTSLeadValidationHttpPost">
    <wsdl:operation name="ValidateLead">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This operation is still supported for legacy users. Not recommended for new applications.</wsdl:documentation>
      <wsdl:input message="tns:ValidateLeadHttpPostIn" />
      <wsdl:output message="tns:ValidateLeadHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="ValidateLead_V2">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This operation validates business and residential leads using new datasets and the latest validation algorithms.  This is the recommend operation for DOTS Lead Validation.</wsdl:documentation>
      <wsdl:input message="tns:ValidateLead_V2HttpPostIn" />
      <wsdl:output message="tns:ValidateLead_V2HttpPostOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="DOTSLeadValidationSoap" type="tns:DOTSLeadValidationSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="ValidateLead">
      <soap:operation soapAction="http://www.serviceobjects.com/ValidateLead" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ValidateLead_V2">
      <soap:operation soapAction="http://www.serviceobjects.com/ValidateLead_V2" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="DOTSLeadValidationSoap12" type="tns:DOTSLeadValidationSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="ValidateLead">
      <soap12:operation soapAction="http://www.serviceobjects.com/ValidateLead" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ValidateLead_V2">
      <soap12:operation soapAction="http://www.serviceobjects.com/ValidateLead_V2" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="DOTSLeadValidationHttpGet" type="tns:DOTSLeadValidationHttpGet">
    <http:binding verb="GET" />
    <wsdl:operation name="ValidateLead">
      <http:operation location="/ValidateLead" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ValidateLead_V2">
      <http:operation location="/ValidateLead_V2" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="DOTSLeadValidationHttpPost" type="tns:DOTSLeadValidationHttpPost">
    <http:binding verb="POST" />
    <wsdl:operation name="ValidateLead">
      <http:operation location="/ValidateLead" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ValidateLead_V2">
      <http:operation location="/ValidateLead_V2" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="DOTSLeadValidation">
    <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">For more information on our web services, visit us at &lt;a href='http://www.serviceobjects.com/products/default.asp' target='new'&gt;our website&lt;/a&gt;&lt;br/&gt;&lt;br/&gt;&lt;a href='http://www.serviceobjects.com' target='new'&gt;&lt;img src='http://www.serviceobjects.com/images/so_logo_2_inside.gif' border='0'/&gt;&lt;/a&gt;</wsdl:documentation>
    <wsdl:port name="DOTSLeadValidationSoap" binding="tns:DOTSLeadValidationSoap">
      <soap:address location="http://trial.serviceobjects.com/lv/leadvalidation.asmx" />
    </wsdl:port>
    <wsdl:port name="DOTSLeadValidationSoap12" binding="tns:DOTSLeadValidationSoap12">
      <soap12:address location="http://trial.serviceobjects.com/lv/leadvalidation.asmx" />
    </wsdl:port>
    <wsdl:port name="DOTSLeadValidationHttpGet" binding="tns:DOTSLeadValidationHttpGet">
      <http:address location="http://trial.serviceobjects.com/lv/leadvalidation.asmx" />
    </wsdl:port>
    <wsdl:port name="DOTSLeadValidationHttpPost" binding="tns:DOTSLeadValidationHttpPost">
      <http:address location="http://trial.serviceobjects.com/lv/leadvalidation.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>