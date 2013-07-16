<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tns="http://www.serviceobjects.com/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" targetNamespace="http://www.serviceobjects.com/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://www.serviceobjects.com/">
      <s:element name="GetGeoLocation">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="Address" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Municipality" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Province" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="PostalCode" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetGeoLocationResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetGeoLocationResult" type="tns:Location" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="Location">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Error" type="tns:Err" />
          <s:element minOccurs="0" maxOccurs="1" name="Latitude" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Longitude" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="PostalCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="MatchCode" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="Err">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Desc" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Number" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Location" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetGeoLocationByMunicipalityProvince">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="Municipality" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Province" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetGeoLocationByMunicipalityProvinceResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetGeoLocationByMunicipalityProvinceResult" type="tns:Location" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetPostalCodeInfo">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="PostalCode" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetPostalCodeInfoResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetPostalCodeInfoResult" type="tns:PostalCodeInfo" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="PostalCodeInfo">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Error" type="tns:Err" />
          <s:element minOccurs="0" maxOccurs="1" name="Latitude" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Longitude" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="PostalCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="TimeZone" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="DST" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="AreaCode" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="City" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CityPopulation" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Province" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ProvinceAbbreviation" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="DMA" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="Location" nillable="true" type="tns:Location" />
      <s:element name="PostalCodeInfo" nillable="true" type="tns:PostalCodeInfo" />
    </s:schema>
  </wsdl:types>
  <wsdl:message name="GetGeoLocationSoapIn">
    <wsdl:part name="parameters" element="tns:GetGeoLocation" />
  </wsdl:message>
  <wsdl:message name="GetGeoLocationSoapOut">
    <wsdl:part name="parameters" element="tns:GetGeoLocationResponse" />
  </wsdl:message>
  <wsdl:message name="GetGeoLocationByMunicipalityProvinceSoapIn">
    <wsdl:part name="parameters" element="tns:GetGeoLocationByMunicipalityProvince" />
  </wsdl:message>
  <wsdl:message name="GetGeoLocationByMunicipalityProvinceSoapOut">
    <wsdl:part name="parameters" element="tns:GetGeoLocationByMunicipalityProvinceResponse" />
  </wsdl:message>
  <wsdl:message name="GetPostalCodeInfoSoapIn">
    <wsdl:part name="parameters" element="tns:GetPostalCodeInfo" />
  </wsdl:message>
  <wsdl:message name="GetPostalCodeInfoSoapOut">
    <wsdl:part name="parameters" element="tns:GetPostalCodeInfoResponse" />
  </wsdl:message>
  <wsdl:message name="GetGeoLocationHttpGetIn">
    <wsdl:part name="Address" type="s:string" />
    <wsdl:part name="Municipality" type="s:string" />
    <wsdl:part name="Province" type="s:string" />
    <wsdl:part name="PostalCode" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetGeoLocationHttpGetOut">
    <wsdl:part name="Body" element="tns:Location" />
  </wsdl:message>
  <wsdl:message name="GetGeoLocationByMunicipalityProvinceHttpGetIn">
    <wsdl:part name="Municipality" type="s:string" />
    <wsdl:part name="Province" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetGeoLocationByMunicipalityProvinceHttpGetOut">
    <wsdl:part name="Body" element="tns:Location" />
  </wsdl:message>
  <wsdl:message name="GetPostalCodeInfoHttpGetIn">
    <wsdl:part name="PostalCode" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetPostalCodeInfoHttpGetOut">
    <wsdl:part name="Body" element="tns:PostalCodeInfo" />
  </wsdl:message>
  <wsdl:message name="GetGeoLocationHttpPostIn">
    <wsdl:part name="Address" type="s:string" />
    <wsdl:part name="Municipality" type="s:string" />
    <wsdl:part name="Province" type="s:string" />
    <wsdl:part name="PostalCode" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetGeoLocationHttpPostOut">
    <wsdl:part name="Body" element="tns:Location" />
  </wsdl:message>
  <wsdl:message name="GetGeoLocationByMunicipalityProvinceHttpPostIn">
    <wsdl:part name="Municipality" type="s:string" />
    <wsdl:part name="Province" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetGeoLocationByMunicipalityProvinceHttpPostOut">
    <wsdl:part name="Body" element="tns:Location" />
  </wsdl:message>
  <wsdl:message name="GetPostalCodeInfoHttpPostIn">
    <wsdl:part name="PostalCode" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetPostalCodeInfoHttpPostOut">
    <wsdl:part name="Body" element="tns:PostalCodeInfo" />
  </wsdl:message>
  <wsdl:portType name="DOTSGeoCoderCanadaSoap">
    <wsdl:operation name="GetGeoLocation">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Returns latitude/longitude information for a given Canadian postal address.</documentation>
      <wsdl:input message="tns:GetGeoLocationSoapIn" />
      <wsdl:output message="tns:GetGeoLocationSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetGeoLocationByMunicipalityProvince">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Returns latitude/longitude information for a given Canadian city and province.</documentation>
      <wsdl:input message="tns:GetGeoLocationByMunicipalityProvinceSoapIn" />
      <wsdl:output message="tns:GetGeoLocationByMunicipalityProvinceSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetPostalCodeInfo">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Returns location and demographic information for a given Canadian postal code.</documentation>
      <wsdl:input message="tns:GetPostalCodeInfoSoapIn" />
      <wsdl:output message="tns:GetPostalCodeInfoSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="DOTSGeoCoderCanadaHttpGet">
    <wsdl:operation name="GetGeoLocation">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Returns latitude/longitude information for a given Canadian postal address.</documentation>
      <wsdl:input message="tns:GetGeoLocationHttpGetIn" />
      <wsdl:output message="tns:GetGeoLocationHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetGeoLocationByMunicipalityProvince">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Returns latitude/longitude information for a given Canadian city and province.</documentation>
      <wsdl:input message="tns:GetGeoLocationByMunicipalityProvinceHttpGetIn" />
      <wsdl:output message="tns:GetGeoLocationByMunicipalityProvinceHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetPostalCodeInfo">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Returns location and demographic information for a given Canadian postal code.</documentation>
      <wsdl:input message="tns:GetPostalCodeInfoHttpGetIn" />
      <wsdl:output message="tns:GetPostalCodeInfoHttpGetOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="DOTSGeoCoderCanadaHttpPost">
    <wsdl:operation name="GetGeoLocation">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Returns latitude/longitude information for a given Canadian postal address.</documentation>
      <wsdl:input message="tns:GetGeoLocationHttpPostIn" />
      <wsdl:output message="tns:GetGeoLocationHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetGeoLocationByMunicipalityProvince">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Returns latitude/longitude information for a given Canadian city and province.</documentation>
      <wsdl:input message="tns:GetGeoLocationByMunicipalityProvinceHttpPostIn" />
      <wsdl:output message="tns:GetGeoLocationByMunicipalityProvinceHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetPostalCodeInfo">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Returns location and demographic information for a given Canadian postal code.</documentation>
      <wsdl:input message="tns:GetPostalCodeInfoHttpPostIn" />
      <wsdl:output message="tns:GetPostalCodeInfoHttpPostOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="DOTSGeoCoderCanadaSoap" type="tns:DOTSGeoCoderCanadaSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" style="document" />
    <wsdl:operation name="GetGeoLocation">
      <soap:operation soapAction="http://www.serviceobjects.com/GetGeoLocation" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetGeoLocationByMunicipalityProvince">
      <soap:operation soapAction="http://www.serviceobjects.com/GetGeoLocationByMunicipalityProvince" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetPostalCodeInfo">
      <soap:operation soapAction="http://www.serviceobjects.com/GetPostalCodeInfo" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="DOTSGeoCoderCanadaHttpGet" type="tns:DOTSGeoCoderCanadaHttpGet">
    <http:binding verb="GET" />
    <wsdl:operation name="GetGeoLocation">
      <http:operation location="/GetGeoLocation" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetGeoLocationByMunicipalityProvince">
      <http:operation location="/GetGeoLocationByMunicipalityProvince" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetPostalCodeInfo">
      <http:operation location="/GetPostalCodeInfo" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="DOTSGeoCoderCanadaHttpPost" type="tns:DOTSGeoCoderCanadaHttpPost">
    <http:binding verb="POST" />
    <wsdl:operation name="GetGeoLocation">
      <http:operation location="/GetGeoLocation" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetGeoLocationByMunicipalityProvince">
      <http:operation location="/GetGeoLocationByMunicipalityProvince" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetPostalCodeInfo">
      <http:operation location="/GetPostalCodeInfo" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="DOTSGeoCoderCanada">
    <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">For more information on our web services, visit us at &lt;a href='http://www.serviceobjects.com/products/default.asp' target='new'&gt;our website&lt;/a&gt;&lt;br/&gt;&lt;br/&gt;&lt;a href='http://www.serviceobjects.com' target='new'&gt;&lt;img src='http://www.serviceobjects.com/images/so_logo_2_inside.gif' border='0'/&gt;&lt;/a&gt;</documentation>
    <wsdl:port name="DOTSGeoCoderCanadaSoap" binding="tns:DOTSGeoCoderCanadaSoap">
      <soap:address location="http://trial.serviceobjects.com/gcc/GeoCoderCanada.asmx" />
    </wsdl:port>
    <wsdl:port name="DOTSGeoCoderCanadaHttpGet" binding="tns:DOTSGeoCoderCanadaHttpGet">
      <http:address location="http://trial.serviceobjects.com/gcc/GeoCoderCanada.asmx" />
    </wsdl:port>
    <wsdl:port name="DOTSGeoCoderCanadaHttpPost" binding="tns:DOTSGeoCoderCanadaHttpPost">
      <http:address location="http://trial.serviceobjects.com/gcc/GeoCoderCanada.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>