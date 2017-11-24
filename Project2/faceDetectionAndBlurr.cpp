#include "opencv2/objdetect.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/imgproc/imgproc.hpp"

#include <iostream>
#include <stdio.h>

using namespace std;
using namespace cv;

/** Function Headers */
void detectAndDisplay( Mat frame );
int display_dst( int delay );
int DELAY_BLUR = 100;
int MAX_KERNEL_LENGTH = 31;
Mat dst;
/** Global variables */
String face_cascade_name = "haarcascade_frontalface_alt.xml";
CascadeClassifier face_cascade;
String window_name = "Capture - Face detection";

/** @function main */
int main( void )
{
    VideoCapture capture("test2.mp4");
    Mat frame;

    //-- 1. Load the cascades
    if( !face_cascade.load( face_cascade_name ) ){ printf("--(!)Error loading face cascade\n"); return -1; };

    //-- 2. Read the video stream
    //capture.open("test1.mp4");
    //if ( ! capture.isOpened() ) { printf("--(!)Error opening video capture\n"); return -1; }

    while (  capture.read(frame) )
    {
    	capture >> frame;
        if( frame.empty() )
        {
            printf(" --(!) No captured frame -- Break!");
            break;
        }

        //-- 3. Apply the classifier to the frame
        detectAndDisplay( frame );

        int c = waitKey(10);
        if( (char)c == 27 ) { break; } // escape
    }
    return 0;
}

/** @function detectAndDisplay */
void detectAndDisplay( Mat frame )
{
    std::vector<Rect> faces;
    Mat frame_gray;

    cvtColor( frame, frame_gray, COLOR_BGR2GRAY );
    equalizeHist( frame_gray, frame_gray );

    //-- Detect faces
    face_cascade.detectMultiScale( frame_gray, faces, 1.1, 2, 0|CASCADE_SCALE_IMAGE, Size(30, 30) );

    for( size_t i = 0; i < faces.size(); i++ )
    {
        Point center( faces[i].x + faces[i].width/2, faces[i].y + faces[i].height/2 );
        //ellipse( frame, center, Size( faces[i].width/2, faces[i].height/2), 0, 0, 360, Scalar( 255, 0, 255 ), 4, 8, 0 );
        Rect region(faces[i].x, faces[i].y, (faces[i].width),(faces[i].height));
        GaussianBlur(frame(region), frame(region), Size(0, 0), 20);
        /*dst = frame.clone();
        blur( frame, dst, Size( 50, 50 ), Point(-1,-1) );*/
        Mat faceROI = frame_gray( faces[i] );
    }
    //-- Show what you got
    imshow( window_name, frame );
}