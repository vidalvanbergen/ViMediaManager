<?php

  $hit_count = @file_get_contents('cocoa_count.txt');
  $hit_count++;
  @file_put_contents('cocoa_count.txt', $hit_count);

  header('Location: http://mariusth.channelwood.org/vimediamanager/files/vimediamanager_cocoa.dmg'); // redirect to the real file to be downloaded
?>