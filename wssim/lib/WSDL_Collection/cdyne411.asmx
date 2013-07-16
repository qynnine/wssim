<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://ws.cdyne.com/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" targetNamespace="http://ws.cdyne.com/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://ws.cdyne.com/">
      <s:element name="FindPerson">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="LastName" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="FirstName" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="City" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="State" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Zip" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="FindPersonResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="FindPersonResult" type="tns:DirectoryResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="DirectoryResult">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Status" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="Count" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="Items" type="tns:ArrayOfDirectoryRecord" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfDirectoryRecord">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="DirectoryRecord" nillable="true" type="tns:DirectoryRecord" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="DirectoryRecord">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="FirstName" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="LastName" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="BusinessName" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="PrimaryNumber" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Street" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="City" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="State" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Zip" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Phone" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="FindBusiness">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="BusinessName" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="City" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="State" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Zip" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="FindBusinessResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="FindBusinessResult" type="tns:DirectoryResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="FindNeighbor">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="FullAddress" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="City" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="State" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Zip" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="FindNeighborResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="FindNeighborResult" type="tns:DirectoryResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ReverseAddress">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="FullAddress" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="City" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="State" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Zip" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ReverseAddressResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ReverseAddressResult" type="tns:DirectoryResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ReversePhone">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="PhoneNumber" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="AreaCode" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="State" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ReversePhoneResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ReversePhoneResult" type="tns:DirectoryResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="DirectoryResult" nillable="true" type="tns:DirectoryResult" />
    </s:schema>
  </wsdl:types>
  <wsdl:message name="FindPersonSoapIn">
    <wsdl:part name="parameters" element="tns:FindPerson" />
  </wsdl:message>
  <wsdl:message name="FindPersonSoapOut">
    <wsdl:part name="parameters" element="tns:FindPersonResponse" />
  </wsdl:message>
  <wsdl:message name="FindBusinessSoapIn">
    <wsdl:part name="parameters" element="tns:FindBusiness" />
  </wsdl:message>
  <wsdl:message name="FindBusinessSoapOut">
    <wsdl:part name="parameters" element="tns:FindBusinessResponse" />
  </wsdl:message>
  <wsdl:message name="FindNeighborSoapIn">
    <wsdl:part name="parameters" element="tns:FindNeighbor" />
  </wsdl:message>
  <wsdl:message name="FindNeighborSoapOut">
    <wsdl:part name="parameters" element="tns:FindNeighborResponse" />
  </wsdl:message>
  <wsdl:message name="ReverseAddressSoapIn">
    <wsdl:part name="parameters" element="tns:ReverseAddress" />
  </wsdl:message>
  <wsdl:message name="ReverseAddressSoapOut">
    <wsdl:part name="parameters" element="tns:ReverseAddressResponse" />
  </wsdl:message>
  <wsdl:message name="ReversePhoneSoapIn">
    <wsdl:part name="parameters" element="tns:ReversePhone" />
  </wsdl:message>
  <wsdl:message name="ReversePhoneSoapOut">
    <wsdl:part name="parameters" element="tns:ReversePhoneResponse" />
  </wsdl:message>
  <wsdl:message name="FindPersonHttpGetIn">
    <wsdl:part name="LastName" type="s:string" />
    <wsdl:part name="FirstName" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="State" type="s:string" />
    <wsdl:part name="Zip" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="FindPersonHttpGetOut">
    <wsdl:part name="Body" element="tns:DirectoryResult" />
  </wsdl:message>
  <wsdl:message name="FindBusinessHttpGetIn">
    <wsdl:part name="BusinessName" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="State" type="s:string" />
    <wsdl:part name="Zip" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="FindBusinessHttpGetOut">
    <wsdl:part name="Body" element="tns:DirectoryResult" />
  </wsdl:message>
  <wsdl:message name="FindNeighborHttpGetIn">
    <wsdl:part name="FullAddress" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="State" type="s:string" />
    <wsdl:part name="Zip" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="FindNeighborHttpGetOut">
    <wsdl:part name="Body" element="tns:DirectoryResult" />
  </wsdl:message>
  <wsdl:message name="ReverseAddressHttpGetIn">
    <wsdl:part name="FullAddress" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="State" type="s:string" />
    <wsdl:part name="Zip" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ReverseAddressHttpGetOut">
    <wsdl:part name="Body" element="tns:DirectoryResult" />
  </wsdl:message>
  <wsdl:message name="ReversePhoneHttpGetIn">
    <wsdl:part name="PhoneNumber" type="s:string" />
    <wsdl:part name="AreaCode" type="s:string" />
    <wsdl:part name="State" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ReversePhoneHttpGetOut">
    <wsdl:part name="Body" element="tns:DirectoryResult" />
  </wsdl:message>
  <wsdl:message name="FindPersonHttpPostIn">
    <wsdl:part name="LastName" type="s:string" />
    <wsdl:part name="FirstName" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="State" type="s:string" />
    <wsdl:part name="Zip" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="FindPersonHttpPostOut">
    <wsdl:part name="Body" element="tns:DirectoryResult" />
  </wsdl:message>
  <wsdl:message name="FindBusinessHttpPostIn">
    <wsdl:part name="BusinessName" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="State" type="s:string" />
    <wsdl:part name="Zip" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="FindBusinessHttpPostOut">
    <wsdl:part name="Body" element="tns:DirectoryResult" />
  </wsdl:message>
  <wsdl:message name="FindNeighborHttpPostIn">
    <wsdl:part name="FullAddress" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="State" type="s:string" />
    <wsdl:part name="Zip" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="FindNeighborHttpPostOut">
    <wsdl:part name="Body" element="tns:DirectoryResult" />
  </wsdl:message>
  <wsdl:message name="ReverseAddressHttpPostIn">
    <wsdl:part name="FullAddress" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="State" type="s:string" />
    <wsdl:part name="Zip" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ReverseAddressHttpPostOut">
    <wsdl:part name="Body" element="tns:DirectoryResult" />
  </wsdl:message>
  <wsdl:message name="ReversePhoneHttpPostIn">
    <wsdl:part name="PhoneNumber" type="s:string" />
    <wsdl:part name="AreaCode" type="s:string" />
    <wsdl:part name="State" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ReversePhoneHttpPostOut">
    <wsdl:part name="Body" element="tns:DirectoryResult" />
  </wsdl:message>
  <wsdl:portType name="Cdyne411Soap">
    <wsdl:operation name="FindPerson">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Find Person Search&lt;br/&gt;&lt;b&gt;Required:&lt;/b&gt; Last Name&lt;br/&gt;&lt;b&gt;Optional:&lt;/b&gt; First Name, City, State/Province, ZIP/Postal Code</wsdl:documentation>
      <wsdl:input message="tns:FindPersonSoapIn" />
      <wsdl:output message="tns:FindPersonSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="FindBusiness">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Find Business Search&lt;br/&gt;&lt;b&gt;Required:&lt;/b&gt; Business Name or Business Keyword or Business Category ID&lt;br/&gt;&lt;b&gt;Optional:&lt;/b&gt; First Name, City, State/Province, ZIP/Postal Code</wsdl:documentation>
      <wsdl:input message="tns:FindBusinessSoapIn" />
      <wsdl:output message="tns:FindBusinessSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="FindNeighbor">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Find Neighbor Search.&lt;br/&gt;&lt;b&gt;Required:&lt;/b&gt;	FullAddress, State/Province, &lt;br/&gt;&lt;b&gt;Optional:&lt;/b&gt;	City, ZIP/Postal Code</wsdl:documentation>
      <wsdl:input message="tns:FindNeighborSoapIn" />
      <wsdl:output message="tns:FindNeighborSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="ReverseAddress">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Reversed Address Search.&lt;br/&gt;&lt;b&gt;Required:&lt;/b&gt;	FullAddress, State/Province, &lt;br/&gt;&lt;b&gt;Optional:&lt;/b&gt;	City, ZIP/Postal Code</wsdl:documentation>
      <wsdl:input message="tns:ReverseAddressSoapIn" />
      <wsdl:output message="tns:ReverseAddressSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="ReversePhone">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Reverse Phone Search.&lt;br/&gt;&lt;b&gt;Required:&lt;/b&gt;	10 digit Phone or 7 digit Phone &amp; Area Code or 7 digit Phone &amp; State/Province&lt;br/&gt;&lt;b&gt;Optional:&lt;/b&gt;	Toll Free Search: 7 digit Phone &amp; State/Province = TF</wsdl:documentation>
      <wsdl:input message="tns:ReversePhoneSoapIn" />
      <wsdl:output message="tns:ReversePhoneSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="Cdyne411HttpGet">
    <wsdl:operation name="FindPerson">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Find Person Search&lt;br/&gt;&lt;b&gt;Required:&lt;/b&gt; Last Name&lt;br/&gt;&lt;b&gt;Optional:&lt;/b&gt; First Name, City, State/Province, ZIP/Postal Code</wsdl:documentation>
      <wsdl:input message="tns:FindPersonHttpGetIn" />
      <wsdl:output message="tns:FindPersonHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="FindBusiness">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Find Business Search&lt;br/&gt;&lt;b&gt;Required:&lt;/b&gt; Business Name or Business Keyword or Business Category ID&lt;br/&gt;&lt;b&gt;Optional:&lt;/b&gt; First Name, City, State/Province, ZIP/Postal Code</wsdl:documentation>
      <wsdl:input message="tns:FindBusinessHttpGetIn" />
      <wsdl:output message="tns:FindBusinessHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="FindNeighbor">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Find Neighbor Search.&lt;br/&gt;&lt;b&gt;Required:&lt;/b&gt;	FullAddress, State/Province, &lt;br/&gt;&lt;b&gt;Optional:&lt;/b&gt;	City, ZIP/Postal Code</wsdl:documentation>
      <wsdl:input message="tns:FindNeighborHttpGetIn" />
      <wsdl:output message="tns:FindNeighborHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="ReverseAddress">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Reversed Address Search.&lt;br/&gt;&lt;b&gt;Required:&lt;/b&gt;	FullAddress, State/Province, &lt;br/&gt;&lt;b&gt;Optional:&lt;/b&gt;	City, ZIP/Postal Code</wsdl:documentation>
      <wsdl:input message="tns:ReverseAddressHttpGetIn" />
      <wsdl:output message="tns:ReverseAddressHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="ReversePhone">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Reverse Phone Search.&lt;br/&gt;&lt;b&gt;Required:&lt;/b&gt;	10 digit Phone or 7 digit Phone &amp; Area Code or 7 digit Phone &amp; State/Province&lt;br/&gt;&lt;b&gt;Optional:&lt;/b&gt;	Toll Free Search: 7 digit Phone &amp; State/Province = TF</wsdl:documentation>
      <wsdl:input message="tns:ReversePhoneHttpGetIn" />
      <wsdl:output message="tns:ReversePhoneHttpGetOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="Cdyne411HttpPost">
    <wsdl:operation name="FindPerson">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Find Person Search&lt;br/&gt;&lt;b&gt;Required:&lt;/b&gt; Last Name&lt;br/&gt;&lt;b&gt;Optional:&lt;/b&gt; First Name, City, State/Province, ZIP/Postal Code</wsdl:documentation>
      <wsdl:input message="tns:FindPersonHttpPostIn" />
      <wsdl:output message="tns:FindPersonHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="FindBusiness">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Find Business Search&lt;br/&gt;&lt;b&gt;Required:&lt;/b&gt; Business Name or Business Keyword or Business Category ID&lt;br/&gt;&lt;b&gt;Optional:&lt;/b&gt; First Name, City, State/Province, ZIP/Postal Code</wsdl:documentation>
      <wsdl:input message="tns:FindBusinessHttpPostIn" />
      <wsdl:output message="tns:FindBusinessHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="FindNeighbor">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Find Neighbor Search.&lt;br/&gt;&lt;b&gt;Required:&lt;/b&gt;	FullAddress, State/Province, &lt;br/&gt;&lt;b&gt;Optional:&lt;/b&gt;	City, ZIP/Postal Code</wsdl:documentation>
      <wsdl:input message="tns:FindNeighborHttpPostIn" />
      <wsdl:output message="tns:FindNeighborHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="ReverseAddress">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Reversed Address Search.&lt;br/&gt;&lt;b&gt;Required:&lt;/b&gt;	FullAddress, State/Province, &lt;br/&gt;&lt;b&gt;Optional:&lt;/b&gt;	City, ZIP/Postal Code</wsdl:documentation>
      <wsdl:input message="tns:ReverseAddressHttpPostIn" />
      <wsdl:output message="tns:ReverseAddressHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="ReversePhone">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Reverse Phone Search.&lt;br/&gt;&lt;b&gt;Required:&lt;/b&gt;	10 digit Phone or 7 digit Phone &amp; Area Code or 7 digit Phone &amp; State/Province&lt;br/&gt;&lt;b&gt;Optional:&lt;/b&gt;	Toll Free Search: 7 digit Phone &amp; State/Province = TF</wsdl:documentation>
      <wsdl:input message="tns:ReversePhoneHttpPostIn" />
      <wsdl:output message="tns:ReversePhoneHttpPostOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="Cdyne411Soap" type="tns:Cdyne411Soap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="FindPerson">
      <soap:operation soapAction="http://ws.cdyne.com/FindPerson" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="FindBusiness">
      <soap:operation soapAction="http://ws.cdyne.com/FindBusiness" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="FindNeighbor">
      <soap:operation soapAction="http://ws.cdyne.com/FindNeighbor" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReverseAddress">
      <soap:operation soapAction="http://ws.cdyne.com/ReverseAddress" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReversePhone">
      <soap:operation soapAction="http://ws.cdyne.com/ReversePhone" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="Cdyne411Soap12" type="tns:Cdyne411Soap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="FindPerson">
      <soap12:operation soapAction="http://ws.cdyne.com/FindPerson" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="FindBusiness">
      <soap12:operation soapAction="http://ws.cdyne.com/FindBusiness" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="FindNeighbor">
      <soap12:operation soapAction="http://ws.cdyne.com/FindNeighbor" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReverseAddress">
      <soap12:operation soapAction="http://ws.cdyne.com/ReverseAddress" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReversePhone">
      <soap12:operation soapAction="http://ws.cdyne.com/ReversePhone" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="Cdyne411HttpGet" type="tns:Cdyne411HttpGet">
    <http:binding verb="GET" />
    <wsdl:operation name="FindPerson">
      <http:operation location="/FindPerson" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="FindBusiness">
      <http:operation location="/FindBusiness" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="FindNeighbor">
      <http:operation location="/FindNeighbor" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReverseAddress">
      <http:operation location="/ReverseAddress" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReversePhone">
      <http:operation location="/ReversePhone" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="Cdyne411HttpPost" type="tns:Cdyne411HttpPost">
    <http:binding verb="POST" />
    <wsdl:operation name="FindPerson">
      <http:operation location="/FindPerson" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="FindBusiness">
      <http:operation location="/FindBusiness" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="FindNeighbor">
      <http:operation location="/FindNeighbor" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReverseAddress">
      <http:operation location="/ReverseAddress" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ReversePhone">
      <http:operation location="/ReversePhone" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="Cdyne411">
    <wsdl:port name="Cdyne411Soap" binding="tns:Cdyne411Soap">
      <soap:address location="http://ws.cdyne.com/cdyne411ws/cdyne411.asmx" />
    </wsdl:port>
    <wsdl:port name="Cdyne411Soap12" binding="tns:Cdyne411Soap12">
      <soap12:address location="http://ws.cdyne.com/cdyne411ws/cdyne411.asmx" />
    </wsdl:port>
    <wsdl:port name="Cdyne411HttpGet" binding="tns:Cdyne411HttpGet">
      <http:address location="http://ws.cdyne.com/cdyne411ws/cdyne411.asmx" />
    </wsdl:port>
    <wsdl:port name="Cdyne411HttpPost" binding="tns:Cdyne411HttpPost">
      <http:address location="http://ws.cdyne.com/cdyne411ws/cdyne411.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>