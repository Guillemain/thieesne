
// for mac osx
#ifdef __APPLE__
#include <OpenGL/gl.h>
#include <OpenGL/glu.h>
#include <GLUT/glut.h>
#else
// only for windows
#ifdef _WIN32
#include <windows.h>
#endif
// for windows and linux
#include <GL/gl.h>
#include <GL/glu.h>
#include <GL/freeglut.h>
#endif

#include <stdlib.h>
#include <stdio.h>
#include <math.h>


#define SPEED 2
#define ANG_SPEED 3

// coordinates of one of the icosahedron vertex
#define X 0.525731112119133696
#define Z 0.850650808352039932
#define NUMTRIANGLES 20

// icosahedron  vertices
static float vertices[12][3] =
{
	{-X, 0.0, Z}, {X, 0.0, Z}, {-X, 0.0, -Z}, {X, 0.0, -Z},
	{0.0, Z, X}, {0.0, Z, -X}, {0.0, -Z, X}, {0.0, -Z, -X},
	{Z, X, 0.0}, {-Z, X, 0.0}, {Z, -X, 0.0}, {-Z, -X, 0.0}
};

// triangular faces expressed as indices of vertices
static GLuint vIndices[NUMTRIANGLES][3] =
{
	{1,4,0}, {4,9,0}, {4,5,9}, {8,5,4}, {1,8,4},
	{1,10,8}, {10,3,8}, {8,3,5}, {3,2,5}, {3,7,2},
	{3,10,7}, {10,6,7}, {6,11,7}, {6,0,11}, {6,1,0},
	{10,1,6}, {11,0,9}, {2,11,9}, {5,2,9}, {11,2,7}
};



// global variable to deal with the camera movements
float theta = 0.0f;
float phi = 0.0f;

float movex = 0.0;
float movey = 0.0;
float movez = 2.0;

float fov = 60.0f;

// this indicates the recursion level of the subdivision algorithm
int depth = 0;


// for loops
int i;

// function that draws a triangle of vertices v1 v2 v3
void drawtriangle(float v1[3], float v2[3], float v3[3])
{

	//*******************************
	// we want to give some color to the faces of the
	// triangles, let's say a mild grey (50%)
	//*******************************

	glColor3f(0.5f,0.5f,0.5f);

	//*******************************
	// draw the triangle using the 3 vertices
	//*******************************

	glBegin(GL_LINE_LOOP);
		glVertex3fv(v1);
		glVertex3fv(v2);
		glVertex3fv(v3);
	glEnd();


	glColor3f(1.0f,0.0f,0.0f);
	glLineWidth(3.0f);
	glBegin(GL_POINTS);
		glVertex3fv(v1);
		glVertex3fv(v2);
		glVertex3fv(v3);
	glEnd();

}

// function that normalizes a vector
void normalize(float v[3])
{
	//*******************************
	// compute the norm of the vector
	//*******************************

	float norm = sqrtf(powf(v[0],2.0)+powf(v[1],2.0)+powf(v[2],2.0));

	//*******************************
	// normalize the vector
	//*******************************

	for (i=0;i<3;i++) {
		v[i] = v[i]/norm;
	}


}




// simple subdivision algorithm for the icosahedron
void subdivide(float v1[3], float v2[3], float v3[3])
{
	// the new vertices
	float v12[3], v23[3], v31[3];

	//*******************************
	// compute the 3 midpoints of each edge of the triangle
	//*******************************

	for (i=0;i<3;i++) {
		v12[i] = (v1[i]+v2[i])/2;
		v23[i] = (v2[i]+v3[i])/2;
		v31[i] = (v3[i]+v1[i])/2;
	}


	//*******************************
	// projects the 3 midpoints on the unitary sphere, \ie normalize them
	//*******************************

	normalize(v12);
	normalize(v23);
	normalize(v31);



	//*******************************
	// draw the four triangles
	// respect the counter-clockwise order
	//*******************************

	drawtriangle(v1,v12,v31);
	drawtriangle(v12,v23,v31);
	drawtriangle(v31,v23,v3);
	drawtriangle(v12,v2,v23);



}

// recursive subdivision
void recursiveSubdivision(float v1[3], float v2[3], float v3[3], long depth)
{
	// the new vertices
	float v12[3], v23[3], v31[3];

	//*******************************
	// the stop condition for the recursion.
	// Remember: when if depth = 0 is passed, we just want to see the icosahedron
	//*******************************

	if (depth == 0.0) {
		drawtriangle(v1,v2,v3);
	} else {



	//*******************************
	// compute the 3 midpoints of each edge of the triangle
	//*******************************

	for (i=0;i<3;i++) {
		v12[i] = (v1[i]+v2[i])/2;
		v23[i] = (v2[i]+v3[i])/2;
		v31[i] = (v3[i]+v1[i])/2;
	}


	//*******************************
	// projects the 3 midpoints on the unitary sphere, \ie normalize them
	//*******************************

	normalize(v12);
	normalize(v23);
	normalize(v31);



	//*******************************
	// recursive step on the for new faces
	//*******************************

	recursiveSubdivision(v1,v12,v31,depth-1);
	recursiveSubdivision(v12,v23,v31,depth-1);
	recursiveSubdivision(v31,v23,v3,depth-1);
	recursiveSubdivision(v12,v2,v23,depth-1);

	}


}

// function called everytime the windows is refreshed
void display ()
{

	// clear window
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );

	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	gluLookAt(movex,movey,movez,movex,movey,movez-1.0,0.0,1,0);

	glPushMatrix();
		glRotatef(theta, 1.0, 0.0, 0.0);
		glRotatef(phi, 0.0, 1.0, 0.0);



		//*******************************
		// Draw stuff here
		//*******************************
		int i;
		for (i=0;i<NUMTRIANGLES;i++) {
			recursiveSubdivision(vertices[vIndices[i][0]],vertices[vIndices[i][1]],vertices[vIndices[i][2]],depth);
		}



	glPopMatrix();

	// flush drawing routines to the window
	glFlush();
	glutSwapBuffers();

}


// function that manage special keys
void specialKeys( int key, int x, int y )
{
	switch( key )
	{
		case GLUT_KEY_LEFT:
			phi += ANG_SPEED;
			break;
		case GLUT_KEY_RIGHT:
			phi -= ANG_SPEED;
			break;
		case GLUT_KEY_UP:
			theta += ANG_SPEED;
			break;
		case GLUT_KEY_DOWN:
			theta -= ANG_SPEED;
			break;

		//*******************************
		// Menage user input for depth here
		//*******************************
		case GLUT_KEY_PAGE_UP:
			++depth;
			break;
		case GLUT_KEY_PAGE_DOWN:
			if(depth > 0) --depth;
	  		break;
	  	default:
	  		break;
	}
	// marks the current window as needing to be redisplayed.
	glutPostRedisplay( );
}

// function that reset che camera pose
void resetView()
{
	theta = 0.0f;
	phi = 0.0f;
	movex = 0.0;
	movey = 0.0;
	movez = 2.0;
	fov = 60;
}
// Function called everytime a key is pressed
void keys( unsigned char key, int x, int y )
{
	switch ( key  )
	{
		case 27:
		exit( EXIT_SUCCESS );
		case 'a':
			movey -= SPEED;
			break;
		case 'w':
			movey += SPEED;
			break;
		case 'z':
			movez -= SPEED;
			break;
		case 's':
			movez += SPEED;
			break;
		case 't':
			fov += 10;
			glMatrixMode(GL_PROJECTION);
			glLoadIdentity();
			gluPerspective(fov, 1, 1, 20);
			glMatrixMode(GL_MODELVIEW);
			break;
		case 'g':
			fov -= 10;
			glMatrixMode(GL_PROJECTION);
			glLoadIdentity();
			gluPerspective(fov, 1, 1, 20);
			glMatrixMode(GL_MODELVIEW);
			break;
		case 'r':
			resetView();
			break;
		default:
			break;
	}
	// marks the current window as needinggg to be redisplayed.
	glutPostRedisplay( );
}


// Function called every time the main window is resized
void reshape ( int width, int height )
{

	// define the viewport transformation;
	glViewport(0,0,width,height);
	if (width < height)
		glViewport(0,(height-width)/2,width,width);
	else
		glViewport((width-height)/2,0,height,height);
}


// Main routine
int main ( int argc, char * argv[] )
{

	// initialize GLUT, using any commandline parameters passed to the
	//   program
	glutInit( &argc, argv );
	glutInitDisplayMode(GLUT_RGB | GLUT_DEPTH | GLUT_DOUBLE);

	// setup the size, position, and display mode for new windows
	glutInitWindowSize( 500, 500 );

	glutCreateWindow("Icosahedron subdivision as sphere approximation");

	// Set up the callback functions
	// for display
	glutDisplayFunc( display );
	// for the keyboard
	glutKeyboardFunc( keys );
	// for the special keys
	glutSpecialFunc( specialKeys );
	// for reshaping
	glutReshapeFunc( reshape );

	// glClearColor(1.0, 1.0, 1.0, 0.0);
	glEnable(GL_DEPTH_TEST);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(fov, 1, 1, 20);

	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	gluLookAt(movex,movey,movez,movex,movey,movez-1.0,0.0,1,0);

	// tell GLUT to wait for events
	glutMainLoop();

	return(EXIT_SUCCESS);
}
