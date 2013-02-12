<!doctype html>
<!--
   _    ___     __      __                        ____
  | |  / (_)___/ /___ _/ /  _   ______ _____     / __ )___  _________ ____  ____
  | | / / / __  / __ `/ /  | | / / __ `/ __ \   / __  / _ \/ ___/ __ `/ _ \/ __ \
  | |/ / / /_/ / /_/ / /   | |/ / /_/ / / / /  / /_/ /  __/ /  / /_/ /  __/ / / /
  |___/_/\__,_/\__,_/_/    |___/\__,_/_/ /_/  /_____/\___/_/   \__, /\___/_/ /_/
                                                              /____/

  Hello, thanks for taking a look at my source code. Feel free to look and learn,
  but please respect that everything here is trademarked 2012 by Vidal van Bergen.
-->

<!--[if IEMobile 7]>          <html lang="en" dir="ltr" class="no-js iem7">                 <![endif]-->
<!--[if lt IE 7]>             <html lang="en" dir="ltr" class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if (IE 7)&!(IEMobile)]>  <html lang="en" dir="ltr" class="no-js lt-ie9 lt-ie8">        <![endif]-->
<!--[if (IE 8)&!(IEMobile)]>  <html lang="en" dir="ltr" class="no-js lt-ie9">               <![endif]-->
<!--[if gt IE 8|(gt IEMobile 7)]><!-->
<html lang="en" dir="ltr" class="no-js"><!--<![endif]-->
<head>
  <meta charset="utf-8">
  <!--[if lt IE 7]><meta http-equiv="refresh" content="0; url=unsupported.html"><![endif]-->

  <title>ViMediaManager</title>
  <link rel="shortcut icon"     type="image/png" href="favicon.png">
  <link rel="apple-touch-icon"  type="image/png" href="apple-touch-icon.png">

  <!-- About the website -->
  <meta name="description"      content="ViMediaManager is the best media manager to prepare your movies, TV shows &amp; anime for XBMC &amp; YAMJ.">
  <meta name="keywords"         content="ViMediaManager, Media Manager, XBMC, YAMJ, TV Shows, Movies, Anime, Media, Managerw">
  <meta name="robots"           content="index,follow">

  <!-- iOS. Delete if not required -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
  <!--link rel="apple-touch-startup-image" href="img/splash.png"-->
  <meta name="viewport"         content="width=device-width,initial-scale=1,maximum-scale=100.0,user-scalable=yes">

  <!-- MSIE. Delete if not required -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="ImageToolbar"    content="false">
  <!-- Mobile IE allows us to activate ClearType technology for smoothing fonts for easy reading -->
  <meta http-equiv="cleartype" content="on">
  <!--[if lt IE 9]>
    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

  <!-- About the author -->
  <meta name="author"           content="Vidal van Bergen">
  <meta name="copyright"        content="™ Trademarked by Vidal van Bergen 2012. All Rights Reserved.">
  <link rel="author"            href="humans.txt" type="text/plain">

  <!-- Facebook Open Graph Tags -->
  <meta property="og:title"     content="ViMediaManager" />
  <meta property="og:type"      content="website" />
  <meta property="og:url"       content="http://vidalvanbergen.github.com/ViMediaManager/" />
  <meta property="og:image"     content="http://vidalvanbergen.github.com/ViMediaManager/img/vimediamanager.png" />
  <meta property="og:site_name" content="ViMediaManager" />
  <meta property="fb:admins"    content="725431550" />

  <!--link rel="alternate"         href="rss.xml" type="application/rss+xml" title="RSS feed"-->
  <link rel="stylesheet"        href="css/styles.css">
  <!--script src="js/libs/modernizr.js"></script-->
  <script src="js/libs/FancyZoom.js" type="text/javascript"></script>
  <script src="js/libs/FancyZoomHTML.js" type="text/javascript"></script>
</head>
<body>

  <!-- Facebook Junk -->
  <div id="fb-root"></div>

  <nav>
    <ul>
      <li><a href="index.html#about"   title="" class="active">ViMediaManager</a></li>
      <!--li><a href="#guides"  title="">User Guides</a></li-->
      <li><a href="index.html#support" title="">Support</a></li>
      <!--li><a href="#roadmap" title="">History &amp; Future</a></li-->
    </ul>
  </nav>

  <header>
    <a href="/index.html" class="logo"><img src="img/site/vimm.png" alt="ViMediaManager"></a>

    <hgroup>
      <h1>ViMediaManager</h1>
      <h2>The Best Media Manager for Mac</h2>
    </hgroup>

    <hr/>

    <ul>
      <li>
        <a href="" class="stable">Download 0.5.4</a>
        <p>PPC &amp; Intel Mac OS X 10.5+</p>
      </li>
      <li>
        <a href="" class="unstable">Download 0.6α4</a>
        <span class="balloon">Note that the TV Shows &amp; Anime sections are not functional yet.</span>
        <p>Intel Mac OS X 10.5+</p>
      </li>
    </ul>

    <a href="donate" class="donate">Donate</a>
    <span class="balloon">If you like ViMediaManager, consider showing your support by donating!</span>

  </header>

  <!-- About -->
  <section id="about">

<?php
$name = $_POST['name'];
$email = $_POST['email'];
$request_type = $_POST['request-type'];
$message = $_POST['message'];

$formcontent= "<style>table { padding: 0; margin: 0; border: 0; text-align: left; } th { width: 100px; font-weight: bold; } </style> <table> <tr><th>From:</th>			<td>$name</td></tr> <tr><th>Email:</th> 			<td><a href='mailto:$email'>$email</a></td></tr> <tr><th>Request Type:</th> 	<td>$request_type</td></tr> </table>\n\n<b>Message:</b>\n$message";

$recipient = "vimediamanager@gmail.com";
$subject = "Contact Form";
$mailheader = "From: $email \r\n";

mail($recipient, $subject, $formcontent, $mailheader) or die("Error!");
echo "<p><b>The Email has been send successfully!</b></p><br/><p><a href='index.html'>Return to homepage</a></p>";
?>
	</section>

  <aside class="share">
    <!-- Facebook Button -->
    <div class="fb-like" data-href="https://www.facebook.com/ViMediaManager" data-send="true" data-layout="button_count" data-width="90" data-show-faces="false" data-font="" data-colorscheme="dark"></div>

    <!-- Twitter Button -->
    <a href="https://twitter.com/vimediamanager" class="twitter-follow-button" data-text="Check out #ViMediaManager, the best media manager for Mac!" data-via="" data-related="ViMediaManager" data-hashtags="" data-show-count="true" data-lang="en" data-colorscheme="dark">Follow @vimediamanager</a>

    <!-- Flattr Button -->
    <!--a class="FlattrButton" style="display:none;" rev="flattr;button:compact;" href="http://vidalvanbergen.github.com/ViMediaManager/"></a>
    <noscript>
      <a href="http://flattr.com/thing/834268/ViMediaManager" target="_blank">
        <img src="http://api.flattr.com/button/flattr-badge-large.png" alt="Flattr this" title="Flattr this" border="0" />
      </a>
    </noscript-->
  </aside>

  <footer>
    <p>A Project by Vidal van Bergen, hosted on <a href="http://www.github.com" target="github">github.com</a>.</p>
    <!--p>&copy; Copyright 2012 Vidal van Bergen. All Rights Reserved.</p-->
  </footer>

  <!-- JavaScript at the bottom for fast page loading -->

  <!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if offline -->
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/libs/jquery.min.js"><\/script>')</script>

  <script src="js/plugins.js"></script>
  <script src="js/script.js"></script>

  <!-- Asynchronous Google Analytics snippet. Change UA-XXXXX-X to be your site's ID. -->
  <script>
    var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
    (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
    g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
    s.parentNode.insertBefore(g,s)}(document,'script'));
  </script>

</body>
</html>