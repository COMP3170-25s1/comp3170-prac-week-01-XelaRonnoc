#version 410

uniform vec3 u_colour;			// colour as a 3D vector (r,g,b)
uniform vec2 u_screenSize;  	// screen dimensions in pixels

layout(location = 0) out vec4 o_colour;	// output to colour buffer

void main() {
   vec2 p = gl_FragCoord.xy / u_screenSize;   // scale p into range (0,0) to (1,1)
//   float d = distance(p, vec2(0.3, 0.5));     // calculate distance to midpoint
//  this and line below draw square
	vec2 v = abs(p - vec2(0.5, 0.5)); // this gets all the xy distances from point to (0.5,0.5) screen center
	float d = max(v.x, v.y); // this then gets the maximum value out of x or y from v above
	// if you change to min you get a cross as it will colour anything where at least one of points is less than the if condition below   
	float diamond = v.x + v.y; // this means that the vertex can be further away in one dimension from the center than the side can as the vertex is only summed with 0
	
  
   if (diamond < 0.28) {
      o_colour = vec4(0,1,0, 0);
   }
   else {
      o_colour = vec4(0,0,1,1); // BLACK
   }
}