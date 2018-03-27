简要教程
这是一款效果非常好的支持移动触摸设备的响应式模块化jQuery幻灯片插件。通过这个幻灯片插件你可以制作出漂亮和专业的幻灯片效果。它的特点有：
模块化的体系结构。
响应式设计。
支持触摸滑动。
支持CSS3过渡效果。
支持动画层。
幻灯片可以无限循环。
支持旋转木马布局。
支持全屏显示。
幻灯片带有缩略图。
支持深层链接。
图片带有懒加载模式。
支持视网膜设备。
支持淡入淡出效果。
导航按钮使用CSS生成，不使用图片，样式容易控制。
支持幻灯片中嵌人视频。
支持图片尺寸自适应（不同的图片会显示不同的尺寸）。
JavaScript breakpoints。
 安装
可以使用bower或npm来安装这个幻灯片插件：
$ npm install slider-pro
$ bower install slider-pro                
 使用方法
使用时需要在页面中引入必要的文件：
<link rel="stylesheet" href="dist/css/slider-pro.min.css"/>
<script src="libs/js/jquery-1.11.0.min.js"></script>
<script src="dist/js/jquery.sliderPro.min.js"></script>                
 HTML结构

该幻灯片的HTML结构采用嵌套结构：slider-pro > sp-slides >sp-slide，这三个层级的class名称的div是必须的。
<div class="slider-pro" id="my-slider">
    <div class="sp-slides">
        <!-- Slide 1 -->
        <div class="sp-slide">
            <img class="sp-image" src="path/to/image1.jpg"/>
        </div>
 
        <!-- Slide 2 -->
        <div class="sp-slide">
            <p>Lorem ipsum dolor sit amet</p>
        </div>
 
        <!-- Slide 3 -->
        <div class="sp-slide">
            <h3 class="sp-layer">Lorem ipsum dolor sit amet</h3>
            <p class="sp-layer">consectetur adipisicing elit</p>
        </div>
    </div>
</div>            
如果你在幻灯片中添加一幅图片，并且希望它能够显示为背景图片，你需要为它添加class sp-image。
 JAVASCRIPT

在页面加载完成之后，可以使用下面的方法来初始化该幻灯片插件：
<script type="text/javascript">
    jQuery( document ).ready(function( $ ) {
        $( '#my-slider' ).sliderPro();
    });
</script>                
 配置参数
该幻灯片插件有50+个可用的配置参数：
width：默认值：500。设置幻灯片的宽度值。可以设置固定值，如900（900像素）。或者设置为百分比值，如'100%'。注意使用百分比值时需要引号引起来，而固定值不需要。另外请注意，不用为了使幻灯片具有响应式效果而专门设置为百分比数值。
height：默认值：300。设置幻灯片的高度。规则和“width”属性相同。
responsive：默认值：true。使幻灯片具有响应式效果。该属性设置为true时，即使宽度和高度设置为固定值，幻灯片也具有响应式效果。
aspectRatio：默认值：-1。设置幻灯片的宽高比。如果设置的值不是-1，幻灯片的高度将被重写以保持指定的宽高比。
imageScaleMode：默认值：'cover'。可用值： 'cover', 'contain', 'exact' 和 'none'。设置幻灯片图片的缩放模式。 'cover' 会缩放和裁剪图片以适应容器，'contain'保存幻灯片内整个图片可见，'exact' 将图片的尺寸匹配为幻灯片的尺寸， 'none'保存图片原有的尺寸。
centerImage：默认值：true。幻灯片图片是否居中显示。
autoHeight：默认值：false。是否自动调整幻灯片的高度为当前幻灯片的高度。
startSlide：默认值：0。设置哪个幻灯片在加载时被选择。
shuffle：默认值：false。设置是否打乱图片顺序。
orientation：默认值：horizontal。可选值：horizontal和vertical。设置幻灯片是水平还是垂直移动。
forceSize：默认值：none。可选择：fullWidth、fullWindow和none。设置幻灯片的尺寸。
loop：默认值：true。设置幻灯片是否无限循环。
slideDistance：默认值：10。设置幻灯片之间的距离。
slideAnimationDuration：默认值：700。设置幻灯片的动画持续时间。
heightAnimationDuration：默认值：700。设置幻灯片高度动画的持续时间。
visibleSize：默认值：auto。设置幻灯片的可见区域的尺寸。
breakpoints：默认值：null。当页面尺寸改变的时候，设置指定的breakpoints来修改幻灯片的外观和行为。例如：
$( '#my-slider' ).sliderPro({
    width: 960, 
    height: 400,
    orientation: 'horizontal',
    thumbnailPosition: 'right',
    breakpoints: {
        800: {
            thumbnailsPosition: 'bottom',
            thumbnailWidth: 270,
            thumbnailHeight: 100
        },
        500: {
            orientation: 'vertical',
            thumbnailsPosition: 'bottom',
            thumbnailWidth: 120,
            thumbnailHeight: 50
        }
    }
});  
fade：默认值：false。是否使用淡入淡出效果。
fadeOutPreviousSlide：默认值：true。前一个slider是否 faded out。
fadeDuration：默认值：500。设置幻灯片淡入淡出效果的持续时间。
autoplay：默认值：true。设置幻灯片是否自动播放。
autoplayDelay：默认值：5000。设置幻灯片自动播放的时间间隔，单位毫秒。
autoplayDirection：默认值：normal。可选值：normal或backwards。自动播放是导航到下一个slider还是前一个slider。
autoplayOnHover：默认值：。
：默认值：pause。可选值：pause、none或stop。当用鼠标滑过幻灯片时是暂停还是停止播放幻灯片。
arrows：默认值：false。是否插件幻灯片的箭头导航按钮。
fadeArrows：默认值：true。是否在鼠标滑过时淡入淡出显示箭头按钮。
buttons：默认值：true。是否插件圆点导航按钮。
keyboard：默认值：true。是否可以使用键盘来导航。
keyboardOnlyOnFocus：默认值：false。是否只有在幻灯片聚焦的时候才可以使用键盘来导航。
touchSwipe：默认值：true。设置幻灯片是否支持滑动触摸。
touchSwipeThreshold：默认值：50。设置幻灯片移动的最小数量。
fadeCaption：默认值：true。幻灯片标题是否淡入淡出显示。
captionFadeDuration：默认值：500。设置标题淡入淡出的持续时间。
fullScreen：默认值：false。设置“全屏”按钮是否可用。
fadeFullScreen：默认值：true。“全屏”按钮是否在鼠标滑过时淡入淡出显示。
waitForLayers：默认值：false。Indicates whether the slider will wait for the layers to disappear before going to a new slide.
autoScaleLayers：默认值：true。设置是否自动缩放层。
autoScaleReference：默认值：-1。设置参考宽度和当前幻灯片的宽度做比较，以确定层需要缩放多少。默认情况下，参考宽度等于幻灯片的宽度。如果设置为百分比值，必须为autoScaleReference设置一个指定值。
smallSize：默认值：480。如果幻灯片的尺寸小于这个尺寸，小版本的图片将被使用。
mediumSize：默认值：768。如果幻灯片的尺寸小于这个尺寸，中等版本的图片将被使用。
largeSize：默认值：1024。如果幻灯片的尺寸小于这个尺寸，大版本的图片将被使用。
updateHash：默认值：false。当一个新耳朵slide被选择的时候是否更新hash值。
reachVideoAction：默认值：'none'。可选值：'playVideo'和'none'。设置当幻灯片的内容被选择的时候，是否播放video内容。
leaveVideoAction：默认值：'pauseVideo'。可选值：'stopVideo'、'pauseVideo'、 'removeVideo'和'none'。设置当另外一个幻灯片的内容被选择的时候，是否播放video内容。
playVideoAction：默认值：'stopAutoplay'。可选值：'stopAutoplay'和'none'。设置video开始播放的时候，是否执行幻灯片。
pauseVideoAction：默认值：none。可选值：'startAutoplay'和'none'。设置video暂停播放的时候，是否执行幻灯片。
endVideoAction：默认值：none。可选值：'startAutoplay'、'nextSlide'、'replayVideo'和'none'。设置video停止播放的时候，是否执行幻灯片。
thumbnailWidth：默认值：100。设置幻灯片缩略图的宽度。
thumbnailHeight：默认值：80。设置幻灯片缩略图的高度。
thumbnailsPosition：默认值：bottom。可选值：top、bottom、right和left。设置幻灯片缩略图的位置。
thumbnailPointer：默认值：false。Indicates if a pointer will be displayed for the selected thumbnail。
thumbnailArrows：默认值：false。设置缩略图的箭头按钮是否可用。
fadeThumbnailArrows：默认值：true。缩略图的箭头按钮是否淡入淡出。
thumbnailTouchSwipe：默认值：。
：默认值：true。缩略图的箭头按钮是否可以被滑动触摸。
 方法
该幻灯片插件有两种方式来调用公共方法。
第一种是在幻灯片元素上调用sliderPro方法，并传入方法的名称和可用参数。
$( '#my-slider' ).sliderPro( 'gotoSlide', 3 );                
第一个参数指明方法的名称，第二个参数代表被使用的值。有些方法可以不写的第二个参数：
$( '#my-slider' ).sliderPro( 'nextSlide' );                
第二种方法是获取幻灯片的实例对象，在该对象上调用方法。
// get a reference to the SliderPro instance
var slider = $( '#my-slider' ).data( 'sliderPro' );
 
slider.gotoSlide( 2 );                
下面是一些可用的公共方法：
gotoSlide( index )：将幻灯片滚动到指定的index。
nextSlide()：幻灯片滚动到下一个slide。
previousSlide()：幻灯片滚动到前一个slide。
getSlideAt( index )：获取指定index的所有幻灯片数据。返回一个对象。
getSelectedSlide()：获取选择slide的index。
update()：当某个属性改变的时候插件会自动调用该方法。如果改动了HTML标签你可以手动调用这个方法来刷新幻灯片。
resize()：当幻灯片的尺寸改变的时候插件会自动调用这个方法。
getTotalSlides()：获取幻灯片slides的总数。
on( eventType, callback )：为幻灯片添加事件监听。
off( eventType )：为幻灯片移除事件监听。
destroy()：销毁幻灯片对象。
 回调函数
回调函数（callbacks）可以在幻灯片初始化时添加或者后面在添加：
$( '#my-slider' ).sliderPro({
    width: 900, 
    height: 400,
    gotoSlide: function( event ) {
        console.log( event.index );
    },
    sliderResize: function() {
        console.log( 'slider is resized' );
    }
});
 
$( '#my-slider' ).on( 'gotoSlide', function( event ) {
    console.log( event.index );
})                
回调函数都带有一个event参数，该参数事件的一些信息。
下面是可用的事件：
init：在幻灯片创建之后触发。
update：当update方法被调用的时候被触发。
gotoSlide：当一个新的slide被选择的时候触发。返回的数据为：
index：选择slide的index。
previousIndex：前一个被选择的slide的index。
gotoSlideComplete：当动画到一个新的slide时触发。返回的数据为：
index：当前打开的slide的index。
breakpointReach：当到达一个breakpoint时触发。返回的数据为：
size：到达的指定尺寸。
settings：当前尺寸的设置。
videoPlay：当视频开始播放的时候触发。
videoPause：当视频暂停播放的时候触发。
videoEnd：当视频结束的时候触发。
showLayersComplete：所有的动画层都可见的时候触发。
hideLayersComplete：所有的动画层都不可见的时候触发。
thumbnailsUpdate：当缩略图更新的时候触发。
gotoThumbnail：一个新的缩略图被选择的时候触发。
thumbnailsMoveComplete：当缩略图的移动的是触发。