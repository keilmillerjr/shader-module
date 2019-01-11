::shadersDirectory <- fe.module_dir + "shaders/";
::shadersDir <- shadersDirectory;

class Bloom {
	shader = null;

	constructor() {
		shader = fe.add_shader(Shader.Fragment, shadersDir + "bloom.fsh");
		set_default();
	}

	function set_default() {
		shader.set_param("bloom_spread", 0.000695);
		shader.set_param("bloom_power", 0.228);
		shader.set_texture_param("mpass_texture");
	}
}

class BloomMultipass {
	shader = null;

	constructor() {
		shader = fe.add_shader(Shader.VertexAndFragment, shadersDir + "bloomMultipass.vsh", shadersDir + "bloomMultipass.fsh");
		set_default();
	}

	function set_default() {
		shader.set_texture_param("source");
		shader.set_param("sourceSize", 320, 240);
	}
}

class Colorize {
	shader = null;

	constructor(h=0.6 ,s=1.0, l=1.0) {
		shader = fe.add_shader(Shader.Fragment, shadersDir + "colorize.fsh");
		set_default(vargv[0], vargv[2], vargv[3]);
	}

	function set_default(h, s, l) {
		shader.set_texture_param("texture");
		shader.set_param("hsl", h, s, l);
		shader.set_param("texmix", 0.0);
	}
}

class CrtCgwg {
	shader = null;

	constructor() {
		shader = fe.add_shader(Shader.VertexAndFragment, shadersDir + "crtCgwg.vsh", shadersDir + "crtCgwg.fsh");
		set_default();
	}

	function set_default() {
		shader.set_param("CRTgamma", 2.4);					// gamma of simulated CRT
		shader.set_param("monitorgamma", 2.2);			// gamma of display monitor (typically 2.2 is correct)
		shader.set_param("overscan", 0.99, 0.99);		// overscan (e.g. 1.02 for 2% overscan)
		shader.set_param("aspect", 1.0, 0.75);			// aspect ratio
		shader.set_param("d", 1.3);									// distance from viewer
		shader.set_param("R", 2.5);									// radius of curvature - 2.0 to 3.0?
		shader.set_param("cornersize", 0.02);				// size of curved corners
		shader.set_param("cornersmooth", 80); 			// border smoothness parameter, decrease if borders are too aliased
		shader.set_texture_param("texture");
		shader.set_param("inputSize", 320, 240);		// size of input
    shader.set_param("outputSize", 320, 240);		// size of mask
    shader.set_param("textureSize", 320, 240);	// size drawing to

	}
}

class CrtLottes {
	shader = null;

	constructor() {
		shader = fe.add_shader(Shader.VertexAndFragment, shadersDir + "crtLottes.vsh", shadersDir + "crtLottes.fsh");
		set_default();
	}

	function set_default() {
		// APERATURE_TYPE
		// 0.0 = VGA style shadow mask.
		// 1.0 = Very compressed TV style shadow mask.
		// 2.0 = Aperture-grille.
		shader.set_param("aperature_type", 2.0);
		shader.set_param("hardScan", -20.0);		// Hardness of Scanline -8.0 = soft -16.0 = medium
		shader.set_param("hardPix", -5.0);			// Hardness of pixels in scanline -2.0 = soft, -4.0 = hard
		shader.set_param("maskDark", 0.4);			// Sets how dark a "dark subpixel" is in the aperture pattern.
		shader.set_param("maskLight", 1.5);			// Sets how dark a "bright subpixel" is in the aperture pattern
		shader.set_param("saturation", 1.1);		// 1.0 is normal saturation. Increase as needed.
		shader.set_param("tint", 0.0);					// 0.0 is 0.0 degrees of Tint. Adjust as needed.
		shader.set_param("blackClip", 0.02);		// Drops the final color value by this amount
		shader.set_param("brightMult", 1.2);		// Multiplies the color values by this amount if GAMMA_CONTRAST_BOOST is defined
		shader.set_param("distortion", 0.15);		// 0.0 to 0.2 seems right
		shader.set_param("cornersize", 0.03);		// 0.0 to 0.1
		shader.set_param("cornersmooth", 80);		// Reduce jagginess of corners
		shader.set_texture_param("texture");
		shader.set_param("color_texture_sz", 320, 240);
    shader.set_param("color_texture_pow2_sz", 320, 240);
	}
}

class CrtLottesMultipass {
	shader = null;

	constructor() {
		shader = fe.add_shader(Shader.VertexAndFragment, shadersDir + "crtLottesMultipass.vsh", shadersDir + "crtLottesMultipass.fsh");
		set_default();
	}

	function set_default() {
		shader.set_texture_param("source");
		shader.set_param("sourceSize", 320, 240);
		shader.set_param("outputSize", 320, 240);
	}
}

class Desaturate {
	shader = null;

	constructor() {
		shader = fe.add_shader(Shader.Fragment, shadersDir + "desaturate.fsh");
		set_default();
	}

	function set_default() {
		shader.set_texture_param("texture");
	}
}

class RoundedCorners {
	shader = null;

	constructor(...) {
		shader = fe.add_shader(Shader.Fragment, shadersDir + "roundedCorners.fsh");
		if (vargv.len() == 3) set_default(vargv[0], vargv[1], vargv[2]);
		if (vargv.len() == 5) set_default(vargv[0], vargv[1], vargv[2], vargv[3], vargv[4]);
	}

	function set_default(r, iw, ih, siw=null, sih=null) {
		shader.set_param("radius", r);
		shader.set_param("snap_dimensions", iw, ih);
		if (!siw || !sih) {
			siw = iw;
			sih = ih;
		}
		shader.set_param("subimg_dimensions", siw, sih);
	}
}
