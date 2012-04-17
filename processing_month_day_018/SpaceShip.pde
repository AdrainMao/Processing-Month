class SpaceShip
{
    PVector location;
    
    PVector point1;
    PVector point2;
    PVector point3;
 
    boolean hit;
    float   starRadius;
   
    SpaceShip()
    {
        location = new PVector( width/2, 360 );
        point1   = new PVector( location.x     , location.y - 20 );
        point2   = new PVector( location.x + 10, location.y + 20 );
        point3   = new PVector( location.x - 10, location.y + 20 );
        
        hit = false;
        starRadius = 10;
        
    }
    
    void update(float x)
    {
        location.x += x;
        
        location.x = constrain( location.x, 15, width - 15 );
        
        point1.set( location.x     , location.y - 20, 0 );
        point2.set( location.x + 10, location.y + 20, 0 );
        point3.set( location.x - 10, location.y + 20, 0 );
 
   }
    
    void render()
    {
        fill(0);
        stroke(255);        
        triangle( point1.x, point1.y, point2.x, point2.y, point3.x, point3.y );
 
        if ( hit ) {
            stroke(0, 255, 0);
            noFill();
            star( location.x, location.y, starRadius );
            starRadius++;
        } 

    }

    void reset()
    {
        starRadius = 10;
        hit = false;
        location.set( width/2, 360, 0 );
        update(0);
    }
}
