// helloteapot.cpp

#include <GL/gl.h>
#include <GL/freeglut.h>
#include <algorithm>
#include <time.h>
//#include 

bool tea = true;
double fouvy = 80;
double vx = 1.;
// function called everytime the windows is refreshed
void display () 
{

    // clear window 
    glClear(GL_COLOR_BUFFER_BIT);

    // draw scene 
    //glutSolidTeapot(.5);
    if (tea){
        glutWireTeapot(.5);
    }else{
        glutWireSphere(.5,16,16);
    }
    
    // flush drawing routines to the window 
    glFlush();

}

// Function called everytime a key is pressed
void key( unsigned char key, int x, int y )
{
    switch ( key )
    {
        case '+':
            fouvy += 10; 
            glMatrixMode(GL_PROJECTION);
            glLoadIdentity();
            gluPerspective(fouvy,1,1,10);
            glFlush();
            break;
        case '-':
            fouvy += -10; 
            glMatrixMode(GL_PROJECTION);
            glLoadIdentity();
            gluPerspective(fouvy,1,1,10);
            glFlush();
            break;
        /*case 'a':
                vx += 1.;
                glMatrixMode(GL_MODELVIEW);
                glLoadIdentity();
                 gluLookAt(vx,2.2,1.0,
                0.0,0.0,0.0,
                0.0,1.0,0.0);
            break;
        case 'e':
                vx -= 1.;
                glMatrixMode(GL_MODELVIEW);
                glLoadIdentity();
                gluLookAt(vx,2.2,1.0,
                0.0,0.0,0.0,
                0.0,1.0,0.0);
            break;*/
        case 'w':
            tea = !tea;
            break;
    	// the 'esc' key
        case 27:
        // the 'q' key
        case 'q':
            exit( EXIT_SUCCESS );
            break;
        default:
            break;
    }
    glutPostRedisplay( );
}

// Function called every time the main window is resized
void reshape ( int width, int height )
{
    float rat = std::min(width, height);
    float ctr = std::max(width,height);
    if (ctr == width){
        glViewport((width - height)/2,0,rat,rat);
    }else{
        glViewport(0,(height - width)/2,rat,rat);
    }
    // define the viewport transformation;
    //glViewport(0,0,rat,rat);

}


// Main routine
int main ( int argc, char * argv[] ) 
{

    // initialize GLUT, using any commandline parameters passed to the 
    //   program 
    glutInit( &argc, argv );

    // setup the size, position, and display mode for new windows 
    glutInitWindowSize( 500, 500 );
    glutInitWindowPosition( 0, 0 );
    glutInitDisplayMode( GLUT_RGB );

    // create and set up a window 
    glutCreateWindow("Hello, teapot!");
    
    // Set up the callback functions:
    // for display
    glutDisplayFunc( display );
    // for the keyboard
    glutKeyboardFunc( key );
    // for reshaping
    glutReshapeFunc( reshape );

    // define the projection transformation
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(fouvy,1,1,10);
    // define the viewing transformation
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    gluLookAt(0.0,0.,-2.,
                0.0,0.0,0.0,
                1.0,1.0,0.0);
    
    // gluLookAt(1.0,2.2,1.0,
    //             0.0,0.0,0.0,
    //             0.0,1.0,0.0);
    
   
//    gluLookAt(0.0,0.0,1.0,
//             0.0,0.0,0.0,
//             0.0,1.0,0.0);
    

    // tell GLUT to wait for events 
    glutMainLoop();
}
