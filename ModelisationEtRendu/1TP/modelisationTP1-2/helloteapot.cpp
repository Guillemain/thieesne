// helloteapot.cpp

#include <GL/gl.h>
#include <GL/freeglut.h>
#include <algorithm>


bool tea = false;
// function called everytime the windows is refreshed
void display () 
{

    // clear window 
    glClear(GL_COLOR_BUFFER_BIT);

    // draw scene 
    //glutSolidTeapot(.5);
    if (tea){
        glutSolidTeapot(.5);
    }else{
        glutWireSphere(.5,20,20);
    }
    
    // flush drawing routines to the window 
    glFlush();

}

// Function called everytime a key is pressed
void key( unsigned char key, int x, int y )
{
    switch ( key )
    {
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


    // tell GLUT to wait for events 
    glutMainLoop();
}
