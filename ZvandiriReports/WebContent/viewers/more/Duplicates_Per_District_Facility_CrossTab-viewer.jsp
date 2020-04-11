<%@ page contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1" %><%@ page import="com.businessobjects.samples.CRJavaHelper,
com.crystaldecisions.report.web.viewer.CrystalReportViewer,
com.crystaldecisions.sdk.occa.report.application.OpenReportOptions,
com.crystaldecisions.sdk.occa.report.application.ReportClientDocument,
com.crystaldecisions.sdk.occa.report.lib.ReportSDKExceptionBase" %><%
	// This sample code calls methods from the CRJavaHelper class, which 
	// contains examples of how to use the BusinessObjects APIs. You are free to 
	// modify and distribute the source code contained in the CRJavaHelper class. 

	try {

		String reportName = "Reports/Duplicates_Per_District_Facility_CrossTab.rpt";
		ReportClientDocument clientDoc = (ReportClientDocument) session.getAttribute(reportName);

		if (clientDoc == null) {
			// Report can be opened from the relative location specified in the CRConfig.xml, or the report location
			// tag can be removed to open the reports as Java resources or using an absolute path
			// (absolute path not recommended for Web applications).

			clientDoc = new ReportClientDocument();
			clientDoc.setReportAppServer(ReportClientDocument.inprocConnectionString);
			
			// Open report
			clientDoc.open(reportName, OpenReportOptions._openAsReadOnly);

		
			// ****** BEGIN SET RUNTIME DATABASE CREDENTIALS ****************  
			{
				String connectString = "jdbc:mysql://localhost:3306/zvandiri";
				String driverName = "com.mysql.jdbc.Driver";
				String JNDIName = "";
				String userName = "zvandiri";			// TODO: Fill in database user
				String password = "zvandiri2019";		// TODO: Fill in password

				// Switch all tables on the main report and sub reports
				CRJavaHelper.changeDataSource(clientDoc, userName, password, connectString, driverName, JNDIName);

				// logon to database
				CRJavaHelper.logonDataSource(clientDoc, userName, password);
			}
			// ****** END SET RUNTIME DATABASE CREDENTIALS **************** 		
		
		
			// ****** BEGIN CONNECT PARAMETERS SNIPPET ****************		
			     // This option is not applicable for the report you have chosen
			// ****** END CONNECT PARAMETERS SNIPPET ****************	
		

			// Store the report document in session
			session.setAttribute(reportName, clientDoc);

		}

				
		// ****** BEGIN CONNECT CRYSTALREPORTPAGEVIEWER SNIPPET ****************  
		{
			// Create the CrystalReportViewer object
			CrystalReportViewer crystalReportPageViewer = new CrystalReportViewer();
			crystalReportPageViewer.setName("Duplicates_Per_District_Facility_CrossTab");
			String reportSourceSessionKey = reportName+"ReportSource";
			Object reportSource = session.getAttribute(reportSourceSessionKey);
			if (reportSource == null)
			{
				reportSource = clientDoc.getReportSource();
				session.setAttribute(reportSourceSessionKey, reportSource);
			}
			//	set the reportsource property of the viewer
			crystalReportPageViewer.setReportSource(reportSource);

			// Apply the viewer preference attributes


			// Process the report
			crystalReportPageViewer.processHttpRequest(request, response, application, null); 

		}
		// ****** END CONNECT CRYSTALREPORTPAGEVIEWER SNIPPET ****************		
	

	} catch (ReportSDKExceptionBase e) {
	    out.println(e);
	}
	
%>

<title>Duplicates_Per_District_Facility_CrossTab</title>