# Typography
Think of this as a quick-start for modern typography and custom CSS setup. If you pick a CSS framework, a lot of these decisions are already made for you. They might be the right ones for your project and they might not. 

Sometimes a framework adds a lot of value to a project. Sometimes, it becomes a bloated config nightmare. Remember, all code is garbage so anything you do will be wrong in some sort of way.

With that out of the way, let's get started.

### Kick off a new project
Sure, you could clone this repo, but why not just start from scratch and make your own decisions?

Here is how this project was started. 

```
yarn init
yarn global add parcel-bundler && yarn add parcel-bundler --dev
yarn add sanitize.css parcel-bundler materialize-css --dev
mkdir -p src/scss
touch src/scssindex.scss
touch src/scssvars.scss
touch src/index.html
```


## CSS Reset or Normalize
CSS Reset - does what is says - resets all the default styles to a baseline.
CSS Normalize - patches browsers that vary from spec to make them consistent.
CSS Reboot - 

If you use a library, this has been chosen for you. You can make the decision on your own though. I've been really happy with santize.css b/c they already provide the system font stack OOTB.

```
@import "sanitize.css/sanitize.css";
@import "sanitize.css/typography.css";
```

## System Font Stack
Recent (and even not-so-recent) versions of OS's now ship with high quality fonts. 

* boost performance and load time
* they look good!
* no need to host fonts, especially in a locked down environment like govt.

[Overview from MD](https://material.io/design/typography/understanding-typography.html#system-fonts)

This is what the code looks like:
[sanitize.css/typography](https://github.com/csstools/sanitize.css/blob/master/typography.css)

## Quick Comment/Tangent on Colors
Color is important to everything in a website. If a designer chose a palette, get the palette from them. If something looks off, chat with a designer about it before hacking in something like `lighten($brand-color, 15%)`. Things like this are often a sign something might have changed in the app or a piece of info is missing and can negatively affect the overall usability of an app or website.  These little hacks seem reasonable, they can mess things up. 

##### Accessbility - Make sure there is enough contrast. 
* [MD color contrast](https://material.io/design/usability/accessibility.html#color-contrast)
* [W3C detailed explanation](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html)
* [Accessibility checker](https://webaim.org/resources/contrastchecker/)

##### Do not hardcode random colors everywhere
This is about maintainability, tweaking, and fine tuning.

* Put color variables in a config file. Use these variables everywhere.
* Consider a color mixin - This one is really good and since it is a mixin, it can be imported easily into a pre-processor like SASS.

[MaterializeCSS color mixin](https://github.com/Dogfalo/materialize/blob/v1-dev/sass/components/_color-variables.scss#L361)

```
color: color('pink', 'darken-1');
```

## Simplify font sizes
Hopefully, your designer didn't make every little font a different size. This used to be a bigger problem when everything was dont in photoshop, but design language systems/tools have improved this.


## Guidelines
Like all guidelines, you might have to deviate from them at some point. They are guidelines for a reason so just double check that it is really appropriate to do so..

![bad time](https://pics.me.me/if-you-french-fry-when-you-are-suppose-to-pizza-14270228.png)

* Use the system font stack.
* ALWAYS use `rem` for font size. especially for reponsive!
* monospace for things like code snippets where significant whitespace is important
* Ideal line length for body is 40-60 chars. [see line-length](https://material.io/design/typography/understanding-typography.html#readability)
* Do not hand code colors. Colors should be configured as vars or use a mixin. 

## External Links

* [Material Design - Typography](https://material.io/design/typography)
* [Reboot, Resets, and Reasoning](https://css-tricks.com/reboot-resets-reasoning/)
* [Normalize CSS or CSS Reset?!](https://medium.com/@elad/normalize-css-or-css-reset-9d75175c5d1e)
* [sanitize.css](https://csstools.github.io/sanitize.css/)
* [type-scale.com](https://type-scale.com/)
* [system font stack](https://css-tricks.com/snippets/css/system-font-stack/)

