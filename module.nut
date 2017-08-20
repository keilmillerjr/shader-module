class CrtLottes {
	shader = null;

	constructor(w=640, h=480, c=0, a=2.0, r=1.0, v=fe.module_dir+"CRT-lottes.vsh", f=fe.module_dir+"CRT-lottes_rgb32_dir.fsh") {
		shader = fe.add_shader(Shader.VertexAndFragment, v, f);

		curvature(c);
		aperature(a);
		distortion();
		cornerSize();
		cornerSmooth();
		hardScan();
		hardPix();
		maskDark();
		maskLight();
		saturation();
		tint();
		backClip();
		brightMult();
		rotated(r);
		setTextures(w, h);
	}

	function curvature(val=0) {
		// 0 = Flat
		// 1.0 = Curved
		shader.set_param("curvature", val);
	}

	function aperature(val=2.0) {
		// 0 = VGA style shadow mask.
		// 1.0 = Very compressed TV style shadow mask.
		// 2.0 = Aperture-grille.
		shader.set_param("aperature_type", val);
	}

	function distortion(val=0.1) {
		shader.set_param("distortion", val);
	}

	function cornerSize(val=0.038) {
		shader.set_param("cornersize", val);
	}

	function cornerSmooth(val=400.0) {
		// Accepts values 100-1000
		shader.set_param("cornersmooth", val);
	}

	function hardScan(val=-10.0) {
		// -8.0 = soft
		// -16.0 = medium
		shader.set_param("hardScan", val);
	}

	function hardPix(val=-2.3) {
		// -2.0 = soft
		// -4.0 = hard
		shader.set_param("hardPix", val);
	}

	function maskDark(val=0.4) {
		shader.set_param("maskDark", val);
	}

	function maskLight(val=1.3) {
		shader.set_param("maskLight", val);
	}

	function saturation(val=1.25) {
		// 1.0 is normal saturation. Increase as needed.
		shader.set_param("saturation", val);
	}

	function tint(val=0.1) {
		// 0.0 is 0.0 degrees of Tint. Adjust as needed.
		shader.set_param("tint", val);
	}

	function backClip(val=0.08) {
		// Drops the final color value by this amount if GAMMA_CONTRAST_BOOST is defined
		shader.set_param("blackClip", val);
	}

	function brightMult(val=1.25) {
		// Multiplies the color settings by this amount if GAMMA_CONTRAST_BOOST is defined
		shader.set_param("brightMult", val);
	}
	
	function rotated(val=1.0) {
		// 0 = Scan line orientation vertical.
		// 1.0 = Scan line orientation horizontal.
		shader.set_param("rotated", val);
	}

	function setTextures(w=640, h=480) {
		shader.set_param("color_texture_sz", w, h);
		shader.set_param("color_texture_pow2_sz", w, h);
		shader.set_texture_param("mpass_texture");
	}
}

class RoundCorners {
	shader = null;

	constructor(r, iw, ih, siw=null, sih=null, f=fe.module_dir+"RoundCorners.fsh") {
		shader = fe.add_shader(Shader.Fragment, f);
		
		setRadius(r);
		setImgDimensions(iw, ih);
		if (!siw || !sih ) setSubImgDimensions(iw, ih);
		else setSubImgDimensions(siw, sih);
	}
	
	function setRadius(val) {
		shader.set_param("radius", val);
	}
	
	function setImgDimensions(val1, val2) {
		shader.set_param("snap_dimensions", val1, val2);
	}
	
	function setSubImgDimensions(val1, val2) {
		shader.set_param("subimg_dimensions", val1, val2);
	}
}
