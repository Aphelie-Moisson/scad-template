# scad template

This is a template for openscad projects.

## Usage

Use whichever editor you prefer.
Use of the openscad GUI is not supported unless you temporarily add the contents of `default_env.env` to your scad files.

### Directory Structure

All scad files you add in `./src` will be compiled into a different stl file.
Variables and modules you want to have shared accross your project can be defined in scad files stored in `./src/lib`.

stl files will be generated in `./build`.

### Workflow

You can compile your projects into stl files by running `./build.sh` from the project's root.


### Environment Variables

if you want to modify your objects at compile time, you may want to use environment variables.
Do this by adding lines to `default_env.env` with the default values of the environment variables you want to access in your scad files `var_name=default_value`.
You may then change those values at compile time by defining those environment variables (eg: `var_name=value ./build.sh`)

A version tag is generated from git tags and provided as a variable you can use in your scad files.
You may engrave this string into your objects if you want to easily identify printed objects.

If you define the environment variable `only`, the build script will only generate the stl file with that name.
For example, `only=example ./build.sh` Will only generate `./build/example.stl` from `./src/example.scad`, even if other scad files exist in `./src`.
