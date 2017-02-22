# Shader module for AttractMode front end

by [Keil Miller Jr](http://keilmillerjr.com)

## DESCRIPTION:

Shader module is for the [AttractMode](http://attractmode.org) front end. It can assist you in easily using shaders for layout design.

## Paths

You may need to change file paths as necessary as each platform (windows, mac, linux) has a slightly different directory structure.

## Install Files

1. Copy module files to `$HOME/.attract/modules/Shader/`

## Usage

From within your layout, you can load the module. Currently this module only supports the Crt Lottes Shader.

Example:

```Squirrel
// Create Artwork Variable
local snap = fe.add_artwork("snap", 0, 0, 640, 480);

// Load Shader Module and apply CrtLottes to snap
if (fe.load_module("shader")) {
  local snapShader = CrtLottes();
  snap.shader = snapShader.shader;
}
```

#### Optional Params

See [module.nut](https://github.com/keilmillerjr/shader-module/blob/master/module.nut) for notes on acceptable variables and public class functions to change other params.

```Squirrel
CrtLottes(width, height, curvature, aperature, vertex, fragment);
```

## Notes

Crt Lottes Shader is by Timothy Lottes. It was converted to MAME and AttractMode FE by Luke-Nukem found [here](https://github.com/Luke-Nukem/attract-extra/tree/master/layouts/lottes-crt). It has been slightly modified to allow for changes to some constants such as curvature.

More functionality is expected as it meets my needs. If you have an idea of something to add that might benefit a wide range of layout developers, please join the AttractMode forum and send me a message.
