# Shader module for AttractMode front end

by [Keil Miller Jr](http://keilmillerjr.com)

## DESCRIPTION:

Shader module is for the [AttractMode](http://attractmode.org) front end. It can assist you in easily using shaders for layout design.

## Paths

You may need to change file paths as necessary as each platform (windows, mac, linux) has a slightly different directory structure.

## Install Files

1. Copy module files to `$HOME/.attract/modules/Shader/`

## Usage

The shaders module provides a global variable ```shadersDirectory``` or ```shadersDir``` containing the shaders directory path. This enables you to use the shaders as you wish.

You may optionally use the provided classes to make usage easier, and in some cases, set with default parameters. All classes utilize a public shader variable. This enables you to set some parameters outside of the defaults provided from the class.

Example:

```Squirrel
// Load the Shader module
fe.load_module("shader");

// Create your shaders
local shaderBloom = Bloom();

// Create an object
local surf = fe.add_surface(640, 480);

// Apply shader
surf.shader = shaderBloom.shader;
```

#### Parameters

See [module.nut](https://github.com/keilmillerjr/shader-module/blob/master/module.nut) for notes on parameters.

```Squirrel
Bloom();
BloomMultipass();
crtCgwg();
CrtLottes();
crtLottesMultipass();
RoundCorners(radius, imageWidth, imageHeight, [subImgWidth], [subImgHeight]);
```

## Notes

Bloom shader from [here](http://wp.applesandoranges.eu/?p=14), modified by Chris Van Graas. Crt Lottes Shader and Bloom Multipass is by Timothy Lottes. Crt Cgwg is by Themaister and DOLLS. They were converted to work with AttractMode FE by Luke-Nukem, found in his [crt-shader-theme](https://gitlab.com/ljcode/crt-shader-theme).

Round Corders Shader is by Oomek, and was shared on the AttractMode forum [here](http://forum.attractmode.org/index.php?topic=1588).

All shaders were used here with permission. Thank you so much for your contribution. Including them in a module makes it easier to be included in a layout.

More functionality is expected as it meets my needs. If you have an idea of something to add that might benefit a wide range of layout developers, please join the AttractMode forum and send me a message.
