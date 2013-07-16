<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://tempuri.org/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" targetNamespace="http://tempuri.org/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://tempuri.org/">
      <s:element name="getSessionId">
        <s:complexType />
      </s:element>
      <s:element name="getSessionIdResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="getSessionIdResult" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AuthHeader" type="tns:AuthHeader" />
      <s:complexType name="AuthHeader">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="userName" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="password" type="s:string" />
        </s:sequence>
        <s:anyAttribute />
      </s:complexType>
      <s:element name="startRemoteOptimizationRunTest">
        <s:complexType />
      </s:element>
      <s:element name="startRemoteOptimizationRunTestResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="startRemoteOptimizationRunTestResult" type="tns:JOptAspOptimizationResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="JOptAspOptimizationResult">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="totalDistance" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="totalCost" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="timeTotal" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="timeStop" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="timeTrip" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="timeBreak" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="timeIdle" type="s:double" />
          <s:element minOccurs="0" maxOccurs="1" name="routes" type="tns:ArrayOfJOptAspRoute" />
          <s:element minOccurs="0" maxOccurs="1" name="violations" type="tns:ArrayOfJOptAspViolation" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfJOptAspRoute">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="JOptAspRoute" nillable="true" type="tns:JOptAspRoute" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="JOptAspRoute">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="routeId" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="routeStart" type="s:dateTime" />
          <s:element minOccurs="1" maxOccurs="1" name="routeEnd" type="s:dateTime" />
          <s:element minOccurs="1" maxOccurs="1" name="totalDistance" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="totalCost" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="timeTotal" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="timeStop" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="timeTrip" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="timeBreak" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="timeIdle" type="s:double" />
          <s:element minOccurs="0" maxOccurs="1" name="violations" type="tns:ArrayOfJOptAspViolation" />
          <s:element minOccurs="0" maxOccurs="1" name="resourceId" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="nodes" type="tns:ArrayOfJOptAspScheduledNode" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfJOptAspViolation">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="JOptAspViolation" nillable="true" type="tns:JOptAspViolation" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="JOptAspViolation">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="category" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="type" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="value" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfJOptAspScheduledNode">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="JOptAspScheduledNode" nillable="true" type="tns:JOptAspScheduledNode" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="JOptAspScheduledNode">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="nodeId" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="arrivalTime" type="s:dateTime" />
          <s:element minOccurs="1" maxOccurs="1" name="departureTime" type="s:dateTime" />
          <s:element minOccurs="0" maxOccurs="1" name="violations" type="tns:ArrayOfJOptAspViolation" />
        </s:sequence>
      </s:complexType>
      <s:element name="startRemoteOptimizationRun">
        <s:complexType />
      </s:element>
      <s:element name="startRemoteOptimizationRunResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="startRemoteOptimizationRunResult" type="tns:JOptAspOptimizationResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="addNode">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="node" type="tns:JOptAspTimeWindowGeoNode" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="JOptAspTimeWindowGeoNode">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="nodeId" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="type" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="latitude" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="longitude" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="visitDuration" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="openingHours" type="tns:ArrayOfJOptAspOpeningHours" />
          <s:element minOccurs="1" maxOccurs="1" name="priority" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="load" type="tns:ArrayOfDouble" />
          <s:element minOccurs="0" maxOccurs="1" name="relationships" type="tns:ArrayOfJOptAspRelationship" />
          <s:element minOccurs="1" maxOccurs="1" name="distanceMatrixId" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="preferableResource" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="minimumInitialVisitDuration" type="s:int" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfJOptAspOpeningHours">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="JOptAspOpeningHours" nillable="true" type="tns:JOptAspOpeningHours" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="JOptAspOpeningHours">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="begin" type="s:dateTime" />
          <s:element minOccurs="1" maxOccurs="1" name="end" type="s:dateTime" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfDouble">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="double" type="s:double" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfJOptAspRelationship">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="JOptAspRelationship" nillable="true" type="tns:JOptAspRelationship" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="JOptAspRelationship">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="relationshipType" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="nodeId" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="addNodeResponse">
        <s:complexType />
      </s:element>
      <s:element name="addNodes">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="nodes" type="tns:ArrayOfJOptAspTimeWindowGeoNode" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfJOptAspTimeWindowGeoNode">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="JOptAspTimeWindowGeoNode" nillable="true" type="tns:JOptAspTimeWindowGeoNode" />
        </s:sequence>
      </s:complexType>
      <s:element name="addNodesResponse">
        <s:complexType />
      </s:element>
      <s:element name="addResource">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="resource" type="tns:JOptAspCapacityResource" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="JOptAspCapacityResource">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="resourceId" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="latitude" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="longitude" type="s:double" />
          <s:element minOccurs="0" maxOccurs="1" name="capacity" type="tns:ArrayOfDouble" />
          <s:element minOccurs="0" maxOccurs="1" name="nodeTypes" type="tns:ArrayOfString" />
          <s:element minOccurs="1" maxOccurs="1" name="maxHours" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="maxDailyHours" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="maxWeeklyHours" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="maxDistance" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="distanceMatrixId" type="s:int" />
          <s:element minOccurs="1" maxOccurs="1" name="avgSpeed" type="s:double" />
          <s:element minOccurs="0" maxOccurs="1" name="workingHours" type="tns:ArrayOfJOptAspWorkingHours" />
          <s:element minOccurs="1" maxOccurs="1" name="fixCost" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="perHourCost" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="perKilometerCost" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="timeBreak" type="s:double" />
          <s:element minOccurs="0" maxOccurs="1" name="initialLoad" type="tns:ArrayOfDouble" />
          <s:element minOccurs="1" maxOccurs="1" name="timeFactor" type="s:double" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfString">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="string" nillable="true" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfJOptAspWorkingHours">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="JOptAspWorkingHours" nillable="true" type="tns:JOptAspWorkingHours" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="JOptAspWorkingHours">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="begin" type="s:dateTime" />
          <s:element minOccurs="1" maxOccurs="1" name="end" type="s:dateTime" />
        </s:sequence>
      </s:complexType>
      <s:element name="addResourceResponse">
        <s:complexType />
      </s:element>
      <s:element name="addResources">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="resources" type="tns:ArrayOfJOptAspCapacityResource" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfJOptAspCapacityResource">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="JOptAspCapacityResource" nillable="true" type="tns:JOptAspCapacityResource" />
        </s:sequence>
      </s:complexType>
      <s:element name="addResourcesResponse">
        <s:complexType />
      </s:element>
      <s:element name="setDistanceMatrix">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="distanceMatrix" type="tns:JOptAspMatrix" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="JOptAspMatrix">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="distance" type="tns:ArrayOfArrayOfDouble" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfArrayOfDouble">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="ArrayOfDouble" nillable="true" type="tns:ArrayOfDouble" />
        </s:sequence>
      </s:complexType>
      <s:element name="setDistanceMatrixResponse">
        <s:complexType />
      </s:element>
      <s:element name="setTimeMatrix">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="timeMatrix" type="tns:JOptAspMatrix" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="setTimeMatrixResponse">
        <s:complexType />
      </s:element>
      <s:element name="setProperties">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="properties" type="tns:ArrayOfJOptAspProperty" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfJOptAspProperty">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="JOptAspProperty" nillable="true" type="tns:JOptAspProperty" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="JOptAspProperty">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="type" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="value" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="setPropertiesResponse">
        <s:complexType />
      </s:element>
      <s:element name="setCredentials">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="user" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="pwd" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="setCredentialsResponse">
        <s:complexType />
      </s:element>
      <s:element name="getOptimizationProgress">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="sessionid" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="getOptimizationProgressResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="getOptimizationProgressResult" type="tns:JOptAspProgress" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="JOptAspProgress">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="curProgress" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="curCost" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="curDistance" type="s:double" />
          <s:element minOccurs="1" maxOccurs="1" name="curPhase" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="curMode" type="s:string" />
        </s:sequence>
      </s:complexType>
    </s:schema>
  </wsdl:types>
  <wsdl:message name="getSessionIdSoapIn">
    <wsdl:part name="parameters" element="tns:getSessionId" />
  </wsdl:message>
  <wsdl:message name="getSessionIdSoapOut">
    <wsdl:part name="parameters" element="tns:getSessionIdResponse" />
  </wsdl:message>
  <wsdl:message name="getSessionIdAuthHeader">
    <wsdl:part name="AuthHeader" element="tns:AuthHeader" />
  </wsdl:message>
  <wsdl:message name="startRemoteOptimizationRunTestSoapIn">
    <wsdl:part name="parameters" element="tns:startRemoteOptimizationRunTest" />
  </wsdl:message>
  <wsdl:message name="startRemoteOptimizationRunTestSoapOut">
    <wsdl:part name="parameters" element="tns:startRemoteOptimizationRunTestResponse" />
  </wsdl:message>
  <wsdl:message name="startRemoteOptimizationRunTestAuthHeader">
    <wsdl:part name="AuthHeader" element="tns:AuthHeader" />
  </wsdl:message>
  <wsdl:message name="startRemoteOptimizationRunSoapIn">
    <wsdl:part name="parameters" element="tns:startRemoteOptimizationRun" />
  </wsdl:message>
  <wsdl:message name="startRemoteOptimizationRunSoapOut">
    <wsdl:part name="parameters" element="tns:startRemoteOptimizationRunResponse" />
  </wsdl:message>
  <wsdl:message name="startRemoteOptimizationRunAuthHeader">
    <wsdl:part name="AuthHeader" element="tns:AuthHeader" />
  </wsdl:message>
  <wsdl:message name="addNodeSoapIn">
    <wsdl:part name="parameters" element="tns:addNode" />
  </wsdl:message>
  <wsdl:message name="addNodeSoapOut">
    <wsdl:part name="parameters" element="tns:addNodeResponse" />
  </wsdl:message>
  <wsdl:message name="addNodeAuthHeader">
    <wsdl:part name="AuthHeader" element="tns:AuthHeader" />
  </wsdl:message>
  <wsdl:message name="addNodesSoapIn">
    <wsdl:part name="parameters" element="tns:addNodes" />
  </wsdl:message>
  <wsdl:message name="addNodesSoapOut">
    <wsdl:part name="parameters" element="tns:addNodesResponse" />
  </wsdl:message>
  <wsdl:message name="addNodesAuthHeader">
    <wsdl:part name="AuthHeader" element="tns:AuthHeader" />
  </wsdl:message>
  <wsdl:message name="addResourceSoapIn">
    <wsdl:part name="parameters" element="tns:addResource" />
  </wsdl:message>
  <wsdl:message name="addResourceSoapOut">
    <wsdl:part name="parameters" element="tns:addResourceResponse" />
  </wsdl:message>
  <wsdl:message name="addResourceAuthHeader">
    <wsdl:part name="AuthHeader" element="tns:AuthHeader" />
  </wsdl:message>
  <wsdl:message name="addResourcesSoapIn">
    <wsdl:part name="parameters" element="tns:addResources" />
  </wsdl:message>
  <wsdl:message name="addResourcesSoapOut">
    <wsdl:part name="parameters" element="tns:addResourcesResponse" />
  </wsdl:message>
  <wsdl:message name="addResourcesAuthHeader">
    <wsdl:part name="AuthHeader" element="tns:AuthHeader" />
  </wsdl:message>
  <wsdl:message name="setDistanceMatrixSoapIn">
    <wsdl:part name="parameters" element="tns:setDistanceMatrix" />
  </wsdl:message>
  <wsdl:message name="setDistanceMatrixSoapOut">
    <wsdl:part name="parameters" element="tns:setDistanceMatrixResponse" />
  </wsdl:message>
  <wsdl:message name="setDistanceMatrixAuthHeader">
    <wsdl:part name="AuthHeader" element="tns:AuthHeader" />
  </wsdl:message>
  <wsdl:message name="setTimeMatrixSoapIn">
    <wsdl:part name="parameters" element="tns:setTimeMatrix" />
  </wsdl:message>
  <wsdl:message name="setTimeMatrixSoapOut">
    <wsdl:part name="parameters" element="tns:setTimeMatrixResponse" />
  </wsdl:message>
  <wsdl:message name="setTimeMatrixAuthHeader">
    <wsdl:part name="AuthHeader" element="tns:AuthHeader" />
  </wsdl:message>
  <wsdl:message name="setPropertiesSoapIn">
    <wsdl:part name="parameters" element="tns:setProperties" />
  </wsdl:message>
  <wsdl:message name="setPropertiesSoapOut">
    <wsdl:part name="parameters" element="tns:setPropertiesResponse" />
  </wsdl:message>
  <wsdl:message name="setPropertiesAuthHeader">
    <wsdl:part name="AuthHeader" element="tns:AuthHeader" />
  </wsdl:message>
  <wsdl:message name="setCredentialsSoapIn">
    <wsdl:part name="parameters" element="tns:setCredentials" />
  </wsdl:message>
  <wsdl:message name="setCredentialsSoapOut">
    <wsdl:part name="parameters" element="tns:setCredentialsResponse" />
  </wsdl:message>
  <wsdl:message name="setCredentialsAuthHeader">
    <wsdl:part name="AuthHeader" element="tns:AuthHeader" />
  </wsdl:message>
  <wsdl:message name="getOptimizationProgressSoapIn">
    <wsdl:part name="parameters" element="tns:getOptimizationProgress" />
  </wsdl:message>
  <wsdl:message name="getOptimizationProgressSoapOut">
    <wsdl:part name="parameters" element="tns:getOptimizationProgressResponse" />
  </wsdl:message>
  <wsdl:message name="getOptimizationProgressAuthHeader">
    <wsdl:part name="AuthHeader" element="tns:AuthHeader" />
  </wsdl:message>
  <wsdl:portType name="jopt_aspClassSoap">
    <wsdl:operation name="getSessionId">
      <wsdl:input message="tns:getSessionIdSoapIn" />
      <wsdl:output message="tns:getSessionIdSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="startRemoteOptimizationRunTest">
      <wsdl:input message="tns:startRemoteOptimizationRunTestSoapIn" />
      <wsdl:output message="tns:startRemoteOptimizationRunTestSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="startRemoteOptimizationRun">
      <wsdl:input message="tns:startRemoteOptimizationRunSoapIn" />
      <wsdl:output message="tns:startRemoteOptimizationRunSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="addNode">
      <wsdl:input message="tns:addNodeSoapIn" />
      <wsdl:output message="tns:addNodeSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="addNodes">
      <wsdl:input message="tns:addNodesSoapIn" />
      <wsdl:output message="tns:addNodesSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="addResource">
      <wsdl:input message="tns:addResourceSoapIn" />
      <wsdl:output message="tns:addResourceSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="addResources">
      <wsdl:input message="tns:addResourcesSoapIn" />
      <wsdl:output message="tns:addResourcesSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="setDistanceMatrix">
      <wsdl:input message="tns:setDistanceMatrixSoapIn" />
      <wsdl:output message="tns:setDistanceMatrixSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="setTimeMatrix">
      <wsdl:input message="tns:setTimeMatrixSoapIn" />
      <wsdl:output message="tns:setTimeMatrixSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="setProperties">
      <wsdl:input message="tns:setPropertiesSoapIn" />
      <wsdl:output message="tns:setPropertiesSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="setCredentials">
      <wsdl:input message="tns:setCredentialsSoapIn" />
      <wsdl:output message="tns:setCredentialsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="getOptimizationProgress">
      <wsdl:input message="tns:getOptimizationProgressSoapIn" />
      <wsdl:output message="tns:getOptimizationProgressSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="jopt_aspClassSoap" type="tns:jopt_aspClassSoap">
    <wsdl:documentation>
      <wsi:Claim conformsTo="http://ws-i.org/profiles/basic/1.1" xmlns:wsi="http://ws-i.org/schemas/conformanceClaim/" />
    </wsdl:documentation>
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="getSessionId">
      <soap:operation soapAction="http://tempuri.org/getSessionId" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
        <soap:header message="tns:getSessionIdAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="startRemoteOptimizationRunTest">
      <soap:operation soapAction="http://tempuri.org/startRemoteOptimizationRunTest" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
        <soap:header message="tns:startRemoteOptimizationRunTestAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="startRemoteOptimizationRun">
      <soap:operation soapAction="http://tempuri.org/startRemoteOptimizationRun" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
        <soap:header message="tns:startRemoteOptimizationRunAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="addNode">
      <soap:operation soapAction="http://tempuri.org/addNode" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
        <soap:header message="tns:addNodeAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="addNodes">
      <soap:operation soapAction="http://tempuri.org/addNodes" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
        <soap:header message="tns:addNodesAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="addResource">
      <soap:operation soapAction="http://tempuri.org/addResource" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
        <soap:header message="tns:addResourceAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="addResources">
      <soap:operation soapAction="http://tempuri.org/addResources" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
        <soap:header message="tns:addResourcesAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="setDistanceMatrix">
      <soap:operation soapAction="http://tempuri.org/setDistanceMatrix" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
        <soap:header message="tns:setDistanceMatrixAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="setTimeMatrix">
      <soap:operation soapAction="http://tempuri.org/setTimeMatrix" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
        <soap:header message="tns:setTimeMatrixAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="setProperties">
      <soap:operation soapAction="http://tempuri.org/setProperties" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
        <soap:header message="tns:setPropertiesAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="setCredentials">
      <soap:operation soapAction="http://tempuri.org/setCredentials" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
        <soap:header message="tns:setCredentialsAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getOptimizationProgress">
      <soap:operation soapAction="http://tempuri.org/getOptimizationProgress" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
        <soap:header message="tns:getOptimizationProgressAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="jopt_aspClassSoap12" type="tns:jopt_aspClassSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="getSessionId">
      <soap12:operation soapAction="http://tempuri.org/getSessionId" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
        <soap12:header message="tns:getSessionIdAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="startRemoteOptimizationRunTest">
      <soap12:operation soapAction="http://tempuri.org/startRemoteOptimizationRunTest" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
        <soap12:header message="tns:startRemoteOptimizationRunTestAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="startRemoteOptimizationRun">
      <soap12:operation soapAction="http://tempuri.org/startRemoteOptimizationRun" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
        <soap12:header message="tns:startRemoteOptimizationRunAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="addNode">
      <soap12:operation soapAction="http://tempuri.org/addNode" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
        <soap12:header message="tns:addNodeAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="addNodes">
      <soap12:operation soapAction="http://tempuri.org/addNodes" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
        <soap12:header message="tns:addNodesAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="addResource">
      <soap12:operation soapAction="http://tempuri.org/addResource" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
        <soap12:header message="tns:addResourceAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="addResources">
      <soap12:operation soapAction="http://tempuri.org/addResources" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
        <soap12:header message="tns:addResourcesAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="setDistanceMatrix">
      <soap12:operation soapAction="http://tempuri.org/setDistanceMatrix" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
        <soap12:header message="tns:setDistanceMatrixAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="setTimeMatrix">
      <soap12:operation soapAction="http://tempuri.org/setTimeMatrix" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
        <soap12:header message="tns:setTimeMatrixAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="setProperties">
      <soap12:operation soapAction="http://tempuri.org/setProperties" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
        <soap12:header message="tns:setPropertiesAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="setCredentials">
      <soap12:operation soapAction="http://tempuri.org/setCredentials" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
        <soap12:header message="tns:setCredentialsAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="getOptimizationProgress">
      <soap12:operation soapAction="http://tempuri.org/getOptimizationProgress" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
        <soap12:header message="tns:getOptimizationProgressAuthHeader" part="AuthHeader" use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="jopt_aspClass">
    <wsdl:port name="jopt_aspClassSoap" binding="tns:jopt_aspClassSoap">
      <soap:address location="http://www.joptaas.net/joptasp/jopt_asp.asmx" />
    </wsdl:port>
    <wsdl:port name="jopt_aspClassSoap12" binding="tns:jopt_aspClassSoap12">
      <soap12:address location="http://www.joptaas.net/joptasp/jopt_asp.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>