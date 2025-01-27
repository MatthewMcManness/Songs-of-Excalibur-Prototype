shader_type spatial;

uniform vec4 color_bg = vec4(0.008, 0.212, 0.063, 1.0); // Background color
uniform vec4 color_line = vec4(0.0, 0.0, 0.0, 1.0);    // Line color

uniform float cell_size = 0.5;                        // Grid cell size
uniform float line_thickness = 0.02;                 // Line thickness

void fragment() {
    // Convert the vertex position to grid coordinates (XZ plane)
  

    // Calculate the distance to the nearest grid line
    float dist_x = abs((fract(VERTEX.x) * cell_size) - 0.5); // Distance to the middle of the cell (X-axis)
    float dist_y = abs((fract(VERTEX.y) * cell_size) - 0.5); // Correctly use Y for the Z-axis

    // Check if the fragment is within the line thickness for either X or Z
    float line_x = step(dist_x, line_thickness); // Vertical lines
    float line_y = step(dist_y, line_thickness); // Horizontal lines

    // Combine the two lines
    float is_line = max(line_x, line_y);

    // Assign colors for the grid or background
    if (is_line > 0.0) {
        ALBEDO = color_line.rgb; // Line color
    } else {
		ALBEDO = color_bg.rgb; // Visualize distances
        // ALBEDO = color_bg.rgb;   // Background color
    }

    ALPHA = 1.0; // Full opacity
}
