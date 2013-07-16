<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://ws.cdyne.com/DemographixWS" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" targetNamespace="http://ws.cdyne.com/DemographixWS" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">CDYNE’s Demographics® is a neighborhood level segmentation system built using various data sources in one combined database. By classifying all U.S. neighborhoods according to consumers’ different stages of life and related income levels, it provides a current, accurate and consistent framework to view customers at a neighborhood level. It enables users to compare customers across their product mix, across time and across their enterprise. With high coverage, Demographix also enables users to see differences in how U.S. neighborhoods spend time and money. This turns raw data about customers into accurate, actionable information.  Use a Licensekey of 0 for testing.</wsdl:documentation>
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://ws.cdyne.com/DemographixWS">
      <s:element name="GetLocationInformationByLatitudeLongitude">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="Latitude" type="s:decimal" />
            <s:element minOccurs="1" maxOccurs="1" name="Longitude" type="s:decimal" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetLocationInformationByLatitudeLongitudeResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetLocationInformationByLatitudeLongitudeResult" type="tns:SummaryInformation" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="SummaryInformation">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="PlaceInformation" type="tns:PlaceInformationCls" />
          <s:element minOccurs="1" maxOccurs="1" name="Error" type="s:boolean" />
          <s:element minOccurs="0" maxOccurs="1" name="ErrorString" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="MedianAge" type="s:unsignedByte" />
          <s:element minOccurs="1" maxOccurs="1" name="MedianIncome" type="s:int" />
          <s:element minOccurs="1" maxOccurs="1" name="MedianRoomsInHouse" type="s:unsignedByte" />
          <s:element minOccurs="1" maxOccurs="1" name="MedianHouseValue" type="s:int" />
          <s:element minOccurs="1" maxOccurs="1" name="MedianVehicles" type="s:unsignedByte" />
          <s:element minOccurs="0" maxOccurs="1" name="MaritalStatusPercentages" type="tns:MaritalStatusPercentagesCls" />
          <s:element minOccurs="0" maxOccurs="1" name="RacePercentages" type="tns:RacePercentagesCls" />
          <s:element minOccurs="0" maxOccurs="1" name="GenderPercentages" type="tns:GenderPercentagesCls" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="PlaceInformationCls">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="StateAbbrev" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="PlaceID" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="Rural" type="s:boolean" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="MaritalStatusPercentagesCls">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="NeverMarried" type="s:decimal" />
          <s:element minOccurs="1" maxOccurs="1" name="Married" type="s:decimal" />
          <s:element minOccurs="1" maxOccurs="1" name="Separated" type="s:decimal" />
          <s:element minOccurs="1" maxOccurs="1" name="MarriedOther" type="s:decimal" />
          <s:element minOccurs="1" maxOccurs="1" name="Widowed" type="s:decimal" />
          <s:element minOccurs="1" maxOccurs="1" name="Divorced" type="s:decimal" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="RacePercentagesCls">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="Asian" type="s:decimal" />
          <s:element minOccurs="1" maxOccurs="1" name="Black" type="s:decimal" />
          <s:element minOccurs="1" maxOccurs="1" name="Indian" type="s:decimal" />
          <s:element minOccurs="1" maxOccurs="1" name="Mixed" type="s:decimal" />
          <s:element minOccurs="1" maxOccurs="1" name="NativeHawaiian" type="s:decimal" />
          <s:element minOccurs="1" maxOccurs="1" name="Other" type="s:decimal" />
          <s:element minOccurs="1" maxOccurs="1" name="White" type="s:decimal" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="GenderPercentagesCls">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="Female" type="s:decimal" />
          <s:element minOccurs="1" maxOccurs="1" name="Male" type="s:decimal" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetLocationInformationByAddress">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="AddressLine1" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="City" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="StateAbbrev" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="ZipCode" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetLocationInformationByAddressResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetLocationInformationByAddressResult" type="tns:SummaryInformation" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetIncomeHouseValueByAddress">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="AddressLine1" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="City" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="StateAbbrev" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="ZipCode" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetIncomeHouseValueByAddressResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetIncomeHouseValueByAddressResult" type="tns:IncomeAndHouseValue" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="IncomeAndHouseValue">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="PlaceInformation" type="tns:PlaceInformationCls" />
          <s:element minOccurs="1" maxOccurs="1" name="Error" type="s:boolean" />
          <s:element minOccurs="0" maxOccurs="1" name="ErrorString" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="MedianIncome" type="s:int" />
          <s:element minOccurs="1" maxOccurs="1" name="MedianHouseValue" type="s:int" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetPlaceIDbyAddress">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="AddressLine1" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="City" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="StateAbbrev" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="ZipCode" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetPlaceIDbyAddressResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetPlaceIDbyAddressResult" type="tns:PlaceInfo" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="PlaceInfo">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="PlaceInformation" type="tns:PlaceInformationCls" />
          <s:element minOccurs="1" maxOccurs="1" name="Error" type="s:boolean" />
          <s:element minOccurs="0" maxOccurs="1" name="ErrorString" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetPlaceIDbyCensusTractAndBlock">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="StateAbbrev" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="CensusTract" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="CensusBlock" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="LicenseKey" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetPlaceIDbyCensusTractAndBlockResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetPlaceIDbyCensusTractAndBlockResult" type="tns:PlaceInfo" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSummaryInformationByPlaceID">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="StateAbbrev" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="PlaceID" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSummaryInformationByPlaceIDResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetSummaryInformationByPlaceIDResult" type="tns:SummaryInformation" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNeighborhoodAgeInDataSet">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="StateAbbrev" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="PlaceID" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNeighborhoodAgeInDataSetResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetNeighborhoodAgeInDataSetResult" type="tns:CensusInfoWithDataSet" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="CensusInfoWithDataSet">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="Error" type="s:boolean" />
          <s:element minOccurs="0" maxOccurs="1" name="ErrorString" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CensusDataSet">
            <s:complexType>
              <s:sequence>
                <s:element ref="s:schema" />
                <s:any />
              </s:sequence>
            </s:complexType>
          </s:element>
        </s:sequence>
      </s:complexType>
      <s:element name="GetNeighborhoodAgeGenderMaleInDataSet">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="StateAbbrev" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="PlaceID" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNeighborhoodAgeGenderMaleInDataSetResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetNeighborhoodAgeGenderMaleInDataSetResult" type="tns:CensusInfoWithDataSet" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNeighborhoodAgeGenderFemaleInDataSet">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="StateAbbrev" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="PlaceID" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNeighborhoodAgeGenderFemaleInDataSetResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetNeighborhoodAgeGenderFemaleInDataSetResult" type="tns:CensusInfoWithDataSet" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNeighborhoodRealtyValueInDataSet">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="StateAbbrev" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="PlaceID" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNeighborhoodRealtyValueInDataSetResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetNeighborhoodRealtyValueInDataSetResult" type="tns:CensusInfoWithDataSet" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNeighborhoodVehiclesPerHouseholdInDataset">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="StateAbbr" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="PlaceID" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNeighborhoodVehiclesPerHouseholdInDatasetResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetNeighborhoodVehiclesPerHouseholdInDatasetResult" type="tns:CensusInfoWithDataSet" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDataset">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="StateAbbr" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="PlaceID" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDatasetResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDatasetResult" type="tns:CensusInfoWithDataSet" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNeighborhoodYearStructuresBuilt">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="StateAbbr" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="PlaceID" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNeighborhoodYearStructuresBuiltResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetNeighborhoodYearStructuresBuiltResult" type="tns:CensusInfoWithDataSet" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNeighborhoodLinguisticIsolation">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="StateAbbr" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="PlaceID" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNeighborhoodLinguisticIsolationResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetNeighborhoodLinguisticIsolationResult" type="tns:CensusInfoWithDataSet" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetVersion">
        <s:complexType />
      </s:element>
      <s:element name="GetVersionResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetVersionResult" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="SummaryInformation" nillable="true" type="tns:SummaryInformation" />
      <s:element name="IncomeAndHouseValue" nillable="true" type="tns:IncomeAndHouseValue" />
      <s:element name="PlaceInfo" nillable="true" type="tns:PlaceInfo" />
      <s:element name="CensusInfoWithDataSet" nillable="true" type="tns:CensusInfoWithDataSet" />
      <s:element name="string" nillable="true" type="s:string" />
    </s:schema>
  </wsdl:types>
  <wsdl:message name="GetLocationInformationByLatitudeLongitudeSoapIn">
    <wsdl:part name="parameters" element="tns:GetLocationInformationByLatitudeLongitude" />
  </wsdl:message>
  <wsdl:message name="GetLocationInformationByLatitudeLongitudeSoapOut">
    <wsdl:part name="parameters" element="tns:GetLocationInformationByLatitudeLongitudeResponse" />
  </wsdl:message>
  <wsdl:message name="GetLocationInformationByAddressSoapIn">
    <wsdl:part name="parameters" element="tns:GetLocationInformationByAddress" />
  </wsdl:message>
  <wsdl:message name="GetLocationInformationByAddressSoapOut">
    <wsdl:part name="parameters" element="tns:GetLocationInformationByAddressResponse" />
  </wsdl:message>
  <wsdl:message name="GetIncomeHouseValueByAddressSoapIn">
    <wsdl:part name="parameters" element="tns:GetIncomeHouseValueByAddress" />
  </wsdl:message>
  <wsdl:message name="GetIncomeHouseValueByAddressSoapOut">
    <wsdl:part name="parameters" element="tns:GetIncomeHouseValueByAddressResponse" />
  </wsdl:message>
  <wsdl:message name="GetPlaceIDbyAddressSoapIn">
    <wsdl:part name="parameters" element="tns:GetPlaceIDbyAddress" />
  </wsdl:message>
  <wsdl:message name="GetPlaceIDbyAddressSoapOut">
    <wsdl:part name="parameters" element="tns:GetPlaceIDbyAddressResponse" />
  </wsdl:message>
  <wsdl:message name="GetPlaceIDbyCensusTractAndBlockSoapIn">
    <wsdl:part name="parameters" element="tns:GetPlaceIDbyCensusTractAndBlock" />
  </wsdl:message>
  <wsdl:message name="GetPlaceIDbyCensusTractAndBlockSoapOut">
    <wsdl:part name="parameters" element="tns:GetPlaceIDbyCensusTractAndBlockResponse" />
  </wsdl:message>
  <wsdl:message name="GetSummaryInformationByPlaceIDSoapIn">
    <wsdl:part name="parameters" element="tns:GetSummaryInformationByPlaceID" />
  </wsdl:message>
  <wsdl:message name="GetSummaryInformationByPlaceIDSoapOut">
    <wsdl:part name="parameters" element="tns:GetSummaryInformationByPlaceIDResponse" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeInDataSetSoapIn">
    <wsdl:part name="parameters" element="tns:GetNeighborhoodAgeInDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeInDataSetSoapOut">
    <wsdl:part name="parameters" element="tns:GetNeighborhoodAgeInDataSetResponse" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeGenderMaleInDataSetSoapIn">
    <wsdl:part name="parameters" element="tns:GetNeighborhoodAgeGenderMaleInDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeGenderMaleInDataSetSoapOut">
    <wsdl:part name="parameters" element="tns:GetNeighborhoodAgeGenderMaleInDataSetResponse" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeGenderFemaleInDataSetSoapIn">
    <wsdl:part name="parameters" element="tns:GetNeighborhoodAgeGenderFemaleInDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeGenderFemaleInDataSetSoapOut">
    <wsdl:part name="parameters" element="tns:GetNeighborhoodAgeGenderFemaleInDataSetResponse" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodRealtyValueInDataSetSoapIn">
    <wsdl:part name="parameters" element="tns:GetNeighborhoodRealtyValueInDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodRealtyValueInDataSetSoapOut">
    <wsdl:part name="parameters" element="tns:GetNeighborhoodRealtyValueInDataSetResponse" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodVehiclesPerHouseholdInDatasetSoapIn">
    <wsdl:part name="parameters" element="tns:GetNeighborhoodVehiclesPerHouseholdInDataset" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodVehiclesPerHouseholdInDatasetSoapOut">
    <wsdl:part name="parameters" element="tns:GetNeighborhoodVehiclesPerHouseholdInDatasetResponse" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDatasetSoapIn">
    <wsdl:part name="parameters" element="tns:GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDataset" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDatasetSoapOut">
    <wsdl:part name="parameters" element="tns:GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDatasetResponse" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodYearStructuresBuiltSoapIn">
    <wsdl:part name="parameters" element="tns:GetNeighborhoodYearStructuresBuilt" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodYearStructuresBuiltSoapOut">
    <wsdl:part name="parameters" element="tns:GetNeighborhoodYearStructuresBuiltResponse" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodLinguisticIsolationSoapIn">
    <wsdl:part name="parameters" element="tns:GetNeighborhoodLinguisticIsolation" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodLinguisticIsolationSoapOut">
    <wsdl:part name="parameters" element="tns:GetNeighborhoodLinguisticIsolationResponse" />
  </wsdl:message>
  <wsdl:message name="GetVersionSoapIn">
    <wsdl:part name="parameters" element="tns:GetVersion" />
  </wsdl:message>
  <wsdl:message name="GetVersionSoapOut">
    <wsdl:part name="parameters" element="tns:GetVersionResponse" />
  </wsdl:message>
  <wsdl:message name="GetLocationInformationByLatitudeLongitudeHttpGetIn">
    <wsdl:part name="Latitude" type="s:string" />
    <wsdl:part name="Longitude" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetLocationInformationByLatitudeLongitudeHttpGetOut">
    <wsdl:part name="Body" element="tns:SummaryInformation" />
  </wsdl:message>
  <wsdl:message name="GetLocationInformationByAddressHttpGetIn">
    <wsdl:part name="AddressLine1" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="ZipCode" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetLocationInformationByAddressHttpGetOut">
    <wsdl:part name="Body" element="tns:SummaryInformation" />
  </wsdl:message>
  <wsdl:message name="GetIncomeHouseValueByAddressHttpGetIn">
    <wsdl:part name="AddressLine1" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="ZipCode" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetIncomeHouseValueByAddressHttpGetOut">
    <wsdl:part name="Body" element="tns:IncomeAndHouseValue" />
  </wsdl:message>
  <wsdl:message name="GetPlaceIDbyAddressHttpGetIn">
    <wsdl:part name="AddressLine1" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="ZipCode" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetPlaceIDbyAddressHttpGetOut">
    <wsdl:part name="Body" element="tns:PlaceInfo" />
  </wsdl:message>
  <wsdl:message name="GetPlaceIDbyCensusTractAndBlockHttpGetIn">
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="CensusTract" type="s:string" />
    <wsdl:part name="CensusBlock" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetPlaceIDbyCensusTractAndBlockHttpGetOut">
    <wsdl:part name="Body" element="tns:PlaceInfo" />
  </wsdl:message>
  <wsdl:message name="GetSummaryInformationByPlaceIDHttpGetIn">
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSummaryInformationByPlaceIDHttpGetOut">
    <wsdl:part name="Body" element="tns:SummaryInformation" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeInDataSetHttpGetIn">
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeInDataSetHttpGetOut">
    <wsdl:part name="Body" element="tns:CensusInfoWithDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeGenderMaleInDataSetHttpGetIn">
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeGenderMaleInDataSetHttpGetOut">
    <wsdl:part name="Body" element="tns:CensusInfoWithDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeGenderFemaleInDataSetHttpGetIn">
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeGenderFemaleInDataSetHttpGetOut">
    <wsdl:part name="Body" element="tns:CensusInfoWithDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodRealtyValueInDataSetHttpGetIn">
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodRealtyValueInDataSetHttpGetOut">
    <wsdl:part name="Body" element="tns:CensusInfoWithDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodVehiclesPerHouseholdInDatasetHttpGetIn">
    <wsdl:part name="StateAbbr" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodVehiclesPerHouseholdInDatasetHttpGetOut">
    <wsdl:part name="Body" element="tns:CensusInfoWithDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDatasetHttpGetIn">
    <wsdl:part name="StateAbbr" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDatasetHttpGetOut">
    <wsdl:part name="Body" element="tns:CensusInfoWithDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodYearStructuresBuiltHttpGetIn">
    <wsdl:part name="StateAbbr" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodYearStructuresBuiltHttpGetOut">
    <wsdl:part name="Body" element="tns:CensusInfoWithDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodLinguisticIsolationHttpGetIn">
    <wsdl:part name="StateAbbr" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodLinguisticIsolationHttpGetOut">
    <wsdl:part name="Body" element="tns:CensusInfoWithDataSet" />
  </wsdl:message>
  <wsdl:message name="GetVersionHttpGetIn" />
  <wsdl:message name="GetVersionHttpGetOut">
    <wsdl:part name="Body" element="tns:string" />
  </wsdl:message>
  <wsdl:message name="GetLocationInformationByLatitudeLongitudeHttpPostIn">
    <wsdl:part name="Latitude" type="s:string" />
    <wsdl:part name="Longitude" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetLocationInformationByLatitudeLongitudeHttpPostOut">
    <wsdl:part name="Body" element="tns:SummaryInformation" />
  </wsdl:message>
  <wsdl:message name="GetLocationInformationByAddressHttpPostIn">
    <wsdl:part name="AddressLine1" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="ZipCode" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetLocationInformationByAddressHttpPostOut">
    <wsdl:part name="Body" element="tns:SummaryInformation" />
  </wsdl:message>
  <wsdl:message name="GetIncomeHouseValueByAddressHttpPostIn">
    <wsdl:part name="AddressLine1" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="ZipCode" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetIncomeHouseValueByAddressHttpPostOut">
    <wsdl:part name="Body" element="tns:IncomeAndHouseValue" />
  </wsdl:message>
  <wsdl:message name="GetPlaceIDbyAddressHttpPostIn">
    <wsdl:part name="AddressLine1" type="s:string" />
    <wsdl:part name="City" type="s:string" />
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="ZipCode" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetPlaceIDbyAddressHttpPostOut">
    <wsdl:part name="Body" element="tns:PlaceInfo" />
  </wsdl:message>
  <wsdl:message name="GetPlaceIDbyCensusTractAndBlockHttpPostIn">
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="CensusTract" type="s:string" />
    <wsdl:part name="CensusBlock" type="s:string" />
    <wsdl:part name="LicenseKey" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetPlaceIDbyCensusTractAndBlockHttpPostOut">
    <wsdl:part name="Body" element="tns:PlaceInfo" />
  </wsdl:message>
  <wsdl:message name="GetSummaryInformationByPlaceIDHttpPostIn">
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSummaryInformationByPlaceIDHttpPostOut">
    <wsdl:part name="Body" element="tns:SummaryInformation" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeInDataSetHttpPostIn">
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeInDataSetHttpPostOut">
    <wsdl:part name="Body" element="tns:CensusInfoWithDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeGenderMaleInDataSetHttpPostIn">
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeGenderMaleInDataSetHttpPostOut">
    <wsdl:part name="Body" element="tns:CensusInfoWithDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeGenderFemaleInDataSetHttpPostIn">
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodAgeGenderFemaleInDataSetHttpPostOut">
    <wsdl:part name="Body" element="tns:CensusInfoWithDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodRealtyValueInDataSetHttpPostIn">
    <wsdl:part name="StateAbbrev" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodRealtyValueInDataSetHttpPostOut">
    <wsdl:part name="Body" element="tns:CensusInfoWithDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodVehiclesPerHouseholdInDatasetHttpPostIn">
    <wsdl:part name="StateAbbr" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodVehiclesPerHouseholdInDatasetHttpPostOut">
    <wsdl:part name="Body" element="tns:CensusInfoWithDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDatasetHttpPostIn">
    <wsdl:part name="StateAbbr" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDatasetHttpPostOut">
    <wsdl:part name="Body" element="tns:CensusInfoWithDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodYearStructuresBuiltHttpPostIn">
    <wsdl:part name="StateAbbr" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodYearStructuresBuiltHttpPostOut">
    <wsdl:part name="Body" element="tns:CensusInfoWithDataSet" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodLinguisticIsolationHttpPostIn">
    <wsdl:part name="StateAbbr" type="s:string" />
    <wsdl:part name="PlaceID" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNeighborhoodLinguisticIsolationHttpPostOut">
    <wsdl:part name="Body" element="tns:CensusInfoWithDataSet" />
  </wsdl:message>
  <wsdl:message name="GetVersionHttpPostIn" />
  <wsdl:message name="GetVersionHttpPostOut">
    <wsdl:part name="Body" element="tns:string" />
  </wsdl:message>
  <wsdl:portType name="DemographixQuerySoap">
    <wsdl:operation name="GetLocationInformationByLatitudeLongitude">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return Summary Information about a location via Longitude and Latitude. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetLocationInformationByLatitudeLongitudeSoapIn" />
      <wsdl:output message="tns:GetLocationInformationByLatitudeLongitudeSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetLocationInformationByAddress">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return Summary Information about a location via the Address.  Address Line 2 is not needed for Summary information.  For more advanced address information use CDYNE's Postal Address Corrector. &lt;b&gt;This method is the best place to start!&lt;/b&gt; Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetLocationInformationByAddressSoapIn" />
      <wsdl:output message="tns:GetLocationInformationByAddressSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetIncomeHouseValueByAddress">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return only Income and House Value. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetIncomeHouseValueByAddressSoapIn" />
      <wsdl:output message="tns:GetIncomeHouseValueByAddressSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetPlaceIDbyAddress">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Place ID that can be used with more of the advanced functions via StateAbbrev, Tract, and Block.</wsdl:documentation>
      <wsdl:input message="tns:GetPlaceIDbyAddressSoapIn" />
      <wsdl:output message="tns:GetPlaceIDbyAddressSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetPlaceIDbyCensusTractAndBlock">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Place ID that can be used with more of the advanced functions via StateAbbrev, Tract, and Block.</wsdl:documentation>
      <wsdl:input message="tns:GetPlaceIDbyCensusTractAndBlockSoapIn" />
      <wsdl:output message="tns:GetPlaceIDbyCensusTractAndBlockSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSummaryInformationByPlaceID">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return Summary Information about a location via StateAbbrev and PlaceID.</wsdl:documentation>
      <wsdl:input message="tns:GetSummaryInformationByPlaceIDSoapIn" />
      <wsdl:output message="tns:GetSummaryInformationByPlaceIDSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeInDataSet">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Age Populations in a DataSet. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodAgeInDataSetSoapIn" />
      <wsdl:output message="tns:GetNeighborhoodAgeInDataSetSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeGenderMaleInDataSet">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Male Age Populations in a DataSet. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodAgeGenderMaleInDataSetSoapIn" />
      <wsdl:output message="tns:GetNeighborhoodAgeGenderMaleInDataSetSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeGenderFemaleInDataSet">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Female Age Populations in a DataSet. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodAgeGenderFemaleInDataSetSoapIn" />
      <wsdl:output message="tns:GetNeighborhoodAgeGenderFemaleInDataSetSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodRealtyValueInDataSet">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Realty Value Population in a DataSet. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodRealtyValueInDataSetSoapIn" />
      <wsdl:output message="tns:GetNeighborhoodRealtyValueInDataSetSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodVehiclesPerHouseholdInDataset">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the number of cars for each household in the given neighborhood in a dataset. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodVehiclesPerHouseholdInDatasetSoapIn" />
      <wsdl:output message="tns:GetNeighborhoodVehiclesPerHouseholdInDatasetSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDataset">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the place of birth by their citizenship status in a dataset. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDatasetSoapIn" />
      <wsdl:output message="tns:GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDatasetSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodYearStructuresBuilt">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the year the the houses build during a period in a dataset. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodYearStructuresBuiltSoapIn" />
      <wsdl:output message="tns:GetNeighborhoodYearStructuresBuiltSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodLinguisticIsolation">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return isolation of different cultures in a particular area in a dataset. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodLinguisticIsolationSoapIn" />
      <wsdl:output message="tns:GetNeighborhoodLinguisticIsolationSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetVersion">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Version Information.</wsdl:documentation>
      <wsdl:input message="tns:GetVersionSoapIn" />
      <wsdl:output message="tns:GetVersionSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="DemographixQueryHttpGet">
    <wsdl:operation name="GetLocationInformationByLatitudeLongitude">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return Summary Information about a location via Longitude and Latitude. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetLocationInformationByLatitudeLongitudeHttpGetIn" />
      <wsdl:output message="tns:GetLocationInformationByLatitudeLongitudeHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetLocationInformationByAddress">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return Summary Information about a location via the Address.  Address Line 2 is not needed for Summary information.  For more advanced address information use CDYNE's Postal Address Corrector. &lt;b&gt;This method is the best place to start!&lt;/b&gt; Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetLocationInformationByAddressHttpGetIn" />
      <wsdl:output message="tns:GetLocationInformationByAddressHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetIncomeHouseValueByAddress">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return only Income and House Value. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetIncomeHouseValueByAddressHttpGetIn" />
      <wsdl:output message="tns:GetIncomeHouseValueByAddressHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetPlaceIDbyAddress">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Place ID that can be used with more of the advanced functions via StateAbbrev, Tract, and Block.</wsdl:documentation>
      <wsdl:input message="tns:GetPlaceIDbyAddressHttpGetIn" />
      <wsdl:output message="tns:GetPlaceIDbyAddressHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetPlaceIDbyCensusTractAndBlock">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Place ID that can be used with more of the advanced functions via StateAbbrev, Tract, and Block.</wsdl:documentation>
      <wsdl:input message="tns:GetPlaceIDbyCensusTractAndBlockHttpGetIn" />
      <wsdl:output message="tns:GetPlaceIDbyCensusTractAndBlockHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSummaryInformationByPlaceID">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return Summary Information about a location via StateAbbrev and PlaceID.</wsdl:documentation>
      <wsdl:input message="tns:GetSummaryInformationByPlaceIDHttpGetIn" />
      <wsdl:output message="tns:GetSummaryInformationByPlaceIDHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeInDataSet">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Age Populations in a DataSet. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodAgeInDataSetHttpGetIn" />
      <wsdl:output message="tns:GetNeighborhoodAgeInDataSetHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeGenderMaleInDataSet">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Male Age Populations in a DataSet. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodAgeGenderMaleInDataSetHttpGetIn" />
      <wsdl:output message="tns:GetNeighborhoodAgeGenderMaleInDataSetHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeGenderFemaleInDataSet">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Female Age Populations in a DataSet. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodAgeGenderFemaleInDataSetHttpGetIn" />
      <wsdl:output message="tns:GetNeighborhoodAgeGenderFemaleInDataSetHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodRealtyValueInDataSet">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Realty Value Population in a DataSet. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodRealtyValueInDataSetHttpGetIn" />
      <wsdl:output message="tns:GetNeighborhoodRealtyValueInDataSetHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodVehiclesPerHouseholdInDataset">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the number of cars for each household in the given neighborhood in a dataset. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodVehiclesPerHouseholdInDatasetHttpGetIn" />
      <wsdl:output message="tns:GetNeighborhoodVehiclesPerHouseholdInDatasetHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDataset">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the place of birth by their citizenship status in a dataset. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDatasetHttpGetIn" />
      <wsdl:output message="tns:GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDatasetHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodYearStructuresBuilt">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the year the the houses build during a period in a dataset. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodYearStructuresBuiltHttpGetIn" />
      <wsdl:output message="tns:GetNeighborhoodYearStructuresBuiltHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodLinguisticIsolation">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return isolation of different cultures in a particular area in a dataset. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodLinguisticIsolationHttpGetIn" />
      <wsdl:output message="tns:GetNeighborhoodLinguisticIsolationHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetVersion">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Version Information.</wsdl:documentation>
      <wsdl:input message="tns:GetVersionHttpGetIn" />
      <wsdl:output message="tns:GetVersionHttpGetOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="DemographixQueryHttpPost">
    <wsdl:operation name="GetLocationInformationByLatitudeLongitude">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return Summary Information about a location via Longitude and Latitude. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetLocationInformationByLatitudeLongitudeHttpPostIn" />
      <wsdl:output message="tns:GetLocationInformationByLatitudeLongitudeHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetLocationInformationByAddress">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return Summary Information about a location via the Address.  Address Line 2 is not needed for Summary information.  For more advanced address information use CDYNE's Postal Address Corrector. &lt;b&gt;This method is the best place to start!&lt;/b&gt; Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetLocationInformationByAddressHttpPostIn" />
      <wsdl:output message="tns:GetLocationInformationByAddressHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetIncomeHouseValueByAddress">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return only Income and House Value. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetIncomeHouseValueByAddressHttpPostIn" />
      <wsdl:output message="tns:GetIncomeHouseValueByAddressHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetPlaceIDbyAddress">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Place ID that can be used with more of the advanced functions via StateAbbrev, Tract, and Block.</wsdl:documentation>
      <wsdl:input message="tns:GetPlaceIDbyAddressHttpPostIn" />
      <wsdl:output message="tns:GetPlaceIDbyAddressHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetPlaceIDbyCensusTractAndBlock">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Place ID that can be used with more of the advanced functions via StateAbbrev, Tract, and Block.</wsdl:documentation>
      <wsdl:input message="tns:GetPlaceIDbyCensusTractAndBlockHttpPostIn" />
      <wsdl:output message="tns:GetPlaceIDbyCensusTractAndBlockHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSummaryInformationByPlaceID">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return Summary Information about a location via StateAbbrev and PlaceID.</wsdl:documentation>
      <wsdl:input message="tns:GetSummaryInformationByPlaceIDHttpPostIn" />
      <wsdl:output message="tns:GetSummaryInformationByPlaceIDHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeInDataSet">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Age Populations in a DataSet. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodAgeInDataSetHttpPostIn" />
      <wsdl:output message="tns:GetNeighborhoodAgeInDataSetHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeGenderMaleInDataSet">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Male Age Populations in a DataSet. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodAgeGenderMaleInDataSetHttpPostIn" />
      <wsdl:output message="tns:GetNeighborhoodAgeGenderMaleInDataSetHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeGenderFemaleInDataSet">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Female Age Populations in a DataSet. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodAgeGenderFemaleInDataSetHttpPostIn" />
      <wsdl:output message="tns:GetNeighborhoodAgeGenderFemaleInDataSetHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodRealtyValueInDataSet">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the Realty Value Population in a DataSet. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodRealtyValueInDataSetHttpPostIn" />
      <wsdl:output message="tns:GetNeighborhoodRealtyValueInDataSetHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodVehiclesPerHouseholdInDataset">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the number of cars for each household in the given neighborhood in a dataset. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodVehiclesPerHouseholdInDatasetHttpPostIn" />
      <wsdl:output message="tns:GetNeighborhoodVehiclesPerHouseholdInDatasetHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDataset">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the place of birth by their citizenship status in a dataset. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDatasetHttpPostIn" />
      <wsdl:output message="tns:GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDatasetHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodYearStructuresBuilt">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return the year the the houses build during a period in a dataset. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodYearStructuresBuiltHttpPostIn" />
      <wsdl:output message="tns:GetNeighborhoodYearStructuresBuiltHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodLinguisticIsolation">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">This function will return isolation of different cultures in a particular area in a dataset. Use a LicenseKey of 0 for testing.</wsdl:documentation>
      <wsdl:input message="tns:GetNeighborhoodLinguisticIsolationHttpPostIn" />
      <wsdl:output message="tns:GetNeighborhoodLinguisticIsolationHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetVersion">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Version Information.</wsdl:documentation>
      <wsdl:input message="tns:GetVersionHttpPostIn" />
      <wsdl:output message="tns:GetVersionHttpPostOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="DemographixQuerySoap" type="tns:DemographixQuerySoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetLocationInformationByLatitudeLongitude">
      <soap:operation soapAction="http://ws.cdyne.com/DemographixWS/GetLocationInformationByLatitudeLongitude" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetLocationInformationByAddress">
      <soap:operation soapAction="http://ws.cdyne.com/DemographixWS/GetLocationInformationByAddress" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetIncomeHouseValueByAddress">
      <soap:operation soapAction="http://ws.cdyne.com/DemographixWS/GetIncomeHouseValueByAddress" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetPlaceIDbyAddress">
      <soap:operation soapAction="http://ws.cdyne.com/DemographixWS/GetPlaceIDbyAddress" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetPlaceIDbyCensusTractAndBlock">
      <soap:operation soapAction="http://ws.cdyne.com/DemographixWS/GetPlaceIDbyCensusTractAndBlock" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSummaryInformationByPlaceID">
      <soap:operation soapAction="http://ws.cdyne.com/DemographixWS/GetSummaryInformationByPlaceID" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeInDataSet">
      <soap:operation soapAction="http://ws.cdyne.com/DemographixWS/GetNeighborhoodAgeInDataSet" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeGenderMaleInDataSet">
      <soap:operation soapAction="http://ws.cdyne.com/DemographixWS/GetNeighborhoodAgeGenderMaleInDataSet" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeGenderFemaleInDataSet">
      <soap:operation soapAction="http://ws.cdyne.com/DemographixWS/GetNeighborhoodAgeGenderFemaleInDataSet" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodRealtyValueInDataSet">
      <soap:operation soapAction="http://ws.cdyne.com/DemographixWS/GetNeighborhoodRealtyValueInDataSet" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodVehiclesPerHouseholdInDataset">
      <soap:operation soapAction="http://ws.cdyne.com/DemographixWS/GetNeighborhoodVehiclesPerHouseholdInDataset" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDataset">
      <soap:operation soapAction="http://ws.cdyne.com/DemographixWS/GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDataset" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodYearStructuresBuilt">
      <soap:operation soapAction="http://ws.cdyne.com/DemographixWS/GetNeighborhoodYearStructuresBuilt" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodLinguisticIsolation">
      <soap:operation soapAction="http://ws.cdyne.com/DemographixWS/GetNeighborhoodLinguisticIsolation" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetVersion">
      <soap:operation soapAction="http://ws.cdyne.com/DemographixWS/GetVersion" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="DemographixQuerySoap12" type="tns:DemographixQuerySoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetLocationInformationByLatitudeLongitude">
      <soap12:operation soapAction="http://ws.cdyne.com/DemographixWS/GetLocationInformationByLatitudeLongitude" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetLocationInformationByAddress">
      <soap12:operation soapAction="http://ws.cdyne.com/DemographixWS/GetLocationInformationByAddress" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetIncomeHouseValueByAddress">
      <soap12:operation soapAction="http://ws.cdyne.com/DemographixWS/GetIncomeHouseValueByAddress" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetPlaceIDbyAddress">
      <soap12:operation soapAction="http://ws.cdyne.com/DemographixWS/GetPlaceIDbyAddress" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetPlaceIDbyCensusTractAndBlock">
      <soap12:operation soapAction="http://ws.cdyne.com/DemographixWS/GetPlaceIDbyCensusTractAndBlock" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSummaryInformationByPlaceID">
      <soap12:operation soapAction="http://ws.cdyne.com/DemographixWS/GetSummaryInformationByPlaceID" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeInDataSet">
      <soap12:operation soapAction="http://ws.cdyne.com/DemographixWS/GetNeighborhoodAgeInDataSet" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeGenderMaleInDataSet">
      <soap12:operation soapAction="http://ws.cdyne.com/DemographixWS/GetNeighborhoodAgeGenderMaleInDataSet" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeGenderFemaleInDataSet">
      <soap12:operation soapAction="http://ws.cdyne.com/DemographixWS/GetNeighborhoodAgeGenderFemaleInDataSet" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodRealtyValueInDataSet">
      <soap12:operation soapAction="http://ws.cdyne.com/DemographixWS/GetNeighborhoodRealtyValueInDataSet" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodVehiclesPerHouseholdInDataset">
      <soap12:operation soapAction="http://ws.cdyne.com/DemographixWS/GetNeighborhoodVehiclesPerHouseholdInDataset" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDataset">
      <soap12:operation soapAction="http://ws.cdyne.com/DemographixWS/GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDataset" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodYearStructuresBuilt">
      <soap12:operation soapAction="http://ws.cdyne.com/DemographixWS/GetNeighborhoodYearStructuresBuilt" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodLinguisticIsolation">
      <soap12:operation soapAction="http://ws.cdyne.com/DemographixWS/GetNeighborhoodLinguisticIsolation" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetVersion">
      <soap12:operation soapAction="http://ws.cdyne.com/DemographixWS/GetVersion" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="DemographixQueryHttpGet" type="tns:DemographixQueryHttpGet">
    <http:binding verb="GET" />
    <wsdl:operation name="GetLocationInformationByLatitudeLongitude">
      <http:operation location="/GetLocationInformationByLatitudeLongitude" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetLocationInformationByAddress">
      <http:operation location="/GetLocationInformationByAddress" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetIncomeHouseValueByAddress">
      <http:operation location="/GetIncomeHouseValueByAddress" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetPlaceIDbyAddress">
      <http:operation location="/GetPlaceIDbyAddress" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetPlaceIDbyCensusTractAndBlock">
      <http:operation location="/GetPlaceIDbyCensusTractAndBlock" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSummaryInformationByPlaceID">
      <http:operation location="/GetSummaryInformationByPlaceID" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeInDataSet">
      <http:operation location="/GetNeighborhoodAgeInDataSet" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeGenderMaleInDataSet">
      <http:operation location="/GetNeighborhoodAgeGenderMaleInDataSet" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeGenderFemaleInDataSet">
      <http:operation location="/GetNeighborhoodAgeGenderFemaleInDataSet" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodRealtyValueInDataSet">
      <http:operation location="/GetNeighborhoodRealtyValueInDataSet" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodVehiclesPerHouseholdInDataset">
      <http:operation location="/GetNeighborhoodVehiclesPerHouseholdInDataset" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDataset">
      <http:operation location="/GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDataset" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodYearStructuresBuilt">
      <http:operation location="/GetNeighborhoodYearStructuresBuilt" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodLinguisticIsolation">
      <http:operation location="/GetNeighborhoodLinguisticIsolation" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetVersion">
      <http:operation location="/GetVersion" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="DemographixQueryHttpPost" type="tns:DemographixQueryHttpPost">
    <http:binding verb="POST" />
    <wsdl:operation name="GetLocationInformationByLatitudeLongitude">
      <http:operation location="/GetLocationInformationByLatitudeLongitude" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetLocationInformationByAddress">
      <http:operation location="/GetLocationInformationByAddress" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetIncomeHouseValueByAddress">
      <http:operation location="/GetIncomeHouseValueByAddress" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetPlaceIDbyAddress">
      <http:operation location="/GetPlaceIDbyAddress" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetPlaceIDbyCensusTractAndBlock">
      <http:operation location="/GetPlaceIDbyCensusTractAndBlock" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSummaryInformationByPlaceID">
      <http:operation location="/GetSummaryInformationByPlaceID" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeInDataSet">
      <http:operation location="/GetNeighborhoodAgeInDataSet" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeGenderMaleInDataSet">
      <http:operation location="/GetNeighborhoodAgeGenderMaleInDataSet" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodAgeGenderFemaleInDataSet">
      <http:operation location="/GetNeighborhoodAgeGenderFemaleInDataSet" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodRealtyValueInDataSet">
      <http:operation location="/GetNeighborhoodRealtyValueInDataSet" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodVehiclesPerHouseholdInDataset">
      <http:operation location="/GetNeighborhoodVehiclesPerHouseholdInDataset" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDataset">
      <http:operation location="/GetNeighborhoodPlaceofBirthbyCitizenshipStatusInDataset" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodYearStructuresBuilt">
      <http:operation location="/GetNeighborhoodYearStructuresBuilt" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNeighborhoodLinguisticIsolation">
      <http:operation location="/GetNeighborhoodLinguisticIsolation" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetVersion">
      <http:operation location="/GetVersion" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="DemographixQuery">
    <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">CDYNE’s Demographics® is a neighborhood level segmentation system built using various data sources in one combined database. By classifying all U.S. neighborhoods according to consumers’ different stages of life and related income levels, it provides a current, accurate and consistent framework to view customers at a neighborhood level. It enables users to compare customers across their product mix, across time and across their enterprise. With high coverage, Demographix also enables users to see differences in how U.S. neighborhoods spend time and money. This turns raw data about customers into accurate, actionable information.  Use a Licensekey of 0 for testing.</wsdl:documentation>
    <wsdl:port name="DemographixQuerySoap" binding="tns:DemographixQuerySoap">
      <soap:address location="http://ws.cdyne.com/DemographixWS/DemographixQuery.asmx" />
    </wsdl:port>
    <wsdl:port name="DemographixQuerySoap12" binding="tns:DemographixQuerySoap12">
      <soap12:address location="http://ws.cdyne.com/DemographixWS/DemographixQuery.asmx" />
    </wsdl:port>
    <wsdl:port name="DemographixQueryHttpGet" binding="tns:DemographixQueryHttpGet">
      <http:address location="http://ws.cdyne.com/DemographixWS/DemographixQuery.asmx" />
    </wsdl:port>
    <wsdl:port name="DemographixQueryHttpPost" binding="tns:DemographixQueryHttpPost">
      <http:address location="http://ws.cdyne.com/DemographixWS/DemographixQuery.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>