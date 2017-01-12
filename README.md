# CommonMark
A module for converting Markdown (CommonMark spec) to HTML. It requires the
bundling of the open source, cross-platform, [cmark][cmark] command line tool which is
provided in this repo. It's quick (7 ms for the seminal Markdown
[specification page][gruber]) and robust.

## Adding Markdown support to your projects
Using the CommonMark module in your projects is pretty straightforwards. Just
follow the below steps depending on your platform:

1. Add the CommonMark module to your Xojo project
2. Add a `Copy Files` build step to your project (name it whatever you like)
3. Drag the named build step in the navigator to the correct platform node (OS X, Windows or Linux) under the `Build Settings` heading
4. In the build step, drag the correct `cmark` binary for your platform found in the `resources` folder in this repo and set the `Destination` to `Resources Folder`

You will need to repeat steps 1-4 for each platform you want to support, making
sure to copy the correct cmark binary for the correct platform.

## Usage
Converting Markdown to HTML is easy peasy:

```xojo
dim md as Text = "This is **bold** text."
dim html as Text = CommonMark.ToHTML(md) ' This is <strong>bold</strong> text.
```

Note: The first time CommonMark parses some Markdown will take a little longer
than subsequent parses (~25 ms longer) as it has to do some internal setup.

[gruber]: https://daringfireball.net/projects/markdown/syntax.text
[cmark]: https://github.com/jgm/cmark
