# CommonMark
A module for converting Markdown (CommonMark spec) to HTML. It requires the
bundling of the open source, cross-platform, [cmark][cmark] command line tool which is
provided in this repo. It's quick (7 ms for the seminal Markdown
[specification page][gruber]) and robust.

## Adding Markdown support to your projects
Using the CommonMark module in your projects is pretty straightforwards. Just
follow the steps below depending on your platform:

1. Add the CommonMark module to your Xojo project
2. Add a `Copy Files` build step to your project (name it whatever you like)
3. Drag the newly created build step in the navigator to the correct platform node (OS X, Windows or Linux) under the `Build Settings` heading
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

## Under the hood
As mentioned above, the work is really being done by the cmark binary. When the
`CommonMark.ToHTML()` method is called, it writes the passed Markdown to a
temporary file, passes that to cmark and then reads StdOut for the HTML. I
think it may be possible to speed things up a little by passing the Markdown
direct to cmark and bypass the file IO step but I haven't been able to get it
work reliably. I'd be interested in hearing suggestions to make this work.

[gruber]: https://daringfireball.net/projects/markdown/syntax.text
[cmark]: https://github.com/jgm/cmark
