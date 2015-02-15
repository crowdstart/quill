# quill
Functional CSS library.

## Development
Run [`bebop`](https://github.com/zeekay/bebop) to compile `docs/` directory and start watching source dir for
changes.

```bash
$ bebop
```

### Style guide
Our style guide is generated using
[kss-node](https://github.com/kss-node/kss-node). Our project is a bit
unconventional, however. Files are laid out in the following structure:

```
.
├── docs/              Generated by Quill
├── guide/
│   ├── examples/      Example HTML for Quill widgets
│   ├── template/      Template used by style guide
│   └── styles.styl    All styles are imported here for style guide.
└─── src/              Quill source
```
