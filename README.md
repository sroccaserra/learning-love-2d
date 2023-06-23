Learning how to render on scaled low resolutions with LÖVE.

## How to start

```
$ make
```

## Rationale

The intention is to have a 224 px high resolution (28 8 px high tiles), with a
~ 4:3 ratio (1.333...).

A 296 px wide screen (37 8 px wide tiles) would be nice, with a 1.321.. ratio,
but 37 x 28 tiles would be 1036 tiles. If we want to have a screen of at most
1024 tiles (for silly reasons), we should limit to a 36 tiles wide screen.

This would mean a 288x224 resolution, with a 1.2857.. ratio, let's settle for
that.

This would be a very small window on a 1080p screen, so having at least a x3
pixel size would be nice. This would mean a 864x672 window. A 4 px pixel size
would mean a 1152x896 window.

## References

- <https://love2d.org/>
- <https://github.com/adekto/maid64>
- <https://love2d.org/forums/viewtopic.php?t=82034>
