//mostrar gráficas
function barras(element, datos)
{
    var svgBarra = document.getElementById(element);
    //var maxval = Math.max.apply(Math, datos), series = maxval / 5;
    while (svgBarra.firstChild) {
        svgBarra.removeChild(svgBarra.firstChild);
    }
    var linea = dibujarLinea(130, 50, 130,300, "#1f7dd2" ); svgBarra.appendChild(linea);
    linea = dibujarLinea(130, 300, 480,300, "#1f7dd2" ); svgBarra.appendChild(linea);
    var texto = dibujarTexto("0", 130, 320, "middle", 12, "#1f7dd2"); svgBarra.appendChild(texto);
    texto = dibujarTexto("0", 130, 45, "middle", 12, "#1f7dd2"); svgBarra.appendChild(texto);
    
    var x = 50;
    var y = 165;
    for (var i = 0; i < titulosY.length; i++)
	{
		linea = dibujarLinea(130, x, 480,x, "#d3d3d3" ); svgBarra.appendChild(linea);
        texto = dibujarTexto(titulosY[i], 10, x +30, "right", 12, "#1f7dd2"); svgBarra.appendChild(texto);
        x += 50;
        linea = dibujarLinea(y, 50, y,305, "#d3d3d3" ); svgBarra.appendChild(linea);
        y += 35;
        linea = dibujarLinea(y, 50, y,305, "#d3d3d3" ); svgBarra.appendChild(linea);
        texto = dibujarTexto(i+1, y, 320, "middle", 12, "#1f7dd2"); svgBarra.appendChild(texto);
        texto = dibujarTexto(i+1, y, 45, "middle", 12, "#1f7dd2"); svgBarra.appendChild(texto);
        y += 35;
	}
    x = 50;
    y = 110;
    for (var i = 0; i < titulosY.length; i++)
	{	
        var rectangulo = dibujarRectangulo(130, x +5, datos[i]*70, 40, "#5e91c6", colores[i], 0, 0); svgBarra.appendChild(rectangulo);
        texto = dibujarTexto(datos[i], y + (datos[i] *70) , x +30, "middle", 12, "#CCCCCC"); svgBarra.appendChild(texto); // testo dentro de la barra
        x += 50;
	}
}
//Funcion para dibujar los arcos
function pie(element, datos){//recive elemento donde se va a dibujar y arreglo de datos
    var svgPie = document.getElementById(element), dibujos = [];
    while (svgPie.firstChild) {
        svgPie.removeChild(svgPie.firstChild);
    }
    var total = datos.reduce(function (accu, that) { return that + accu; }, 0);
    var anguloSector = datos.map(function (v) { return 360 * v / total; });
    
    x= 20; y=35;
    
    for (var i = 0; i < titulosY.length; i++)
	{
        texto = dibujarTexto(titulosY[i],x, y , "right", 12, "#1f7dd2"); svgPie.appendChild(texto);
        var rectangulo = dibujarRectangulo(x-15, y-10, 10, 10, "#5e91c6", colores[i], 0, 0); svgPie.appendChild(rectangulo);
        x += 120;
        
	}

    var anguloInicio = 0;
    var anguloFin = 0;
    for (var i=0; i<anguloSector.length; i++){
        anguloInicio = anguloFin;
        anguloFin = anguloInicio + anguloSector[i];
        var x = 250;
        var y = 200;
        var r = 150;

        var x1,x2,y1,y2 ;

        x1 = parseInt(Math.round(x + r * Math.cos(Math.PI*anguloInicio/180)));
        y1 = parseInt(Math.round(y + r * Math.sin(Math.PI*anguloInicio/180)));

        x2 = parseInt(Math.round(x + r*Math.cos(Math.PI*anguloFin/180)));
        y2 = parseInt(Math.round(y + r*Math.sin(Math.PI*anguloFin/180)));
        
        

        var d = "M"+x +","+y+"  L" + x1 + "," + y1 + "  A"+r+","+r+" 0 " + 
                ((anguloFin-anguloInicio > 180) ? 1 : 0) + ",1 " + x2 + "," + y2 + " z";
        //alert(d); // muestra las coordenadas
        var c = parseInt(i / anguloSector.length * 360);
        var arcos = crearSVG("path", {d: d, fill: colores[i], stroke:"#CCCCCC", strokewidth:"2px"}); 
        svgPie.appendChild(arcos);
        //dibujar tiquetas
        var texto = dibujarTexto(titulosY[i] + " : " + ((100/total)*datos[i]).toFixed(2)+"%", (x1+x2) /2, ((y1+y2)/2) ,"middle", "15", "#1f7dd2");
        var rectangulo = dibujarRectangulo(texto.getAttribute("x")-100, texto.getAttribute("y")-18, 200, 25, "#0e96eb", "#d3d3d3", 5, 5);
        texto.style.display = "none";
        texto.style.zIndex = "5";
        rectangulo.style.display = "none";
        rectangulo.style.zIndex = "5";
        dibujos.push({arcos, rectangulo, texto});
    }
    //desplegar las etiquetas al pasar el raton
    for (var i = 0; i < dibujos.length; i++)
    {
        svgPie.appendChild(dibujos[i].rectangulo);
        svgPie.appendChild(dibujos[i].texto);
        tooltip(dibujos[i].arcos, dibujos[i].rectangulo, dibujos[i].texto);
    }
    
}
//Grafica Lineal
var colorLineas = '#919191';
var colorTexto = '#919191';
var colorRelleno = 'rgba(81, 172, 184, 0.69)';
function lineal(element, datosY, datosX, maxval, labelY, labelX, gridX)
{
    //var maxval = Math.max.apply(Math, datos);
    var svgLinea = document.getElementById(element), dibujos = [];
    while (svgLinea.firstChild) {
        svgLinea.removeChild(svgLinea.firstChild);
    }
    var startX = 60; // graph start x position
    var startY = 300; // graph start y position (height)
    var lineXLenght = 850;
    var dataLineYInterval = Math.round((lineXLenght - startX) / (gridX-1));
    //crear grid
    var linea = dibujarLinea(startX, 50, startX,startY, colorLineas ); svgLinea.appendChild(linea);
    linea = dibujarLinea(startX, startY, lineXLenght ,startY, colorLineas ); svgLinea.appendChild(linea);
    var texto = dibujarTexto("0°", startX - 25, startY, "middle", 12, colorLineas); svgLinea.appendChild(texto);
    texto = dibujarTexto(labelY, startX - 50, 150, "middle", 12, colorTexto); texto.style.writingMode = "tb";
    texto.style.glyphOrientationVertical = 0;svgLinea.appendChild(texto);
    texto = dibujarTexto(labelX, 400, 360, "middle", 12, colorTexto);svgLinea.appendChild(texto);
    //Dibujar
    var x = 50;
    //lineas x
    for (var i = 0; i < 5; i++)
	{
		linea = dibujarLinea(startX, x, lineXLenght,x, "#d3d3d3" ); svgLinea.appendChild(linea);
        texto = dibujarTexto(Math.round(maxval - (i * (maxval/5))) + "°", startX - 35, x+5, "right", 12, colorTexto); svgLinea.appendChild(texto);
        x += 50;
	}
    var y = startX + dataLineYInterval;
    //lineas y
    for (var i = 0; i < gridX-1; i++)
	{
        linea = dibujarLinea(y, 50, y, startY + 5, "#d3d3d3" ); svgLinea.appendChild(linea);
        y += dataLineYInterval;
	}
    y = startX;
    //datos y
    for (var i = 0; i < gridX; i++)
	{
        if (datosY[i] != null)//solo dibuja el texto si contiene datos
            texto = dibujarTexto(datosX[i], y, 320, "middle", 12, colorTexto); svgLinea.appendChild(texto);
        y += dataLineYInterval;
	}
    //crear lineas de datos y circulos
    x = startX;
    y = startY;
    var x1 = 0, y1 = 0, x2= 0, y2=0;
    var fill = "", circles = [];
    for (var i = 0; i < datosY.length; i++)//genera arrglo de datos
	{	
        x1 = x + (i * dataLineYInterval);
        y1 = y - ((datosY[i] / maxval)*250);
        fill += " L"+x1+","+y1;
        circles.push({x1, y1});
	}
    var graph = crearSVG("path", {d: "M" + startX +",300 " + fill + " L"+ circles[datosY.length-1].x1 + ",300", fill: colorRelleno, stroke:"#5e91c6", strokewidth:"2px"});
    svgLinea.appendChild(graph);
    for (var i = 0; i < datosY.length; i++)
    {	
        var circulo = dibujarCirculo(circles[i].x1, circles[i].y1, "#f7f7f7", colorLineas); svgLinea.appendChild(circulo);
        texto = dibujarTexto(labelX + " : " + datosX[i] + ", " + labelY + " : " + datosY[i] + "°C", circles[i].x1, circles[i].y1-15, "right", 8, colorLineas);
        var rectangulo = dibujarRectangulo(texto.getAttribute("x")-10, texto.getAttribute("y")-18, 170, 25, colorLineas, "rgba(247, 247, 247, 0.77)", 0, 0);
        texto.style.display = "none";
        rectangulo.style.display = "none";
        svgLinea.appendChild(rectangulo);
        svgLinea.appendChild(texto);
        dibujos.push({circulo, rectangulo, texto});
	}
    //desplegar las etiquetas al pasar el raton
    for (var i = 0; i < dibujos.length; i++)
    {
        svgLinea.appendChild(dibujos[i].rectangulo);
        svgLinea.appendChild(dibujos[i].texto);
        tooltip(dibujos[i].circulo, dibujos[i].rectangulo, dibujos[i].texto);
    }
    
}
function tooltip(trigger, display, display2)
{
    trigger.onmouseover = (function(){
            display.style.display = "inline";
            display2.style.display = "inline";
        });
    trigger.onmouseout = (function(){
            display.style.display = "none";
            display2.style.display = "none";
        });
}
//dibujar el pie
function crearSVG(grafico, atributos) { //Recibe el tipo de grafico que se requiere y los atributos para crearlo
    var svg = document.createElementNS('http://www.w3.org/2000/svg', grafico); // se crea la figura
    for (var k in atributos)
        if (atributos.hasOwnProperty(k)) svg.setAttribute(k, atributos[k]);
    return svg;
}
//Dibujar Linea
function dibujarLinea(x1, y1, x2, y2, color)
{
	//crear linea
	var linea = document.createElementNS('http://www.w3.org/2000/svg', 'line');
	//punto inicial
	linea.setAttribute('x1', x1); linea.setAttribute('y1', y1); 
	//punto final
	linea.setAttribute('x2', x2); linea.setAttribute('y2', y2);
	//estilo linea
	linea.style.stroke = color; //color de linea
	linea.style.strokeWidth = '1px'; //grosor de la linea
	//regresar linea
	return linea;
}
//Dibujar Rectángulo
function dibujarRectangulo(x, y, alto, ancho, colorLinea, colorRelleno, rx, ry)
{
	//crear rectángulo
	var rect = document.createElementNS('http://www.w3.org/2000/svg', 'rect');
	//punto inicial
	rect.setAttribute('x', x); rect.setAttribute('y', y); 
    rect.setAttribute('rx', rx);rect.setAttribute('ry', ry);
	//ancho y alto
	rect.setAttribute('height', ancho); rect.setAttribute('width', alto);
	//estilo rectangulo
	rect.style.stroke = colorLinea; //color de linea
	rect.style.strokeWidth = '1px'; //grosor de la linea
	rect.style.fill = colorRelleno; //relleno
	//regresar rectángulo
	return rect;
}
//Dibujar Circulo
function dibujarCirculo(cx, cy, stroke, fill)
{
	//crear circulo
	var c = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
	//centro
	c.setAttribute('cx', cx); c.setAttribute('cy', cy); 
	//radio
	c.setAttribute('r', 5); 
	//estilo del circulo
	c.style.stroke = stroke; //color de linea
	c.style.strokeWidth = '2px'; //grosor de la linea
	c.style.fill = fill; //color de relleno
	//agregar circulo a svg
	return c;
}
// Dibujar Texto
function dibujarTexto(texto, x, y, ancla, tamano, color)
{
	//crear texto
	var t = document.createElementNS('http://www.w3.org/2000/svg', 'text');
	//texto
	t.innerHTML = texto;
	//posición
	t.setAttribute('x', x); t.setAttribute('y', y);
	//alineacion
	t.setAttribute('text-anchor', ancla);
	//font
	t.setAttribute('font-family', 'arial');
	t.setAttribute('font-size', tamano + 'pt');
	//color
	t.style.fill = color;
	//regresar texto
	return t;
}
//Dibujar Poligono
function dibujarPoligono()
{
	//crear poligono
	var p = document.createElementNS('http://www.w3.org/2000/svg', 'polygon');
	//generar atributo de puntos
	var puntos = [ [200,200], [300,200], [300,300], [400,300], [400,400], [200,400] ];
	var puntosString = '';
	for (var i = 0; i < puntos.length; i++)
	{
		puntosString += puntos[i][0] + ',' + puntos[i][1] + ' ';
	}
	puntosString += puntos[0][0] + ',' + puntos[0][1]; //regresar a punto original
	p.setAttribute('points',puntos);
	//estilo
	p.style.stroke = '#822'; //color de linea
	p.style.strokeWidth = '1px'; //grosor de la linea
	p.style.fill = '#A55'; //color de relleno
	//agregar poligono a svg
	s.appendChild(p);
}
