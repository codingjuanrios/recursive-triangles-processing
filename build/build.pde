//VAR TIEMPO
int second = second();  // Values from 0 - 59
int minute = minute();  // Values from 0 - 59
int hour = hour();    // Values from 0 - 23
int day = day();    // Values from 1 - 31
int month = month();  // Values from 1 - 12
int year = year();   // 2003, 2004, 2005, etc.

String timestamp = str(year)+str(month)+str(day)+str(hour)+str(minute)+str(second);

color[] colores = {#F2BE24, #57523E, #D94C1A, #A4A68A};
float[] angulo = {0,HALF_PI,PI,3*QUARTER_PI};

// ArrayList<PVector> puntos = new ArrayList<PVector>();

float secciones = 6;
float comparacion = secciones*secciones;
float tamano = 250;

PVector a, b, c;

void setup() {
	size(1800, 1800);

	background(#CCCCCC);

	noLoop();
	noStroke();
}

void draw() {
	// drawTriangle(a,b,c,5);

	// if (frameCount%60 == 0) {

		float anchoSecc = width/secciones;
		float altoSecc = height/secciones;
		println("anchoSecc: "+anchoSecc);
		println("altoSecc: "+altoSecc);

		float margenX = (anchoSecc - tamano)/2;
		float margenY = (altoSecc - tamano)/2;
		println("margenX: "+margenX);
		println("margenY: "+margenY);

		for (int j = 0; j < secciones; j++){

			for (int i = 0; i < secciones; i++){
				float desplX = (anchoSecc*i) + margenX;
				float desplY = (altoSecc*j) + margenY;
				println("desplX: "+desplX);
				println("desplY: "+desplY);

				pushMatrix();
				translate(desplX, desplY);

				a = new PVector(random(tamano/4),random(tamano/4));
				b = new PVector(random(3*tamano/4,tamano),random(tamano/4,3*tamano/4));
				c = new PVector(random(tamano/2),random(3*tamano/4,tamano));

				// DIBUJAR EL TRIANGULO
				drawTriangle(a,b,c,5);
				// drawCircle(0,0,tamano,3);

				rotate(angulo[(int)random(angulo.length)]);

				popMatrix();
			}
		}
	// }

	saveFrame("C:/users/escri/Pictures/Processing/RecursiveTriangles/screenshot/recursive"+timestamp+".jpeg");

}

void drawTriangle(PVector a, PVector b, PVector c, int level) {
	// fill(#FFFFFF, 50);
	fill(colores[(int)random(colores.length)]);
	triangle(a.x, a.y, b.x, b.y, c.x, c.y);

	if(level > 1) {
		level--;
		PVector e = PVector.lerp(a,c,random(0.25,0.75));
		PVector f = PVector.lerp(b,a,random(0.25,0.75));
		PVector g = PVector.lerp(c,b,random(0.25,0.75));
		drawTriangle(e,f,g,level);
	}
}

void drawCircle(float x, float y, float size, int level) {
	// fill(#FFFFFF, 50);
	fill(colores[(int)random(colores.length)]);
	circle(x,y,size);

	if(level > 1) {
		level--;
		float theta = random (TWO_PI);
		drawCircle(x + size/4  * cos(theta), y +  size/4 * sin(theta),size/2,level);
	}
}