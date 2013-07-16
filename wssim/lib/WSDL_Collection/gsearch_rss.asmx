<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://www.ecubicle.net/webservices" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" targetNamespace="http://www.ecubicle.net/webservices" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://www.ecubicle.net/webservices">
      <s:element name="GetSearchResults">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="searchPage" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="gQuery" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="numOfResults" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSearchResultsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetSearchResultsResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any />
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
    </s:schema>
  </wsdl:types>
  <wsdl:message name="GetSearchResultsSoapIn">
    <wsdl:part name="parameters" element="tns:GetSearchResults" />
  </wsdl:message>
  <wsdl:message name="GetSearchResultsSoapOut">
    <wsdl:part name="parameters" element="tns:GetSearchResultsResponse" />
  </wsdl:message>
  <wsdl:portType name="gsearch_rssSoap">
    <wsdl:operation name="GetSearchResults">
      <wsdl:input message="tns:GetSearchResultsSoapIn" />
      <wsdl:output message="tns:GetSearchResultsSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="gsearch_rssSoap" type="tns:gsearch_rssSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetSearchResults">
      <soap:operation soapAction="http://www.ecubicle.net/webservices/GetSearchResults" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="gsearch_rssSoap12" type="tns:gsearch_rssSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetSearchResults">
      <soap12:operation soapAction="http://www.ecubicle.net/webservices/GetSearchResults" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="gsearch_rss">
    <wsdl:port name="gsearch_rssSoap" binding="tns:gsearch_rssSoap">
      <soap:address location="http://www.ecubicle.net/gsearch_rss.asmx" />
    </wsdl:port>
    <wsdl:port name="gsearch_rssSoap12" binding="tns:gsearch_rssSoap12">
      <soap12:address location="http://www.ecubicle.net/gsearch_rss.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>