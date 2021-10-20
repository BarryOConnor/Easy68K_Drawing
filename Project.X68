*-----------------------------------------------------------
* Title      :  My Lovely Art
* Written by :  Barry O'Connor N0813926
* Date       :  27/04/2019
* Description:  Using some of the drawing functions and trap calls to draw a picture and color it in using brushes, lines and shapes. 
*               Not very academic I guess, but I was interested to see how much functionality there was in Easy68k for graphical
*               stuff for a change as I build windows systems for a living and fancied trying something silly
*-----------------------------------------------------------

        ORG   $1000
START:            ; first instruction of program

BLUE    EQU     $00D9D600
YELLOW  EQU     $0026FFFF
BLACK   EQU     $00000000
WHITE   EQU     $00ECECEC
GREEN   EQU     $001A6600
GREY    EQU     $00DBDBEA
DGREY   EQU     $00514242
BROWN   EQU     $0000468C

START
        MOVE.B  #33,D0
        MOVE.L  #800*$10000+600,D1      ;set the "masterpiece" to fit in an 800x600 window for easier position calculation
        TRAP    #15
    

        BSR     SKY
        BSR     GRASS
        BSR     HOUSE
             
     
        MOVE.B  #9,D0
        TRAP    #15      ; halt simulator


SET_PENS
        move.b  #80,d0
        trap    #15                 ;set the pen
        move.b  #81,d0
        trap    #15                 ;set the fill
        RTS 

;TRAPCODE SHORTCUTS
RECTANGLE
        move.b  #87,d0
        trap    #15             ;Draw a Rectangle -coords are from 0,0 in the top left to 800,600 in the bottom right
        RTS
            
ELLIPSE
        move.b  #91,d0
        trap    #15          ;Draw a Rectangle -coords are from 0,0 in the top left to 800,600 in the bottom right
        RTS
        
FILL_POINT
        move.b  #89,d0
        trap    #15          ;Draw a Rectangle -coords are from 0,0 in the top left to 800,600 in the bottom right
        RTS
        
LINE
        move.b  #84,d0
        trap    #15             draw line from D1,D2 to D3,D4
        RTS


;DRAWING FUNCTIONS

GRASS   move.l  #GREEN,d1        ; set the color to D0 then run the sub to set pens
        BSR     SET_PENS        ;set fill colors

    
        ;draw the grass 
        move.l  #0,d1           
        move.l  #350,d2         ;Y - Coord top left   
        move.l  #800,d3      
        move.l  #600,d4         ;(800,600)
        BSR     RECTANGLE
    
        ;draw the grassy hill 
        move.l  #-100,d1            ;X1 = 0
        move.l  #290,d2         ;Y - Coord top left    
        move.l  #386,d3      X2 = 80
        move.l  #453,d4      Y2 = 20
        BSR     ELLIPSE
    
        move.l  #0,d1            ;X1 = 0
        move.l  #320,d2         ;Y1 = 60    
        BSR     FILL_POINT
        RTS
        
 
SKY   
        ;function to draw the sky
        move.l  #BLUE,d1        ; set the color to D0 then run the sub to set pens
        BSR     SET_PENS        ;set fill colors
    
        ;draw the skyblock 
        move.l  #0,d1           ;X - Coord top left
        move.l  #0,d2           ;Y - Coord top left  
        move.l  #800,d3         ;X - Coord bottom right
        move.l  #350,d4         ;Y - Coord bottom right  
        BSR     RECTANGLE
        

        ;function to draw the sun
        move.l  #YELLOW,d1        ; set the color to D0 then run the sub to set pens
        BSR     SET_PENS        ;set fill colors
    
        ;draw the sun 
        move.l  #50,d1           ;X - Coord top left
        move.l  #50,d2           ;Y - Coord top left  
        move.l  #200,d3         ;X - Coord bottom right
        move.l  #200,d4         ;Y - Coord bottom right  
        BSR     ELLIPSE
        
        move.l  #125,d1            ;X1 = 0
        move.l  #125,d2         ;Y1 = 60    
        BSR     FILL_POINT
        
        ;function to draw the CLOUDS
        move.l  #GREY,d1        ; set the color to D0 then run the sub to set pens
        BSR     SET_PENS        ;set fill colors
    
        ;draw the clouds 
        move.l  #103,d1           ;X - Coord top left
        move.l  #73,d2           ;Y - Coord top left  
        move.l  #423,d3         ;X - Coord bottom right
        move.l  #160,d4         ;Y - Coord bottom right  
        BSR     ELLIPSE

        move.l  #125,d1            ;X1 = 0
        move.l  #125,d2         ;Y1 = 60    
        BSR     FILL_POINT
        move.l  #250,d1            ;X1 = 0
        move.l  #125,d2         ;Y1 = 60    
        BSR     FILL_POINT
        
        
        ;draw the clouds 
        move.l  #153,d1           ;X - Coord top left
        move.l  #33,d2           ;Y - Coord top left  
        move.l  #473,d3         ;X - Coord bottom right
        move.l  #130,d4         ;Y - Coord bottom right  
        BSR     ELLIPSE

        move.l  #320,d1            ;X1 = 0
        move.l  #59 ,d2         ;Y1 = 60    
        BSR     FILL_POINT
        move.l  #167,d1            ;X1 = 0
        move.l  #75 ,d2         ;Y1 = 60    
        BSR     FILL_POINT

        RTS


HOUSE:
        ;function to draw the house
        move.l  #GREY,d1        ; set the color to D0 then run the sub to set pens
        BSR     SET_PENS        ;set fill colors
    
        ;draw the house 
        move.l  #400,d1         ;X - Coord top left 
        move.l  #200,d2         ;Y - Coord top left    
        move.l  #750,d3         ;X - Coord bottom right
        move.l  #450,d4         ;Y - Coord bottom right
        BSR     RECTANGLE
    
    
        move.l  #BROWN,d1        ; set the color to D0 then run the sub to set pens
        BSR     SET_PENS        ;set fill colors

    
        ;draw the door 
        move.l  #610,d1         ;X - Coord top left  
        move.l  #330,d2         ;Y - Coord top left   
        move.l  #685,d3         ;X - Coord bottom right
        move.l  #450,d4         ;Y - Coord bottom right
        BSR     RECTANGLE
    
    
        move.l  #DGREY,d1       ; set the color to D0 then run the sub to set pens
        BSR     SET_PENS        ;set fill colors

        ;draw the roof
        move.l  #370,d1          ; coords (D0, D1) to (D2, D3)
        move.l  #210,d2          
        move.l  #555,d3          
        move.l  #78,d4          
        BSR     LINE
        
        move.l  #555,d1          ; coords (D0, D1) to (D2, D3)
        move.l  #78,d2          
        move.l  #780,d3          
        move.l  #210,d4          
        BSR     LINE
        
        move.l  #780,d1          ; coords (D0, D1) to (D2, D3)
        move.l  #210,d2          
        move.l  #370,d3          
        move.l  #210,d4          
        BSR     LINE

        move.l  #606, d0
        move.l  #184, d1
        BSR     FILL_POINT

        
        ;draw the window 
        move.l  #440,d1         ;X - Coord top left  
        move.l  #330,d2         ;Y - Coord top left    
        move.l  #565,d3         ;X - Coord bottom right
        move.l  #405,d4         ;Y - Coord bottom right
        BSR     RECTANGLE

        ;draw the chimney 
        move.l  #665,d1         ;X - Coord top left
        move.l  #111,d2         ;Y - Coord top left    
        move.l  #695,d3         ;X - Coord bottom right
        move.l  #187,d4         ;Y - Coord bottom right
        BSR     RECTANGLE

        ;draw the chimney 
        move.l  #665,d1         ;X - Coord top left  
        move.l  #111,d2         ;Y - Coord top left    
        move.l  #695,d3         ;X - Coord bottom right
        move.l  #157,d4         ;Y - Coord bottom right
        BSR     RECTANGLE
    RTS


    




* Variables and Strings

   END   START      ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
