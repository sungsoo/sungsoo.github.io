---
layout: post
title: PRODML Data Schema and API Specifications
date: 2014-01-03
categories: [computer science]
tags: [big data]

---


### PRODML DATA SCHEMA AND API SPECIFICATIONS
 
#### PRODML Overview
The following specifications are the latest versions and are recommended for new or upgraded implementations.
 
#### NEW COMPLETION DATA-OBJECT
This new data-object is compatible with WITSML v1.4.1.1 and PRODML v1.2.2.
Details found <a href="http://www.energistics.org/drilling-completions-interventions/witsml-standards/completions-data-object">here</a>.</p>
 
<table border="0" cellpadding="0" cellspacing="0" style="color: rgb(0, 0, 0); border: medium none; border-collapse: collapse; ">
	<thead>
		<tr>
			<th scope="col">
				<div>
					Standard</div>
			</th>
			<th scope="col">
				<div>
					Browsable</div>
			</th>
			<th scope="col">
				<div>
					Files</div>
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>
				<div>
					Business Overview</div>
			</td>
			<td>
				<div style="text-align: center; ">
					N/A</div>
			</td>
			<td>
				<div style="text-align: center; ">
					&lt;<a href="http://w3.energistics.org/schema/PRODML_Business_Overview.pdf" target="_blank">download</a>&gt;</div>
			</td>
		</tr>
		<tr>
			<td>
				<div>
					Data Schema Specifications&nbsp;&ndash; Version 1.2.2</div>
			</td>
			<td>
				<div style="text-align: center; ">
					&lt;<a href="http://w3.energistics.org/schema/prodml_v1.2.2_data_schema/prodml_v1.2.2_data/index_prodml_schema.html" target="_blank">link</a>&gt;</div>
			</td>
			<td>
				<div style="text-align: center; ">
					&lt;<a href="http://w3.energistics.org/schema/prodml_v1.2.2_data_schema.zip" target="_blank">download</a>&gt;</div>
			</td>
		</tr>
		<tr>
			<td>
				<div>
					Generic Data Access (GDA) service interface&nbsp;- v2.1.0.1</div>
			</td>
			<td>
				<div style="text-align: center; ">
					N/A</div>
			</td>
			<td>
				<div>
					&lt;<a href="http://w3.energistics.org/schema/PRODML_v2.1.0.1_GDA.zip" target="_blank">download</a>&gt;</div>
			</td>
		</tr>
		<tr>
			<td>
				<div>
					Generic Data&nbsp;Processor (GDP) service interface&nbsp;- v2.1.0</div>
			</td>
			<td>
				<div style="text-align: center; ">
					N/A</div>
			</td>
			<td>
				<div style="text-align: center; ">
					&lt;<a href="http://w3.energistics.org/schema/prodml_v2.1.0_GDP.zip" target="_blank">download</a>&gt;</div>
				<div>
					<div>
						&nbsp;</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div>
					PRODML Identifier&nbsp;- v2.1</div>
			</td>
			<td>
				<div style="text-align: center; ">
					N/A</div>
			</td>
			<td>
				<div style="text-align: center; ">
					&lt;<a href="http://w3.energistics.org/schema/PRODML_Identifiers_V2.1.pdf" target="_blank">download</a>&gt;</div>
			</td>
		</tr>
		<tr>
			<td>
				<div>
					Shared Asset Model (SAM) specification&nbsp;- v2.0</div>
				<div>
					NOTE:&nbsp;Recommended only the SAM specification be used along with the above data schema,&nbsp;GDA and GDP updated specifications (or any combination thereof).</div>
			</td>
			<td>
				<div style="text-align: center; ">
					N/A</div>
			</td>
			<td>
				<div style="text-align: center; ">
					&lt;<a href="http://w3.energistics.org/schema/prodml_v2.0.0_services.zip">dow</a><span style="font-size: 8pt; "><font color="#0066cc" style=""><a href="http://w3.energistics.org/schema/prodml_v2.0.0_services.zip" style="">nload</a></font>&gt;</span></div>
			</td>
		</tr>
	</tbody>
</table>

 
#### DEFINITIONS
Following are brief descriptions of these specifications.
 
**Data schema**: XML schemas for production-oriented data objects.

* The productFlowModel data-object can be used to capture a directed graph of flow connections in a network.
* The productVolume data-object can capture time-varying properties within the context of a flow network. Detailed knowledge of the network is not required.
* The productionOperation data-object can capture the activities related to production operations for a stated period (day, month, arbitrary, ...).
* The timeSeriesData data-object can capture a historian view of how data varies with time.
* The timeSeriesStatistic data-object can capture derived statistics about timeSeriesData within a time interval.
* The fluidSample, fluidAnalysis and fluidAnalysisResult data-objects can capture information about a fluid sample and its related lab tests.
* The dtsInstalledSystem and dtsMeasurement data-objects can capture information related to a distributed temperature survey (DTS) in a wellbore.
* The wellTest data-object can capture the results of a well test.
* The wftRun data-object can capture information from one run of a wireline formation test (WFT).

**Generic Data Access (DGA) service interface**: A web service interface specification for accessing a persistent data store. It supports get, put and delete.
 
**Generic Data Processor (GDP) service interface**: A web service interface specification for passing data to a server in order to apply a server-specific function to that same data. The data returned from the server will represent some variation of the data initially passed by the client to the server.
 
**PRODML Identifier**: A specification for how to create a PRODML-formatted string that incorporates a hierarchy of facility identifiers. This format is specified to be used in some of the service interfaces and data-schemas.
 
#### CHANGES FROM PREVIOUS VERSIONS
Changes in PRODML v2.1 Services

* Added new PRODML_Business_Overview.pdf file.
* Split previous PRODML API document into individual documents for each service interface/WSDL.
	* PRODML_GDA_Service_Specification_V2.1.pdf  
		§ DeleteData operation added.
		§ Replaced pseudo-code descriptions with UML diagrams.
		§ Revamped error handling to specify the use of SOAP faults instead of return codes.
		§ Enhanced descriptions of parameters.
	* PRODML_GDP_Service_Specification_V2.1.pdf  
		§ Replaced pseudo-code descriptions with UML diagrams.  
		§ Revamped error handling to specify the use of SOAP faults instead of return codes.  
		§ Enhanced descriptions of parameters.  
		§ Enhanced capabilities object.
		
	* PRODML_Identifiers_V2.1.pdf
		§ Centralized the documentation of PRODML IDs for use in GDA, GDP, SAM and productVolume data-schema.
		§ Clarified the format.
		§ Changed the format to allow the type to be specified without an ID (e.g., well known points such as bottomhole do not need an ID).
		§ Added support for a Relative PRODML ID.
	* The SAM specification was also split out but is not included in this release.
 
Changes in PRODML v1.2.1 data-schemas (all backward compatible).

* Added wftRun data-schema for “Wireline Formation Tests”.
* Added elements for “Productivity Index”.
* Added support for internal facility parameters using a “Relative PRODML Identifier”.

### References
[1] The Energy Standards Resource Centre, [PRODML DATA SCHEMA AND API SPECIFICATIONS](http://www.energistics.org/production/prodml-standards/current-standards), 2014.
