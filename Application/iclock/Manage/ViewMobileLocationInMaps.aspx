<%@ page language="VB" autoeventwireup="false" inherits="Manage_ViewMobileLocationInMaps, App_Web_usmjemmz" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Google Map with Latitude and Longitude</title>
    <style type="text/css">
        html
        {
            height: 100%;
        }
        body
        {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        #map_canvas
        {
            height: 100%;
        }
    </style>
    
    <script type="text/javascript">
        window.onload = function () {

            var lat = getParamValuesByName('Latitude');
            var lon = getParamValuesByName('Longitude');

            var URL = "https://www.google.com/maps/?q=" + lat + "," + lon;

            window.location.href = URL;
         
        }

        function getParamValuesByName(querystring) {
            var qstring = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for (var i = 0; i < qstring.length; i++) {
                var urlparam = qstring[i].split('=');
                if (urlparam[0] == querystring) {
                    return urlparam[1];
                }
            }
        }

  
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="map_canvas" style="width: 800px; height: 500px">
    </div>
    </form>
</body>
</html>
