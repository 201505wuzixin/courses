# 工具使用

各位小伙伴大家好，咱们接着前面的课程，继续讲解 Github 开源之旅第五季：stylish 网站换肤。现在咱们讲解工具使用这个话题。完成网站换肤会用到三个工具，他们分别是：stylish 插件，userstyles.org 网站，以及浏览器自带的开发者工具。其中，核心工具是 stylish 插件。

在介绍这三款工具之前，先给小伙伴们简单介绍一下网站换肤的原理。当你访问或者浏览一个网站时，其实是由浏览器呈现给我们一个又一个的页面，这些页面也称为网页。而任何一个网页中，都有三个层面的元素，分别是：内容、样式和交互。这三个层面，分别由三种技术来实现，网页内容由 HTML 来描述，网页的样式由 CSS 来控制，而网页的交互动作由 JavaScript 来定义。所以，我们要想给网站换肤，本质上来说，就是修改网页的样式，也就是修改网页的 CSS 代码。这就是网站换肤的本质及核心原理。

## 开发者工具

下面咱们先介绍一下浏览器的开发者工具，并利用这个工具进一步来演示和说明网站换肤的原理。浏览器的开发者工具是不需要安装的，主流的浏览器都自带开发者工具，而且不同浏览器的开发者工具都大同小异。火狐浏览器还有一个 firebug 插件，也是类似的作用。不过，既然浏览器自带开发者工具，我现在一般都不用 firebug 了，我已经把 firebug 卸载了。

【演示：百度网站换肤，把背景改为黑色，把 logo 换成我的头像】

我们打开浏览器，打开百度网站，按 F12 键，会调出开发者工具。开发者工具其实是一个工具集，这里我们只用到查看器工具，所以其他工具不做介绍，感兴趣的小伙伴可以自行了解和学习。在查看器工具下面，工具窗口被分为左右两列，左边的是网页的 HTML 代码，右侧是网页的样式定义，就是 CSS 代码。下面我们用选择器在页面上点击一下，这个时候，查看器会帮我们定位到...... （略）

要点：
- 修改的目标一定要明确，打算修改哪个样式？
- 选择器点网页的什么地方？
- 选择器定位的代码，准确吗？不准确如何找代码？


【包袱】
这里面涉及到 CSS 代码的问题，我们下节课再给大家详细介绍。这里貌似问题被完美的解决了，而且非常简单，是不是啊？但是，你注意一下，重新刷新一下网页，样式又恢复原状了。

这是为什么呢？因为，样式是内联或内嵌的 CSS 代码，或者是外链的 CSS 文件，这些样式的定义已经存放到服务器上了。当我们刷新网页时，浏览器会重新从网站获取这些代码，我们的修改就丢弃了。是不是我们演示的操作毫无意义呢？不是，其实我们已经演示出了网站换肤的核心原理。网站换肤的核心原理，就是修改网页的 CSS 代码，来控制或者定制网站的外观。刚才演示的操作，已经做到这一点了，而且开发者工具能够帮助我们快速定位到需要修改的代码位置，或者帮助我们分析需要修改元素的样式代码。接下来就剩一小丢丢了，就是如何保存我们修改的样式，这样每次刷新网站时，自动把我们定义的样式重新启用一下，问题就可以完美解决了。

## stylish 插件

接下来，就该咱们的主角，网站活肤的核心工具闪亮登场了，哒哒哒哒，她就是 stylish 插件。首先，先安装 stylish 插件。

【演示：stylish 插件安装】

安装好了 stylish 插件后，我们就可以把刚才做的修改用 stylish 帮我们保存起来，这样每次访问或者刷新网站的时候，都会重新启用我的定义的样式。现在那刚才的百度网站，用 stylish 工具给大家演示一下。

【演示：stylish 百度网站换肤】
 

## userstyles.org 网站

如果你对自己的网站皮肤，非常满意，希望别人在访问网站的时候也可以使用你定制的皮肤或者样式。这样，你可以把自己定义的网站样式，上传到 userstyles.org 网站上了。

我们在演示怎么上传之前，先给大家看一下如何下载我之前做过的样式。

【演示：stylish 下载已经定义好的网站样式】

下面演示一下如何上传样式。
【上传样式】

你上传的样式也可以设置一个 PayPal 打赏账户，这样有的小伙伴感觉不错，没准一激动给你赏点小费。怎么注册 PayPal 账户我就不再演示了。
