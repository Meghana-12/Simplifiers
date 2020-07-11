# Simplifiers



*INSTRUCTIONS* :
      Go to the code folder
      Enter make (that will guide you further) on the command line
      
 DOCUMENTATION:

**COMPONENTS**

  1. **Nav**: 
	 Props:
        - title=any string
        - sizeT=refer Typography (default: "h5")
        - colorT=any hex code
       
  2. **Grid**:
	 Props:
	    - container
	    - spacing={1,2,3,4,5,6,7,8,9}
	    - direction="row" | "row-reverse" | "column" | "column-reverse"
	    - justify="flex-start" | "center" | "flex-end" | "space-between" | "space-around" | "space-evenly"
	    - alignItems="flex-start" | "center" | "flex-end" | "stretch" | "baseline"
  4. **Card**:
	  Props:
	  - imgLink=img src link
	  - title=any string
	  - content=any string
	  - sizeT=refer Typography (default : "h5")
	  - sizeC=refer Typography (default : "body2" )
	  - colorT=any hex 
	  - colorC=ant hex
  5. **Heading**:
      Props:
        - title=any string
        - content=any string
        - sizeT=refer Typography (default value : "h1" )
        - colorT=any hex (default value : "#e68a00" )
        - sizeC=refer Typography (default value : "h4" )
        - colorC=any hex (default value : "#e68a00" )
  5. **Para**:
      Props:
	  - title=any string
	  - content=any string
	  - sizeT=refer Typography (default value : "h3")
	  - colorT= any hex (default value : "#000066")
	  - sizeC=refer Typography (default value : "body1")
	  - colorC=any hex (default value : "#000000")

  6. **TECH STACK** :
        - typescript
        - makefile
        - react (Material UI framework is used too)
        - flex
        - bison

**TYPOGRAPHY**
Allowed property values: "h1","h2","h3","h4","h5","h6", "body1", "body2"
 *(Component part only)*

