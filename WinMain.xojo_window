#tag Window
Begin Window WinMain
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   600
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   574732287
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Pandoc"
   Visible         =   True
   Width           =   1200
   Begin TextArea Input
      AcceptTabs      =   True
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   550
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   0
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Markdown: Syntax\n================\n\n<ul id=""ProjectSubmenu"">\n    <li><a href=""/projects/markdown/"" title=""Markdown Project Page"">Main</a></li>\n    <li><a href=""/projects/markdown/basics"" title=""Markdown Basics"">Basics</a></li>\n    <li><a class=""selected"" title=""Markdown Syntax Documentation"">Syntax</a></li>\n    <li><a href=""/projects/markdown/license"" title=""Pricing and License Information"">License</a></li>\n    <li><a href=""/projects/markdown/dingus"" title=""Online Markdown Web Form"">Dingus</a></li>\n</ul>\n\n\n*   [Overview](#overview)\n    *   [Philosophy](#philosophy)\n    *   [Inline HTML](#html)\n    *   [Automatic Escaping for Special Characters](#autoescape)\n*   [Block Elements](#block)\n    *   [Paragraphs and Line Breaks](#p)\n    *   [Headers](#header)\n    *   [Blockquotes](#blockquote)\n    *   [Lists](#list)\n    *   [Code Blocks](#precode)\n    *   [Horizontal Rules](#hr)\n*   [Span Elements](#span)\n    *   [Links](#link)\n    *   [Emphasis](#em)\n    *   [Code](#code)\n    *   [Images](#img)\n*   [Miscellaneous](#misc)\n    *   [Backslash Escapes](#backslash)\n    *   [Automatic Links](#autolink)\n\n\n**Note:** This document is itself written using Markdown; you\ncan [see the source for it by adding '.text' to the URL][src].\n\n  [src]: /projects/markdown/syntax.text\n\n* * *\n\n<h2 id=""overview"">Overview</h2>\n\n<h3 id=""philosophy"">Philosophy</h3>\n\nMarkdown is intended to be as easy-to-read and easy-to-write as is feasible.\n\nReadability, however, is emphasized above all else. A Markdown-formatted\ndocument should be publishable as-is, as plain text, without looking\nlike it's been marked up with tags or formatting instructions. While\nMarkdown's syntax has been influenced by several existing text-to-HTML\nfilters -- including [Setext] [1], [atx] [2], [Textile] [3], [reStructuredText] [4],\n[Grutatext] [5], and [EtText] [6] -- the single biggest source of\ninspiration for Markdown's syntax is the format of plain text email.\n\n  [1]: http://docutils.sourceforge.net/mirror/setext.html\n  [2]: http://www.aaronsw.com/2002/atx/\n  [3]: http://textism.com/tools/textile/\n  [4]: http://docutils.sourceforge.net/rst.html\n  [5]: http://www.triptico.com/software/grutatxt.html\n  [6]: http://ettext.taint.org/doc/\n\nTo this end, Markdown's syntax is comprised entirely of punctuation\ncharacters, which punctuation characters have been carefully chosen so\nas to look like what they mean. E.g., asterisks around a word actually\nlook like \\*emphasis\\*. Markdown lists look like, well, lists. Even\nblockquotes look like quoted passages of text, assuming you've ever\nused email.\n\n\n\n<h3 id=""html"">Inline HTML</h3>\n\nMarkdown's syntax is intended for one purpose: to be used as a\nformat for *writing* for the web.\n\nMarkdown is not a replacement for HTML, or even close to it. Its\nsyntax is very small, corresponding only to a very small subset of\nHTML tags. The idea is *not* to create a syntax that makes it easier\nto insert HTML tags. In my opinion, HTML tags are already easy to\ninsert. The idea for Markdown is to make it easy to read, write, and\nedit prose. HTML is a *publishing* format; Markdown is a *writing*\nformat. Thus, Markdown's formatting syntax only addresses issues that\ncan be conveyed in plain text.\n\nFor any markup that is not covered by Markdown's syntax, you simply\nuse HTML itself. There's no need to preface it or delimit it to\nindicate that you're switching from Markdown to HTML; you just use\nthe tags.\n\nThe only restrictions are that block-level HTML elements -- e.g. `<div>`,\n`<table>`, `<pre>`, `<p>`, etc. -- must be separated from surrounding\ncontent by blank lines, and the start and end tags of the block should\nnot be indented with tabs or spaces. Markdown is smart enough not\nto add extra (unwanted) `<p>` tags around HTML block-level tags.\n\nFor example, to add an HTML table to a Markdown article:\n\n    This is a regular paragraph.\n\n    <table>\n        <tr>\n            <td>Foo</td>\n        </tr>\n    </table>\n\n    This is another regular paragraph.\n\nNote that Markdown formatting syntax is not processed within block-level\nHTML tags. E.g., you can't use Markdown-style `*emphasis*` inside an\nHTML block.\n\nSpan-level HTML tags -- e.g. `<span>`, `<cite>`, or `<del>` -- can be\nused anywhere in a Markdown paragraph, list item, or header. If you\nwant, you can even use HTML tags instead of Markdown formatting; e.g. if\nyou'd prefer to use HTML `<a>` or `<img>` tags instead of Markdown's\nlink or image syntax, go right ahead.\n\nUnlike block-level HTML tags, Markdown syntax *is* processed within\nspan-level tags.\n\n\n<h3 id=""autoescape"">Automatic Escaping for Special Characters</h3>\n\nIn HTML, there are two characters that demand special treatment: `<`\nand `&`. Left angle brackets are used to start tags; ampersands are\nused to denote HTML entities. If you want to use them as literal\ncharacters, you must escape them as entities, e.g. `&lt;`, and\n`&amp;`.\n\nAmpersands in particular are bedeviling for web writers. If you want to\nwrite about 'AT&T', you need to write '`AT&amp;T`'. You even need to\nescape ampersands within URLs. Thus, if you want to link to:\n\n    http://images.google.com/images?num=30&q=larry+bird\n\nyou need to encode the URL as:\n\n    http://images.google.com/images?num=30&amp;q=larry+bird\n\nin your anchor tag `href` attribute. Needless to say, this is easy to\nforget, and is probably the single most common source of HTML validation\nerrors in otherwise well-marked-up web sites.\n\nMarkdown allows you to use these characters naturally, taking care of\nall the necessary escaping for you. If you use an ampersand as part of\nan HTML entity, it remains unchanged; otherwise it will be translated\ninto `&amp;`.\n\nSo, if you want to include a copyright symbol in your article, you can write:\n\n    &copy;\n\nand Markdown will leave it alone. But if you write:\n\n    AT&T\n\nMarkdown will translate it to:\n\n    AT&amp;T\n\nSimilarly, because Markdown supports [inline HTML](#html), if you use\nangle brackets as delimiters for HTML tags, Markdown will treat them as\nsuch. But if you write:\n\n    4 < 5\n\nMarkdown will translate it to:\n\n    4 &lt; 5\n\nHowever, inside Markdown code spans and blocks, angle brackets and\nampersands are *always* encoded automatically. This makes it easy to use\nMarkdown to write about HTML code. (As opposed to raw HTML, which is a\nterrible format for writing about HTML syntax, because every single `<`\nand `&` in your example code needs to be escaped.)\n\n\n* * *\n\n\n<h2 id=""block"">Block Elements</h2>\n\n\n<h3 id=""p"">Paragraphs and Line Breaks</h3>\n\nA paragraph is simply one or more consecutive lines of text, separated\nby one or more blank lines. (A blank line is any line that looks like a\nblank line -- a line containing nothing but spaces or tabs is considered\nblank.) Normal paragraphs should not be indented with spaces or tabs.\n\nThe implication of the ""one or more consecutive lines of text"" rule is\nthat Markdown supports ""hard-wrapped"" text paragraphs. This differs\nsignificantly from most other text-to-HTML formatters (including Movable\nType's ""Convert Line Breaks"" option) which translate every line break\ncharacter in a paragraph into a `<br />` tag.\n\nWhen you *do* want to insert a `<br />` break tag using Markdown, you\nend a line with two or more spaces, then type return.\n\nYes, this takes a tad more effort to create a `<br />`, but a simplistic\n""every line break is a `<br />`"" rule wouldn't work for Markdown.\nMarkdown's email-style [blockquoting][bq] and multi-paragraph [list items][l]\nwork best -- and look better -- when you format them with hard breaks.\n\n  [bq]: #blockquote\n  [l]:  #list\n\n\n\n<h3 id=""header"">Headers</h3>\n\nMarkdown supports two styles of headers, [Setext] [1] and [atx] [2].\n\nSetext-style headers are ""underlined"" using equal signs (for first-level\nheaders) and dashes (for second-level headers). For example:\n\n    This is an H1\n    =============\n\n    This is an H2\n    -------------\n\nAny number of underlining `=`'s or `-`'s will work.\n\nAtx-style headers use 1-6 hash characters at the start of the line,\ncorresponding to header levels 1-6. For example:\n\n    # This is an H1\n\n    ## This is an H2\n\n    ###### This is an H6\n\nOptionally, you may ""close"" atx-style headers. This is purely\ncosmetic -- you can use this if you think it looks better. The\nclosing hashes don't even need to match the number of hashes\nused to open the header. (The number of opening hashes\ndetermines the header level.) :\n\n    # This is an H1 #\n\n    ## This is an H2 ##\n\n    ### This is an H3 ######\n\n\n<h3 id=""blockquote"">Blockquotes</h3>\n\nMarkdown uses email-style `>` characters for blockquoting. If you're\nfamiliar with quoting passages of text in an email message, then you\nknow how to create a blockquote in Markdown. It looks best if you hard\nwrap the text and put a `>` before every line:\n\n    > This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,\n    > consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.\n    > Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.\n    > \n    > Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse\n    > id sem consectetuer libero luctus adipiscing.\n\nMarkdown allows you to be lazy and only put the `>` before the first\nline of a hard-wrapped paragraph:\n\n    > This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,\n    consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.\n    Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.\n\n    > Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse\n    id sem consectetuer libero luctus adipiscing.\n\nBlockquotes can be nested (i.e. a blockquote-in-a-blockquote) by\nadding additional levels of `>`:\n\n    > This is the first level of quoting.\n    >\n    > > This is nested blockquote.\n    >\n    > Back to the first level.\n\nBlockquotes can contain other Markdown elements, including headers, lists,\nand code blocks:\n\n	> ## This is a header.\n	> \n	> 1.   This is the first list item.\n	> 2.   This is the second list item.\n	> \n	> Here's some example code:\n	> \n	>     return shell_exec(""echo $input | $markdown_script"");\n\nAny decent text editor should make email-style quoting easy. For\nexample, with BBEdit, you can make a selection and choose Increase\nQuote Level from the Text menu.\n\n\n<h3 id=""list"">Lists</h3>\n\nMarkdown supports ordered (numbered) and unordered (bulleted) lists.\n\nUnordered lists use asterisks, pluses, and hyphens -- interchangably\n-- as list markers:\n\n    *   Red\n    *   Green\n    *   Blue\n\nis equivalent to:\n\n    +   Red\n    +   Green\n    +   Blue\n\nand:\n\n    -   Red\n    -   Green\n    -   Blue\n\nOrdered lists use numbers followed by periods:\n\n    1.  Bird\n    2.  McHale\n    3.  Parish\n\nIt's important to note that the actual numbers you use to mark the\nlist have no effect on the HTML output Markdown produces. The HTML\nMarkdown produces from the above list is:\n\n    <ol>\n    <li>Bird</li>\n    <li>McHale</li>\n    <li>Parish</li>\n    </ol>\n\nIf you instead wrote the list in Markdown like this:\n\n    1.  Bird\n    1.  McHale\n    1.  Parish\n\nor even:\n\n    3. Bird\n    1. McHale\n    8. Parish\n\nyou'd get the exact same HTML output. The point is, if you want to,\nyou can use ordinal numbers in your ordered Markdown lists, so that\nthe numbers in your source match the numbers in your published HTML.\nBut if you want to be lazy, you don't have to.\n\nIf you do use lazy list numbering, however, you should still start the\nlist with the number 1. At some point in the future, Markdown may support\nstarting ordered lists at an arbitrary number.\n\nList markers typically start at the left margin, but may be indented by\nup to three spaces. List markers must be followed by one or more spaces\nor a tab.\n\nTo make lists look nice, you can wrap items with hanging indents:\n\n    *   Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n        Aliquam hendrerit mi posuere lectus. Vestibulum enim wisi,\n        viverra nec, fringilla in, laoreet vitae, risus.\n    *   Donec sit amet nisl. Aliquam semper ipsum sit amet velit.\n        Suspendisse id sem consectetuer libero luctus adipiscing.\n\nBut if you want to be lazy, you don't have to:\n\n    *   Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n    Aliquam hendrerit mi posuere lectus. Vestibulum enim wisi,\n    viverra nec, fringilla in, laoreet vitae, risus.\n    *   Donec sit amet nisl. Aliquam semper ipsum sit amet velit.\n    Suspendisse id sem consectetuer libero luctus adipiscing.\n\nIf list items are separated by blank lines, Markdown will wrap the\nitems in `<p>` tags in the HTML output. For example, this input:\n\n    *   Bird\n    *   Magic\n\nwill turn into:\n\n    <ul>\n    <li>Bird</li>\n    <li>Magic</li>\n    </ul>\n\nBut this:\n\n    *   Bird\n\n    *   Magic\n\nwill turn into:\n\n    <ul>\n    <li><p>Bird</p></li>\n    <li><p>Magic</p></li>\n    </ul>\n\nList items may consist of multiple paragraphs. Each subsequent\nparagraph in a list item must be indented by either 4 spaces\nor one tab:\n\n    1.  This is a list item with two paragraphs. Lorem ipsum dolor\n        sit amet, consectetuer adipiscing elit. Aliquam hendrerit\n        mi posuere lectus.\n\n        Vestibulum enim wisi, viverra nec, fringilla in, laoreet\n        vitae, risus. Donec sit amet nisl. Aliquam semper ipsum\n        sit amet velit.\n\n    2.  Suspendisse id sem consectetuer libero luctus adipiscing.\n\nIt looks nice if you indent every line of the subsequent\nparagraphs, but here again, Markdown will allow you to be\nlazy:\n\n    *   This is a list item with two paragraphs.\n\n        This is the second paragraph in the list item. You're\n    only required to indent the first line. Lorem ipsum dolor\n    sit amet, consectetuer adipiscing elit.\n\n    *   Another item in the same list.\n\nTo put a blockquote within a list item, the blockquote's `>`\ndelimiters need to be indented:\n\n    *   A list item with a blockquote:\n\n        > This is a blockquote\n        > inside a list item.\n\nTo put a code block within a list item, the code block needs\nto be indented *twice* -- 8 spaces or two tabs:\n\n    *   A list item with a code block:\n\n            <code goes here>\n\n\nIt's worth noting that it's possible to trigger an ordered list by\naccident, by writing something like this:\n\n    1986. What a great season.\n\nIn other words, a *number-period-space* sequence at the beginning of a\nline. To avoid this, you can backslash-escape the period:\n\n    1986\\. What a great season.\n\n\n\n<h3 id=""precode"">Code Blocks</h3>\n\nPre-formatted code blocks are used for writing about programming or\nmarkup source code. Rather than forming normal paragraphs, the lines\nof a code block are interpreted literally. Markdown wraps a code block\nin both `<pre>` and `<code>` tags.\n\nTo produce a code block in Markdown, simply indent every line of the\nblock by at least 4 spaces or 1 tab. For example, given this input:\n\n    This is a normal paragraph:\n\n        This is a code block.\n\nMarkdown will generate:\n\n    <p>This is a normal paragraph:</p>\n\n    <pre><code>This is a code block.\n    </code></pre>\n\nOne level of indentation -- 4 spaces or 1 tab -- is removed from each\nline of the code block. For example, this:\n\n    Here is an example of AppleScript:\n\n        tell application ""Foo""\n            beep\n        end tell\n\nwill turn into:\n\n    <p>Here is an example of AppleScript:</p>\n\n    <pre><code>tell application ""Foo""\n        beep\n    end tell\n    </code></pre>\n\nA code block continues until it reaches a line that is not indented\n(or the end of the article).\n\nWithin a code block, ampersands (`&`) and angle brackets (`<` and `>`)\nare automatically converted into HTML entities. This makes it very\neasy to include example HTML source code using Markdown -- just paste\nit and indent it, and Markdown will handle the hassle of encoding the\nampersands and angle brackets. For example, this:\n\n        <div class=""footer"">\n            &copy; 2004 Foo Corporation\n        </div>\n\nwill turn into:\n\n    <pre><code>&lt;div class=""footer""&gt;\n        &amp;copy; 2004 Foo Corporation\n    &lt;/div&gt;\n    </code></pre>\n\nRegular Markdown syntax is not processed within code blocks. E.g.,\nasterisks are just literal asterisks within a code block. This means\nit's also easy to use Markdown to write about Markdown's own syntax.\n\n\n\n<h3 id=""hr"">Horizontal Rules</h3>\n\nYou can produce a horizontal rule tag (`<hr />`) by placing three or\nmore hyphens, asterisks, or underscores on a line by themselves. If you\nwish, you may use spaces between the hyphens or asterisks. Each of the\nfollowing lines will produce a horizontal rule:\n\n    * * *\n\n    ***\n\n    *****\n\n    - - -\n\n    ---------------------------------------\n\n\n* * *\n\n<h2 id=""span"">Span Elements</h2>\n\n<h3 id=""link"">Links</h3>\n\nMarkdown supports two style of links: *inline* and *reference*.\n\nIn both styles, the link text is delimited by [square brackets].\n\nTo create an inline link, use a set of regular parentheses immediately\nafter the link text's closing square bracket. Inside the parentheses,\nput the URL where you want the link to point, along with an *optional*\ntitle for the link, surrounded in quotes. For example:\n\n    This is [an example](http://example.com/ ""Title"") inline link.\n\n    [This link](http://example.net/) has no title attribute.\n\nWill produce:\n\n    <p>This is <a href=""http://example.com/"" title=""Title"">\n    an example</a> inline link.</p>\n\n    <p><a href=""http://example.net/"">This link</a> has no\n    title attribute.</p>\n\nIf you're referring to a local resource on the same server, you can\nuse relative paths:\n\n    See my [About](/about/) page for details.   \n\nReference-style links use a second set of square brackets, inside\nwhich you place a label of your choosing to identify the link:\n\n    This is [an example][id] reference-style link.\n\nYou can optionally use a space to separate the sets of brackets:\n\n    This is [an example] [id] reference-style link.\n\nThen, anywhere in the document, you define your link label like this,\non a line by itself:\n\n    [id]: http://example.com/  ""Optional Title Here""\n\nThat is:\n\n*   Square brackets containing the link identifier (optionally\n    indented from the left margin using up to three spaces);\n*   followed by a colon;\n*   followed by one or more spaces (or tabs);\n*   followed by the URL for the link;\n*   optionally followed by a title attribute for the link, enclosed\n    in double or single quotes, or enclosed in parentheses.\n\nThe following three link definitions are equivalent:\n\n	[foo]: http://example.com/  ""Optional Title Here""\n	[foo]: http://example.com/  'Optional Title Here'\n	[foo]: http://example.com/  (Optional Title Here)\n\n**Note:** There is a known bug in Markdown.pl 1.0.1 which prevents\nsingle quotes from being used to delimit link titles.\n\nThe link URL may, optionally, be surrounded by angle brackets:\n\n    [id]: <http://example.com/>  ""Optional Title Here""\n\nYou can put the title attribute on the next line and use extra spaces\nor tabs for padding, which tends to look better with longer URLs:\n\n    [id]: http://example.com/longish/path/to/resource/here\n        ""Optional Title Here""\n\nLink definitions are only used for creating links during Markdown\nprocessing, and are stripped from your document in the HTML output.\n\nLink definition names may consist of letters, numbers, spaces, and\npunctuation -- but they are *not* case sensitive. E.g. these two\nlinks:\n\n	[link text][a]\n	[link text][A]\n\nare equivalent.\n\nThe *implicit link name* shortcut allows you to omit the name of the\nlink, in which case the link text itself is used as the name.\nJust use an empty set of square brackets -- e.g., to link the word\n""Google"" to the google.com web site, you could simply write:\n\n	[Google][]\n\nAnd then define the link:\n\n	[Google]: http://google.com/\n\nBecause link names may contain spaces, this shortcut even works for\nmultiple words in the link text:\n\n	Visit [Daring Fireball][] for more information.\n\nAnd then define the link:\n	\n	[Daring Fireball]: http://daringfireball.net/\n\nLink definitions can be placed anywhere in your Markdown document. I\ntend to put them immediately after each paragraph in which they're\nused, but if you want, you can put them all at the end of your\ndocument, sort of like footnotes.\n\nHere's an example of reference links in action:\n\n    I get 10 times more traffic from [Google] [1] than from\n    [Yahoo] [2] or [MSN] [3].\n\n      [1]: http://google.com/        ""Google""\n      [2]: http://search.yahoo.com/  ""Yahoo Search""\n      [3]: http://search.msn.com/    ""MSN Search""\n\nUsing the implicit link name shortcut, you could instead write:\n\n    I get 10 times more traffic from [Google][] than from\n    [Yahoo][] or [MSN][].\n\n      [google]: http://google.com/        ""Google""\n      [yahoo]:  http://search.yahoo.com/  ""Yahoo Search""\n      [msn]:    http://search.msn.com/    ""MSN Search""\n\nBoth of the above examples will produce the following HTML output:\n\n    <p>I get 10 times more traffic from <a href=""http://google.com/""\n    title=""Google"">Google</a> than from\n    <a href=""http://search.yahoo.com/"" title=""Yahoo Search"">Yahoo</a>\n    or <a href=""http://search.msn.com/"" title=""MSN Search"">MSN</a>.</p>\n\nFor comparison, here is the same paragraph written using\nMarkdown's inline link style:\n\n    I get 10 times more traffic from [Google](http://google.com/ ""Google"")\n    than from [Yahoo](http://search.yahoo.com/ ""Yahoo Search"") or\n    [MSN](http://search.msn.com/ ""MSN Search"").\n\nThe point of reference-style links is not that they're easier to\nwrite. The point is that with reference-style links, your document\nsource is vastly more readable. Compare the above examples: using\nreference-style links, the paragraph itself is only 81 characters\nlong; with inline-style links, it's 176 characters; and as raw HTML,\nit's 234 characters. In the raw HTML, there's more markup than there\nis text.\n\nWith Markdown's reference-style links, a source document much more\nclosely resembles the final output, as rendered in a browser. By\nallowing you to move the markup-related metadata out of the paragraph,\nyou can add links without interrupting the narrative flow of your\nprose.\n\n\n<h3 id=""em"">Emphasis</h3>\n\nMarkdown treats asterisks (`*`) and underscores (`_`) as indicators of\nemphasis. Text wrapped with one `*` or `_` will be wrapped with an\nHTML `<em>` tag; double `*`'s or `_`'s will be wrapped with an HTML\n`<strong>` tag. E.g., this input:\n\n    *single asterisks*\n\n    _single underscores_\n\n    **double asterisks**\n\n    __double underscores__\n\nwill produce:\n\n    <em>single asterisks</em>\n\n    <em>single underscores</em>\n\n    <strong>double asterisks</strong>\n\n    <strong>double underscores</strong>\n\nYou can use whichever style you prefer; the lone restriction is that\nthe same character must be used to open and close an emphasis span.\n\nEmphasis can be used in the middle of a word:\n\n    un*frigging*believable\n\nBut if you surround an `*` or `_` with spaces, it'll be treated as a\nliteral asterisk or underscore.\n\nTo produce a literal asterisk or underscore at a position where it\nwould otherwise be used as an emphasis delimiter, you can backslash\nescape it:\n\n    \\*this text is surrounded by literal asterisks\\*\n\n\n\n<h3 id=""code"">Code</h3>\n\nTo indicate a span of code, wrap it with backtick quotes (`` ` ``).\nUnlike a pre-formatted code block, a code span indicates code within a\nnormal paragraph. For example:\n\n    Use the `printf()` function.\n\nwill produce:\n\n    <p>Use the <code>printf()</code> function.</p>\n\nTo include a literal backtick character within a code span, you can use\nmultiple backticks as the opening and closing delimiters:\n\n    ``There is a literal backtick (`) here.``\n\nwhich will produce this:\n\n    <p><code>There is a literal backtick (`) here.</code></p>\n\nThe backtick delimiters surrounding a code span may include spaces --\none after the opening, one before the closing. This allows you to place\nliteral backtick characters at the beginning or end of a code span:\n\n	A single backtick in a code span: `` ` ``\n	\n	A backtick-delimited string in a code span: `` `foo` ``\n\nwill produce:\n\n	<p>A single backtick in a code span: <code>`</code></p>\n	\n	<p>A backtick-delimited string in a code span: <code>`foo`</code></p>\n\nWith a code span, ampersands and angle brackets are encoded as HTML\nentities automatically, which makes it easy to include example HTML\ntags. Markdown will turn this:\n\n    Please don't use any `<blink>` tags.\n\ninto:\n\n    <p>Please don't use any <code>&lt;blink&gt;</code> tags.</p>\n\nYou can write this:\n\n    `&#8212;` is the decimal-encoded equivalent of `&mdash;`.\n\nto produce:\n\n    <p><code>&amp;#8212;</code> is the decimal-encoded\n    equivalent of <code>&amp;mdash;</code>.</p>\n\n\n\n<h3 id=""img"">Images</h3>\n\nAdmittedly, it's fairly difficult to devise a ""natural"" syntax for\nplacing images into a plain text document format.\n\nMarkdown uses an image syntax that is intended to resemble the syntax\nfor links, allowing for two styles: *inline* and *reference*.\n\nInline image syntax looks like this:\n\n    ![Alt text](/path/to/img.jpg)\n\n    ![Alt text](/path/to/img.jpg ""Optional title"")\n\nThat is:\n\n*   An exclamation mark: `!`;\n*   followed by a set of square brackets, containing the `alt`\n    attribute text for the image;\n*   followed by a set of parentheses, containing the URL or path to\n    the image, and an optional `title` attribute enclosed in double\n    or single quotes.\n\nReference-style image syntax looks like this:\n\n    ![Alt text][id]\n\nWhere ""id"" is the name of a defined image reference. Image references\nare defined using syntax identical to link references:\n\n    [id]: url/to/image  ""Optional title attribute""\n\nAs of this writing, Markdown has no syntax for specifying the\ndimensions of an image; if this is important to you, you can simply\nuse regular HTML `<img>` tags.\n\n\n* * *\n\n\n<h2 id=""misc"">Miscellaneous</h2>\n\n<h3 id=""autolink"">Automatic Links</h3>\n\nMarkdown supports a shortcut style for creating ""automatic"" links for URLs and email addresses: simply surround the URL or email address with angle brackets. What this means is that if you want to show the actual text of a URL or email address, and also have it be a clickable link, you can do this:\n\n    <http://example.com/>\n    \nMarkdown will turn this into:\n\n    <a href=""http://example.com/"">http://example.com/</a>\n\nAutomatic links for email addresses work similarly, except that\nMarkdown will also perform a bit of randomized decimal and hex\nentity-encoding to help obscure your address from address-harvesting\nspambots. For example, Markdown will turn this:\n\n    <address@example.com>\n\ninto something like this:\n\n    <a href=""&#x6D;&#x61;i&#x6C;&#x74;&#x6F;:&#x61;&#x64;&#x64;&#x72;&#x65;\n    &#115;&#115;&#64;&#101;&#120;&#x61;&#109;&#x70;&#x6C;e&#x2E;&#99;&#111;\n    &#109;"">&#x61;&#x64;&#x64;&#x72;&#x65;&#115;&#115;&#64;&#101;&#120;&#x61;\n    &#109;&#x70;&#x6C;e&#x2E;&#99;&#111;&#109;</a>\n\nwhich will render in a browser as a clickable link to ""address@example.com"".\n\n(This sort of entity-encoding trick will indeed fool many, if not\nmost, address-harvesting bots, but it definitely won't fool all of\nthem. It's better than nothing, but an address published in this way\nwill probably eventually start receiving spam.)\n\n\n\n<h3 id=""backslash"">Backslash Escapes</h3>\n\nMarkdown allows you to use backslash escapes to generate literal\ncharacters which would otherwise have special meaning in Markdown's\nformatting syntax. For example, if you wanted to surround a word\nwith literal asterisks (instead of an HTML `<em>` tag), you can use\nbackslashes before the asterisks, like this:\n\n    \\*literal asterisks\\*\n\nMarkdown provides backslash escapes for the following characters:\n\n    \\   backslash\n    `   backtick\n    *   asterisk\n    _   underscore\n    {}  curly braces\n    []  square brackets\n    ()  parentheses\n    #   hash mark\n	+	plus sign\n	-	minus sign (hyphen)\n    .   dot\n    !   exclamation mark\n"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
   End
   Begin PushButton ButtonParse
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Parse"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   560
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   562
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label Time
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   750
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   "Time:"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   562
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   230
   End
   Begin TabPanel Panel
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   550
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   600
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "HTML\rRender"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      Value           =   0
      Visible         =   True
      Width           =   600
      Begin TextArea Output
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   512
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "Panel"
         Italic          =   False
         Left            =   600
         LimitText       =   0
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   True
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Output"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   38
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   600
      End
      Begin HTMLViewer HTML
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   512
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Panel"
         Left            =   600
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Renderer        =   0
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   38
         Visible         =   True
         Width           =   600
      End
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events ButtonParse
	#tag Event
		Sub Action()
		  dim md, result as Text
		  dim startTime, endTime, total as Double
		  
		  md = Input.Text.ToText
		  
		  startTime = Microseconds()
		  
		  result = CommonMark.ToHTML(md)
		  
		  endTime = Microseconds - startTime
		  total = endTime/1000
		  
		  Output.Text = result
		  
		  HTML.LoadPage(result, Nil)
		  
		  Time.Text = "Parsed in " + total.ToText + "ms"
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
