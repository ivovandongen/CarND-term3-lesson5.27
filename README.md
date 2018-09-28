## Build
- `#>` `git submodule update --init --recursive`
- `#>` `mkdir build && cd build && cmake .. -DGIT_SUBMODULE=ON && make`
- `#>` `./Template`

## Usage as template:
- `#>` `git init`
- `#>` `git remote add template git@github.com:ivovandongen/CarND-term2-template.git`
- `#>` `git remote add origin <your remote>`
- `#>` `git fetch template`
- `#>` `git checkout -b master template/master`

Then adapt and use build instructions above

Pushing changes to your own repo:
- `#>` `git push -u origin master`
