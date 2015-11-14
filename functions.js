var dataY = [], dataX = [], contador = 0, maxval = 0, minval = 0, averval = 0, date, valueY, valueX;



function start()
{
    setInterval(makeGraphics, 2000);
}

function makeGraphics()
{
    var dataLenght = 10;
    var max= 50, labelY = "Temp", labelX= "Time";
    if (dataY.length != dataLenght)
    {
        llenarDatos(contador);//generate data (array < 7)
    }
    else
    {
        actualizarDatos(dataLenght);//actualizar datos
    }
    lineal("graph", dataY, dataX, max, labelY, labelX, 10);
}

function llenarDatos()
{
    
    valueY = getRandomNumber(); //generate random number
    dataY.push(valueY);//add the value y to the array
    valueX = getTime();//get the time for the x label (timeline)
    dataX.push(valueX);//add the value y to the array for timeline
    maxval = getMaximum(dataY);//found the maximum value in the array
    minval = getMinimum(dataY);//found the minimum value in the array    
    averval = getAverage(dataY);//get the average value from the array
    display(); //display on the dashboard
}
function actualizarDatos(number)
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
            dataY[i] = valueY = getRandomNumber();
            dataX[i] = valueX = getTime();
        }
    }
    maxval = getMaximum(dataY);
    minval = getMinimum(dataY);
    averval = getAverage(dataY);
    display(); //display on the dashboard
}
function display()
{
    document.getElementById("max-val").innerHTML = maxval + "&deg";//display the maximum value in the dashboard
    document.getElementById("min-val").innerHTML = minval + "&deg";//display the minimum value in the dashboard
    document.getElementById("aver-val").innerHTML = averval + "&deg";//diplay the average value in the dashboard
    /** display the data in the activity text area **/
    var text = document.getElementById('activity').innerHTML;
    document.getElementById('activity').innerHTML = "<p>Time : " + valueX + "<span>Temperature : " + valueY + "&deg</span>" + text;
}
function getTime()
{
    date = new Date();
    var hour = (date.getHours() < 10) ? "0" + date.getHours() : date.getHours();
    var minutes = (date.getMinutes() < 10) ? "0" + date.getMinutes() : date.getMinutes();
    var seconds = (date.getSeconds() < 10) ? "0" + date.getSeconds() : date.getSeconds();
    var time = hour + ":" + minutes + ":" + seconds;
    return time;
}
function getMaximum(array)
{
    var max = Math.max.apply(Math, array);
    return max;
}
function getMinimum(array)
{
    var min = Math.min.apply(Math, dataY);
    return min;
}
function getAverage(array)
{
    var aver = (array.reduce(function(a, b) { return a + b; })/array.length).toFixed();
    return aver;
}
function getRandomNumber()
{
    var random = Math.floor(Math.random() * (49 - 30 + 1)) + 30; //max = 49; min = 30 (random between 30 - 49)
    return random;
}
function showMenu () {
    var sidebar = document.getElementById('sidebar');
    sidebar.style.display = 'inline';
}
function showHideMenu () {
    var sidebar = document.getElementById('sidebar');
    sidebar.style.display = (sidebar.style.display == 'inline') ? 'none' : 'inline';
}
