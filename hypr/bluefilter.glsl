precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec4 pixColor = texture2D(tex, v_texcoord);

    pixColor.b = pixColor.b * 0.4;
    pixColor.g = pixColor.g * 0.7;

    gl_FragColor = pixColor;
}
