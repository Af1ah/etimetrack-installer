//Global 2d brush
var globalContext = null;
//The background color of the arc in the upper right corner of the page
var arcBgColor = "rgb(54, 100, 139)";
//Page background color
//var bgColor = "rgb(0, 0, 0)";
//Validation tag -- whether it has been verified true: verification is in progress; false: no
var verifyFlag = false;
//Mode: 1--1:1, 2--1: N
var model = "2";
//Painting the starting point of the hands
var x = 28;
//Painting the starting point of the hands
var y = 346;
//Storing an array of painted finger functions
var fingerList = [];
//Save the finger marker currently being collected - when deleting, remove the color of the finger currently being collected
var lastFPIdNum = null;
//Painting finger border color
var fingerBorderColor = "rgb(71,75,79)";
//The background color of the arc in the upper right corner of the page
//var arcBgColor = "rgb(243, 245,240)";
//Page background color
var bgColor = "rgb(243, 245,240)";
//Graphic border style for painting - edge drawing
var strokeStyle = "stroke";
//Graphic fill style for painting - fill the drawing
var fillStyle = "fill";
//Click the color of your finger
var fillFingerColor = "rgb(71,75,79)";
//Determine if the data has been modified (including adding and deleting)
var fpModifyFlag = false;


/**
* Draw ellipse -- add the attributes of the painting ellipse to the context
* @author wenxin
* @create 2013-05-15 10:11:21 am
* @param x, y coordinates of the ellipse positioning
* @param width, height the width and height of the ellipse
*/
CanvasRenderingContext2D.prototype.oval = function (x, y, width, height) {
    var k = (width / 0.75) / 2, w = width / 2, h = height / 2;
    this.strokeStyle = bgColor;
    this.beginPath();

    this.moveTo(x, y - h);
    this.bezierCurveTo(x + k, y - h, x + k, y + h, x, y + h);
    this.bezierCurveTo(x - k, y + h, x - k, y - h, x, y - h);
    this.closePath();
    this.stroke();
    return this;
}


/**
* Check dynamic library connection callback function
* @author wenxin
* @create 2013-05-15 17:12:21 pm
* @param ${pers_person_templateCount}: number of fingerprints
*/
//Used method
function getDLLConnectCallBack(result,isComp)
{
	if(globalContext == null)
	{
		if(isComp==true){
			globalContext = document.getElementById("canvasComp").getContext("2d");
		}else{
			globalContext = document.getElementById("canvas").getContext("2d");
		}
	}
//Return code
	var ret = null;
	ret = result.ret;

	//When the interface call returns successfully
	if(ret == 0)
	{
		//${base_fp_connectFail}:Failed to connect fingerprint collector
	    collectTips(globalContext, "No fingerprint collector detected.", "verification");
	}
	else
	{
	    //${base_fp_loadFail}:Failed to load ZKFinger10
	    collectTips(globalContext, "Failed to load dynamic library.", "verification");
	}
}


 
//Used method
function myfunction() {
    
    //Load ip and port of ISSOnline_server in xml
	loadXml("<%=basePath%>"+"webapp/xml/BaseISSOnlineServer.xml");
	//Load fingerprint tag and fingerprint template data to the page
	loadFPDataTemplate("[]", "[]");
	var browserFlag = "";
	//Storing an array of internationalized elements
	var paramArray = new Array();
	//Get browser type
	browserFlag = getBrowserType();
	paramArray[0] = 'fingerprint';
	paramArray[1] = 'Number of fingerprints:';
	paramArray[2] = 'Are you sure to save the current changes?';
	paramArray[3] = 'Click here for Registration';
	paramArray[4] = 'Please install a fingerprint driver or start the service!';
	paramArray[5] = '0';
	paramArray[6] = 'Number of fingerprints:';
	paramArray[7] = 'verification';

	document.getElementById("btn_Save").disabled = true;
	//Check drive
	checkDriver(paramArray, browserFlag, false);
}








/**
* Initialize data when the page loads
* @author wenxin
* @create 2013-07-09 15:18:31 pm
*/
function dataInitReg() {
    if (!duressFingerShowFlag) {
        $("#duressFingerDiv").hide();
    }
    var canvas = document.getElementById("canvas");
    var context = canvas.getContext("2d");

    fpIdNum = null;
    //Get the fingerprint data of the page
    getDataFromPage();
    //painting
    draw(context, x, y, fingerBorderColor);
    //jQuery implements cors cross-domain request under ie
    jQuery.support.cors = true;
    //Mouse event
    canvas.onmousedown = function (event) {
        //event.which == 1--left mouse button
        if (event.which == 1) {
            var pageInfo = canvas.getBoundingClientRect();
            var x = event.clientX - pageInfo.left;
            var y = event.clientY - pageInfo.top;

            duressFingerFlag = $("#duressFinger").attr("checked");

            //Redraw
            redraw(x, y);
        }
    }
}



/**
* Painting
* @author wenxin
* @create 2013-05-13 10:18:31 am
* @param context 2d canvas context
* @param x, y draws the coordinates of the first point of the left palm, and the coordinates of the following painting fingers and right palm are calculated relative to the coordinates of this point.
* @param color Painting the border color of fingers and palms
*/
function draw(context, x, y, color) {
    var coordArray = new Array();
    //Initialize the starting coordinates and return the json format data
    var coordJson = initCoordJson();
    for (var i = 0; i < coordJson.length; i++) {

        //Painting hands and arc
        drawHandAndArc(context, coordArray, color, coordJson[i].coord.x, coordJson[i].coord.y, coordJson[i].num);
        //  		drawHandAndArc(context, coordArray, color, coordJson[i].coord.x, coordJson[i].coord.y, i);
        coordArray = null;
        coordArray = new Array();
    }
    //Storing an array of internationalized elements
    var paramArray = new Array();
    paramArray[0] = "Please choose your finger.";
    paramArray[1] = "No fingerprint collector detected.";
    paramArray[2] = "Failed to load dynamic library.";
    paramArray[3] = "Please choose your finger.";


    //Check fingerprint collector
    checkFPReader(context, paramArray, "html5");

    //progress bar
    drawProgressBar(context, 0);
    //Ash the OK button
    $("#submitButtonId").attr("disabled", true);
}
/**
* Painting hands and arcs
* @author wenxin
* @create 2013-06-17 10:18:31 am
* @param context 2d canvas context
* @param coordArray coordinate array
* @param x, y draws the coordinates of the first point of the left palm, and the coordinates of the following painting fingers and right palm are calculated relative to the coordinates of this point.
* @param color Painting the border color of fingers and palms
* @param num current session object number
*/
function drawHandAndArc(context, coordArray, color, x, y, num) {
    //Initialization coordinates
    coordArray = initCoordArray(coordArray, x, y, num);
    var drawObj = null;
    //Painting finger
    if (num < 10) {
        drawObj = "finger" + num;
        drawObj = new renderFinger(context, coordArray);
        drawObj.drawFinger(strokeStyle, color);
        //Render finger when initializing
        renderInit(context, num, "html5");
        //Put the finger instance of the painting into an array for easy redrawing
        if (fingerList.length < 10) {
            fingerList.push(drawObj);
        }
    }
    //Painting both hands palm
    else if (num < 12) {
        new renderHand(context, coordArray).drawHand(color);
    }
    //Painting circle
    showImage(context, "../imageFPSensor/base_fpVerify_clearImage.png", "clearForRegister");
    //Painting arc
    //else if(num == 12)
    //{
    //	new FillArc(context, coordArray).drawArc(arcBgColor);
    //}
}
/**
* Redraw
* @author wenxin
* @create 2013-05-13 10:18:31 am
* @param x, y coordinates of the mouse click
*/
function redraw(x, y) {
    var canvas = document.getElementById("canvas");
    if (canvas.getContext) {
        var context = canvas.getContext("2d");

        //Whether to click on the finger area
        var isInFingerArea = false;
        //Determine if the current click is in the finger area
        for (var i = 0; i < fingerList.length; i++) {
            var finger = fingerList[i];
            finger.drawFinger(strokeStyle, fingerBorderColor);
            if (context.isPointInPath(x, y)) {
                isInFingerArea = true;
                break;
            }
        }

        outerloop:
        for (var i = 0; i < fingerList.length; i++) {
            if (collectFlag) {
                //How to judge when clicking the same finger? (When editing the fingerprint, there is a problem)
                if (fpIdNum == i) {
                    //After switching your finger, render your finger (eliminate the color of the original finger)
                    renderAfterColl(globalContext, fpIdNum, bgColor, false);
                }
            }
            var finger = fingerList[i];
            finger.drawFinger(strokeStyle, fingerBorderColor);
            //currentContext = context;
            if (context.isPointInPath(x, y)) {
                globalContext = context;
                //The same finger is clicked twice to collect. If yes, cancel the acquisition on the second click.
                var iaSameFinger = false;
                if (fpIdNum == i && collectFlag) {
                    iaSameFinger = true;
                }
                var fingerId;
                //Determine if the finger has fingerprints
                var isCollected = false;
                isCollected = isContains(fingerIdArray, i);
                fpIdNum = i;
                if (!isCollected) {
                    //Save the finger marker currently being collected
                    lastFPIdNum = fpIdNum;
                }
                //If you already have a fingerprint
                if (isCollected) {
                    //Cancel collection
                    cancelRegister();
                    var flag = confirm("Delete the currently selected fingerprint?");
                    if (flag) {
                        delFPData(flag, context, "html5");
                        collectTips(globalContext, "Please choose your finger.", "html5");
                        //progress bar
                        drawProgressBar(globalContext, 0);
                    }

                    break outerloop;
                }
                else {
                    //The same finger is used for two clicks to cancel the acquisition.
                    if (iaSameFinger) {
                        //Cancel collection
                        cancelRegister();
                        //Re-prompt after canceling the acquisition, please select your finger
                        collectTips(globalContext, "Please choose your finger.", "html5");
                        //Repaint the progress bar after canceling the acquisition
                        drawProgressBar(context, 0);
                        fpIdNum = -1;
                    }
                    else {
                        //Cancel collection
                        cancelRegister();
                        context.fillStyle = fillFingerColor;
                        context.fill();
                        //globalContext = context;
                        collectFlag = true; //Need to judge, when you click repeatedly, the color changes
                        $("#duressFinger").attr("disabled", true);
                        $("#submitButtonId").attr("disabled", true);
                        //${base_fp_collCount}:Press the remaining number of fingerprints:
                        var text = "Press the remaining number of times:" + FINGERPRINT_NUMBER;
                        //progress bar
                        drawProgressBar(globalContext, 0);
                        //Display box - collection tips
                        collectTips(globalContext, text, "html5");
                        //Fingerprint collection
                        fpCollection(context);
                    }
                }
            }
            else {
                context.fillStyle = bgColor;
                context.fill();
                renderInit(context, i, "html5");
                if (collectFlag) {
                    if (fpIdNum == i && !isInFingerArea) {
                        context.fillStyle = fillFingerColor;
                        context.fill();
                    }
                }
            }
        }
    }
}



function closeCompa() {
    $("#bg").css("display", "none");
    $("#box").css("display", "none");
}

//initialize the interface data, that is, clear the fingerprint record.
function cleanData() {
    var canvas = document.getElementById("canvas");
    var context = canvas.getContext("2d");
    fpIdNum = null;
    getDataFromPage();
    draw(context, x, y, fingerBorderColor);
    jQuery.support.cors = true;
    redraw(x, y);
}



/**
* Collect fingerprints
* @author wenxin
* @create 2013-05-13 10:18:31 am
* @param context 2d canvas context
*/
function fpCollection(context) {
    $.ajax({
        type: "GET",
        url: issOnlineUrl + "/fingerprint/beginCapture?type=1&FakeFunOn=0&random=" + getRandomNum(),
        dataType: "json",
        async: true,
        success: function (result) {
            //Return code
            var ret = null;
            ret = result.ret;
            //When the interface call returns successfully
            if (ret == 0) {
                //Check the number of acquisitions, display images
                checkCollCount();
            }
            else if (ret == -2001) {
               
//${base_fp_connectFail}: Failed to connect fingerprint collector
                // Display box - collection tips
                collectTips(globalContext, "No fingerprint collector detected.", "html5");
            }
            else if (ret == -2002) {
                getWebServerInfo(null, null, "1");
            }
            else if (ret == -2005) {
                //Cancel collection
                cancelRegister();
                //After switching your finger, render your finger (eliminate the color of the original finger)
                renderAfterColl(globalContext, fpIdNum, bgColor, false);
                //${base_fp_pressFinger}:Please choose your finger
                //Display box - collection tips
                collectTips(globalContext, "Please choose your finger.", "html5");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Please install a fingerprint driver or start the service!");
            //messageBox({messageType: "alert", title: "prompt", text: "Please install the fingerprint driver or start the service!"});
        }
    });
}

/**
* Check the number of collections
* @author wenxin
* @create 2013-05-22 09:24:31 am
* @param collCount Collection times
*/
function checkCollCount() {
    var base64FPImg = "";
    //Return code
    var ret = null;
    $.ajax({
        type: "GET",
        url: issOnlineUrl + "/fingerprint/getImage?random=" + getRandomNum(),
        dataType: "json",
        async: false,
        success: function (result) {
            //alert(objToStr(data));
            //Fingerprint collection times
            var collCount = 0;
            ret = result.ret;
            if (ret == 0) {
                collCount = result.data.enroll_index;
                base64FPImg = result.data.jpg_base64;
            }
            if (collCount != 3) {
                //First and second acquisitions, showing the number of acquisitions, fingerprint images, progress bars
                if (collCount == 1 || collCount == 2) {
                    //${base_fp_collCount}:Press the remaining number of fingerprints:
                    var text = "Press the remaining number of times:" + (FINGERPRINT_NUMBER - collCount);
                    //Display box - collection tips
                    collectTips(globalContext, text, "html5");
                    //progress bar
                    drawProgressBar(globalContext, collCount);
                    //Display fingerprint image
                    showImage(globalContext, base64FPImg, "html5");
                    //Clear image
                    setTimeout("clearImageData()", 200);
                }
                //Timer
                timer = setTimeout("checkCollCount()", 200);
            }
            else {
                //Display fingerprint image
                showImage(globalContext, base64FPImg, "html5");
                //Clear image
                setTimeout("clearImageData()", 200);
                //Storing an array of internationalized elements
                var paramArray = new Array();
                paramArray[0] = "Successful registration of fingerprints."; //base_fp_registerSuccess:成功登记指纹
                paramArray[1] = "The acquisition failed, please re-register."; //base_fp_pressFingerAgain:请重按手指
                paramArray[2] = "Please do not enter fingerprints repeatedly!"; //base_fp_repeatCollection:请不要重复录入指纹!
                paramArray[3] = "Please install the fingerprint driver or start the service!"; //base_fp_connectPrompt:请检查网络连接
                //进度条
                drawProgressBar(globalContext, collCount);
                //Get fingerprint template
                if (!getFPTemplate(paramArray, "register")) {
                    drawProgressBar(globalContext, 0); //Progress bar grayed out
                }

                //If the duress fingerprint is selected, uncheck it
                if (duressFingerFlag) {
                    $("#duressFinger").attr("checked", false);
                }
                $("#duressFinger").attr("disabled", false);
                $("#submitButtonId").attr("disabled", false);
                collectFlag = false;
                fpIdNum = -1;
                return collCount;
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Please install a fingerprint driver or start the service!");
            //messageBox({messageType: "alert", title: "prompt", text: "Please install a fingerprint driver or start the service!"});
        }
    });

}

/**
* Cancel the acquisition, when the acquisition is interrupted
* @author wenxin
* @create 2013-05-27 17:46:31 pm
*/
function cancelRegister() {
    //Currently there are fingers collecting fingerprints
    if (collectFlag) {
        //Recursive call to close the timer
        clearTimeout(timer);
        //Cancel collection
        $.ajax({
            type: "GET",
            url: issOnlineUrl + "/fingerprint/cancelCapture?random=" + getRandomNum(),
            dataType: "json",
            async: false,
            success: function (result) {
                //If the duress fingerprint is selected, uncheck it
                if (duressFingerFlag) {
                    $("#duressFinger").attr("checked", false);
                }
                if (fpModifyFlag) {
                    $("#submitButtonId").attr("disabled", false);
                }
                $("#duressFinger").attr("disabled", false);
                if (fpIdNum != null) {
                    //Eliminate the color of the original finger

                    renderAfterColl(globalContext, lastFPIdNum, bgColor, false);
                }
                collectFlag = false;
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("Please install a fingerprint driver or start the service!");
                //messageBox({messageType: "alert", title: "prompt", text: "Please install a fingerprint driver or start the service!"});
            }
        });
    }
}



//Initialization data
//dataInit();
/**
* Trigger event when the OK button is clicked
* @author wenxin
* @create 2013-05-15 17:12:21 pm
* @param ${pers_person_templateCount}: number of fingerprints
*/
function submitEvent() {
    storeDataToHtml();
    showFPCount('Number of fingerprints:');

    var lblInfo = document.getElementById("lblResult");
    lblInfo.innerHTML = "Total Finger Registered:" + templateDataArray.length;
    document.getElementById("btn_Save").disabled = false;


    //closeWindow();
    close();
}



/**
* Call the begincapture interface to start collecting fingerprints
* @author wenxin
* @create 2013-06-24 10:11:21 am
* @param context 2d canvas context
*/
function beginCapture(context) {
    $.ajax({
        type: "GET",
        url: issOnlineUrl + "/fingerprint/beginCapture?type=2&FakeFunOn=0&random=" + getRandomNum(),
        dataType: "json",
        async: true,
        success: function (result) {
            //Return code
            var ret = null;
            ret = result.ret;
            //When the interface call returns successfully
            if (ret == 0) {
                verifyFlag = true;
                //Check the collection and display images
                checkColl();
            }
            else if (ret == -2001) {
                //${base_fp_connectFail}:Failed to connect fingerprint collector
                //Display box - collection tips
                collectTips(context, "No fingerprint collector detected.", "verification");
            }
            else if (ret == -2002) {
                getWebServerInfo(null, null, "1");
            }
            else if (ret == -2005) {
                //Cancel collection
                cancelCapture();
                //Start collecting
                beginCapture(globalContext);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Please install a fingerprint driver or start the service!");
            //messageBox({messageType: "alert", title: "${common_prompt_title}", text: "${base_fp_connectPrompt}"});
        }
    });
}

/**
* Check the collection - recursive call, if the fingerprint is collected, display the image, get the template, compare
* @author wenxin
* @create 2013-06-24 10:11:21 am
*/
function checkColl() {
    var base64FPImg = "";
    //Return code
    var ret = null;
    $.ajax({
        type: "GET",
        url: issOnlineUrl + "/fingerprint/getImage?random=" + getRandomNum(),
        dataType: "json",
        async: true,
        success: function (result) {
            debugger;
            //alert(objToStr(data));
            //Fingerprint collection times
            var collCount = 0;
            ret = result.ret;
            if (ret == 0) {
                collCount = result.data.enroll_index;
                base64FPImg = result.data.jpg_base64;
            }
            if (collCount == 0) {
                //Timer
                timer = setTimeout("checkColl()", 200); //The comparison failed to start again
            }
            else {
                //Turn off the timer
                clearTimeout(verifyTimer);
                //Display fingerprint image
                showImage(globalContext, base64FPImg, "verification");
                //Storing an array of internationalized elements
                var paramArray = new Array();
                paramArray[0] = 'Successful registration of fingerprints'; //${base_fp_registerSuccess}:Successful registration of fingerprints
                paramArray[1] = 'Please press your finger'; //${base_fp_pressFingerAgain}:Please press your finger
                paramArray[3] = 'Please check the network connection'; //${base_fp_connectPrompt}:Please check the network connection
                //Get fingerprint template
                getFPTemplate(paramArray, "verification");
                $("#oneToMany").attr("disabled", false);
                $("#oneToOne").attr("disabled", false);
                setTimeout("beginCapture(null)", 200);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Please install a fingerprint driver or start the service!");
            //messageBox({messageType: "alert", title: "${common_prompt_title}", text: "${base_fp_connectPrompt}"});
        }
    });
}



/**
* Cancel collection
* @author wenxin
* @create 2013-06-24 19:57:11 pm
*/
function cancelCapture() {
    //Recursive call to close the timer
    clearTimeout(timer);
    //Cancel collection
    $.ajax({
        type: "GET",
        url: issOnlineUrl + "/fingerprint/cancelCapture?random=" + getRandomNum(),
        dataType: "json",
        async: true,
        success: function (result) {
            verifyFlag = false;
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Please install a fingerprint driver or start the service!");
            //messageBox({messageType: "alert", title: "${common_prompt_title}", text: "${base_fp_connectPrompt}"});
        }
    });
}





/**
* Empty
* @author wenxin
* @create 2013-09-05 16:57:11 pm
*/
function clearImageData() {

    if (isComp) {
        //Empty fingerprint image
        clearFPImage(globalContext, "verification");
        //Display box - collection tips
        collectTips(globalContext, "Please press the finger horizontally to verify", "verification");
    } else {
        //Empty fingerprint image
        clearFPImage(globalContext, "register");
    }
}

/**
* Form submission callback function
* @author wenxin
* @create 2013-06-26 16:57:11 pm
*/
function callBackFormSubmit(msg) {
    if (msg.ret == "ok")//success
    {
        collectTips(globalContext, "Verification passed", "verification");
        setTimeout("closeVerify()", 1000);
        setTimeout(_callBackFunction("dashboard.action"), 1000);
    }
    else if (msg.msg == "disabled") {
        collectTips(globalContext, "${auth_login_disabled}", "verification");
        setTimeout("closeVerify()", 1000);
        $(".errorTip").html("${auth_login_disabled}");
        $(".errorTip").show();
    } else if (msg.msg == "notExist") {
        collectTips(globalContext, "verification failed", "verification");
        setTimeout("clearImageData()", 1000);
        beginCapture(globalContext);
    }


}

/**
* Close the comparison page
* @author wenxin
* @create 2013-06-21 14:57:11 pm
*/
function closeVerify() {
    //Verifying is in progress and fingerprint collection has not been turned off
    if (verifyFlag) {
        //Cancel collection
        cancelCapture();
    }
    close();
}


/**
* Initialize data when the page loads
* @author wenxin
* @create 2013-07-09 15:18:31 pm
*/
function dataInitComp() {
    var canvas = document.getElementById("canvasComp");
    var context = canvas.getContext("2d");
    globalContext = context;
    // text box prompts and clears
    //checkText();

    //${base_fp_verifyInfo}: Please press your finger horizontally to verify
    //Display box - collection tips
    collectTips(context, "Please press the finger to verify", "verification");

    //Start collecting
    beginCapture(context);
    //timer
    verifyTimer = setTimeout("closeVerify()", 500000);
}
