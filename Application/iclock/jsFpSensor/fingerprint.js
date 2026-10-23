/**
* ----------------------------------------------------------common start--------------------------------------------------------------
*/

// Collect fingerprints
var FINGERPRINT_NUMBER = 3;
// Duress fingerprint number - when the fingerprint is dull, the number added to the ordinary fingerprint
var DURESS_FINGER_NUM = 16;
// duress fingerprint mark
var duressFingerFlag = null;
// Whether to display the duress fingerprint (when the user enrolls the fingerprint, do not need duress fingerprint), the default display duress fingerprint
var duressFingerShowFlag = true;
// finger tag array
var fingerIdArray = new Array(); //[]
// fingerprint template data array
var templateDataArray = new Array(); //[]
// Timer - used when closing setTimeOut
var timer = null;
// Timer - verification
var verifyTimer = null;
// Determine whether the current finger is being collected
var collectFlag = false;
//The currently clicked finger marker
var fpIdNum = null;
// Access ISSOnline_server ip
var serverIp = null;
//Visit the ISSOnline_server port
var serverPort = null;
//The public part of the url of the ISSOnline_server: http://127.0.0.1:22001/ZKBIOOnline
//var issOnlineUrl = null;
var issOnlineUrl = "http://127.0.0.1:22001/ZKBIOOnline";
// Is it a visitor?
var isVisPager = false;
// Define the version number of the driver
var fpDriverVersion = "5.0.0.1";
// Is it a comparison function?
var isComp = false;

/**
* Load ip and port of ISSOnline_server in xml
* @author wenxin
* @create 2013-06-15 15:01:31 pm
* @param url load xml url
*/
function loadXml(url)
{



    $.ajax({
        type: "GET",
        url: url,
        dataType: "xml",
        async: false,
        success: function (xml) {
            $(xml).find('service').each(function () {
                var service = $(this);
                serverIp = service.find('ISSOnline_serverIp').text();
               
                serverPort = service.find('ISSOnline_serverPort').text();
            })
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            //If the configuration file error occurs, set the default
            serverIp = "127.0.0.1";
            serverPort = "22001";
        }
    });
    //Assign value to issOnlineUrl
    issOnlineUrl = "http://" + serverIp + ":" + serverPort + "/ZKBIOOnline";
}

/**
* Get the fingerprint mark and fingerprint template of the database when editing
* @author wenxin
* @create 2013-04-22 10:18:31 am
* @param fingerIdList fingerprint tag for database query
* @param templateList Fingerprint template for database query
*/
function loadFPDataTemplate(fingerIdList, templateList)
{
	if(fingerIdList == "[]") 
	{
		$("#fingerId").val(" ");
	} 
	else 
	{
		$("#fingerId").val(fingerIdList);
	}
	if(templateList == "[]") 
	{
		$("#fingerTemplate10").val(" ");
	} 
	else 
	{
		$("#fingerTemplate10").val(templateList);
	}
}


/**
* Get browser type
* @author wenxin
* @create 2013-08-09 17:24:31 pm
*/
function getBrowserType()
{
	var browserFlag = "";
	//Whether to support html5 cors cross-domain
    if (typeof(Worker) !== "undefined")
    {
        browserFlag = "html5";
    }
    //Here judge IE8, ie9
    else if(navigator.userAgent.indexOf("MSIE 8.0")>0 || navigator.userAgent.indexOf("MSIE 9.0")>0)
    {
        browserFlag = "simple";
    }
    else
	{
		browserFlag = "upgradeBrowser";//当前浏览器不支持该功能,请升级浏览器
	}
    return browserFlag;
}

/**
* Determine whether to install the fingerprint driver
* @author wenxin
* @create 2013-04-22 20:18:31 pm
* @param browserFlag Browser tag simple: simple version, indicating that it is IE browser; html5: means browser supporting html5
* @param paramArray An array of internationalized elements
* @param isFPLogin Whether it is a fingerprint login true: yes; false: no
*/
//Used method
function checkDriver(paramArray, browserFlag, isFPLogin)
{
	var hrefStr = "";
	if(browserFlag == "html5")
	{
	    // Send a request to check if the driver is installed
		getWebServerInfo(paramArray, isFPLogin, "0");
	}
	else if(browserFlag == "simple")
	{
	    //Send a request to check if the driver is installed
		getWebServerInfoForSimple(paramArray, isFPLogin, "0");
	}
	else if(browserFlag == "upgradeBrowser")
	{
		if($("#userLoginForm [name='fingerLogin']").val() != undefined)
		{
			$("#userLoginForm [name='fingerLogin']").attr("onclick", "");
			$("#userLoginForm [name='fingerLogin']").attr("title", "The current browser does not support the change function, please upgrade the browser!");
		}
		if($("#fpRegister").val() != undefined)
		{
			$("#fpRegister").attr("onclick", "");
			$("#fpRegister").attr("title", "The current browser does not support the change function, please upgrade the browser!");
		}
	}
}

/**
* Get information about webserver
* @author wenxin
* @param
* @param paramArray An array of internationalized elements
* @param isFPLogin Whether it is a fingerprint login true: yes; false: no
* @param type 0 means that there are other operations after the request is sent. 1 means that after the request is sent, there are no more operations.
* @create 2013-08-09 17:24:31 pm
*/
//Used method
function getWebServerInfo(paramArray, isFPLogin, type)
{
   
	$.ajax( {
		type : "GET",
		url : issOnlineUrl+"/info",
		dataType : "json",
		async: true,
		//timeout:1000,
		success : function(result) 
		{
		    //Check drive
			if(type == "0")
			{
				getWebServerInfoCallBack(result, paramArray, isFPLogin);
			}
            //Check dynamic library connections
			else if(type == "1")
			{
				getDLLConnectCallBack(result,isComp);
			}
			
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) 
		{
			
	    }
	});
}

/**
* Get information about webserver
* @author wenxin
* @param paramArray An array of internationalized elements
* @param isFPLogin Whether it is a fingerprint login true: yes; false: no
* @param type 0 means that there are other operations after the request is sent. 1 means that after the request is sent, there are no more operations.
* @create 2013-08-09 17:24:31 pm
*/
//Used method
function getWebServerInfoForSimple(paramArray, isFPLogin, type)
{
    //Create an XDomainRequest instance for cross-domain access to ie8 and ie9
	var xDomainRequest = new XDomainRequest();
	//If the xDomainRequest exists, you can use the xDomainRequest function. Otherwise, the description is not the IE browser.
	if (xDomainRequest) 
	{  
		xDomainRequest.open('GET', issOnlineUrl+"/info?random="+getRandomNum());  
		xDomainRequest.onload = function()
		{
		    //Check drive
			if(type == "0")
			{
				getInfoForSimpleCallBack(xDomainRequest, paramArray, isFPLogin);
			}
//Check dynamic library connections
			else if(type == "1")
			{
				getDLLConnectCallBack(xDomainRequest,isComp);
			}
		};  
		xDomainRequest.onerror = function()
		{
			//When you are done, set the object to empty
			xDomainRequest = null;
		};
		xDomainRequest.send();  
	} 
}



/**
* Get callback function for webserver information
* @author wenxin
* @create 2013-08-09 17:24:31 pm
*/
//Used method
function getWebServerInfoCallBack(result, paramArray, isFPLogin)
{
    //Return code
	var ret = null;
	ret = result.ret;
	//When the interface call returns successfully
	if(ret == 0)
	{
		if(isFPLogin)
		{
		    //Display fingerprint login
			showFPVerify(paramArray);
		}
		else
		{
		    //Display registration - you can click to collect fingerprints
			showRegister(paramArray);
			//Calculate the number of fingerprints ${pers_person_templateCount}: number of fingerprints
			showFPCountInit(paramArray[5], paramArray[6]);
			//Mouse over event
			//mouseOverEvent();
			// Contrast fingerprint drive
			if (result.data&&result.data.server_version){
			    compareFPDriver(result.data.server_version);
			}
		}
		
	}
}


/**
* Display fingerprint login - click to perform fingerprint verification
* @author wenxin
* @create 2013-06-14 10:09:20 am
* @param paramArray An array of internationalized elements
*/
function showFPVerify(paramArray)
{
	$("#userLoginForm .but_fing_disabled").hide();
	$("#userLoginForm .but_fing").show();
}


/**
* Display registration - click to collect fingerprints
* @author wenxin
* @create 2013-06-14 10:09:20 am
* @param paramArray An array of internationalized elements
*/
function showRegister(paramArray)
{
	var hrefStr = "";
	var param = '"' + paramArray[0] + '", "' + paramArray[1] + '", "' + paramArray[2] + '", ' + null + '';

	$("#fpRegister").remove();
	$("#downloadDriver").remove();
	//The webservice interface is successfully called, indicating that the driver has been installed.
	hrefStr = "<a id='fpRegister' style='color: #006400;border-bottom: 1px solid green;' onclick='submitRegister(" + param + ", true" + ")' title='" + paramArray[3] + "' class='linkStyle'>" + paramArray[3] + "</a>";

	$("#fpRegisterDiv").append(hrefStr);
}

/**
* Calculate the number of fingerprints when the page is initialized
* @author wenxin
* @create 2013-04-25 11:31:20 am
*
*/
function showFPCountInit(fingerIdCount, text)
{
	$("#fpCountMessage").text(text +" "+ fingerIdCount);
}


/**
* Compare fingerprint driver version
* @author gordon.zhang
* @param oldVersion old driver version
* @create 2015-01-28 17:24:31 pm
*/
function compareFPDriver(oldVersion)
{
    var existVersion = fpDriverVersion
	var curVersion = oldVersion;//3.5.2
	var existVersionArr = existVersion.split(".");
	var curVersionArr = curVersion.split(".");
	var isLast = true;
	var len = existVersionArr.length;
	for(var i=len;i>0;i--)
	{
		var existVersionTemp = parseInt(existVersionArr[i-1]);
		var curVersionTemp = parseInt(curVersionArr[i-1]);
		if(existVersionTemp<curVersionTemp)
		{
			isLast = false;
		}
		else if(existVersionTemp>curVersionTemp)
		{
			isLast = true;
		}
		else
		{
		    //Equal to ignore
		}
	}
}

/**
* Show new drivers found
* @author gordon.zhang
* @create 2015-01-28 17:24:31 pm
*/
function showNewDriver(){
    var hrefStr = "<a id='downloadDriver' href='../ZKBioOnline.exe' title='Download new driver'>Download new driver</a>";
    //var hrefStr = "<a id='downloadDriver' href='base/driver/zkbioonline driver.exe' title='Download new driver'>Download new driver</a>";
    $("#driverDownload").append(hrefStr);
}


/**
* Get webserver information - simple version
* @author wenxin
* @param paramArray An array of internationalized elements
* @param isFPLogin Whether it is a fingerprint login true: yes; false: no
* @create 2013-08-09 17:43:31 pm
*/
//Used method
function getInfoForSimpleCallBack(xDomainRequest, paramArray, isFPLogin)
{
    //Get the interface return value
	var resultData = xDomainRequest.responseText;
	//Convert to json object
	var obj = jQuery.parseJSON(resultData);
	//Return code
	var ret = null;
	if(obj != null && obj.ret != undefined)
	{
		ret = obj.ret;
	}
	//When the interface call returns successfully
	if(ret == 0)
	{
		if(isFPLogin)
		{
			//Display fingerprint comparison
			showFPVerify(paramArray);
		}
		else
		{
		    //Display registration - click to collect fingerprints
			showRegister(paramArray);
			//Calculate the number of fingerprints ${pers_person_templateCount}: number of fingerprints
			
			showFPCountInit(paramArray[5], paramArray[6]);
			//Mouse over event
			//mouseOverEvent();
		}
		//When you are done, set the object to empty
		xDomainRequest = null;
	}
}





/**
* Display box - display information such as the number of acquisitions, successful acquisition, failure, etc.
* @author wenxin
* @create 2013-05-16 16:56:31 pm
* @param context 2d canvas context
* @param text Display information content
* @param browserFlag Browser tag or comparison verification tag simple: simple version, indicating that it is IE browser; html5: means browser supporting html5
* --verification: fingerprint verification mark
*/
function collectTips(context, text, browserFlag)
{
	if(browserFlag == "simple")
	{
		$("#showCollInfoDiv").html("<span style='color:rgb(122,193,66); font-size: 12px;word-break: break-all; word-wrap: break-word;'>"+text+"</span>");
	}
	else if(browserFlag == "html5")
	{

	    //alert(text);
		context.fillStyle = bgColor;//bgColor;
		context.fillRect(205, 18, 240, 16);

		//Right-aligned text
		context.fillStyle = "rgb(122,193,66)";
		context.font ="11px Arial,微软雅黑"; 
		//context.shadowColor = 'white'; 
	    //context.shadowBlur = 10; 
	    //context.strokeText(text, 230, 30);
		context.textAlign = "end";
		context.fillText(text, 400, 30);
	}
	else if(browserFlag == "verification")
	{
		//#6BA5D7
		context.fillStyle = "#F3F5F0";//#6BA5D7
		context.fillRect(2, 8, 600, 30);
		//Get the canvas object
		var canvas ="";
		if(isComp){
			canvas = document.getElementById("canvasComp");
		}else{
			canvas = document.getElementById("canvas");
		}
//		canvas.width = canvas.width;
//Returns a text metric information object metrics
		var metrics = context.measureText(text);
		//Text width
		var textWidth = metrics.width;
		//Canvas width
		canvas != null?canvasWidth = canvas.width:canvasWidth = 450;
		//Text start x coordinate
		var x = textWidth/2 + (canvasWidth - textWidth)/2;
		
		
		//context.fillStyle = bgColor;
		//context.fillRect(0, 18, 445, 16);

		//Right-aligned text
		context.fillStyle = "rgb(122,193,66)";
		context.font ="24px Arial,微软雅黑"; 
		context.textAlign = "center";
		//Automatic line break
		autoWordBreak(context,text,canvasWidth,x);
		context.restore();
	}
	else if(browserFlag == "verifyForSimple")
	{
		$("#showCollInfoDiv").html("<span style='color:yellow;align:center;font-size: 18px;word-break: break-all; word-wrap: break-word;'>"+text+"</span>");
	}
}





// open FP Registration popup


//------
/**
* Click on the registration to trigger the event
* @author wenxin
* @create 2013-05-21 11:31:20 am
* @param title page title internationalization content
* @param fpCount Fingerprint number internationalization content
* @param saveText Tip: Whether to save international content
* @param downloadText driver to install international content
* @param isDriverInstall Is the driver installed?
*/
function submitRegister(title, fpCount, saveText, downloadText, isDriverInstall) {
    //Support html5
    if (typeof (Worker) !== "undefined" && isDriverInstall) {
        var box = document.getElementById("box");
        var bg = document.getElementById("bg");

        $("#fingerTemplate10").val(" ");
        $("#fingerId").val(" ");

        fingerIdArray = new Array();
        templateDataArray = new Array();

        box.style.display = "block"; //Display content layer, display overlay
        box.style.left = parseInt((document.documentElement.scrollWidth - box.offsetWidth) / 2) + document.documentElement.scrollLeft + "px";
        box.style.top = Math.abs(parseInt((document.documentElement.clientHeight - box.offsetHeight) / 2)) + document.documentElement.scrollTop + "px"; //为内容层设置位置
        bg.style.display = "block";
        bg.style.height = document.documentElement.scrollHeight + "px";
        isComp = false;
        cleanData();
        dataInitReg();


        //Prompt to save data when closing the page
        //storeBeforeClose(fpCount, saveText);
    }
    else if (typeof (Worker) == "undefined" && isDriverInstall) {
        //createWindow('base_baseFPRegisterSimple.action?random=' + getRandomNum() + '^0^0^465^460^' + title);//public/html/applet.html
        showModalDialog('webapp/html/baseFPRegisterSimple.html', title, 'dialogWidth:465px;dialogHeight:460px;dialogLeft:600px;dialogTop:150px;center:yes;resizable:no;status:yes');
        //Prompt to save data when closing the page
        //storeBeforeClose(fpCount, saveText);
    }
    else if (!isDriverInstall) {

        alert("Please install the fingerprint driver or start the service!");
        //messageBox({messageType: "alert", title: "提示", text: "Please install a fingerprint driver or start the service!"});
        if (typeof ($("#downloadDriver").val()) == "undefined") {
            var hrefStr = "<a id='downloadDriver' href='../ZKBioOnline.exe' title='" + downloadText + "'>" + downloadText + "</a>";
            //var hrefStr = "<a id='downloadDriver' href='webapp/driver/zkbioonline driver.exe' title='" + downloadText + "'>" + downloadText + "</a>";
            $("#driverDownload").append(hrefStr);
        }
    }
}




/**
* Get the fingerprint data of the page
* @author wenxin
* @create 2013-05-13 10:18:31 am
* @param
*/
function getDataFromPage() {

    var strArrayFP = new Array();
    var strArrayID = new Array();

    if (document.getElementById("fingerTemplate10DB").value != "") {

        strArrayFP = document.getElementById("fingerTemplate10DB").value.split(",");
        strArrayID = document.getElementById("fingerIdDB").value.split(",");


        $("#fingerTemplate10").val("[" + strArrayFP.toString() + "]");
        $("#fingerId").val("[" + strArrayID.toString() + "]");

    }

    var fingerId = $("#fingerId").val();
    var fingerTemplate = $("#fingerTemplate10").val();

//    alert(fingerTemplate);

    //If there is data
    if ($.trim(fingerId) != "") {
        fingerIdArray = new Array();
        templateDataArray = new Array();
        fingerId = fingerId.substr(1, fingerId.length - 2);
        fingerTemplate = fingerTemplate.substr(1, fingerTemplate.length - 2);
        fingerIdArray = fingerId.split(",");
        templateDataArray = fingerTemplate.split(",");

    } else {
        fingerIdArray = new Array();
        templateDataArray = new Array();
    }

    
    
}


/**
* When the page is closed, if there is a modification operation, the user is prompted to save the data.
* @author wenxin
* @create 2013-06-08 19:36:20 pm
* @param fpCount Fingerprint number internationalization content
* @param saveText Tip: Whether to save international content
*/
function storeBeforeClose(fpCount, saveText) {
    //Monitor closed onclick event when closing page
    getCurrentWindow().button("close").attachEvent("onClick", function () {
        //Determine if the data has been modified (including adding and deleting)
        if ($("#whetherModify").val() != undefined && (fpModifyFlag != undefined && fpModifyFlag)) {
            //Get fingerprint tag data
            var fingerIdData = fingerIdArray;
            //Get fingerprint template data
            var fingerTemplateData = templateDataArray;
            var flag = confirm(saveText);
            saveFPData(flag, fpCount);
        }
        else {
            //Cancel collection 
            cancelRegister();
            //Recursive call to close the timer
            clearTimeout(timer);
            //closeWindow();
            close();
        }
    });
}



/**
* Initialize the starting coordinates of the painting finger, palm, and arc, and make it into json format.
* @author wenxin
* @create 2013-06-15 15:40:31 pm
*/
function initCoordJson() {
    var coordJson = [{ "num": 0, "coord": { "x": x + 3, "y": y - 37} },
		             { "num": 1, "coord": { "x": x + 25, "y": y - 37} },
		             { "num": 2, "coord": { "x": x + 47, "y": y - 34} },
		             { "num": 3, "coord": { "x": x + 67, "y": y - 26} },
		             { "num": 4, "coord": { "x": x + 77, "y": y + 18} },
		             { "num": 5, "coord": { "x": x + 153, "y": y + 34} },
		             { "num": 6, "coord": { "x": x + 159, "y": y - 19} },
		             { "num": 7, "coord": { "x": x + 177, "y": y - 30} },
		             { "num": 8, "coord": { "x": x + 198, "y": y - 36} },
		             { "num": 9, "coord": { "x": x + 220, "y": y - 36} },
		             { "num": 10, "coord": { "x": x, "y": y} },
		             { "num": 11, "coord": { "x": x + 170, "y": y + 12} },
		             { "num": 12, "coord": { "x": x + 210, "y": y - 346}}];
    return coordJson;
}



/**
* Put the coordinates of the painting into the array
* @author wenxin
* @create 2013-05-31 18:01:33 pm
* @param coordArray The array passed in, after the coordinates are placed, return
* @param x, y coordinates of the starting point of the painting finger
* @param num Finger, palm number 0-9: finger number; 10: left palm, 11: right palm, 12: arc.
*/
function initCoordArray(coordArray, x, y, num) {
    if (num == 0) {
        coordArray[0] = new Coord(x, y);
        coordArray[1] = new Coord(x + 2, y - 35);
        coordArray[2] = new Coord(x + 5, y - 40);
        coordArray[3] = new Coord(x + 11, y - 42);
        coordArray[4] = new Coord(x + 16, y - 40);
        coordArray[5] = new Coord(x + 18, y - 35);
        coordArray[6] = new Coord(x + 18, y + 1);
        coordArray[7] = new Coord(x + 15, y + 5);
        coordArray[8] = new Coord(x + 9, y + 7);
        coordArray[9] = new Coord(x + 3, y + 5);
        coordArray[10] = new Coord(x, y);
    }
    else if (num == 1) {
        coordArray[0] = new Coord(x, y);
        coordArray[1] = new Coord(x + 8, y - 50);
        coordArray[2] = new Coord(x + 12, y - 54);
        coordArray[3] = new Coord(x + 19, y - 55);
        coordArray[4] = new Coord(x + 22, y - 53);
        coordArray[5] = new Coord(x + 24, y - 49);
        coordArray[6] = new Coord(x + 18, y + 1);
        coordArray[7] = new Coord(x + 15, y + 6);
        coordArray[8] = new Coord(x + 8, y + 7);
        coordArray[9] = new Coord(x + 3, y + 4);
        coordArray[10] = new Coord(x, y);
    }
    else if (num == 2) {
        coordArray[0] = new Coord(x, y);
        coordArray[1] = new Coord(x + 14, y - 54);
        coordArray[2] = new Coord(x + 16, y - 57);
        coordArray[3] = new Coord(x + 23, y - 58);
        coordArray[4] = new Coord(x + 28, y - 55);
        coordArray[5] = new Coord(x + 29, y - 50);
        coordArray[6] = new Coord(x + 17, y + 4);
        coordArray[7] = new Coord(x + 13, y + 8);
        coordArray[8] = new Coord(x + 6, y + 9);
        coordArray[9] = new Coord(x + 1, y + 5);
        coordArray[10] = new Coord(x, y);
    }
    else if (num == 3) {
        coordArray[0] = new Coord(x, y);
        coordArray[1] = new Coord(x + 19, y - 37);
        coordArray[2] = new Coord(x + 21, y - 39);
        coordArray[3] = new Coord(x + 28, y - 39);
        coordArray[4] = new Coord(x + 32, y - 36);
        coordArray[5] = new Coord(x + 33, y - 31);
        coordArray[6] = new Coord(x + 17, y + 6);
        coordArray[7] = new Coord(x + 12, y + 10);
        coordArray[8] = new Coord(x + 6, y + 10);
        coordArray[9] = new Coord(x + 1, y + 6);
        coordArray[10] = new Coord(x, y);
    }
    else if (num == 4) {
        coordArray[0] = new Coord(x, y);
        coordArray[1] = new Coord(x + 30, y - 18);
        coordArray[2] = new Coord(x + 34, y - 17);
        coordArray[3] = new Coord(x + 37, y - 14);
        coordArray[4] = new Coord(x + 39, y - 11);
        coordArray[5] = new Coord(x + 39, y - 8);
        coordArray[6] = new Coord(x + 38, y - 6);
        coordArray[7] = new Coord(x + 12, y + 15);
        coordArray[8] = new Coord(x + 8, y + 17);
        coordArray[9] = new Coord(x + 2, y + 14);
        coordArray[10] = new Coord(x - 2, y + 8);
        coordArray[11] = new Coord(x, y);
    }
    else if (num == 5) {
        coordArray[0] = new Coord(x, y);
        coordArray[1] = new Coord(x - 26, y - 21);
        coordArray[2] = new Coord(x - 27, y - 24);
        coordArray[3] = new Coord(x - 26, y - 30);
        coordArray[4] = new Coord(x - 21, y - 34);
        coordArray[5] = new Coord(x - 16, y - 34);
        coordArray[6] = new Coord(x + 12, y - 18);
        coordArray[7] = new Coord(x + 15, y - 10);
        coordArray[8] = new Coord(x + 13, y - 3);
        coordArray[9] = new Coord(x + 7, y + 1);
        coordArray[10] = new Coord(x, y);
    }
    else if (num == 6) {
        coordArray[0] = new Coord(x, y);
        coordArray[1] = new Coord(x - 17, y - 46);
        coordArray[2] = new Coord(x - 17, y - 50);
        coordArray[3] = new Coord(x - 13, y - 56);
        coordArray[4] = new Coord(x - 6, y - 56);
        coordArray[5] = new Coord(x - 3, y - 54);
        coordArray[6] = new Coord(x + 15, y - 11);
        coordArray[7] = new Coord(x + 15, y - 4);
        coordArray[8] = new Coord(x + 11, y + 2);
        coordArray[9] = new Coord(x + 4, y + 2);
        coordArray[10] = new Coord(x, y);
    }
    else if (num == 7) {
        coordArray[0] = new Coord(x, y);
        coordArray[1] = new Coord(x - 12, y - 54);
        coordArray[2] = new Coord(x - 10, y - 58);
        coordArray[3] = new Coord(x - 5, y - 62);
        coordArray[4] = new Coord(x + 1, y - 61);
        coordArray[5] = new Coord(x + 4, y - 58);
        coordArray[6] = new Coord(x + 18, y - 4);
        coordArray[7] = new Coord(x + 16, y + 1);
        coordArray[8] = new Coord(x + 11, y + 5);
        coordArray[9] = new Coord(x + 5, y + 4);
        coordArray[10] = new Coord(x, y);
    }
    else if (num == 8) {
        coordArray[0] = new Coord(x, y);
        coordArray[1] = new Coord(x - 5, y - 50);
        coordArray[2] = new Coord(x - 2, y - 54);
        coordArray[3] = new Coord(x + 3, y - 57);
        coordArray[4] = new Coord(x + 9, y - 55);
        coordArray[5] = new Coord(x + 11, y - 52);
        coordArray[6] = new Coord(x + 18, y - 1);
        coordArray[7] = new Coord(x + 14, y + 4);
        coordArray[8] = new Coord(x + 9, y + 6);
        coordArray[9] = new Coord(x + 4, y + 5);
        coordArray[10] = new Coord(x, y);
    }
    else if (num == 9) {
        coordArray[0] = new Coord(x, y);
        coordArray[1] = new Coord(x, y - 37);
        coordArray[2] = new Coord(x + 3, y - 41);
        coordArray[3] = new Coord(x + 7, y - 43);
        coordArray[4] = new Coord(x + 13, y - 41);
        coordArray[5] = new Coord(x + 15, y - 37);
        coordArray[6] = new Coord(x + 17, y + 1);
        coordArray[7] = new Coord(x + 15, y + 3);
        coordArray[8] = new Coord(x + 10, y + 6);
        coordArray[9] = new Coord(x + 3, y + 4);
        coordArray[10] = new Coord(x, y);
    }
    else if (num == 10) {
        coordArray[0] = new Coord(x, y);
        coordArray[1] = new Coord(x + 2, y - 8);
        coordArray[2] = new Coord(x + 6, y - 16);
        coordArray[3] = new Coord(x + 13, y - 23);
        coordArray[4] = new Coord(x + 27, y - 27);
        coordArray[5] = new Coord(x + 37, y - 25);
        coordArray[6] = new Coord(x + 43, y - 23);
        coordArray[7] = new Coord(x + 64, y - 16);
        coordArray[8] = new Coord(x + 69, y - 11);
        coordArray[9] = new Coord(x + 73, y - 3);

        coordArray[10] = new Coord(x + 73, y + 10);
        coordArray[11] = new Coord(x + 71, y + 18);
        coordArray[12] = new Coord(x + 57, y + 40);
        coordArray[13] = new Coord(x + 50, y + 46);
        coordArray[14] = new Coord(x + 41, y + 49);
        coordArray[15] = new Coord(x + 34, y + 49);
        coordArray[16] = new Coord(x + 14, y + 43);
        coordArray[17] = new Coord(x + 10, y + 41);
        coordArray[18] = new Coord(x + 6, y + 36);
        coordArray[19] = new Coord(x + 2, y + 29);
        coordArray[20] = new Coord(x, y);
    }
    else if (num == 11) {
        coordArray[0] = new Coord(x, y);
        coordArray[1] = new Coord(x - 2, y - 10);
        coordArray[2] = new Coord(x + 1, y - 20);
        coordArray[3] = new Coord(x + 14, y - 31);
        coordArray[4] = new Coord(x + 47, y - 39);
        coordArray[5] = new Coord(x + 55, y - 38);
        coordArray[6] = new Coord(x + 61, y - 34);
        coordArray[7] = new Coord(x + 68, y - 26);
        coordArray[8] = new Coord(x + 72, y - 16);
        coordArray[9] = new Coord(x + 72, y + 13);

        coordArray[10] = new Coord(x + 68, y + 22);
        coordArray[11] = new Coord(x + 62, y + 29);
        coordArray[12] = new Coord(x + 60, y + 30);
        coordArray[13] = new Coord(x + 39, y + 36);
        coordArray[14] = new Coord(x + 34, y + 36);
        coordArray[15] = new Coord(x + 20, y + 33);
        coordArray[16] = new Coord(x + 16, y + 29);
        coordArray[17] = new Coord(x, y);
    }
    else if (num == 12) {
        coordArray[0] = new Coord(x - 10, y);
        coordArray[1] = new Coord(x + 212, y);
        coordArray[2] = new Coord(x + 212, y + 129);
        coordArray[3] = new Coord(x + 201, y + 130);
        coordArray[4] = new Coord(x + 191, y + 131);
        coordArray[5] = new Coord(x + 174, y + 131);
        coordArray[6] = new Coord(x + 159, y + 129);
        coordArray[7] = new Coord(x + 142, y + 127);
        coordArray[8] = new Coord(x + 133, y + 125);
        coordArray[9] = new Coord(x + 114, y + 120);

        coordArray[10] = new Coord(x + 97, y + 113);
        coordArray[11] = new Coord(x + 86, y + 108);
        coordArray[12] = new Coord(x + 72, y + 100);
        coordArray[13] = new Coord(x + 52, y + 87);
        coordArray[14] = new Coord(x + 40, y + 76);
        coordArray[15] = new Coord(x + 29, y + 64);
        coordArray[16] = new Coord(x + 16, y + 48);
        coordArray[17] = new Coord(x + 5, y + 30);
        coordArray[18] = new Coord(x - 10, y);
    }
    return coordArray;
}


/**
* coordinate point object
* @author wenxin
* @create 2013-05-31 18:01:33 pm
*/
var Coord = function (x, y) {
    this.x = x;
    this.y = y;
}

/**
* Painting fingers
* @author wenxin
* @create 2013-05-31 18:01:33 pm
* @param context 2d canvas context
* @param pointArray coordinate point array
* @param renderFlag render mark stroke: paint edge; fill: fill
* @param color rendering color
*/
var renderFinger = function (context, pointArray) {
    this.context = context;
    this.pointArray = pointArray;
    this.isClick = false;
    this.drawFinger = function (renderFlag, color) {
        if (renderFlag == "stroke") {
            this.context.strokeStyle = color;
        }
        else if (renderFlag == "fill") {
            this.context.fillStyle = color;
        }
        this.context.lineWidth = 1;
        this.context.beginPath();
        for (var i = 0; i < this.pointArray.length; i++) {
            if (i == 0) {
                this.context.moveTo(this.pointArray[0].x, this.pointArray[0].y);
            }
            else {
                this.context.lineTo(this.pointArray[i].x, this.pointArray[i].y);
            }
        }
        if (renderFlag == "stroke") {
            this.context.stroke();
        }
        else if (renderFlag == "fill") {
            this.context.fill();
        }
    };
};


/**
* Render finger when page is loaded and redraw
* @author wenxin
* @create 2013-05-13 15:26:31 pm
* @param context 2d canvas context
* @param num The finger number currently needed to be rendered
* @param browserFlag Browser tag simple: simple version, indicating that it is IE browser; html5: means browser supporting html5
*/
function renderInit(context, num, browserFlag) {
    var fingerId;
    for (var i = 0; i < fingerIdArray.length; i++) {
        fingerId = eval(fingerIdArray[i]);
        if (fingerId >= DURESS_FINGER_NUM) {
            fingerId = fingerId - DURESS_FINGER_NUM;
            if (browserFlag == "html5") {
                if (fingerId == num) {
                    context.fillStyle = "red";
                    context.fill();
                }
            }
        }
        else {
            if (browserFlag == "html5") {
                if (fingerId == num) {
                    context.fillStyle = "rgb(122,193,66)";
                    context.fill();
                }
            }
        }
        if (browserFlag == "simple") {
            document.getElementById("finger" + fingerId).checked = true;
        }
    }
}


/**
* Display fingerprint image
* @author wenxin
* @create 2013-05-18 11:22:31 am
* @param context 2d canvas context
* @param browserFlag Browser tag simple: simple version, indicating that it is IE browser; html5: means browser supporting html5
*/
function showImage(context, base64FPImg, browserFlag) {
    var img;
    var imgSrc = "data:image/jpg;base64," + base64FPImg;
    if (browserFlag == "html5") {
        img = new Image();
        //img.src = sysCfg.rootPath + "/public/html/bmpFile1.jpg";
        img.src = "";
        img.src = imgSrc;
        img.onload = function () {
            // Save the current drawing state
            context.save();
            // Start creating a path
            context.beginPath();
            // Draw an ellipse
            context.oval(125, 142, 112, 145);
            // Close path
            context.closePath();
            // Clipping path
            context.clip();
            //Draw a picture onto the canvas
            context.drawImage(img, 70, 70, 112, 145);
            //The state of the last store called restore will be restored
            context.restore();
        }
    }
    else if (browserFlag == "verification") {
        img = new Image();
        img.src = "";
        img.src = imgSrc;
        img.onload = function () {
            // Save the current drawing state
            context.save();
            // Start creating a path
            context.beginPath();
            // Draw an ellipse
            context.oval(92, 159, 100, 128);
            // 关闭路径
            context.closePath();
            // Clipping path
            context.clip();
            //Draw a picture onto the canvas
            context.drawImage(img, 37, 90, 112, 145);
            //The state of the last store called restore will be restored
            context.restore();
        }
    }
    else if (browserFlag == "clearForVerify" || browserFlag == "clearForRegister") {
        img = new Image();
        img.src = "";
        img.src = base64FPImg;
        img.onload = function () {
            // Save the current drawing state
            context.save();
            // Start creating a path
            context.beginPath();
            // Draw an ellipse
            if (browserFlag == "clearForVerify") {
                context.oval(91, 160, 112, 145);
            }
            else if (browserFlag == "clearForRegister") {
                context.oval(125, 142, 132, 165);
            }
            // Close path
            context.closePath();
            // Clipping path
            context.clip();
            //Draw a picture onto the canvas
            if (browserFlag == "clearForVerify") {
                context.drawImage(img, 12, 54, 160, 213);
            }
            else if (browserFlag == "clearForRegister") {
                context.drawImage(img, 60, 60, 132, 165);
            }
            //The state of the last store called restore will be restored
            context.restore();
        }
    }
    else if (browserFlag == "simple") {
        $("#showFPImageDiv").html("<img src=" + imgSrc + " width='112' height='145' />");
    }
    else if (browserFlag == "verifySimple") {
        $("#showSeachingDiv").show();
        $("#showSeachingDiv").html("&nbsp;&nbsp;<img src=\"/public/images/searching.gif\" width='20' height='20'/></br><label style='color:yellow;align:center;font-size: 14px;'>处理中...</label>");
    }
    else if (browserFlag == "clearForSimple") {
        $("#showFPImageDiv").html("");
    }
}



/**
* Painting palm
* @author wenxin
* @create 2013-06-01 09:01:33 am
* @param context 2d canvas context
* @param pointArray coordinate point array
* @param color rendering color
*/
var renderHand = function (context, pointArray) {
    this.context = context;
    this.pointArray = pointArray;
    this.isClick = false;
    this.drawHand = function (color) {
        this.context.strokeStyle = color;
        this.context.lineWidth = 1;
        this.context.beginPath();
        for (var i = 0; i < this.pointArray.length; i++) {
            if (i == 0) {
                this.context.moveTo(this.pointArray[0].x, this.pointArray[0].y);
            }
            else {
                this.context.lineTo(this.pointArray[i].x, this.pointArray[i].y);
            }
        }
        this.context.stroke();
    };
};



/**
* Draw progress bar
* @author wenxin
* @create 2013-05-16 16:56:31 pm
* @param context 2d canvas context
* @param x,y,width,height The coordinates, width, and height of the bottom bar of the progress bar
*/
function drawProgressBar(context, collCount) {
    var x = 300;
    var y = 60;
    var width = 90;
    var height = 20;
    context.fillStyle = bgColor;
    context.fillRect(x, y, width, height);
    if (collCount == 0) {
        context.fillStyle = "rgb(175,181,185)";
        context.fillRect(x + 4, y + 2, width - 52, height - 4);
        context.fillRect(x + 46, y + 2, width - 52, height - 4);
        context.fillRect(x + 86, y + 2, width - 52, height - 4);
    }
    else if (collCount == 1) {
        context.fillStyle = "rgb(122,193,66)";
        context.fillRect(x + 4, y + 2, width - 52, height - 4);
        context.fillStyle = "rgb(175,181,185)";
        context.fillRect(x + 46, y + 2, width - 52, height - 4);
        context.fillRect(x + 86, y + 2, width - 52, height - 4);
    }
    else if (collCount == 2) {
        context.fillStyle = "rgb(122,193,66)";
        context.fillRect(x + 4, y + 2, width - 52, height - 4);
        context.fillRect(x + 46, y + 2, width - 52, height - 4);
        context.fillStyle = "rgb(175,181,185)";
        context.fillRect(x + 86, y + 2, width - 52, height - 4);
    }
    else if (collCount == 3) {
        context.fillStyle = "rgb(122,193,66)";
        context.fillRect(x + 4, y + 2, width - 52, height - 4);
        context.fillRect(x + 46, y + 2, width - 52, height - 4);
        context.fillRect(x + 86, y + 2, width - 52, height - 4);
    }
}


/**
* Determine whether the current finger is in the fingerIdArray. If it is, it indicates that the finger has already collected the fingerprint.
* @author wenxin
* @create 2013-05-15 16:26:31 pm
* @param num finger number
* @param fingerIdArray stores an array of finger numbers
* @return returns boolean value true: num is included in fingerIdArray; false: not included
*/
function isContains(fingerIdArray, num) {
    var fingerId;
    var isCollected = false;
    for (var j = 0; j < fingerIdArray.length; j++) {
        fingerId = eval(fingerIdArray[j]);
        if (fingerId >= DURESS_FINGER_NUM) {
            fingerId = fingerId - DURESS_FINGER_NUM;
        }
        if (fingerId == num) {
            isCollected = true;
        }
    }
    return isCollected;
}


/**
* Clear fingerprint image
* @author wenxin
* @create 2013-09-05 15:15:11 pm
*/
function clearFPImage(context, browserFlag) {
    if (browserFlag == "verification") {
        //		showImage(context, "${base}/base/images/base_fpVerify_clearImage.png", "clearForVerify");
    }
    else if (browserFlag == "register") {
        showImage(context, "../imageFPSensor/base_fpVerify_clearImage.png", "clearForRegister");
    }
    else if (browserFlag == "verifyForSimple" || browserFlag == "registerForSimple") {
        showImage(null, "", "clearForSimple");
    }
}

//Clear canvas content
CanvasRenderingContext2D.prototype.clear =
	  CanvasRenderingContext2D.prototype.clear || function (preserveTransform) {
	      if (preserveTransform) {
	          this.save();
	          this.setTransform(1, 0, 0, 1, 0, 0);
	      }

	      this.clearRect(0, 0, this.canvas.width, this.canvas.height);

	      if (preserveTransform) {
	          this.restore();
	      }
	  };




	  /**
	  * Form submission
	  * @author wenxin
	  * @create 2013-08-05 15:19:11 pm
	  */
	  function formSubmit(id) {

	      $('#' + id).serialize();
	      $('#' + id).ajaxForm(function (data) {
	          callBackFormSubmit(data);
	      });
	      $('#' + id).submit(); //Form submission
	  }





	  /**
	  * Render finger after collecting fingerprint
	  * @author wenxin
	  * @create 2013-05-18 11:33:31 am
	  * @param context 2d canvas context
	  * @param num The finger number currently needed to be rendered
	  * @param fillColor fill color after collection
	  * @param successOrNot Whether the acquisition was successful - Boolean value true: Acquisition succeeded; false: Acquisition failed
	  */
	  function renderAfterColl(context, num, fillColor, successOrNot) {
	      var canvas = "";
	      if (isComp) {
	          canvas = document.getElementById("canvasComp");
	      } else {
	          canvas = document.getElementById("canvas");
	      }
	      var localContext = canvas.getContext("2d");
	      var coordArray = new Array();
	      //Initialize the starting coordinates and return the json format data
	      var coordJson = initCoordJson();
	      //Come in the page, click delete
	      if (num == null) {
	          num = fpIdNum;
	      }
	      //The clicked finger number is equal to num in json
	      if (coordJson[num].num == num) {
	          //Initialize coordinate array and draw fingers
	          initCoordAndDrawFinger(context, coordArray, coordJson[num].coord.x, coordJson[num].coord.y, num);
	      }

	      //Successful acquisition, fill color (red, green)
	      if (successOrNot) {
	          if (duressFingerFlag) {
	              localContext.fillStyle = "red"; //fillColor
	              localContext.fill();
	              fpModifyFlag = true;
	          }
	          else {
	              localContext.fillStyle = "rgb(122,193,66)"; //fillColor
	              localContext.fill();
	              fpModifyFlag = true;
	          }
	      }
	      else {
	          //Acquisition failed, fill background color - eliminate color (yellow)
	          localContext.fillStyle = fillColor;
	          localContext.fill();
	      }
	  }



	  /**
	  * Initialize the coordinate array and draw the finger - get the current context
	  * @author wenxin
	  * @create 2013-05-31 18:01:33 pm
	  * @param context 2d canvas context
	  * @param pointArray coordinate point array
	  * @param x,y draws the starting coordinates of the current finger
	  * @param num finger tag
	  */
	  function initCoordAndDrawFinger(context, coordArray, x, y, num) {
	      coordArray = initCoordArray(coordArray, x, y, num);
	      new renderFinger(context, coordArray).drawFinger(strokeStyle, fingerBorderColor);
	  }




	  /**
	  * Check the fingerprint collector
	  * @author wenxin
	  * @create 2013-06-17 20:18:31 pm
	  * @param context 2d canvas context
	  * @param paramArray An array of internationalized elements
	  * @param browserFlag Browser tag simple: simple version, indicating that it is IE browser; html5: means browser supporting html5
	  */
	  function checkFPReader(context, paramArray, browserFlag) {
	      if (browserFlag == "html5") {
	          $.ajax({
	              type: "GET",
	              url: issOnlineUrl + "/fingerprint/beginCapture?type=1&FakeFunOn=0&random=" + getRandomNum(),
	              dataType: "json",
	              async: false,
	              //timeout:1000,
	              success: function (result) {
	                  //Return code
	                  var ret = null;
	                  ret = result.ret;
	                  //When the interface call returns successfully
	                  if (ret == 0) {
	                      //Display box - collection tips
	                      collectTips(context, paramArray[0], "html5");
	                  }
	                  else if (ret == -2001) {
	                      //Display box - collection tips
	                      collectTips(context, paramArray[1], "html5");
	                  }
	                  else if (ret == -2002) {
	                      getWebServerInfo(null, null, "1");
	                  }
	                  else if (ret == -2005) {
	                      //Display box - collection tips
	                      collectTips(context, paramArray[3], "html5");
	                  }
	                  collectFlag = true;
	                  //Cancel collection
	                  cancelRegister();
	              },
	              error: function (XMLHttpRequest, textStatus, errorThrown) {
	                  alert("Please install a fingerprint driver or start the service!");
	                  //messageBox({messageType: "alert", title: "${common_prompt_title}", text: "${base_fp_connectPrompt}"});
	              }
	          });
	      }
	      else if (browserFlag == "simple") {
	          //Create an XDomainRequest instance for cross-domain access to ie8 and ie9
	          var xDomainRequest = new XDomainRequest();
	          //If the xDomainRequest exists, you can use the xDomainRequest function. Otherwise, the description is not the IE browser.
	          if (xDomainRequest) {
	              xDomainRequest.open('GET', issOnlineUrl + "/fingerprint/beginCapture?type=1&FakeFunOn=0&random=" + getRandomNum());
	              xDomainRequest.onload = function () {
	                  //Get the interface return value
	                  var resultData = xDomainRequest.responseText;
	                  //Convert to json object
	                  var obj = jQuery.parseJSON(resultData);
	                  //Return code
	                  var ret = null;
	                  if (obj != null && obj.ret != undefined) {
	                      ret = obj.ret;
	                  }
	                  //When the interface call returns successfully
	                  if (ret == 0) {
	                      //Display box - collection tips
	                      collectTips(null, paramArray[0], "simple");
	                  }
	                  else if (ret == -2001) {
	                      //Display box - collection tips
	                      collectTips(null, paramArray[1], "simple");
	                  }
	                  else if (ret == -2002) {
	                      getWebServerInfoForSimple(null, null, "1");
	                  }
	                  collectFlag = true;
	                  //Cancel collection
	                  cancelRegister();
	              };
	              xDomainRequest.onerror = function () {
	                  //When you are done, set the object to empty
	                  xDomainRequest = null;
	              };
	              xDomainRequest.send();
	          }
	      }
	  }




	  /**
	  * Before closing the page, if verification is in progress, cancel the acquisition first
	  * @author wenxin
	  * @create 2013-06-24 19:57:11 pm
	  * @param browserFlag Browser tag simple: simple version, indicating that it is IE browser; html5: means browser supporting html5
	  */
	  function cancelCaptureBeforeClose(browserFlag) {
	      //Monitor closed onclick event when closing page
	      getCurrentWindow().button("close").attachEvent("onClick", function () {
	          clearTimeout(verifyTimer);
	          if (browserFlag == "html5") {
	              //Verifying is in progress and fingerprint capture has not been turned off
	              if (verifyFlag) {
	                  //Cancel collection
	                  cancelCapture();
	              }
	              //Close page
	              closeWindow();
	          }
	          else if (browserFlag == "simple") {
	              //alert("cancel capture before close window!");
	              //Recursive call to close the timer
	              clearTimeout(timer);
	              //Cancel collection 
	              cancelRegister();
	              //This should close the window after the cancellation is over.
	              closeWindow();
	          }
	      });
	  }


	  /**
	  * Canvas text wrap
	  * @author chenpf
	  * @create 2015-03-10 16:56:31 pm
	  * @param context 2d canvas context
	  * @param text Display information content
	  * @param CWidth canvas width
	  * @param x text X coordinate value
	  *
	  */
	  function autoWordBreak(context, text, CWidth, x) {
	      context.clear();
	      var rownum = CWidth / 10;
	      var len = strlen(text);
	      if (rownum > len) {
	          context.fillText(text, x, 30);
	      }
	      else {
	          var endInd = rownum < text.length ? rownum : text.length;
	          var beginInd = 0;
	          var endTemp = 0;
	          for (var i = 0; i <= text.length / rownum; i++) {
	              endTemp = text.substr(beginInd, endInd).lastIndexOf(" ");
	              if (endTemp != -1)
	                  endInd = beginInd + endTemp;
	              context.fillText(text.substr(beginInd, endInd), x, (i + 1) * 30);
	              beginInd = endInd + 1;
	              if (beginInd >= text.length)
	                  break;
	              endInd = beginInd + rownum;
	          }
	      }
	  }


	  /**
	  * Delete array elements -- delete an element starting with the dx subscript
	  * @author wenxin
	  * @create 2013-05-15 11:11:31 am
	  * @param dx to remove the subscript of the element
	  */
	  function removeItem(array, dx) {
	      array.splice(dx, 1);
	  }


	  /**
	  * When clicking a finger that has already collected fingerprints, the pop-up box deletes the data.
	  * Callback function when deleting
	  * @author wenxin
	  * @create 2013-05-14 17:12:21 pm
	  * @param result pop-up box selection OK or cancel
	  * @param context 2d canvas context
	  * @param browserFlag Browser tag simple: simple version, indicating that it is IE browser; html5: means browser supporting html5
	  */
	  var delFPData = function (result, context, browserFlag) {
	      var fingerId;
	      if (result) {
	          //Delete the specified element in the array
	          for (var i = 0; i < fingerIdArray.length; i++) {
	              fingerId = eval(fingerIdArray[i]);
	              if (fingerId >= DURESS_FINGER_NUM) {
	                  fingerId = fingerId - DURESS_FINGER_NUM;
	                  if (fingerId == fpIdNum) {
	                      //fingerIdArray.remove(i);
	                      //templateDataArray.remove(i);
	                      removeItem(fingerIdArray, i);
	                      removeItem(templateDataArray, i);
	                  }
	              }
	              else {
	                  if (fingerId == fpIdNum) {
	                      //fingerIdArray.remove(i);
	                      //templateDataArray.remove(i);
	                      removeItem(fingerIdArray, i);
	                      removeItem(templateDataArray, i);
	                  }
	              }
	          }
	          if (browserFlag == "simple") {
	              document.getElementById("finger" + fingerId).checked = false;
	          }
	          else if (browserFlag == "html5") {
	              //Change the color of the finger - also judge when redrawing
	              context.fillStyle = bgColor;
	              context.fill();
	              if (lastFPIdNum != null && lastFPIdNum != lastFPIdNum) {
	                  //Eliminate the color of the original finger
	                  renderAfterColl(globalContext, lastFPIdNum, bgColor, false);
	              }
	              //Eliminate finger colors that need to be removed
	              renderAfterColl(globalContext, fpIdNum, bgColor, false);
	          }
	          fpModifyFlag = true;
	          $("#duressFinger").attr("disabled", false);
	          $("#submitButtonId").attr("disabled", false);
	      }
	      else {
	          if (browserFlag == "simple") {
	              document.getElementById("finger" + fpIdNum).checked = true
	              collectFlag = true;
	          }
	          else if (browserFlag == "html5") {
	              //Eliminate the color of the original finger - there is a problem, if the original finger is the same as the current one, there is a problem
	              //renderAfterColl(globalContext, lastFPIdNum, bgColor, false);
	          }
	      }
	  }


	  //Close the form
	  function close() {
	      $("#bg").css("display", "none");
	      $("#box").css("display", "none");
	      $("#comparisonDiv").css("display", "none");
	      globalContext = "";
	  }







	  /**
	  * Save fingerprint data to the page
	  * @author wenxin
	  * @create 2013-05-24 16:12:21 pm
	  */
	  function storeDataToHtml() {

	      //No finger tag data
	      if (fingerIdArray.length == 0) {
	          $("#fingerId").val(" ");
	      }
	      else {
	          //Save finger tag data to the page
	          $("#fingerId").val("[" + fingerIdArray.toString() + "]");
	      }
	      //No fingerprint template data
	      if (templateDataArray.length == 0) {
	          $("#fingerTemplate10").val(" ");
	      }
	      else {
	          //Save fingerprint template data to the page
	          $("#fingerTemplate10").val("[" + templateDataArray.toString() + "]");
	      }
	  }


	  /**
	  * Determine the number of fingerprints - when the page loads, there is no calculation. Just calculate the number of fingerprints after collecting the fingerprint
	  * @author wenxin
	  * @create 2013-04-22 21:26:31 pm
	  */
	  function showFPCount(text) {
	      var fingerId = $("#fingerId").val();
	      if ($.trim(fingerId) == "") {
	          $("#fpCountMessage").text(text + " " + 0);
	      }
	      else {
	          fingerId = fingerId.substr(1, fingerId.length - 2);
	          var fingerIdArray = new Array();
	          fingerIdArray = fingerId.split(",");
	          $("#fpCountMessage").text(text + " " + fingerIdArray.length);
	      }
	  }





	  /**
	  * Pop-up box saves data when you click the Cancel button and close the page
	  * cancelEvent() and submitRegister() function are called back to
	  * @author wenxin
	  * @create 2013-05-14 15:11:31 pm
	  * @param result pop-up box selection OK or cancel
	  * @param fpCount Fingerprint number internationalization content
	  * @param ${pers_person_templateCount}: number of fingerprints
	  */
	  var saveFPData = function (result, fpCount) {
	      if (collectFlag) {
	          //Cancel collection
	          cancelRegister();
	          //Recursive call to close the timer
	          clearTimeout(timer);
	      }
	      if (result) {
	          storeDataToHtml();
	          showFPCount(fpCount);
	          //closeWindow();
	          close();
	      }
	      else {
	          clearImageData();
	          //closeWindow();
	          close();
	      }
	  }



	  /**
	  * Trigger event when the Cancel button is clicked
	  * @author wenxin
	  * @create 2013-05-15 17:21:13 pm
	  * @param "${base_fp_save}": Are you sure you want to save the current changes?
	  */
	  function cancelEvent(saveText, fpCountText) {
	      if (!fpModifyFlag) {
	          if (collectFlag) {
	              //Cancel collection
	              cancelRegister();
	              //Recursive call to close the timer
	              clearTimeout(timer);
	          }
	          //closeWindow();
	          close();
	      }
	      else {
	          var flag = confirm(saveText);
	          if (flag) {
	              saveFPData(flag, fpCountText);
	              $("#fingerTemplate10").val(" ");
	              $("#fingerId").val(" ");
	          } else {
	              close();
	          }

	         

	      }

	  }



	  /**
	  * Get fingerprint template
	  * @author wenxin
	  * @create 2013-05-22 19:51:31 pm
	  * @param paramArray An array of internationalized elements
	  * @param flag judgment is registration and verification mark register: registration; verification: verification
	  */
	  function getFPTemplate(paramArray, flag) {
	      var fpTemplate = "";
	      var collectSuccessFlag = false;
	      $.ajax({
	          type: "GET",
	          url: issOnlineUrl + "/fingerprint/getTemplate?random=" + getRandomNum(),
	          dataType: "json",
	          async: false,
	          success: function (result) {
	              //Return code
	              var ret = null;
	              ret = result.ret;
	              if (ret == 0) {
	                  fpTemplate = result.data.template;
	              }
	              //success
	              if (ret == 0) {
	                  collectSuccessFlag = true;
	                  if (flag == "register") {
	                      //Determine if the finger has collected fingerprints
	                      var compareRet = "";
	                      //If the fingerprint has been entered before
	                      if (templateDataArray.length > 0) {
	                          //Send a request for background fingerprint comparison yls
	                          //compareRet = fpComparision(fpTemplate, templateDataArray, paramArray[3]);
	                      }
	                      if ($.trim(compareRet) == "dllNotExist") {
	                          //Collect fingerprints and render your fingers
	                          renderAfterColl(globalContext, fpIdNum, bgColor, false); //bgColor判断
	                          //Display box - collection tips
	                          collectTips(globalContext, "Dynamic library loading failed", "html5");
	                      }
	                      else {
	                          if (compareRet == "noFingerServer") {
	                              //Collect fingerprints and render your fingers
	                              renderAfterColl(globalContext, fpIdNum, bgColor, false); //bgColor判断
	                              //Display box - collection tips
	                              collectTips(globalContext, "The comparison service is not started", "html5");
	                          }
	                          else {
	                              //This finger does not capture fingerprints
	                              if (compareRet != "ok") {
	                                  //Collect fingerprints and render your fingers
	                                  renderAfterColl(globalContext, fpIdNum, bgColor, true); //bgColor判断
	                                  //Display box - collection tips
	                                  collectTips(globalContext, paramArray[0], "html5");
	                                  //Duress fingerprint
	                                  if (duressFingerFlag) {
	                                      //Save finger tags to an array
	                                      fingerIdArray[fingerIdArray.length] = fpIdNum + DURESS_FINGER_NUM;
	                                  }
	                                  else {
	                                      //Save finger tags to an array
	                                      fingerIdArray[fingerIdArray.length] = fpIdNum;
	                                  }
	                                  //Save the fingerprint template to an array
	                                  templateDataArray[templateDataArray.length] = fpTemplate;
	                              }
	                              else {
	                                  //Collect fingerprints and render your fingers
	                                  renderAfterColl(globalContext, fpIdNum, bgColor, false); //bgColor判断
	                                  //Please don't repeat input fingerprint!
	                                  //Display box - collection tips
	                                  collectTips(globalContext, paramArray[2], "html5");
	                              }
	                          }
	                      }
	                  }
	                  else if (flag == "verification") {
	                      verifyFlag = false;
	                      //Fingerprint comparison
	                      fpComparison(fpTemplate);
	                  }
	              }
	              else if (ret == -2003) {
	                  //Collect fingerprints and render your fingers
	                  renderAfterColl(globalContext, fpIdNum, bgColor, false);
	                  //Display box - collection tips
	                  collectTips(globalContext, paramArray[1], "html5");
	              }
	          },
	          error: function (XMLHttpRequest, textStatus, errorThrown) {
	              alert(paramArray[3]);
	              //messageBox({messageType: "alert", title: "${common_prompt_title}", text: paramArray[3]});
	          }
	      });
	      return collectSuccessFlag;
	  }


