#  Demo app for scroll view - horizontal and vertical

![ezgif com-gif-maker](https://user-images.githubusercontent.com/52130832/156348895-815e3ef4-e89d-47f4-a868-8bf8dc89d5b2.gif)


How to set constraints for an scroll view to work

## Scroll view should have 4 constraints 
(All of them to superview)

    1. top
    2. bottom
    3. leading
    4. trailing

## Container view should have 6 constraints
(to scroll view)
    
    1. top
    2. bottom
    3. leading
    4. trailing

   
   ### If we are building vertical scrollview
    
    5. Set equal widths to scroll view [priority 1000]
    6. set equal height to scroll view [priority 250]
    
   #### OR
   
   ### If we are building horizontal scrollview
   
       5. Set equal widths to scroll view [priority 250]
       6. set equal height to scroll view [priority 1000]


## Done.
