var dataY = [],dataY2 = [], dataX = [], contador = 0, maxval = 0, minval = 0, averval = 0, date, valueY, valueX, timer;



function start()
{
    startTimer('',getElement('.buttons a'));
    getWeekAverages();
    date = getDate();
    getElement('day').innerHTML = date.weekday;
    getElement('date').innerHTML = date.month + '/' + date.day + '/' + date.year;
}

function Activity(data)
{
    dataY = [], dataX = [];
    var tb =  getElement('tbody');
    tb.innerHTML = '';
    var readings = data.readings;
    for (var i = 0; i < readings.length; i++)
    {
        var x = readings[i].temperature;
        var y = getTime(readings[i].date);
        dataY.push(x);
        dataX.push(y);
        var z = readings[i].station.description;
        /** display the data in the activity text area **/
        tb.innerHTML += "<tr><td>" + y + "</td><td>" + x + "</td><td>" + z +"</td>";
    }
    makeGraphics(data)
}
function makeGraphics(data)
{
    var readings = data.readings;
    for (var i = 0; i < readings.length; i++)
    {
        
    }
    dataY.reverse();
    dataX.reverse();
    var dataLenght = readings.length;
    var max= 50, labelY = "Temp", labelX= "Time";
    fillData();//generate data (array < 7)
    lineal("graph", dataY, dataX, max, labelY, labelX, dataLenght);
}
function fillData()
{
    maxval = arrayMaximum(dataY);
    minval = arrayMinimum(dataY);
    averval = arrayAverage(dataY);
    display();
}
function updateData(number)
{
    date = new Date();
    var temp = dataY;
    var temp2 = dataX;
    for (var i = 0; i < dataY.length; i++)
    {
        if (i != number-1)
        {
            dataY[i] = temp[i+1];
            dataX[i] = temp2[i+1];
        }
        else
        {
            dataY[i] = valueY = getRandomNumber(40, 30);
            dataX[i] = valueX = getTime();
        }
    }
    maxval = arrayMaximum(dataY);
    minval = arrayMinimum(dataY);
    averval = arrayAverage(dataY);
    display(); //display on the dashboard
}
function display()
{
    document.getElementById("max-val").innerHTML = maxval + "&deg";//display the maximum value in the dashboard
    document.getElementById("min-val").innerHTML = minval + "&deg";//display the minimum value in the dashboard
    document.getElementById("aver-val").innerHTML = averval + "&deg";//diplay the average value in the dashboard
}
function showMenu () {
    var sidebar = document.getElementById('sidebar');
    sidebar.style.display = 'inline';
}
function showHideMenu () {
    var sidebar = document.getElementById('sidebar');
    sidebar.style.display = (sidebar.style.display == 'inline') ? 'none' : 'inline';
}
function weekAverages(data)
{
    var averages = '<p><b>Station 1 : </b><span>'+ data.averages.station1 + '&deg<span></p>' +
        '<p><b>Station 2 : </b><span>'+ data.averages.station2 + '&deg<span></p>' +
        '<p><b>Station 3 : </b><span>'+ data.averages.station3 + '&deg<span></p>';
    getElement('.this-week').innerHTML = averages; 
    //columns('this-week', averages,[10, 15, 20, 25, 30, 35, 40, 45, 50], ['Station 1', 'Station 2', 'Station3']);
}
function Switch(e, s)
{
    if (e.className =='switch switch-on')
    {
        var id = e.id;
        popInfo('Confirmation','Do you wan&#39;t to turn of ' + s + '?<br>'+
            '<input type="button" value="Yes" style="width: 45%;" onclick="SwitchOff('+ id + ')"><input type="button" value="No" style="width: 45%; float:right" onclick="closePopup();">');
    }
    else
    { 
        e.className = 'switch switch-on';
        var o = document.querySelectorAll('.switch-on');
        if (o.length == 1)
            startTimer();
    }
}
function startTimer(s, e)
{
    try
    {
        getElement('.active').className = '';
    }catch(err){}
    e.className = 'active';
    if (s == '')
    { 
        getLastReadings();
        clearInterval(timer);
        timer = setInterval(function(){
            getLastReadings();
            //getStationReadings(1);
        }, 5000);
        colorRelleno = 'rgba(47, 116, 152, 0.69)';
    }
    else
     {   
         c=['rgba(191, 51, 51, 0.76)', 'rgba(61, 183, 199, 0.82)', 'rgba(40, 145, 49, 0.81)'];
         colorRelleno = c[s-1];
         getStationReadings(s);
         clearInterval(timer);
         timer = setInterval(function(){
            getStationReadings(s);
            //getStationReadings(1);
        }, 5000);
     }
    //timer = setInterval(function(){getLastReadings();}, 2000);
}
function SwitchOff(e)
{
    e.className = 'switch';
    closePopup();
    var o = document.querySelectorAll('.switch-on');
    if (o.length == 0)
        clearInterval(timer);
}