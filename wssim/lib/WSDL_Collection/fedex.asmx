<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://service.ecocoma.com/shipping/fedex" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" targetNamespace="http://service.ecocoma.com/shipping/fedex" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Cocoma FedEx Shipping Web Services.</wsdl:documentation>
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://service.ecocoma.com/shipping/fedex">
      <s:element name="GetFedExRate">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="KeyID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="DomainID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="SenderPostalCode" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="SenderCountryCode" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="RecipientPostalCode" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="RecipientCountryCode" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="TotalPackageWeight" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="DeclaredValue" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetFedExRateResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetFedExRateResult" type="tns:Shipping" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="Shipping">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Package" type="tns:ArrayOfPostage" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfPostage">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="Postage" nillable="true" type="tns:Postage" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="Postage">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Code" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="MailService" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Rate" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetExtendedFedExRate">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="KeyID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="DomainID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="SenderPostalCode" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="SenderCountryCode" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="RecipientPostalCode" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="RecipientCountryCode" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="TotalPackageWeight" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="DeclaredValue" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="options" type="tns:Options" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="Options">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="ResidentialDeliveryFlag" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CarrierCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ShipDate" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="DropOffType" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="PackagingType" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="SaturdayDeliveryFlag" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="DryIceFlag" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CourierPickup" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="DangerousGoodsType" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="SignatureOption" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ReturnsShipmentIndicator" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="DimHeight" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="DimWidth" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="DimLength" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CODFlag" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Mode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Sort" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetExtendedFedExRateResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetExtendedFedExRateResult" type="tns:Shipping" />
          </s:sequence>
        </s:complexType>
      </s:element>
    </s:schema>
  </wsdl:types>
  <wsdl:message name="GetFedExRateSoapIn">
    <wsdl:part name="parameters" element="tns:GetFedExRate" />
  </wsdl:message>
  <wsdl:message name="GetFedExRateSoapOut">
    <wsdl:part name="parameters" element="tns:GetFedExRateResponse" />
  </wsdl:message>
  <wsdl:message name="GetExtendedFedExRateSoapIn">
    <wsdl:part name="parameters" element="tns:GetExtendedFedExRate" />
  </wsdl:message>
  <wsdl:message name="GetExtendedFedExRateSoapOut">
    <wsdl:part name="parameters" element="tns:GetExtendedFedExRateResponse" />
  </wsdl:message>
  <wsdl:portType name="FedEx_ServiceSoap">
    <wsdl:operation name="GetFedExRate">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Get FedEx shipping rate.</wsdl:documentation>
      <wsdl:input message="tns:GetFedExRateSoapIn" />
      <wsdl:output message="tns:GetFedExRateSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetExtendedFedExRate">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Get extended FedEx shipping rate.</wsdl:documentation>
      <wsdl:input message="tns:GetExtendedFedExRateSoapIn" />
      <wsdl:output message="tns:GetExtendedFedExRateSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="FedEx_ServiceSoap" type="tns:FedEx_ServiceSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetFedExRate">
      <soap:operation soapAction="http://service.ecocoma.com/shipping/fedex/GetFedExRate" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetExtendedFedExRate">
      <soap:operation soapAction="http://service.ecocoma.com/shipping/fedex/GetExtendedFedExRate" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="FedEx_ServiceSoap12" type="tns:FedEx_ServiceSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetFedExRate">
      <soap12:operation soapAction="http://service.ecocoma.com/shipping/fedex/GetFedExRate" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetExtendedFedExRate">
      <soap12:operation soapAction="http://service.ecocoma.com/shipping/fedex/GetExtendedFedExRate" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="FedEx_Service">
    <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Cocoma FedEx Shipping Web Services.</wsdl:documentation>
    <wsdl:port name="FedEx_ServiceSoap" binding="tns:FedEx_ServiceSoap">
      <soap:address location="http://service.ecocoma.com/shipping/fedex.asmx" />
    </wsdl:port>
    <wsdl:port name="FedEx_ServiceSoap12" binding="tns:FedEx_ServiceSoap12">
      <soap12:address location="http://service.ecocoma.com/shipping/fedex.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>