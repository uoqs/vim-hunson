<div align="center">
<img src="doc/img/Lordofevil_soulsucking.png"/>
<img src="doc/screen/latest.png"/>
</div>

## Configure

### Colors
This scheme works best in GUI colors. If your terminal is `ISO-8613-3` compatible you can enable 24-bit colors by setting:

```vim
set termguicolors
```

### Fading of non-current views
By default non-current views will fade a bit to make it easier to see which one is active. This feature can be disabled by setting `g:hunson_fade_nc_views = 0` before scheme is applied:

```vim
let g:hunson_fade_nc_views = 0
colors hunson
```

### Background of a constant
By default the background of a constant is filled with a different color, which is especially useful for viewing strings that contain whitespace characters. This feature can be disabled by setting `g:hunson_fill_const = 0` before scheme is applied:

```vim
let g:hunson_fill_const = 0
colors hunson
```
